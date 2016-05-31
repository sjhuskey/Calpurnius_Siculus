<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes"/>
    <xsl:template match="ns1:listBibl" xmlns:ns1="http://www.tei-c.org/ns/1.0">
        <listBibl>
        <xsl:for-each select="ns1:bibl">
            <bibl xml:id="{@xml:id}" n="{@n}" type="{@type}">
                <xsl:choose>
                    <xsl:when test="@type ='monograph'">
                        <xsl:for-each select="ns1:author">
                            <author ref="{@ref}"><xsl:value-of select="ns1:persName/ns1:surname"/>, 
                                <xsl:value-of select="ns1:persName/ns1:forename"/>.</author>&#160;
                        </xsl:for-each>
                        <date><xsl:value-of select="ns1:date"/></date>.&#160;
                        <title>
                            <xsl:for-each select="ns1:title">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </title>.&#160;
                        <xsl:choose>
                            <xsl:when test="ns1:pubPlace !=''">
                                <xsl:value-of select="ns1:pubPlace"/>: 
                            </xsl:when>
                            <xsl:otherwise>s. l.,&#160;</xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="ns1:publisher !=''">
                                <xsl:value-of select="ns1:publisher"/>. &#160;
                            </xsl:when>
                            <xsl:otherwise>s. n.&#160;</xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="ns1:ptr">
                                <xsl:copy-of select="ns1:ptr"/>
                            </xsl:when>
                            <xsl:otherwise/>
                            <!-- do something about notes -->
                            <!-- handle "bookpart" -->
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@type ='volume'">
                        <xsl:for-each select="ns1:author">
                            <author ref="{@ref}"><xsl:value-of select="ns1:persName/ns1:surname"/>, 
                                <xsl:value-of select="ns1:persName/ns1:forename"/>.</author>&#160;
                        </xsl:for-each>
                        <date><xsl:value-of select="ns1:date"/></date>. 
                        <title>
                            <xsl:value-of select="ns1:title[@level='a']"/>.&#160;
                            <xsl:if test="ns1:biblScope">
                                Vol. <xsl:value-of select="ns1:biblScope[@unit='volume']"/>:&#160;
                            </xsl:if>
                            <xsl:value-of select="ns1:title[@level='m']"/>    
                        </title>.&#160;
                        <xsl:choose>
                            <xsl:when test="ns1:pubPlace !=''">
                                <xsl:value-of select="ns1:pubPlace"/>: 
                            </xsl:when>
                            <xsl:otherwise>s. l.,&#160;</xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="ns1:publisher !=''">
                                <xsl:value-of select="ns1:publisher"/>. &#160;
                            </xsl:when>
                            <xsl:otherwise>s. n.&#160;</xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="ns1:ptr">
                                <xsl:copy-of select="ns1:ptr"/>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@type ='article'">
                        <xsl:for-each select="ns1:author">
                            <author ref="{@ref}"><xsl:value-of select="ns1:persName/ns1:surname"/>, 
                                <xsl:value-of select="ns1:persName/ns1:forename"/>.</author>&#160;
                        </xsl:for-each>
                        <date><xsl:value-of select="ns1:date"/></date>. 
                        <title>
                            "<xsl:value-of select="ns1:title[@level='a']"/>."</title>&#160;<xsl:value-of select="ns1:title[@level='j']"/>
                        &#160;<xsl:value-of select="ns1:biblScope[@unit='volume']"/>: <xsl:value-of select="ns1:biblScope[@unit='page']"/>.
                        <xsl:choose>
                            <xsl:when test="ns1:ptr">
                                <xsl:copy-of select="ns1:ptr"/>
                            </xsl:when>
                            <xsl:otherwise/>
                            <!-- do something about notes -->
                            <!-- handle "bookpart" -->
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </bibl>
        </xsl:for-each>
        </listBibl>
    </xsl:template>
</xsl:stylesheet>
