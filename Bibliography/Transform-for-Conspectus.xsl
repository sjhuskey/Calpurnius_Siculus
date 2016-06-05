<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="ns1:list" xmlns:ns1="http://www.tei-c.org/ns/1.0">
        <xsl:for-each select="ns1:item/ns1:listWit">
            <list>
                <!-- Print the head, showing the siglum for the family, where given. -->
                <xsl:choose>
                    <!-- If there is a siglum for the entire family, indicate it in the head. -->
                    <xsl:when test="@n">
                        <head>
                            <xsl:value-of select="ns1:head"/> = <xsl:value-of select="@n"/>
                        </head>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- If there isn't a siglum for the family, just give the list a label. -->
                        <xsl:copy-of select="ns1:head"/>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Handling each witness as an <item> -->
                <xsl:for-each select="ns1:witness">
                    <item><ref target="#{@xml:id}">
                            <xsl:value-of select="@n"/></ref> = <xsl:choose><!-- If there isn't an <msDesc>, just print the <desc> -->
                            <xsl:when test="ns1:desc">
                                <xsl:value-of select="ns1:desc"/>
                            </xsl:when>
                            <xsl:otherwise><!-- Print the detailed <msDesc> where possible -->
                                <xsl:value-of select="ns1:msDesc/ns1:msIdentifier/ns1:settlement"/>,
                                    <xsl:value-of
                                    select="ns1:msDesc/ns1:msIdentifier/ns1:repository"/>&#160;
                                    <xsl:value-of select="ns1:msDesc/ns1:msIdentifier/ns1:idno"
                                />&#160; <xsl:if
                                    test="ns1:msDesc/ns1:msIdentifier/ns1:altIdentifier">(olim
                                        <xsl:value-of
                                        select="ns1:msDesc/ns1:msIdentifier/ns1:altIdentifier"
                                    />).&#160;</xsl:if>
                                <xsl:value-of
                                    select="ns1:msDesc/ns1:history/ns1:origin/ns1:origDate"
                                />.</xsl:otherwise></xsl:choose>
                        <xsl:if test="../ns1:listWit"><!-- If there's a sublist of MSS, print that. -->
                            <list><xsl:for-each select="../ns1:listWit/ns1:witness">
                                    <item><ref target="#{@xml:id}">
                                            <xsl:value-of select="@n"/></ref> = <xsl:choose>
                                            <xsl:when test="ns1:desc">
                                                <xsl:value-of select="ns1:desc"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                  select="ns1:msDesc/ns1:msIdentifier/ns1:settlement"
                                                />, <xsl:value-of
                                                  select="ns1:msDesc/ns1:msIdentifier/ns1:repository"
                                                />&#160; <xsl:value-of
                                                  select="ns1:msDesc/ns1:msIdentifier/ns1:idno"
                                                />&#160; <xsl:if
                                                  test="ns1:msDesc/ns1:msIdentifier/ns1:altIdentifier"
                                                  >(olim <xsl:value-of
                                                  select="ns1:msDesc/ns1:msIdentifier/ns1:altIdentifier"
                                                  />).&#160;</xsl:if>
                                                <xsl:value-of
                                                  select="ns1:msDesc/ns1:history/ns1:origin/ns1:origDate"
                                                />.</xsl:otherwise></xsl:choose>
                                    </item>
                                </xsl:for-each>
                            </list>
                        </xsl:if>
                    </item>
                </xsl:for-each>
            </list>
        </xsl:for-each>
        <list>
        <xsl:for-each select="../ns1:listBibl">
            <xsl:copy-of select="ns1:head"/>
            <xsl:for-each select="ns1:biblStruct">
                <item>
                    <ref target="{@n}"><xsl:value-of select="@n"/></ref> = 
                    <xsl:choose>
                        <xsl:when test="ns1:monogr/ns1:editor/ns1:name">
                            <xsl:value-of select="ns1:monogr/ns1:editor/ns1:name"/>.
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="ns1:monogr/ns1:editor/ns1:surname"/>,
                                <xsl:value-of select="ns1:monogr/ns1:editor/ns1:forename"/>
                            <xsl:if test="ns1:mongr/ns1:editor/ns1:addName">("<xsl:value-of
                                    select="ns1:monogr/ns1:editor/ns1:addName"
                            />")</xsl:if>.</xsl:otherwise></xsl:choose>&#160; <xsl:value-of
                        select="ns1:monogr/ns1:imprint/ns1:pubPlace"/>, <xsl:value-of
                        select="ns1:monogr/ns1:imprint/ns1:date"/>.
                </item>
            </xsl:for-each>
        </xsl:for-each>
        </list>
    </xsl:template>
</xsl:stylesheet>
