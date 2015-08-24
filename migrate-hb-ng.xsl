<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:uuid="java.util.UUID" exclude-result-prefixes="uuid">

    <xsl:output method="text" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:for-each select="//mods:mods">

            <xsl:if test="current()/mods:titleInfo and current()/mods:recordInfo and (current()/mods:originInfo/mods:dateIssued or current()/mods:relatedItem[@type='host']/mods:part/mods:date)">

                <xsl:variable name="recordIdentifier" select="current()/mods:recordInfo/mods:recordIdentifier" />
                
                <xsl:variable name="creationDate" select="current()/mods:recordInfo/mods:recordCreationDate" />
                <xsl:variable name="changeDate" select="current()/mods:recordInfo/mods:recordChangeDate" />
                
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfResPubl&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F22_Self-Contained_Expression&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Expression&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#title&gt; "<xsl:value-of select="current()/mods:titleInfo[not(@type)]/mods:title" /><xsl:if test="current()/mods:titleInfo[not(@type)]/mods:subTitle"><xsl:value-of select="concat(' : ', current()/mods:titleInfo[not(@type)]/mods:subTitle)" /></xsl:if>" .
                <xsl:if test="current()/mods:originInfo/mods:dateIssued">
                    &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#issued&gt; "<xsl:value-of select="current()/mods:originInfo/mods:dateIssued" />" .
                </xsl:if>
                <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:date">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#issued&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:part/mods:date" />" .
                </xsl:if>
                <xsl:if test="current()/mods:language/mods:languageTerm">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#language&gt; "<xsl:value-of select="current()/mods:language/mods:languageTerm" />" .
                </xsl:if>
                <xsl:if test="current()/mods:identifier[@type='doi']">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#identifier&gt; "[DOI] <xsl:value-of select="current()/mods:identifier[@type='doi']" />" .
                </xsl:if>
                <xsl:if test="current()/mods:identifier[@type='isbn']">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#identifier&gt; "[ISBN] <xsl:value-of select="current()/mods:identifier[@type='isbn']" />" .
                </xsl:if>
                <xsl:if test="current()/mods:physicalDescription/mods:extent">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#extent&gt; "<xsl:value-of select="current()/mods:physicalDescription/mods:extent" />" .
                </xsl:if>
}};
            <!-- Publisher -->
            <xsl:for-each select="current()/mods:originInfo/mods:publisher">
                <xsl:variable name="publisher-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/#name&gt; "<xsl:value-of select="current()" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#publisher&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$publisher-uuid" />&gt; .
}};
            </xsl:for-each>

            <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'aut'">
                <xsl:variable name="authorship-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#Authorship&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="$creationDate" />" .
                <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
}};
                <!-- Persons with GND-ID -->
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
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .

&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}};
                </xsl:for-each>
                <!-- Persons without GND-ID -->
                <xsl:for-each select="current()/mods:name[@type='personal' and not(@authority='gnd') and not(starts-with(@valueURI, 'http://d-nb.info/gnd/')) ]"><xsl:variable name="per-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/familyName&gt; "<xsl:value-of select="current()/mods:namePart[@type='family']" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/givenName&gt; "<xsl:value-of select="current()/mods:namePart[@type='given']" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="concat(current()/mods:namePart[@type='family'],', ',current()/mods:namePart[@type='given'])" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; .
}};
                </xsl:for-each>
                <!-- Corprate body without GND-ID -->
                <xsl:for-each select="current()/mods:name[@type='corporate' and not(@authority='gnd') and not(starts-with(@valueURI, 'http://d-nb.info/gnd/')) ]"><xsl:variable name="cb-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="current()/mods:namePart" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; .
}};
                </xsl:for-each>
                <!-- Corprate body with GND-ID -->
                <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd' and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
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
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$authorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}};
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'edt'">
                <xsl:variable name="editorship-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#Editorship&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="$creationDate" />" .
                <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
}};
                <!-- Person with GND-ID -->
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
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />" .

&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}};
                </xsl:for-each>
                <!-- Person without GND-ID -->
                <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]"><xsl:variable name="per-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/familyName&gt; "<xsl:value-of select="current()/mods:namePart[@type='family']" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/givenName&gt; "<xsl:value-of select="current()/mods:namePart[@type='given']" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="concat(current()/mods:namePart[@type='family'],', ',current()/mods:namePart[@type='given'])" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="$per-uuid" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="$per-uuid" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="$per-uuid" />" .

&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$per-uuid" />&gt; .
}};
                </xsl:for-each>
                <!-- Corporate body with GND-ID -->
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
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="substring-after(@valueURI, 'gnd/')" />&gt; .
}};
                </xsl:for-each>
                <!-- Corporate body without GND-ID -->
                <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]"><xsl:variable name="cb-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="current()/mods:namePart" />" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                    <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                    </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$editorship-uuid" />&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$cb-uuid" />&gt; .
}};
                </xsl:for-each>
            </xsl:if>

            <!-- Subjects -->
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
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate" />" .
                <xsl:if test="$changeDate != ''">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate" />" .
                </xsl:if>
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#subject&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; .
}};
                <xsl:variable name="work-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-internal-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$work-uuid" />&gt; &lt;http://rdaregistry.info/Elements/w/subjectRelationship&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$uuid" />&gt; .
}};
            </xsl:for-each>

                <xsl:if test="current()/mods:relatedItem[@type='host']"><xsl:variable name="journal-uuid" select="uuid:randomUUID()" />
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F18_Serial_Work&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Work&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Journal&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about-meta&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://purl.org/dc/terms#created&gt; "2009-11-23" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "2013-01-28" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .

<!-- isPartOf / hasPart -->
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; &lt;http://purl.org/dc/terms#isPartOf&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://purl.org/dc/terms#hasPart&gt; &lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$recordIdentifier" />&gt; .

&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://purl.org/dc/terms#title&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:title" /><xsl:if test="current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:subTitle"><xsl:value-of select="concat(' : ', current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:subTitle)" /></xsl:if>" .
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://purl.org/dc/terms#description&gt; "<xsl:value-of select="concat('volume ', current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='volume']/mods:number, ',  issue ', current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='issue']/mods:number)" />" .
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:identifier[@type='issn']">
&lt;http://data.ub.tu-dortmund.de/resource/<xsl:value-of select="$journal-uuid" />&gt; &lt;http://purl.org/dc/terms#identifier&gt; "[ISSN] <xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:identifier[@type='issn']" />" .
                    </xsl:if>
}};
                </xsl:if>


            </xsl:if>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>