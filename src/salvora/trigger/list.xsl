<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

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

      <div class="tableset">
	<div class="line">
	  <div class="linkset" >
	    <a href="{concat('/report/entity/', $entity, '-report.html')}">Report</a> | <a href="{concat('/report/entity/', $entity, '.xml')}">Data</a>
	  </div>
	</div>
	<xsl:choose >
	  
	  <xsl:when test="$entity = 'PerformancePlanOrReport' ">
	    <table class="enity-list">
	      <tr><th>Name</th><th>Date</th><th>Submitter</th><th>Org</th><th/><th/><th/><th/></tr>
	      <xsl:apply-templates select="//issues/*" />
	    </table>
	  </xsl:when>
	  <xsl:otherwise>
	    <table class="enity-list">
	      <tr><th>CODE</th><th>NAME</th><th>DESC</th><th/><th/></tr>
	      <xsl:apply-templates select="//issues/*" />
	    </table>
	  </xsl:otherwise>
	</xsl:choose>

	<div class="line">
	  <div class="linkset" >
	    <a href="{concat('/new/', $entity, '.xml?entity=', $entity)}"> <img src="/resources/img/add-blue-icon.svg" /> New <xsl:value-of select="$entity" /> </a>
	  </div>
	</div>
      </div>
    </main>
  </body>
</html>
  </xsl:template>
  
  <xsl:template match="*[($entity != 'PerformancePlanOrReport')	and (local-name() eq $entity)]">
    <tr>
      <td>
	<xsl:value-of select="code/text()" />
      </td>
      <td>
	<xsl:value-of select="name/text()" />
      </td>
      <td>
	<xsl:value-of select="description/text()" />
      </td>
      <td>
	<a name="borrar-{code/text()}" onclick="deleteDocument('{code/text()}','{$entity}')" >
	<img src="/resources/img/delete-blue-icon.svg" alt="Delete" />
	</a>
      </td>
      
      <td>
	<a href="{concat('/form/',$entity, '/' ,  code/text(), '.xml')}"> <img src="/resources/img/edit-blue-icon.svg" alt="Edit" /> </a>
      </td>
      
    </tr>
  </xsl:template>


  <xsl:template match="*[local-name() eq 'PerformancePlanOrReport']">
    <tr>
      <td>
	<xsl:value-of select="Name/text()" />
      </td>
      <td>
	<xsl:value-of select="Organization[1]/Name/text()" />
      </td>
      <td>
	<xsl:value-of select="Submitter/GivenName/text()" />
	<xsl:value-of select="Submitter/Surname/text()" />
      </td>
      <td>
	<a name="borrar-{code/text()}" onclick="deleteDocument('{code/text()}','{$entity}')" ><img src="/resources/img/delete-blue-icon.svg" alt="Delete" /></a>
      </td>
      <td>
	<a href="{concat('/form/',$entity, '/' ,  code/text(), '.xml')}"><img src="/resources/img/edit-blue-icon.svg" alt="Edit" /></a>
      </td>
      <td>
	<a href="{concat('/form/plan-evaluation/' ,  code/text(), '.xml')}"><img src="/resources/img/configuration.svg" alt="Adjust evaluation" title="Adjust evaluation" /></a>
      </td>
      <!--
      <td>
	<a href="{concat('/plan-evaluation/' ,  code/text(), '.html')}"> TEMP </a>
	</td>
	-->
    </tr>
  </xsl:template>

  
  <xsl:template match="text()"></xsl:template>

</xsl:stylesheet>
