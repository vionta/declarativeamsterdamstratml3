<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xf="http://www.w3.org/2002/xforms"
    xmlns:ev="http://www.w3.org/2001/xml-events" 
    version="3.0" 
    >




  <xsl:template  match="element[name/text() = 'PESTLE']" >
    <xf:repeat
	ref="PESTLE" appearance="compact" >
      <table class="StrategyFramework" >
	<tr>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Political</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="PoliticalFactor"
		    at="last()"
		    position="after"
		    origin="instance('template')/PoliticalFactor"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Economic</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="EconomicFactor"
		    at="last()"
		    position="after"
		    origin="instance('template')/EconomicFactor"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	</tr>
	<tr>
	  <td>
	    <xsl:apply-templates select="./*[name='PoliticalFactor']" mode="nonew" />
	  </td>
	  <td>
	    <xsl:apply-templates select="element[name='EconomicFactor']" mode="nonew" />
	  </td>
	</tr>
<!--  Social Technological -->
	<tr>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Social</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="SocialFactor"
		    at="last()"
		    position="after"
		    origin="instance('template')/SocialFactor"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Technological</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="TechnologicalFactor"
		    at="last()"
		    position="after"
		    origin="instance('template')/TechnologicalFactor"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	</tr>
	<tr>
	  <td>
	    <xsl:apply-templates select="./*[name='SocialFactor']" mode="nonew" />
	  </td>
	  <td>
	    <xsl:apply-templates select="element[name='TechnologicalFactor']" mode="nonew" />
	  </td>
	</tr>

<!--  Legal Environmental -->
	<tr>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Legal</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="LegalFactor"
		    at="last()"
		    position="after"
		    origin="instance('template')/LegalFactor"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Environmental</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="EnvironmentalFactor"
		    at="last()"
		    position="after"
		    origin="instance('template')/EnvironmentalFactor"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	</tr>
	<tr>
	  <td>
	    <xsl:apply-templates select="./*[name='LegalFactor']" mode="nonew" />
	  </td>
	  <td>
	    <xsl:apply-templates select="element[name='EnvironmentalFactor']" mode="nonew" />
	  </td>
	</tr>
      </table>
    </xf:repeat>
  </xsl:template>

  
  <xsl:template  match="element[name/text() = 'SWOT']" >
    <xf:repeat
	ref="SWOT" appearance="compact" >
      <table class="StrategyFramework">
	<tr>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Strength</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="Strength"
		    at="last()"
		    position="after"
		    origin="instance('template')/Strength"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Weakness</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="Weakness"
		    at="last()"
		    position="after"
		    origin="instance('template')/Weakness"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	</tr>
	<tr>
	  <td>
	    <xsl:apply-templates select="./*[name='Strength']" mode="nonew" />
	  </td>
	  <td>
	    <xsl:apply-templates select="element[name='Weakness']" mode="nonew" />
	  </td>
	</tr>
	<tr>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Opportunity</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="Opportunity"
		    at="last()"
		    position="after"
		    origin="instance('template')/Opportunity"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger>
	  </th>
	  <th>
	    <xf:trigger  >
	      <xf:label>+ Threat</xf:label>
	      <xf:action ev:event="DOMActivate">
		<xf:insert
		    ref="Threat"
		    at="last()"
		    position="after"
		    origin="instance('template')/Threat"
		    context="."
		    />
	      </xf:action>
	    </xf:trigger></th>
	</tr>
	<tr>
	  <td>
	    <xsl:apply-templates select="element[name='Opportunity']" mode="nonew" />
	  </td>
	  <td>
	    <xsl:apply-templates select="element[name='Threat']" mode="nonew" />
	  </td>
	</tr>
      </table>
    </xf:repeat>

    <xf:trigger  ref=".[not(./SWOT)] ">
	<xf:label>+ SWOT</xf:label>
	<xf:action ev:event="DOMActivate" >
	  <xf:setvalue ref="SWOT" value="" />
	  <xf:insert
	      ref="SWOT"
	      at="last()"
	      position="after"
	      origin="instance('template')/SWOT"
	      context="."
	      />
	</xf:action>
    </xf:trigger>
	  
    <xf:trigger  ref=".[not(./PESTLE)] ">
	<xf:label> + PESTLE</xf:label>
	<xf:action ev:event="DOMActivate" >
	  <xf:setvalue ref="PESTLE" value="" />
	  <xf:insert
	      ref="PESTLE"
	      at="last()"
	      position="after"
	      origin="instance('template')/PESTLE"
	      context="."
	      />
	</xf:action>
      </xf:trigger>
  </xsl:template>


  <!-- ............ Elemento con nombre pero no con tipo ......
       Elemento de estructura pero que no forma campo.
  -->
  <xsl:template  match="element[(name/text() = 'NameDescription')]" >
    <xf:repeat
	ref="{./name/text()}" appearance="compact" >
      <xsl:apply-templates select="./element[not(name/text() = 'Name')]"/>

    </xf:repeat>
  </xsl:template>

  
</xsl:stylesheet>
