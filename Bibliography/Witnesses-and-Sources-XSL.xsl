<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
   <xsl:output indent="yes"/>
   <!-- List the early editions known as "witnesses" --> 
   <xsl:template match="ns1:listBibl[@type='witness']" xmlns:ns1="http://www.tei-c.org/ns/1.0">
      <listBibl>
         <xsl:copy-of select="ns1:head"/>
               <xsl:for-each select="ns1:bibl">
                  <bibl xml:id="{@xml:id}" n="{@n}">
                     <xsl:choose><!-- Handling named editors -->
                        <xsl:when test="ns1:editor/ns1:persName">
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
         <xsl:if test="ns1:listBibl"><!-- Handling first and second editions -->
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
      </listBibl>
   </xsl:template>
   <!-- List the editions known as "sources" -->
</xsl:stylesheet>
