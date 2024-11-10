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

  <!-- Cenerates samples of the elements that can be added
       to the document with the xform
       -->
  <xsl:variable name="quote" >'</xsl:variable>
  <!--..... Schema Process .................-->
  <xsl:template match="/">
    <Template>
      <!--
	  <xsl:apply-templates select="//element[name  and not(name='Name' or name='Description' or name='NameDescription')]" />
      -->
      <xsl:for-each select="distinct-values(//element/name)">
	<item><name><xsl:value-of select="." ></xsl:value-of></name><label><xsl:value-of select="." ></xsl:value-of></label></item>
      </xsl:for-each>

      <xsl:for-each select="distinct-values(//attribute/attribute-name)">
	<item><name><xsl:value-of select="." ></xsl:value-of></name><label><xsl:value-of select="." ></xsl:value-of></label></item>
      </xsl:for-each>

      <!--
          <attribute>
          <attribute-name>PerformerOrBeneficiary</attribute-name>
          <cardinality>
          <optional/>
          </cardinality>
          <type>xsd:string</type>
          <allowed-values>
          <value>Performer</value>
          <value>Beneficiary</value>
          </allowed-values>
      -->
		  
    </Template>
  </xsl:template>

  <!--
  <xsl:template  match="element[name and not(name='Name' or name='Description' or name='NameDescription')]" >
    <xsl:element name="{name/text()}" label="" >
    </xsl:element>
  </xsl:template>

  <xsl:template  match="attribute|documentation|cardinality|name|element|type" />
  -->  
</xsl:stylesheet>
