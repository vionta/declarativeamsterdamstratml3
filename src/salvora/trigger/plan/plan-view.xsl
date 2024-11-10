<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rsu="http://www.vionta.net/xsd/stratml-results/1.0"
    version="3.0">

  <xsl:import href="chart/stat-bar-chart.xsl" />
  <xsl:import href="chart/pie-chart.xsl" />

  <xsl:param   name="entity" select="'issue'" />
  <xsl:output method="html" encoding="utf-8" indent="yes"/>

  <xsl:template match="/"><html><head>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/entity-list.css" />
    <script src="/resources/js/document-functions.js" />
  </head>
  <body>
    <header>
      <h3><xsl:value-of select="$entity" />s</h3>
      <breadcrumb>
	<a href="/home.html" > &gt; home </a>
      </breadcrumb>
    </header>
    <main>
      <xsl:apply-templates select="PerformancePlanOrReport"  />
    </main>
  </body>
</html>
  </xsl:template>

  <xsl:template match="PerformancePlanOrReport" >
    <table class="evaluation-view" >
      <tr>
	<th>Plan</th>
	<th>Goal</th>
	<th>Objective</th>
	<th>Indicator</th>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
      </tr>
      <tr>
	<td colspan="4">	  <img src="/resources/img/success-{string(rsu:stats/@success)}-blue-icon.svg" />
	<xsl:value-of select="Name/text()" /></td>
	<td>
	</td>
	<td>
	</td>
	<td>
	</td>

	<!--
	    <xsl:call-template name="pie-chart">
	    <xsl:with-param name="stats" select="rsu:stats" />
	    </xsl:call-template>
	--><td>

	  <xsl:call-template name="stats-bar-chart">
	    <xsl:with-param name="stats" select="rsu:stats" />
	  </xsl:call-template>
	</td>
      </tr>
      <!--
	  <xsl:copy-of select="rsu:average/rsu:stats" />
	  <xsl:call-template name="pie-chart">
	  <xsl:with-param name="stats" select="rsu:average/rsu:stats" />
	  </xsl:call-template>
      -->
      <xsl:if test="boolean(Goal)" >
	<ul><xsl:apply-templates select="Goal"/></ul>
      </xsl:if>
    </table>
    
  </xsl:template>

  <xsl:template match="Goal" >
    <tr>
      <td>
      </td>
      <td colspan="3" >
	<img src="/resources/img/success-{string(rsu:stats/@success)}-blue-icon.svg" />
	<xsl:value-of select="Name/text()" />

      </td>
      <td/>
      <td/>
      <td>
	<xsl:call-template name="stats-bar-chart">
	  <xsl:with-param name="stats" select="rsu:stats" />
	</xsl:call-template>
      </td>
      <td/>
    </tr>
    <xsl:apply-templates select="Objective"/>

  </xsl:template>

  <xsl:template match="Objective" >
    <tr >
      <td colspan="2" >
      </td>
      <td colspan="2" >
	<img src="/resources/img/success-{string(rsu:stats/@success)}-blue-icon.svg" />
	<xsl:value-of select="Name/text()" />

      </td>
      <td/>

      <td>
	<xsl:call-template name="stats-bar-chart">
	  <xsl:with-param name="stats" select="rsu:stats" />
	</xsl:call-template>
      </td>
      <td/>
      <td/>
    </tr>

    <!--
        <xsl:call-template name="pie-chart">
	<xsl:with-param name="stats" select="rsu:stats" />
	</xsl:call-template>
    -->
    <xsl:apply-templates select="PerformanceIndicator"/>

  </xsl:template>

  <xsl:template match="PerformanceIndicator" >

    
    <tr>
      <td colspan="3" />
      <td>

	<img src="/resources/img/success-{string(rsu:stats/@success)}-blue-icon.svg" />

	<xsl:value-of select="MeasurementDimension/text()" />
      </td>
      <td colspan="4" />
    </tr>
  </xsl:template>

  
  <xsl:template match="text()"></xsl:template>

</xsl:stylesheet>
