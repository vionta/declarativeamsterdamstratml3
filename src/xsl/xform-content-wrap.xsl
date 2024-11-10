<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xf="http://www.w3.org/2002/xforms"
    xmlns:ev="http://www.w3.org/2001/xml-events" 
    version="3.0" 
    >
  <xsl:output 
      method="xml" 
      encoding="UTF-8"
      indent="yes"/>

  <xsl:param name="entity-name">GENERATION_FILE_NAME</xsl:param>
  
  <xsl:template match="/">
    <xsl:processing-instruction name="xml-stylesheet" >href="/resources/xsltforms/xsltforms.xsl" type="text/xsl"</xsl:processing-instruction>
    <xsl:processing-instruction name="xsltforms-options" >debug="no"</xsl:processing-instruction> 
   <xsl:processing-instruction name="css-conversion" >no</xsl:processing-instruction>
    <html
	xmlns="http://www.w3.org/1999/xhtml" xmlns:xf="http://www.w3.org/2002/xforms"
	xmlns:ev="http://www.w3.org/2001/xml-events" xmlns:xsd="http://www.w3.org/2001/XMLSchema" >
      <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Style-Type" content="text/plain; charset=us-ascii" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
	<title>Form List Form</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
	<!--
	<script src="/resources/js/scripts.js" />
	-->
	  <xf:model id="m" xmlns:sal="http://vionta.net/schemas/salvora/1.0" >
      
	    <xsd:schema targetNamespace="http://vionta.net/schemas/salvora/1.0" xmlns:sal="http://vionta.net/schemas/salvora/1.0" >
	      <xsd:simpleType name="Code">
		<xsd:restriction base="xsd:string">
		  <xsd:pattern value="[0-9a-zA-Z\-]*"/>
		</xsd:restriction>
	      </xsd:simpleType>      
	    </xsd:schema>
	  
	  <xf:instance id="entity" resource="/TEMPLATE_LOCATION/ENTITY/INSTANCE_CODE.xml" />
	  <xf:instance id="options" resource="/conf/ENTITY-options.xml" />
	  <xf:instance id="template" resource="/conf/template/ENTITY/template-parts.xml" />
	  <xf:instance id="configuration">
	<data xmlns="" >

	  <location>/collections/<xsl:value-of select="$entity-name" />/</location>
	  
	  <url>INSTANCE_CODE.xml</url>
	</data>
      </xf:instance>
      
      <xf:bind nodeset="//code" type="sal:Code" required="true()" />
      <xf:bind nodeset="instance('entity')//StartDate" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//EndDate" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//PublicationDate" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//StartTime" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//EndTime" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//@StartDate" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//@EndDate" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//@PublicationDate" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//@StartTime" type="xf:date"  />
      <xf:bind nodeset="instance('entity')//@EndTime" type="xf:date"  />

      <xf:bind nodeset="instance('configuration')/url" type="xsd:string" calculate="concat(instance('configuration')/location, instance('entity')/code, '.xml')"
	       readonly="false()" />

      <!--
      <xf:submission
	  id="load" method="get" replace="instance"
	  instance="entitf" validate="false" >
	<xf:resource
	    value="instance('configuration')/url" />
	/>
	<xf:message ev:event="xforms-submit-error" ev:default="cancel" >A submission error
	(<xf:output value="event('error-type')"/>) occurred.</xf:message>
      </xf:submission>
      -->
      <xf:submission
	  id="save" method="put" replace="none" instance="entity" >
	<xf:resource
	    value="instance('configuration')/url" />	
	<xf:message ev:event="xforms-submit-error" ev:default="cancel">A submission error
	(<xf:output value="event('error-type')"/>) occurred.</xf:message>
      </xf:submission>

      <xf:submission id="list" reload="page" method="get"
		     action="/index/{$entity-name}.html">
      </xf:submission>

	</xf:model>
      </head>
      <body>

	<xsl:copy-of select="." />

	  <div class="section">
	    <div class="final-button-set" >

	    <div class="form-action-button-set" >

	      <xf:trigger>
		<xf:label>Cancel</xf:label>
		<xf:action ev:event="DOMActivate" >
		  <xf:send submission="list" />
		</xf:action>
	      </xf:trigger>
	      
	      <xf:trigger>
		<xf:label>Save</xf:label>
		<xf:action ev:event="DOMActivate" >
		  <xf:message level="ephemeral">Saving document ...</xf:message>
		  <xf:send submission="save" />
		  <xf:send submission="list" />
		</xf:action>
	      </xf:trigger>
 	    </div>
	    </div>
	  </div>
      </body>
    </html>
  </xsl:template>


</xsl:stylesheet>
