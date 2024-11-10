<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"  version="3.0">

  <p:input port="source" primary="true" ><p:inline><documento><otro></otro></documento></p:inline></p:input>
  
  <p:output port="result" primary="true"
	    pipe="result@isses-directory-list" />

  
  <p:directory-list
      name="isses-directory-list"
      include-filter=".xml" >
    <p:with-option name="path" select="'../../data/plan-group'" />
  </p:directory-list>

  <p:for-each name="files" >
    <p:with-input select="//*:file[@*:name]"  />

    <p:output port="result">
      <p:pipe step="fin-1" port="result"/>
    </p:output>

    <p:load name="load-file-content"  >
      <p:with-option
	  name="href" select="concat('../../data/plan-group/', .//@*:name)" />
    </p:load>
    <p:identity name="fin-1" />
  </p:for-each>
  
  <p:wrap-sequence name="group-list" wrapper="groups" />
  <p:xslt name="final-list">
    <p:with-input port="stylesheet" href="./plan-groups-view.xsl"/>
  </p:xslt>
  <p:store name="report-serialization" >
    <p:with-option name="href" select="concat('../../report/plan-groups', '.html')" />
    <!--<p:with-input port="source" pipe="result@final-list" />-->
  </p:store>

</p:declare-step>
