<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    version="3.0" 
    >
  <xsl:output 
      method="xml" 
      encoding="UTF-8"
      indent="yes"/>

  <xsl:variable name="quote" >'</xsl:variable>
  <!--..... Schema Process .................-->
  <xsl:template match="/">
    <xsl:element name="{local-name(./*)}" >
      <xsl:for-each select="/*/*:attribute" >
	<xsl:if test="*:attribute-name/text()" >
	  <xsl:attribute name="{*:attribute-name/text()}" ></xsl:attribute>
	</xsl:if>
      </xsl:for-each>      

      

      <xsl:apply-templates select="./*" />
    </xsl:element>
  </xsl:template>

  <xsl:template  match="*:element[name]" >
    <xsl:if test="not(cardinality/optional) or (cardinality/optional/@default = 'true') " >
<xsl:element name="{name/text()}" >
  <xsl:for-each select="./*:attribute" >
    <xsl:if test="*:attribute-name/text()!=''" >
      <xsl:attribute name="{*:attribute-name/text()}" ></xsl:attribute>
    </xsl:if>
  </xsl:for-each>
  <xsl:apply-templates select="./*" />
</xsl:element>

    </xsl:if>
  </xsl:template>
  <!--
  
  <xsl:template  match="*:element[name='NameDescription']" >
    <xsl:element name="{name/text()}" >
      <xsl:apply-templates select="./*" />
    </xsl:element>
  </xsl:template>
-->
  <xsl:template
      match="text()" ></xsl:template>

</xsl:stylesheet>
