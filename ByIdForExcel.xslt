<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>
    <xsl:template match="/Fixtures">
        <!-- CSV Header -->
        <xsl:text>Id,Name,Display Name,Universe,StartAddress,EndAddress,Count&#10;</xsl:text>
        <!-- Iterate through each fixture -->
        <xsl:for-each select="Fixture">
            <xsl:sort select="@nr" data-type="number" order="ascending"/>		
            <xsl:value-of select="@nr"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@displayName"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="DMXChannel/@universe"/>
            <xsl:text>,</xsl:text>
			<xsl:value-of select="DMXChannel/@startAddress"/>
            <xsl:text>,</xsl:text>
			<xsl:value-of select="DMXChannel/@startAddress + @cntChannels - 1"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@cntChannels"/>
            <xsl:text>&#10;</xsl:text> <!-- New line for next record -->
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
