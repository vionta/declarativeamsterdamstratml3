<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xf="http://www.w3.org/2002/xforms"
    xmlns:ev="http://www.w3.org/2001/xml-events" 
    version="3.0" 
    >

  <xsl:import href="stratml-form-elements.xsl" />

  <xsl:output 
      method="xml" 
      encoding="UTF-8"
      indent="yes"/>
  
  <xsl:variable name="quote" >'</xsl:variable>

  <xsl:variable name="iconset" >
    <iconset>
      <icon name="Identifier" url="/resources/img/key-icon.svg" label="Identifier" />
      <icon name="SequenceIndicator" url="/resources/img/sequence-list.svg" label="Sequence Indicator" />
      <icon name="Acronym" url="/resources/img/acronym.svg" label="Acronym" />
      <icon name="Source" url="/resources/img/world.svg" label="Source" />
      <icon name="WebAddress" url="/resources/img/world.svg" label="Url" />
      <icon name="Description" url="/resources/img/document.svg" label="Description" />
      <icon name="EmailAddress" url="/resources/img/email.svg" label="Email" />
      <icon name="PhoneNumber" url="/resources/img/phone.svg" label="Phone" />
      <icon name="GivenName" url="/resources/img/name.svg" label="Name" />
      <icon name="Surname" url="/resources/img/family-name.svg" label="Surname" />
    </iconset>
  </xsl:variable>
  
  <!--.......... Lista Principal .................-->
  <xsl:template match="/">
    <div class="main" >
<!--
      <element-list>
	<plan-element>
	  <element-main-section>

	    <element-title>
-->
<div class="section" id="title-section">
  <div class="internal-space">
    <h1>StratML Document Editor</h1>
  </div>
</div>
<div class="section" id="title-section">
  
  <div class="internal-space">
      <element-title>  StratML Plan <xf:input ref="Name" class="Source" placeholder="Name"  ></xf:input>
    <xf:input ref="instance('entity')/code" class="Source"  placeholder="code" ></xf:input>
  </element-title>
  <xf:repeat
		ref="instance('entity')/" appearance="compact" >

    <line class="first-buttons">
      <xsl:apply-templates select="/*[1]/element[type]" mode="buttons"/>
    </line>


	      <xsl:if test="boolean(/*[1]/attribute)" >
	      <line class="input-fields">
		<xsl:apply-templates select="/*[1]/attribute"/>
	      </line>
	      </xsl:if>

	    </xf:repeat>

  </div>
</div>
	    <!--
		<xf:repeat
		ref="instance('entity')/" appearance="compact" >
	      <xsl:apply-templates select="/*[1]/element[type]" mode="buttons"/>
	      </xf:repeat>
	    -->
<!--
		</element-title>
-->
	    <!--	<element-buttons>
		</element-buttons>-->
<!-- <element-content>
-->
	      <xf:repeat
		  ref="instance('entity')/" appearance="compact" >
		  <div class="section" id="mission-section">
		    <div class="internal-space"> 
  
		    <h3>Mission, Vision and Values</h3>
		    <div class="section-content" id="mission-section-content">
		    <xsl:apply-templates select="/*[1]/element[name='Organization' or name='Vision' or name='Mission' or name='Value']" />
		    </div>
		    </div>
		  </div>
		  <div class="section" id="context-section">

		    <div class="internal-space"> 
		      <h3>Context</h3> 
		    <div class="section-content" id="context-section-content">
		      <xsl:apply-templates select="/*[1]/element[name='StrategyFramework']" />
		    </div>
		    </div>
		  </div>
		  <div class="section" id="goal-section">
		    <div class="internal-space"> 
  		    <h3>Goals</h3>
		    <div class="section-content" id="goals-section-content">
		    <xsl:apply-templates select="/*[1]/element[name='Goal']" />
		    </div>
		  </div>
		  </div>
		  <div class="section" id="other-section" >
		    <div class="internal-space"> 
		      <h3>Other Information</h3>		  
		    <div class="section-content" id="other-section-content">
		    <xsl:apply-templates select="/*[1]/element[name='OtherInformation' or name='AdministrativeInformation' or name='Submitter']" />
		    </div>
		    </div>
		  </div>
		  <!--
		      </line>
		      -->
	      </xf:repeat>
<!--
	    </element-content>
	  </element-main-section>
	</plan-element>
	</element-list>
-->

    </div>

  </xsl:template>

  
  <!-- ............ Elemento con nombre pero no con tipo ......
       Elemento de estructura pero que no forma campo.
  -->
  <xsl:template  match="element[(name/text()) and not(type) and not(name/text() = 'SWOT') and not(name/text() = 'PESTLE')  ]" >
    <xf:repeat
	ref="{./name/text()}" appearance="compact" >
      <plan-element  >
	<element-controls
	    class="odd-{(boolean(./../../../*) and not(./../../../../*)) or (boolean(./../../../../../*) and not(./../../../../../../*))}"  >
	  <xf:trigger ref="{concat('.[preceding-sibling::*:',./name/text(),']')}" class="iconbutton" title="Move goal up">
	    <xf:label>
	      <img src="/resources/img/up.svg" />
	    </xf:label>
	    <xf:action ev:event="DOMActivate">
	      <xf:insert origin="context()" ref="{concat('preceding-sibling::*:', ./name/text(),'[1]')}" position="before" />
	      <xf:delete ref="." />
	    </xf:action>
	  </xf:trigger>
	  <xf:trigger ref="{concat('.[following-sibling::*:',./name/text(),']')}" class="iconbutton" title="Move goal down">
	    <xf:label>
	      <img src="/resources/img/down.svg" />
	    </xf:label>
	    <xf:action ev:event="DOMActivate">
	      <xf:insert origin="context()" ref="{concat('following-sibling::*:', ./name/text(),'[1]')}" />
	      <xf:delete ref="." />
	    </xf:action>
	  </xf:trigger>
	  <xf:trigger class="linebutton iconbutton" title="Delete element">
	    <xf:label>
	      <img src="/resources/img/cross.svg" alt="Delete element" />
	    </xf:label>
	    <xf:delete ref="." ev:event="DOMActivate" />
	  </xf:trigger>
	</element-controls>
	<element-main-section>
	  <element-title>
	    <xsl:if test="./element/name/text() = 'SequenceIndicator' " >
	      <field>
	      <xf:input ref="./SequenceIndicator" class="Source SequenceIndicator-input" placeholder="Seq."  />

	      <xf:trigger ref=".[./SequenceIndicator]" >
		<xf:label>X</xf:label>
		<xf:action ev:event="DOMActivate">
		  <xf:delete ref="SequenceIndicator" />
		</xf:action>
	      </xf:trigger>
	      </field>
	    </xsl:if>

	  <xsl:value-of select="name/text()" />
	    

	    <xsl:if test="./element/name/text() = 'Name' " >
	      <xf:input ref="./Name" class="Source Name"  />
	    </xsl:if>
	  </element-title>
	  <element-buttons>
	    <xsl:apply-templates select="./attribute" mode="buttons" />
	    <xsl:apply-templates select="./element[type]" mode="buttons"/>
	  </element-buttons>
	  <element-content>
	    <xsl:if test="./attribute or ./element[type and not(name='Name') and not(name='SequenceIndicator') and not(name='Description')] "> 
	    <line class="input-fields">
	      <xsl:apply-templates select="./attribute"/>
	      <xsl:apply-templates select="./element[type and not(name='Name') and not(name='SequenceIndicator') and not(name='Description')] "/>
	    </line>
	    </xsl:if>
	    <xsl:if test="./element[name='Description']" >
	      <line class="description" >
	      <xsl:apply-templates select="./element[name='Description']"/>
	      </line>
	    </xsl:if>
	    <xsl:apply-templates select="./element[not(type)]"/>

	  </element-content>
	</element-main-section>
      </plan-element>
    </xf:repeat>

    <!-- ........... Choose ............ -->
    <xsl:choose>
      <xsl:when test="boolean(cardinality/optional) and not(cardinality/multiple)" >
	<xf:trigger ref="{concat('.[not(./', name/text(),')]')}" >
	  <xf:label>+<xsl:value-of select="name/text()" /></xf:label>
	  <xf:action ev:event="DOMActivate">
	    <xf:insert
		ref="{name}"
		at="last()"
		position="after"
		origin="instance('template')/{name}"
		context="."
		/>
	  </xf:action>
	</xf:trigger>
      </xsl:when>
      <xsl:when test="boolean(cardinality/multiple)" >
	<xf:trigger  >
	  <xf:label>+<xsl:value-of select="name/text()" /></xf:label>
	  <xf:action ev:event="DOMActivate">
	    <xf:insert
		ref="{name}"
		at="last()"
		position="after"
		origin="instance('template')/{name}"
		context="."
		/>
	  </xf:action>
	</xf:trigger>
      </xsl:when>
    </xsl:choose>


  </xsl:template>

  <!-- ............. Mode no new .........................-->
  <xsl:template  match="element[(name/text()) and not(type) and not(name/text() = 'SWOT') and not(name/text() = 'PESTLE') ]" mode="nonew" >
    <xf:repeat
	ref="{./name/text()}" appearance="compact" >
      <plan-element>
	<element-controls>
	  <xf:trigger ref=".[preceding-sibling::*]" class="iconbutton" title="Move goal up">
	    <xf:label>
	      <img src="/resources/img/up.svg" />
	    </xf:label>
	    <xf:action ev:event="DOMActivate">
	      <xf:insert origin="context()" ref="preceding-sibling::*[1]" position="before" />
	      <xf:delete ref="." />
	    </xf:action>
	  </xf:trigger>
	  <xf:trigger ref=".[following-sibling::*]" class="iconbutton" title="Move goal down">
	    <xf:label>
	      <img src="/resources/img/down.svg" />
	    </xf:label>
	    <xf:action ev:event="DOMActivate">
	      <xf:insert origin="context()" ref="following-sibling::*[1]" />
	      <xf:delete ref="." />
	    </xf:action>
	  </xf:trigger>
	  <xf:trigger class="linebutton iconbutton" title="Delete element">
	    <xf:label>
	      <img src="/resources/img/cross.svg" alt="Delete element" />
	    </xf:label>
	    <xf:delete ref="." ev:event="DOMActivate" />
	  </xf:trigger>

	</element-controls>
	<element-main-section>
	  <element-title>
	    <xsl:if test="./element/name/text() = 'SequenceIndicator' " >
	      <field>
	      <xf:input ref="./Name" class="Source SequenceIndicator-input" placeholder="Seq."  />
	      <xf:trigger ref=".[./SequenceIndicator]" >
		<xf:label>X</xf:label>
		<xf:action ev:event="DOMActivate">
		  <xf:delete ref="SequenceIndicator" />
		</xf:action>
	      </xf:trigger>
	      </field>
	    </xsl:if>
	    <xsl:value-of select="name/text()" />
	    <xsl:if test="./element/name/text() = 'Name' " >
	      <xf:input ref="./Name" class="Source Name"  />
	    </xsl:if>
	  </element-title>
	  <element-buttons>
	    <xsl:apply-templates select="./element[type]" mode="buttons" />
	    <xsl:apply-templates select="./attribute" mode="buttons" />
	  </element-buttons>
	  
	  <element-content>

	    <xsl:apply-templates select="./attribute"/>
	    <xsl:apply-templates select="./element[not(name='Name') or not(name='SequenceIndicator')]"/>

	  </element-content>

	</element-main-section>
      </plan-element>
    </xf:repeat>
  </xsl:template>

  <!-- .......... // TODO : Meter anotaciones ....... -->
  
  
  <xsl:template  match="attribute" >

      <field class="attribute-field" >
	<field-control>
	  <xsl:choose>
	    <xsl:when test="allowed-values" >
	      <xf:select1 ref="@{attribute-name/text()}" class="Source"  >
		<xf:label  ><xsl:value-of select="attribute-name/text()"/></xf:label>
		<xsl:for-each select="allowed-values/value" >
		  <xf:item>
                    <xf:label><xsl:value-of select="text()" /></xf:label>
                    <xf:value><xsl:value-of select="text()" /></xf:value> 
		  </xf:item>
		</xsl:for-each>
	      </xf:select1>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:comment> Log otherwise attx : <xsl:value-of select="attribute-name/text()" ></xsl:value-of>
	      
	      <xsl:if test="not(attribute-name/text())" >
		<xsl:copy-of select="." ></xsl:copy-of>
	      </xsl:if>
	      </xsl:comment>
	      <xsl:if test="boolean(attribute-name/text())" >
		<!-- Optional ................... -->
		<xf:input ref="@{attribute-name/text()}" class="Source"  >
		  <xf:label  ><xsl:value-of select="attribute-name/text()"/></xf:label>
		</xf:input>
	      </xsl:if>
	    </xsl:otherwise>
	  </xsl:choose>
	</field-control>
      </field>

    
    
  </xsl:template>

  
  
  <!-- ...... Campo : Elemento con tipo .... -->
  <xsl:template  match="element[type and not(name='Name') and not(name='SequenceIndicator')]" >
      <field>
	<field-control>
	  <xsl:choose>
	    <xsl:when test="name/text() = 'Description' " >
	      <xf:textarea ref="{name/text()}" class="Source"  placeholder="Description" >
		<!--		<xf:label  ><xsl:value-of select="name/text()"/></xf:label>-->
	      </xf:textarea>
	    </xsl:when>
	    <xsl:otherwise>
	      <xf:input ref="{name/text()}" class="Source {name/text()}-field"  >
		<xf:label  ><xsl:value-of select="name/text()"/></xf:label>
	      </xf:input>
	    </xsl:otherwise>
	  </xsl:choose>
	</field-control>
	<xf:trigger ref="{concat('.[./', name,']')}" >
	  <xf:label>X</xf:label>
	  <xf:action ev:event="DOMActivate">
	    <xf:delete
		ref="{name/text()}"
		/>
	  </xf:action>
	</xf:trigger>
      </field>

  </xsl:template>


  <xsl:template  match="element[type]" mode="buttons"  >
    <xf:trigger ref="{concat('.[not(./', name,')]')}" >
      <xf:label>
	<xsl:variable name="element-name" select="name/text()" />
	<xsl:variable name="icon" select="$iconset//*[@*:name=$element-name]" />
	<xsl:if test="boolean($icon/@url)" >
	  <img src="{$icon/@url}"  alt=".......... " />
	</xsl:if>
	<xsl:if test="not($icon)" >+<xsl:value-of select="name" />
	</xsl:if> 

      </xf:label>
      <xf:action ev:event="DOMActivate">
	<xf:insert
	    ref="{name/text()}"
	    at="last()"
	    position="after"
	    origin="instance('template')/{name/text()}"
	    context="."
	    />
      </xf:action>
    </xf:trigger>

  </xsl:template>

  
  <xsl:template  match="attribute" mode="buttons"  >
    <xf:trigger ref="{concat('.[not(./@', attribute-name,')]')}" >
      <xf:label>
	<xsl:variable name="attribute-name" select="attribute-name/text()" />
	<xsl:variable name="icon" select="$iconset//*[@*:name=$attribute-name]" />
	<xsl:if test="boolean($icon/@url)" >
	  <img src="{$icon/@url}"  alt=".......... " />
	</xsl:if>
	<xsl:if test="not($icon)" >+<xsl:value-of select="attribute-name" />
	</xsl:if> 

      </xf:label>
      <xf:action ev:event="DOMActivate">
	<xf:insert
	    ref="@{attribute-name/text()}" context="." origin="instance('template')/attribute-template/@{attribute-name/text()}"
	    />
      </xf:action>
    </xf:trigger>
    <xf:trigger ref="{concat('.[@', attribute-name,']')}" >
      <xf:label>
	<xsl:variable name="attribute-name" select="attribute-name/text()" />
	<xsl:variable name="icon" select="$iconset//*[@*:name=$attribute-name]" />
	<xsl:if test="boolean($icon/@url)" >
	  <img src="{$icon/@url}"  alt=".......... " />
	</xsl:if>
	<xsl:if test="not($icon)" > -
	<xsl:value-of select="attribute-name" />
	</xsl:if> 

      </xf:label>
      <xf:action ev:event="DOMActivate">
	<xf:delete
	    ref="./@{attribute-name/text()}"
	    />
      </xf:action>
    </xf:trigger>

  </xsl:template>

  <xsl:template  match="element[ (@name) and ((@type='xsd:string') or (@type='xsd:date')) ]" >
    <xf:input ref="{@name}" >
      <xf:label><xsl:value-of select="@name" /></xf:label>
    </xf:input>
  </xsl:template>


  <xsl:template  match="element[(name) and ((@type='xsd:string') or (@type='xsd:date') )]" mode="buttons" >
    <xsl:if test="boolean(cardinality/optional) or boolean(cardinality/multiple)" >
      <xf:trigger ref="{concat('.[not(./', @name,')]')}" >
	<xf:label>Add  1: <xsl:value-of select="@name" /></xf:label>
	<xf:action ev:event="DOMActivate">
	  <xf:insert
	      ref="{@name}"
	      at="last()"
	      position="after"
	      origin="instance('template')/{@name}"
	      context="."
	      />
	</xf:action>
      </xf:trigger>
    </xsl:if>

  </xsl:template>


  <!-- ............ // Fin .............. -->

  <xsl:template
      match="text()" ></xsl:template>

</xsl:stylesheet>
