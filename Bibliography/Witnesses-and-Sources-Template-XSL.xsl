<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
   <xsl:output indent="yes"/>
   <!-- List the early editions known as "witnesses" --> 
   <xsl:template match="ns1:listBibl[@type='witness']" xmlns:ns1="http://www.tei-c.org/ns/1.0">
               <xsl:for-each select="ns1:bibl">
                  <h2>TYPE: <xsl:value-of select="../@type"/></h2>
                  <h3>Item: <xsl:value-of select="@xml:id"/></h3>   
                  <xsl:choose><!-- Handling named editors -->
                        <xsl:when test="ns1:editor/ns1:persName">
                           <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:editor/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:editor/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:editor/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
                        </xsl:when>
                        <xsl:otherwise><!-- Anonymous editors -->
                           <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor"/></p>
                        </xsl:otherwise>
                     </xsl:choose>
                     <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
                     <p><strong>Place</strong>: <xsl:value-of select="ns1:pubPlace"/></p>
                     <p><strong>Publisher</strong>: <xsl:value-of select="ns1:publisher"/></p>
                  <xsl:for-each select="ns1:ptr">
                     <p><strong>URL</strong>: <a href="{@target}">
                        <xsl:value-of select="@target"/>
                     </a></p>
                  </xsl:for-each>
                  <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
                  <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
                  <hr />
               </xsl:for-each>
         <xsl:if test="ns1:listBibl"><!-- Handling first and second editions -->
            <h2>TYPE: <xsl:value-of select="@type"/></h2>
            <h3>Item: <xsl:value-of select="ns1:listBibl/@xml:id"/></h3>
               <xsl:for-each select="ns1:listBibl/ns1:bibl">
                  <h4>Subitem: <xsl:value-of select="ns1:listBibl/ns1:bibl/@xml:id"/></h4>
                     <xsl:choose><!-- Handling named editors -->
                        <xsl:when test="ns1:listBibl/ns1:bibl/ns1:editor/ns1:persName">
                           <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:editor/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:editor/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:editor/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
                        </xsl:when>
                        <xsl:otherwise><!-- Anonymous editors -->
                           <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor"/></p>
                        </xsl:otherwise>
                     </xsl:choose>
                     <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
                     <p><strong>Place</strong>: <xsl:value-of select="ns1:pubPlace"/></p>
                     <p><strong>Publisher</strong>: <xsl:value-of select="ns1:publisher"/></p>
                     <xsl:for-each select="ns1:ptr">
                        <p><strong>URL</strong>: <a href="{@target}"><xsl:value-of select="@target"/></a></p>
                     </xsl:for-each>
                  <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
                  <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
                  <hr />
               </xsl:for-each>
         </xsl:if>
   </xsl:template>
   <!-- List the editions known as "sources" -->
   <xsl:template match="ns1:listBibl[@type='source']" xmlns:ns1="http://www.tei-c.org/ns/1.0">
      <xsl:for-each select="ns1:bibl">
         <h2>TYPE: <xsl:value-of select="../@type"/></h2>
         <h3>Item: <xsl:value-of select="@xml:id"/></h3>   
         <xsl:choose><!-- Handling named editors -->
            <xsl:when test="ns1:editor/ns1:persName">
               <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:editor/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:editor/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:editor/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
            </xsl:when>
            <xsl:otherwise><!-- Anonymous editors -->
               <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor"/></p>
            </xsl:otherwise>
         </xsl:choose>
         <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
         <p><strong>Place</strong>: <xsl:value-of select="ns1:pubPlace"/></p>
         <p><strong>Publisher</strong>: <xsl:value-of select="ns1:publisher"/></p>
         <xsl:for-each select="ns1:ptr">
            <p><strong>URL</strong>: <a href="{@target}"><xsl:value-of select="@target"/></a></p>
         </xsl:for-each>
         <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
         <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
         <hr />
      </xsl:for-each>
      <xsl:if test="ns1:listBibl"><!-- Handling first and second editions -->
         <h2>TYPE: <xsl:value-of select="@type"/></h2>
         <h3>Item: <xsl:value-of select="ns1:listBibl/@xml:id"/></h3>
         <xsl:for-each select="ns1:listBibl/ns1:bibl">
            <h4>Subitem: <xsl:value-of select="ns1:listBibl/ns1:bibl/@xml:id"/></h4>
            <xsl:choose><!-- Handling named editors -->
               <xsl:when test="ns1:editor/ns1:persName">
                  <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:editor/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:editor/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:editor/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
               </xsl:when>
               <xsl:otherwise><!-- Anonymous editors -->
                  <p><strong>Editor</strong>: <xsl:value-of select="ns1:editor"/></p>
               </xsl:otherwise>
            </xsl:choose>
            <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
            <p><strong>Place</strong>: <xsl:value-of select="ns1:pubPlace"/></p>
            <p><strong>Publisher</strong>: <xsl:value-of select="ns1:publisher"/></p>
            <xsl:for-each select="ns1:ptr/@target">
               <p><strong>URL</strong>: <xsl:value-of select="ns1:listBibl/ns1:bibl/ns1:ptr/@target"/></p>
            </xsl:for-each>
            <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
            <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
            <hr />
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template match="ns1:listBibl[@type='secondary source']" xmlns:ns1="http://www.tei-c.org/ns/1.0"><!-- Handling secondary sources -->
      ______________________________
      <xsl:for-each select="ns1:bibl">
         <h2>TYPE: <xsl:value-of select="../@type"/></h2>
         <h3>Item Type: <xsl:value-of select="@type"/></h3>   
         <xsl:choose><!-- Handling titles for different kinds of works -->
            <xsl:when test="@type ='volume'">
               <xsl:choose><!-- Handling named authors -->
                  <xsl:when test="ns1:author/ns1:persName">
                     <p><strong>Author</strong>: <xsl:value-of select="ns1:author/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:author/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:author/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:author/ns1:persName/ns1:addName"/>")</xsl:if></p>
                  </xsl:when>
                  <xsl:otherwise><!-- Anonymous authors -->
                     <p><strong>Author</strong>: <xsl:value-of select="ns1:author"/></p>
                  </xsl:otherwise>
               </xsl:choose>
               <p><strong>Main Title</strong>: <xsl:value-of select="ns1:title[@level='a']"/></p>
               <p><strong>Volume Title</strong>: <xsl:value-of select="ns1:title[@level='m']"/></p>
               <p><strong>Volume Number</strong>: <xsl:value-of select="ns1:biblScope[@unit =volume]"/></p>
               <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
               <p><strong>Place</strong>: <xsl:value-of select="ns1:pubPlace"/></p>
               <p><strong>Publisher</strong>: <xsl:value-of select="ns1:publisher"/></p>
               <xsl:for-each select="ns1:ptr">
                  <p><strong>URL</strong>: <a href="{@target}"><xsl:value-of select="@target"/></a></p>
               </xsl:for-each>
               <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
               <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
               <hr />
            </xsl:when>
          <xsl:when test="@type ='monograph'">
               <xsl:choose><!-- Handling named authors -->
            <xsl:when test="ns1:author/ns1:persName">
               <p><strong>Author</strong>: <xsl:value-of select="ns1:author/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:author/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:author/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:author/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
            </xsl:when>
            <xsl:otherwise><!-- Anonymous authors -->
               <p><strong>Author</strong>: <xsl:value-of select="ns1:author"/></p>
            </xsl:otherwise>
         </xsl:choose>
               <p><strong>Title</strong>: <xsl:value-of select="ns1:title"/></p>
               <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
               <p><strong>Place</strong>: <xsl:value-of select="ns1:pubPlace"/></p>
               <p><strong>Publisher</strong>: <xsl:value-of select="ns1:publisher"/></p>
               <xsl:for-each select="ns1:ptr">
                  <p><strong>URL</strong>: <a href="{@target}"><xsl:value-of select="@target"/></a></p>
               </xsl:for-each>
               <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
               <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
             <hr />
            </xsl:when>
            <xsl:when test="@type ='article'">
               <xsl:choose><!-- Handling named authors -->
                  <xsl:when test="ns1:author/ns1:persName">
                     <p><strong>Author</strong>: <xsl:value-of select="ns1:author/ns1:persName/ns1:surname"/>,&#160;<xsl:value-of select="ns1:author/ns1:persName/ns1:forename"/>&#160;<xsl:if test="ns1:author/ns1:persName/ns1:addName">("<xsl:value-of select="ns1:author/ns1:persName/ns1:addName"/>")</xsl:if>.</p>
                  </xsl:when>
                  <xsl:otherwise><!-- Anonymous authors -->
                     <p><strong>Author</strong>: <xsl:value-of select="ns1:author"/></p>
                  </xsl:otherwise>
               </xsl:choose>
               <p><strong>Article Title</strong>: <xsl:value-of select="ns1:title[@level='a']"/></p>
               <p><strong>Journal Title</strong>: <xsl:value-of select="ns1:title[@level='j']"/></p>
               <p><strong>Volume</strong>: <xsl:value-of select="ns1:biblScope[@unit='volume']"/></p>
               <p><strong>Page(s)</strong>: <xsl:value-of select="ns1:biblScope[@unit='page']"/></p>
               <p><strong>Date</strong>: <xsl:value-of select="ns1:date"/></p>
               <xsl:for-each select="ns1:ptr">
                  <p><strong>URL</strong>: <a href="{@target}"><xsl:value-of select="@target"/></a></p>
               </xsl:for-each>
               <p><strong>Siglum</strong>: <xsl:value-of select="@xml:id"/></p>
               <p><strong>N</strong>: <xsl:value-of select="@n"/></p>
               <hr />
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
</xsl:stylesheet>