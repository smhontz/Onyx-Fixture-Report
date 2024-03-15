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
                <xsl:for-each select="Fixture">
                    <xsl:sort select="@name" data-type="text" order="ascending"/>
                    <tr>
                        <td><xsl:value-of select="@nr"/></td>
                        <td><xsl:value-of select="@name"/></td>
                        <td><xsl:value-of select="@displayName"/></td>
                        <td><xsl:value-of select="DMXChannel/@universe"/></td>
                        <td><xsl:value-of select="DMXChannel/@startAddress"/></td>
                        <td>
                            <xsl:value-of select="DMXChannel/@startAddress + @cntChannels - 1"/>
                        </td>
                        <td><xsl:value-of select="@cntChannels"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
