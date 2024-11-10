<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

  <xsl:param   name="entity" select="''" />
  <xsl:output method="html" encoding="utf-8" indent="yes"/>

  <xsl:template match="/"><html><head>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/entity-list.css" />
    <script src="/resources/js/document-functions.js" />
  </head>
  <body>
    <header>
      <h3><xsl:value-of select="$entity" /></h3>
      <breadcrumb>
	<a href="/home.html" > &gt; home </a>
      </breadcrumb>
    </header>


    <xsl:comment>
      <groups>
	<plan-group>
	<code>123</code>
	<name>eeost</name>
	<description/>
	<remarks>osoeu</remarks>
	<plans>
	  <plan>
	    <code>AEOU-O-oeeou</code>
	    <name/>
	    </plan><plan>
	    <code/>
	    <name/>
	  </plan>
	</plans>
      </plan-group>

      </groups></xsl:comment>
    
    <main>
      <h2>Plan Groups</h2>
<ul>
  <xsl:apply-templates  />
</ul>

      
    </main>
  </body>
</html>
</xsl:template>

<xsl:template match="plan-group" >

  <li >

    <h3><a href="/view/plan-group/{code}.html" ><xsl:value-of select="name/text()" ></xsl:value-of></a></h3>
    <p><xsl:value-of select="remarks/text()" ></xsl:value-of>

    <xsl:if test="boolean(./plans/plan)" >
      <ul><xsl:apply-templates select="plans/plan"/></ul>
    </xsl:if>
	
  </p>
  </li>
</xsl:template>


<xsl:template match="plan" >
  <li>
    <h4><a href="/view/plan/{code}.html"> [<xsl:value-of select="code" ></xsl:value-of>]    <xsl:value-of select="Name/text()" ></xsl:value-of></a></h4>
	
  </li>
</xsl:template>

<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>
