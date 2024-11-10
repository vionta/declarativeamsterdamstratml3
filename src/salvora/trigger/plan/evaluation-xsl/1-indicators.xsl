<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:rsu="http://www.vionta.net/xsd/stratml-results/1.0"
    version="3.0" 
    >
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <!--
      <evaluation-criteria>
      <option><value>bigger</value><label>Bigger</label></option>
      <option><value>equals-or-bigger</value><label>Equals or Bigger</label></option>
      <option><value>smaller</value><label>Smaller</label></option>
      <option><value>equals-or-smaller</value><label>Equals or Smaller</label></option>
      Pendientes de implementar
<option additional-reference="true" ><value>closer-than</value><label>Closer Than</label></option>
      <option><value>sooner</value><label>Sooner</label></option>
      <option><value>later</value><label>Later</label></option>
      </evaluation-criteria>
  -->

  <!-- Reference ......................................... -->


  <!-- Bigger ............................................ -->
  <xsl:template
      match="*:PerformanceIndicator[string(./evaluation-criteria/@type) = 'bigger']"
      >
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:choose>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) > number(reference[@type = 'optimistic']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >remarkable</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) > number(reference[@type = 'expected']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >expected</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) > number(reference[@type = 'pesimistic']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >poor</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(reference[@type = 'pesimistic']/@value) > number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >failure</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="element()|text()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Equals or Bigger ............................................ -->    
  <xsl:template
      match="*:PerformanceIndicator[string(./evaluation-criteria/@type) = 'equals-or-bigger']"
      >
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:choose>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) >= number(reference[@type = 'optimistic']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >remarkable</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) >= number(reference[@type = 'expected']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >expected</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) >= number(reference[@type = 'pesimistic']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >poor</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(reference[@type = 'pesimistic']/@value) >= number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >failure</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="element()|text()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Smaller  ............................................ -->
  <xsl:template
      match="*:PerformanceIndicator[string(./evaluation-criteria/@type) = 'smaller']"
      >
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:choose>
	<xsl:when
	    test="number(reference[@type = 'optimistic']/@value) > number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >remarkable</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(reference[@type = 'expected']/@value) > number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >expected</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test=" number(reference[@type = 'pesimistic']/@value) > number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >poor</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) > number(reference[@type = 'pesimistic']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >failure</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="element()|text()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Equals or Smaller  ............................................ -->

  <xsl:template
      match="*:PerformanceIndicator[string(./evaluation-criteria/@type) = 'equals-or-smaller']"
      >
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:choose>
	<xsl:when
	    test="number(reference[@type = 'optimistic']/@value) >= number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >remarkable</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(reference[@type = 'expected']/@value) >= number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >expected</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test=" number(reference[@type = 'pesimistic']/@value) >= number(MeasurementInstance/ActualResult/NumberOfUnits)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >poor</xsl:attribute>
	</xsl:when>
	<xsl:when
	    test="number(MeasurementInstance/ActualResult/NumberOfUnits) >= number(reference[@type = 'pesimistic']/@value)" >
	  <xsl:attribute name="result-level" namespace="http://www.vionta.net/xsd/stratml-results/1.0" >failure</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="element()|text()"/>
    </xsl:copy>
  </xsl:template>

  
  <xsl:template match="element()|@*|text()" >
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>