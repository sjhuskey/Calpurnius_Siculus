<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Sort by xml:id -->
    <xsl:template match="ns1:bibl" xmlns:ns1="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates>
            <xsl:sort select="@xml:id"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="ns1:bibl" xmlns:ns1="http://www.tei-c.org/ns/1.0">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>