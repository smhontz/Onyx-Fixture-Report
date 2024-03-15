<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/Fixtures">
        <html>
        <head>
            <title>Fixture Report</title>
        </head>
        <body>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Display Name</th>
                    <th>Universe</th>
                    <th>Start Address</th>
					<th>End Address</th>
                    <th>Channel Count</th>
                </tr>
                <xsl:for-each select="Fixture/DMXChannel">
                    <xsl:sort select="@universe" data-type="number" order="ascending"/>
                    <xsl:sort select="@startAddress" data-type="number" order="ascending"/>
                    <tr>
                        <xsl:variable name="currentFixture" select="parent::Fixture"/>
                        <td><xsl:value-of select="$currentFixture/@nr"/></td>
                        <td><xsl:value-of select="$currentFixture/@name"/></td>
                        <td><xsl:value-of select="$currentFixture/@displayName"/></td>
                        <td><xsl:value-of select="@universe"/></td>
                        <td><xsl:value-of select="@startAddress"/></td>
                        <td><xsl:value-of select="@startAddress + $currentFixture/@cntChannels - 1"/></td>
                        <td><xsl:value-of select="$currentFixture/@cntChannels"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
