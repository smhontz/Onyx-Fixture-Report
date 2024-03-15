function Transform-XML {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]$xmlFile,

        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]$xsltFile
    )

    # Check if XML file exists
    if (Test-Path $xmlFile -PathType 'Leaf') {
        # Load the XML file
        $xml = New-Object System.Xml.XmlDocument
        $xml.Load($xmlFile)

        # Load the XSLT file
        $xslt = New-Object System.Xml.Xsl.XslCompiledTransform
        $xslt.Load($xsltFile)

        # Look at the OutputMethod property of the XSLT file to determine the output type
        $outputMethod = $xslt.OutputSettings.OutputMethod
        if ($outputMethod -eq 'Html') {
            $xsltOutputExtension = 'html'
        } elseif ($outputMethod -eq 'Text') {
            $xsltOutputExtension = 'csv'
        } else {
            $xsltOutputExtension = 'xml'
        }

        # Get the name of the xlst file without the extension
        $xsltTransformName = (Get-Item $xsltFile).BaseName

        # Get the name of the XML file without the extension
        $xmlName = (Get-Item $xmlFile).BaseName

        # Create a new file based on the XML file name, the transform name, and the output extension
        $outputFile = Join-Path (Split-Path $xmlFile) ($xmlName + '-' + $xsltTransformName + '.' + $xsltOutputExtension)

        # Create an XmlWriter for the output file
        $settings = New-Object System.Xml.XmlWriterSettings
        $settings.Indent = $true
        $settings.ConformanceLevel = [System.Xml.ConformanceLevel]::Fragment
        $writer = [System.Xml.XmlWriter]::Create($outputFile, $settings)

        # Apply the transformation and save the result to the HTML file
        $xslt.Transform($xml, $null, $writer)

        # Close the XmlWriter
        $writer.Close()
    } else {
        Write-Output "No XML file found at '$xmlFile'."
    }
}

# Main Code
# Get the most recent XML file in the current directory
$xmlFile = Get-ChildItem -Path $PSScriptRoot -Filter *.xml | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# loop through all the .xslt files in the script directory and call the Transform-XML function
Get-ChildItem -Path $PSScriptRoot -Filter *.xslt | ForEach-Object {
    Transform-XML -xmlFile $xmlFile.FullName -xsltFile $_.FullName
}
