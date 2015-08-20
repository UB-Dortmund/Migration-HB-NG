<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:uuid="java.util.UUID" exclude-result-prefixes="uuid">

    <xsl:output method="text" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:for-each select="//mods:mods">
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfResPubl&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F22_Self-Contained_Expression&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Expression&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="current()/mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="current()/mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}}

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#language&gt; "<xsl:value-of select="current()/mods:language/mods:languageTerm" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#identifier&gt; "[DOI] <xsl:value-of select="current()/mods:identifier[@type='doi']" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#identifier&gt; "[ISBN] <xsl:value-of select="current()/mods:identifier[@type='isbn']" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#issued&gt; "<xsl:value-of select="current()/mods:originInfo/mods:dateIssued" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#extent&gt; "<xsl:value-of select="current()/mods:physicalDescription/mods:extent" />" .
}}

            <xsl:for-each select="current()/mods:originInfo">
                <xsl:variable name="publisher-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/#name&gt; "<xsl:value-of select="current()/mods:publisher" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="current()/mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="current()/mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}}
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#publisher&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; .
}}
            </xsl:for-each>

            <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'aut'">
                <xsl:variable name="authorship-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#Authorship&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="current()/mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified> "<xsl:value-of select="current()/mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
}}
                <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}}
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .

&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}}
                </xsl:for-each>
                <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}}
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}}
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'edt'">
                <xsl:variable name="editorship-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#Editorship&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="current()/mods:recordInfo/mods:recordIdentifier" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="current()/mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified> "<xsl:value-of select="current()/mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
}}
                <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .

&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}}
                </xsl:for-each>
                <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}}
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}}
                </xsl:for-each>
            </xsl:if>

            <xsl:for-each select="current()/mods:subject[not(@authority)]"><xsl:variable name="uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2004/02/skos/core#Concept&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; &lt;http://www.w3.org/2004/02/skos/core#prefLabel&gt; "<xsl:value-of select="current()/mods:topic" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordCreationDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="../mods:recordInfo/mods:recordChangeDate" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}}
<!--
Hier müssen jetzt noch sämtliche Triple aufgeführt werden, die die obige UUID benötigen. BEACHTE die INSERT DATA-Angaben!
-->

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="../mods:recordInfo/mods:recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#subject&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; .
}}
                <xsl:variable name="work-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-internal-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$work-uuid" />&gt; &lt;http://rdaregistry.info/Elements/w/subjectRelationship&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; .
}}
            </xsl:for-each>


        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>