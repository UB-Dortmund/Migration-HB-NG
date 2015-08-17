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
Hier müssen jetzt noch sämtliche Triple aufgeführt werden, die die obige UUID benötigen. BEACHTE die INSER DATA-Angaben!
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