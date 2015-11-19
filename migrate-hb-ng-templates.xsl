<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:dcterms="http://dublincore.org/documents/dcmi-terms">
  

<xsl:template name="string-replace-all">
        <xsl:param name="text" />
        <xsl:param name="replace" />
        <xsl:param name="by" />
        <xsl:choose>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)" />
                <xsl:value-of select="$by" />
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="substring-after($text,$replace)" />
                    <xsl:with-param name="replace" select="$replace" />
                    <xsl:with-param name="by" select="$by" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="uuid">
        <xsl:param name="output"/>
        <xsl:param name="uri"/>
        <xsl:param name="identifierName"/>
        <!--Wenn es sich um einen Identifier handelt, wird dieser in eckigen Klammern vor die Ausgabe gesetzt-->
        <xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="name($output)"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
			   <!--Wenn bei newURI nichts übergeben wird (leere Zeichenkette), wird valueURI erzeugt-->
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 
		
  
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; <xsl:choose>
        <xsl:when test="$identifierName">"[<xsl:value-of select="$identifierName"/>] <xsl:value-of select="$output"/>" .</xsl:when>
        <xsl:otherwise>"<xsl:call-template name="string-replace-all"><xsl:with-param name="text" select="$output" /><xsl:with-param name="replace" select="'&quot;'" /><xsl:with-param name="by" select="'\&quot;'" /></xsl:call-template>" .</xsl:otherwise>
    </xsl:choose>
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;<xsl:value-of select="$uri"/>&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
}};
    </xsl:template>


    <xsl:template name="title-uuid">
        <xsl:param name="output"/>
        <xsl:param name="uri"/>
        <xsl:param name="subTitle"/>
        <xsl:param name="recordIdentifier"/>
	    <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="name($output)"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/120111/E35_Title&gt; .
        <xsl:variable name="titleString"><xsl:value-of select="$output" /><xsl:if test="$subTitle"><xsl:value-of select="concat(' : ', $subTitle)" /></xsl:if></xsl:variable>
&lt;<xsl:value-of select="$uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:call-template name="string-replace-all"><xsl:with-param name="text" select="$titleString" /><xsl:with-param name="replace" select="'&quot;'" /><xsl:with-param name="by" select="'\&quot;'" /></xsl:call-template>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;<xsl:value-of select="$uri"/>&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
}};
    </xsl:template>

    <xsl:template name="abstract">
        <xsl:param name="output"/>
        <xsl:param name="uri"/>
		<xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="name($output)"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt;
"<xsl:call-template name="string-replace-all"><xsl:with-param name="text" select="$output" /><xsl:with-param name="replace" select="'&quot;'" /><xsl:with-param name="by" select="'\&quot;'" /></xsl:call-template>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;<xsl:value-of select="$uri"/>&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
}};
    </xsl:template>

    <xsl:template name="abstractShareable">
        <xsl:param name="output"/>
        <xsl:param name="uri"/>
        <xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="name($output)"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt;
<xsl:call-template name="string-replace-all"><xsl:with-param name="text" select="$output" /><xsl:with-param name="replace" select="'&quot;'" /><xsl:with-param name="by" select="'\&quot;'" /></xsl:call-template>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;<xsl:value-of select="$uri"/>&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights> "non-public" .
}};
    </xsl:template>

    <xsl:template name="person">
        <xsl:param name="vivoweb"/>
        <xsl:param name="output"/>
        <xsl:param name="creationDate"/>
        <xsl:param name="changeDate"/>
        <xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="name($output)"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#<xsl:value-of select="$vivoweb"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$uuid"/>/about&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$uuid"/>/about-meta&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="$creationDate"/>" .
        <xsl:if test="$changeDate != ''">
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
        </xsl:if>
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)" />&gt; .
&lt;<xsl:value-of select="$collectionURI" />&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$uuid"/>/about&gt; .
}};
    </xsl:template>

    <xsl:template name="withGND">
        <xsl:param name="persOrg"/>
        <xsl:param name="cerifURI"/>
        <xsl:param name="crmURI"/>
        <xsl:param name="rdaURI"/>
        <xsl:param name="creationDate"/>
        <xsl:param name="changeDate"/>
        <xsl:param name="uuid"/>

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/<xsl:value-of select="$persOrg"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cf<xsl:value-of select="$cerifURI"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/<xsl:value-of select="$persOrg"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/<xsl:value-of select="$crmURI"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/<xsl:value-of select="$rdaURI"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#<xsl:value-of select="$persOrg"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about-meta&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
        <xsl:if test="$changeDate != ''">
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
        </xsl:if>
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)" />&gt; .
&lt;<xsl:value-of select="$collectionURI" />&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; .
}};
        <xsl:choose>
            <xsl:when test="$persOrg='Person'">
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .
&lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .

&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
}};
            </xsl:when>
            <xsl:otherwise>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
}};
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--zusätzlich zu withoutGND muss withoutSec oder withoutEdtCor aufgerufen werden-->
    <xsl:template name="withoutGND">
        <xsl:param name="persOrg"/>
        <xsl:param name="cerifURI"/>
        <xsl:param name="crmURI"/>
        <xsl:param name="rdaURI"/>
        <xsl:param name="creationDate"/>
        <xsl:param name="changeDate"/>
        <xsl:param name="output"/>        
        <xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="$output"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>          

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/<xsl:value-of select="$persOrg"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cf<xsl:value-of select="$cerifURI"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/<xsl:value-of select="$persOrg"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/<xsl:value-of select="$crmURI"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/<xsl:value-of select="$rdaURI"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#<xsl:value-of select="$persOrg"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/familyName&gt; "<xsl:value-of select="current()/mods:namePart[@type='family']"/>" .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/givenName&gt; "<xsl:value-of select="current()/mods:namePart[@type='given']"/>" .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="concat(current()/mods:namePart[@type='family'],', ',current()/mods:namePart[@type='given'])"/>" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$uuid"/>/about-meta&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
        <xsl:if test="$changeDate != ''">
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
        </xsl:if>
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)" />&gt; .
&lt;<xsl:value-of select="$collectionURI" />&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$uuid"/>/about&gt; .
}};
    </xsl:template>

    <!--zweite Insert-Data-Anweisung zu withoutGND, anzuwenden bei aut Person und Corporate Bodies sowie bei edt Corporate Bodies-->
    <xsl:template name="withoutSec">
		<xsl:param name="shipUUID"/>
        <xsl:param name="output"/>
        <xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="$output"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 
		   
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$shipUUID"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
}};
    </xsl:template>

    <!--zweite Insert-Data-Anweisung zu withoutGND, anzuwenden bei edt Persons-->
    <xsl:template name="withoutEdtCor">
		<xsl:param name="shipUUID"/>
        <xsl:param name="output"/>
        <xsl:param name="recordIdentifier"/>
        <xsl:param name="type" select=" 'manifestation' "/>
        <xsl:param name="position" select=" '0' "/>
        <xsl:param name="newURI"/>
		<xsl:variable name="fieldname" select="$output"/> 	 
		<xsl:variable name="uuid">
			<xsl:choose>
				<xsl:when test="$newURI=''"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$newURI"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 
        

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$uuid" />&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="$uuid" />" .
&lt;<xsl:value-of select="$uuid" />&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="$uuid" />" .
&lt;<xsl:value-of select="$uuid" />&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="$uuid" />" .

&lt;<xsl:value-of select="$shipUUID" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; .
}};
    </xsl:template>

</xsl:stylesheet>