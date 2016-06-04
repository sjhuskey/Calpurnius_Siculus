<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xsl xs ns1" version="1.0">

    <!-- Sort by xml:id -->
    <xsl:template match="/">
        <xsl:apply-templates select="/ns1:TEI/ns1:text/ns1:body/ns1:listBibl/ns1:biblStruct">
            <xsl:sort select="ns1:monogr/ns1:imprint/ns1:date" data-type="number" order="ascending"/>
        </xsl:apply-templates>
    </xsl:template>

    <!--<xsl:template match="ns1:bibl" xmlns:ns1="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates>
            <xsl:sort select="@xml:id"/>
        </xsl:apply-templates>
    </xsl:template>-->
    <xsl:template match="ns1:biblStruct">
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>
