<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:xf="http://www.w3.org/2002/xforms"
    version="3.0" 
    >
  

  <xsl:output 
      method="xml" 
      encoding="UTF-8"
      indent="yes"/>

  <xsl:variable name="labels" >
    <labels>
      <item>
	<name>code</name>
	<label>code</label>
      </item>
      <item>
	<name>Sequence Indicator</name>
	<label>Sequence</label>
      </item>
      <item>
	<name>Name</name>
	<label>Name</label>
      </item>
      <item>
	<name>Acronym</name>
	<label>Acronym</label>
      </item>
      <item>
	<name>Description</name>
	<label>Description</label>
      </item>
      <item>
	<name>Identifier</name>
	<label>Identifier</label>
      </item>
      <item>
	<name>WebAddress</name>
	<label>Web Address</label>
      </item>
      <item>
	<name>Organization</name>
	<label>Organization</label>
      </item>
      <item>
	<name>Stakeholder</name>
	<label>Stakeholder</label>
      </item>
      <item>
	<name>StakeholderType</name>
	<label>Type</label>
      </item>
      <item>
	<name>RoleType</name>
	<label>Type</label>
      </item>
      <item>
	<name>Categorization</name>
	<label>Categorization</label>
      </item>
      <item>
	<name>Category</name>
	<label>Category</label>
      </item>
      <item>
	<name>PointOfContact</name>
	<label>Point Of Contact</label>
      </item>
      <item>
	<name>GivenName</name>
	<label>Given Name</label>
      </item>
      <item>
	<name>Surname</name>
	<label>Surname</label>
      </item>
      <item>
	<name>PhoneNumber</name>
	<label>Phone</label>
      </item>
      <item>
	<name>EmailAddress</name>
	<label>Email</label>
      </item>
      <item>
	<name>Competency</name>
	<label>Competency</label>
      </item>
      <item>
	<name>ValueProposition</name>
	<label>Value Proposition</label>
      </item>
      <item>
	<name>SpecialOrganizationType</name>
	<label>SpecialOrganizationType</label>
      </item>
      <item>
	<name>Vision</name>
	<label>Vision</label>
      </item>
      <item>
	<name>Mission</name>
	<label>Mission</label>
      </item>
      <item>
	<name>FunctionType</name>
	<label>Function Type</label>
      </item>
      <item>
	<name>Value</name>
	<label>Value</label>
      </item>
      <item>
	<name>Goal</name>
	<label>Goal</label>
      </item>
      <item>
	<name>Place</name>
	<label>Place</label>
      </item>
      <item>
	<name>Authority</name>
	<label>Authority</label>
      </item>
      <item>
	<name>SuccessFactor</name>
	<label>Success Factor</label>
      </item>
      <item>
	<name>OtherInformation</name>
	<label>Other Information</label>
      </item>
      <item>
	<name>Objective</name>
	<label>Objective</label>
      </item>
      <item>
	<name>ManagementChallenge</name>
	<label>Management Challenge</label>
      </item>
      <item>
	<name>PerformanceIndicator</name>
	<label>Performance Indicator</label>
      </item>
      <item>
	<name>MeasurementDimension</name>
	<label>Measurement Dimension</label>
      </item>
      <item>
	<name>UnitOfMeasurement</name>
	<label>Unit</label>
      </item>
      <item>
	<name>Relationship</name>
	<label>Relationship</label>
      </item>
      <item>
	<name>Referent</name>
	<label>Referent</label>
      </item>
      <item>
	<name>MeasurementInstance</name>
	<label>Instance</label>
      </item>
      <item>
	<name>TargetResult</name>
	<label>Target</label>
      </item>
      <item>
	<name>NumberOfUnits</name>
	<label>Units</label>
      </item>
      <item>
	<name>ActualResult</name>
	<label>Actual Result</label>
      </item>
      <item>
	<name>RatingType</name>
	<label>Rating Type</label>
      </item>
      <item>
	<name>TwoLevelType</name>
	<label>Two Level</label>
      </item>
      <item>
	<name>ThreeLevelType</name>
	<label>Three Level</label>
      </item>
      <item>
	<name>FiveLevelType</name>
	<label>Five Level Type</label>
      </item>
      <item>
	<name>SevenLevelType</name>
	<label>Seven Level Type</label>
      </item>
      <item>
	<name>TenLevelType</name>
	<label>Ten Level Type</label>
      </item>
      <item>
	<name>StrategyFramework</name>
	<label>Strategy Framework</label>
      </item>
      <item>
	<name>DrivingForce</name>
	<label>Driving Force</label>
      </item>
      <item>
	<name>SWOT</name>
	<label>SWOT</label>
      </item>
      <item>
	<name>Strength</name>
	<label>Strength</label>
      </item>
      <item>
	<name>Weakness</name>
	<label>Weakness</label>
      </item>
      <item>
	<name>Opportunity</name>
	<label>Opportunity</label>
      </item>
      <item>
	<name>Threat</name>
	<label>Threat</label>
      </item>
      <item>
	<name>PESTLE</name>
	<label>PESTLE</label>
      </item>
      <item>
	<name>PoliticalFactor</name>
	<label>Political Factor</label>
      </item>
      <item>
	<name>EconomicFactor</name>
	<label>Economic Factor</label>
      </item>
      <item>
	<name>SocialFactor</name>
	<label>Social Factor</label>
      </item>
      <item>
	<name>TechnologicalFactor</name>
	<label>Technological Factor</label>
      </item>
      <item>
	<name>LegalFactor</name>
	<label>Legal Factor</label>
      </item>
      <item>
	<name>EnvironmentalFactor</name>
	<label>Environmental Factor</label>
      </item>
      <item>
	<name>AdministrativeInformation</name>
	<label>Administrative Information</label>
      </item>
      <item>
	<name>Source</name>
	<label>Source</label>
      </item>
      <item>
	<name>Submitter</name>
	<label>Submitter</label>
      </item>
      <item>
	<name>PerformerOrBeneficiary</name>
	<label>Performer Or Beneficiary</label>
      </item>
      <item>
	<name>RASCI</name>
	<label>RASCI</label>
      </item>
      <item>
	<name>StakeholderTypeType</name>
	<label>Stakeholder Type</label>
      </item>
      <item>
	<name>CompetencyTypeType</name>
	<label>Competency Type</label>
      </item>
      <item>
	<name>OtherOrganizationTypeName</name>
	<label>Other Organization Type</label>
      </item>
      <item>
	<name>Criticality</name>
	<label>Criticality</label>
      </item>
      <item>
	<name>InternalOrExternal</name>
	<label>Internal Or External</label>
      </item>
      <item>
	<name>Priority</name>
	<label>Priority</label>
      </item>
      <item>
	<name>Probability</name>
	<label>Probability</label>
      </item>
      <item>
	<name>Impact</name>
	<label>Impact</label>
      </item>
      <item>
	<name>RelationshipType</name>
	<label>Relationship Type</label>
      </item>
      <item>
	<name>StartDate</name>
	<label>Start Date</label>
      </item>
      <item>
	<name>StartTime</name>
	<label>Start Time</label>
      </item>
      <item>
	<name>EndDate</name>
	<label>End Date</label>
      </item>
      <item>
	<name>EndTime</name>
	<label>End Time</label>
      </item>
      <item>
	<name>Weighting</name>
	<label>Weighting</label>
      </item>
      <item>
	<name>ValueChainStage</name>
	<label>Value Chain Stage</label>
      </item>
      <item>
	<name>PerformanceIndicatorType</name>
	<label>Performance Indicator Type</label>
      </item>
      <item>
	<name>Keyness</name>
	<label>Keyness</label>
      </item>
      <item>
	<name>PublicationDate</name>
	<label>Publication Date</label>
      </item>
      <item>
	<name>InhibitingOrEnabling</name>
	<label>Inhibiting Or Enabling</label>
      </item>
      <item>
	<name>DocumentType</name>
	<label>Document Type</label>
      </item>
      <item>
	<name>Language</name>
	<label>Language</label>
      </item>
    </labels>

  </xsl:variable>
  <!--..... Schema Process .................-->
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- ......... tratamos las labels .................. -->
  <xsl:template match="xf:label" >
    <xsl:copy>
      <xsl:copy-of select="@*" /><!-- ............. Tomamos el textio como nombre .................
	      --><xsl:variable name="label-name" select="text()" /><xsl:choose>
	<!-- ............. Si tiene mas ajustamos y buscamos label, si no copiamos lo que tenga  ................. -->
	<xsl:when test="contains(text()[1],'+')">
	  <xsl:variable name="label-name-adjusted" select="substring(text(),2)" />
	<xsl:choose>
	  <xsl:when test="boolean($labels//item[name eq $label-name-adjusted])" >+ <xsl:value-of select="$labels//item[name eq $label-name-adjusted]/label/text()" ></xsl:value-of>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:apply-templates/>
	  </xsl:otherwise>
	</xsl:choose>	
	</xsl:when>
	<xsl:when test="not(contains(text()[1],'+')) and boolean($labels//item[name = $label-name])"><xsl:value-of select="$labels//item[name = $label-name]/label/text()" ></xsl:value-of></xsl:when>
      	<xsl:otherwise>
	   <xsl:apply-templates/>
	</xsl:otherwise>
    </xsl:choose></xsl:copy>
  </xsl:template>

  <!--..... Copy all parts by default........-->
  <xsl:template match="element()|@*|text()">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
