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
  
  <!--..... Schema Process .................-->
  <xsl:template match="/*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:for-each select="./*" >
	<xsl:variable name="current-element-name" select="local-name()" />
	<xsl:if
	    test="not(preceding-sibling::*[local-name() = $current-element-name])">
	  <xsl:apply-templates select="." />
	  </xsl:if>
	</xsl:for-each>
    </xsl:copy>
  </xsl:template>

  <!--..... Schema Process .................-->
  <xsl:template match="element()">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
	<xsl:for-each select="./*" >
	  <xsl:variable name="current-element-name" select="local-name()" />
	  <xsl:if
	      test="not(preceding-sibling::*[local-name() = $current-element-name])">
	    <xsl:apply-templates select="." />
	  </xsl:if>
	</xsl:for-each>
    </xsl:copy>
  </xsl:template>
    
  <!--..... Schema Process .................-->
  <xsl:template match="@*">
    <xsl:copy-of select="."/>
  </xsl:template>

</xsl:stylesheet>
