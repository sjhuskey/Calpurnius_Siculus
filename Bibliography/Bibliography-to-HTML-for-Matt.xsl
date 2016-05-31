<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link href="Experiment_annotation.css" rel="stylesheet" type="text/css"/>
                <title>Bibliography</title>
            </head>
            <body>
                    <xsl:apply-templates/>
            </body>
        </html> 
    </xsl:template>
    <xsl:template match="ns1:bibl" xmlns:ns1="http://www.tei-c.org/ns/1.0">
        <h1>Individual Witnesses</h1>
        <xsl:for-each select="ns1:bibl">
            <h3>Edition: <xsl:value-of select="/ns1:TEI/ns1:text/ns1:body/ns1:listBibl/ns1:bibl/@xml:id"/></h3>
            <xsl:choose><!-- Handling named editors -->
                <xsl:when test="ns1:editor/ns1:persName">
                    <p><em>Editor</em>: <xsl:value-of select="ns1:editor/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:editor/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:editor/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:editor/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
                </xsl:when>
                <xsl:otherwise><!-- Anonymous editors -->
                    <p><em>Editor</em>: <xsl:value-of select="ns1:editor"/></p>
                </xsl:otherwise>
            </xsl:choose>
            <p><em>Date</em>: <xsl:value-of select="ns1:date"/>.&#160;</p>
            <p><em>Place</em>: <xsl:value-of select="ns1:pubPlace"/>:&#160;</p>
            <p><em>Publisher</em>: <xsl:value-of select="ns1:publisher"/>.&#160;</p>
            <xsl:for-each select="ns1:ptr">
                <p><em>URL</em>: <xsl:value-of select="."/></p>
            </xsl:for-each>
            <p><em>Siglum</em>: <xsl:value-of select="@xml:id"/></p>
        </xsl:for-each>
        <xsl:if test="ns1:listBibl"><!-- Handling first and second editions -->
            <h1>Groups of Witnesses</h1>
            <listBibl xml:id="{ns1:listBibl/@xml:id}" n="{ns1:listBibl/@n}">
                <xsl:for-each select="ns1:listBibl/ns1:bibl">
                    <bibl xml:id="{@xml:id}" n="{@n}">
                        <xsl:choose><!-- Handling named editors -->
                            <xsl:when test="ns1:listBibl/ns1:bibl/ns1:editor/ns1:persName">
                                <editor xml:id="{ns1:editor/@xml:id}" n="{ns1:editor/@n}" ref="{ns1:editor/@ref}">
                                    <xsl:value-of select="ns1:editor/ns1:persName/ns1:surname"/>,&#160;
                                    <xsl:value-of select="ns1:editor/ns1:persName/ns1:forename"/>&#160;
                                    <xsl:if test="ns1:editor/ns1:persName/ns1:addName">
                                        ("<xsl:value-of select="ns1:editor/ns1:persName/ns1:addName"/>")
                                    </xsl:if>
                                </editor>.
                            </xsl:when>
                            <xsl:otherwise><!-- Anonymous editors -->
                                <editor>
                                    <xsl:value-of select="ns1:editor"/>
                                </editor>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:copy-of select="ns1:date"/>.&#160;
                        <xsl:copy-of select="ns1:pubPlace"/>:&#160;
                        <xsl:copy-of select="ns1:publisher"/>.&#160;
                        <xsl:for-each select="ns1:ptr">
                            URL: <xsl:copy-of select="."/>
                        </xsl:for-each>
                    </bibl>
                </xsl:for-each>
            </listBibl>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>