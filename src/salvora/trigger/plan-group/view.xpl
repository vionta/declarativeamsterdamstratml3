<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"  version="3.0">


  <p:input port="source" primary="true" ><p:inline><documento><otro></otro></documento></p:inline></p:input>
  
  <p:output port="result" primary="true"  />
  <p:option name="code"   select="'eee'"/>    

    <p:load name="load-file-content"  >
      <p:with-option
	  name="href" select="concat('../../data/plan-group/', $code , '.xml')" />
    </p:load>


  <p:xslt name="final-list">
    <p:with-input port="stylesheet" href="./plan-group-view.xsl"/>
  </p:xslt>
    
  <p:store name="report-serialization" >
    <p:with-option name="href" select="concat('../../report/plan-group/',$code,'.html')" />
  </p:store>

</p:declare-step>
