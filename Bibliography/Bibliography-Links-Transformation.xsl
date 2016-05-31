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
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </body>
        </html> 
    </xsl:template>
    <xsl:template match="ns1:bibl" xmlns:ns1="http://www.tei-c.org/ns/1.0">
       
        <xsl:for-each select="ns1:ptr">
            <li>
                <a href="{@target}">
                    <xsl:value-of select="../ns1:title"/>
                </a>
            </li>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>