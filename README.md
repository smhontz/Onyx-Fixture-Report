# Onyx-Fixture-Report
PowerShell script and .xslt files to transform Obsidian Control Systems Onyx fixture report XML file

Download the PowerShell Transform.ps1 script and all the .xslt files to a folder on your computer.

Export your patch in Onyx under Show Settings - Patch Tasks - Export Patch.  This will generate three files: a .xml, .xslt, and .css file.  Copy all of them to the directory where you downloaded the code.

Right-click on Transform.ps1, and pick "Run with PowerShell".  You may be prompted with a security warning about the Execution Policy; select Y to allow the script to run.

The script will look for the most recent .xml file in the directory, and process that against all of the .xslt files that it finds.  It will generate several html files, sorting the fixture report in several ways, and one CSV file that you can load into Excel.
