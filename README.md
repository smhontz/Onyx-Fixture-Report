# Onyx-Fixture-Report
PowerShell .ps1 script and .xslt files to transform Obsidian Control Systems Onyx fixture report XML file into several different output formats.

You can download them as one zip file by clicking on the green Code button and selecting "Download ZIP".  Unzip all the files into a folder on your computer.

Export your patch in Onyx under Show Settings - Patch Tasks - Export Patch.  This will generate three files: a .xml, .xslt, and .css file.  Copy all of them to the directory where you downloaded the code.

Right-click on Transform.ps1, and pick "Run with PowerShell".  You may be prompted with a security warning about the Execution Policy; select Y to allow the script to run.

The script will look for the most recent .xml file in the directory, and process that against all of the .xslt files that it finds.  It will generate several html files, sorting the fixture report in several ways, and one CSV file that you can load into Excel.
