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

  <!--..... This Xslt generates the options
      configuration file for the xforms selec1
      selector. .................-->
  <xsl:template match="/">
    <data>
      <xsl:for-each select="//attribute[allowed-values]" >
	<xsl:element name="{attribute-name/text()}" >
	  <xsl:for-each select="./allowed-values/value" >
	    <option>
	      <value><xsl:value-of select="text()" /></value>
	      <label><xsl:value-of select="text()" /></label>
	    </option>
	    </xsl:for-each>
	</xsl:element>
      </xsl:for-each>
    </data>
  </xsl:template>

  <xsl:template
      match="text()" ></xsl:template>

</xsl:stylesheet>
