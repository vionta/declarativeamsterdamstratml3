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
      <xsl:apply-templates select="//element[name]" />


<!-- TODO: Fix this to be dynamical-->
     <attribute-template
	 PerformerOrBeneficiary=""
	 RASCI=""
	 StakeholderTypeType=""
	 Criticality=""
	 InternalOrExternal=""
	 Priority=""
	 StartDate=""
	 StartTime=""
	 EndDate=""
	 EndTime=""
	 Weighting=""
	 Keyness=""
	 PublicationDate=""
	 InhibitingOrEnabling="" ></attribute-template>

<!--
      
      <xsl:element name="attribute-template">
	<xsl:for-each select="distinct-values(//attribute[attribute-name/text() and boolean(cardinality/optional)])" >

	  <xsl:if test="text() != '' " >
	  <
	  xsl:attribute name="{attribute-name/text()}" ></xsl:attribute>
	  </xsl:if>

	  <xsl:comment>
	  <xsl:value-of select="attribute-name/text()" ></xsl:value-of>
	  </xsl:comment>

	</xsl:for-each>
      </xsl:element>
-->
    </Template>
  </xsl:template>

  <xsl:template  match="element[name and not(name='Name' or name='Description' or name='NameDescription')]" >
    <xsl:element name="{name/text()}" >
      <xsl:for-each select="attribute[attribute-name/text() and not(cardinality/optional)]" >
	<xsl:attribute name="{attribute-name/text()}" ></xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="text()" />
      <xsl:apply-templates select="./*[not(local-name() = 'element')]" />
      <xsl:apply-templates select="./element[not(cardinality/optional) or boolean(cardinality/optional/@default = 'true' )]" />
      <xsl:apply-templates select="./element[name='NameDescription']" />
      <xsl:apply-templates select="./element[name='Name']" />
      <xsl:apply-templates select="./element[name='Description']" />
      <!--
	  <xsl:apply-templates select="./*" />
      -->
    </xsl:element>
  </xsl:template>

  <xsl:template  match="element[(name/text() = 'NameDescription')]" >
    <NameDescription>
      <xsl:apply-templates select="./element[(name/text() = 'Name' or name/text() ='Description')]" />
    </NameDescription>
  </xsl:template>
  
  <xsl:template  match="element[(name/text() ='Name') or (name/text() ='Description')]" >
    <xsl:element name="{name/text()}" ></xsl:element>
  </xsl:template>
  
  <xsl:template  match="element[not(name)]" >
      <xsl:apply-templates select="./element[not(cardinality/optional) or boolean(cardinality/optional/@default = 'true' )]" />
  </xsl:template>
  
 <xsl:template  match="*|@*|text()" >
    <xsl:copy>
      <xsl:apply-templates select="@*|text()" />
      
      <xsl:apply-templates select="./*[not(local-name() = 'element')]" />
      <xsl:apply-templates select="./element[not(cardinality/optional) or boolean(cardinality/optional/@default = 'true' )]" />
    </xsl:copy>
  </xsl:template>

  <xsl:template  match="attribute|documentation|cardinality|name|element|type" />
  
</xsl:stylesheet>
