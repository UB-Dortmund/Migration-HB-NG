<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:uuid="java.util.UUID" exclude-result-prefixes="uuid"  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dcterms="http://dublincore.org/documents/dcmi-terms">

    <xsl:output method="text" indent="yes" encoding="UTF-8"/>


    <xsl:param name="hasVersion" select="'migrated'" />
    <xsl:param name="baseuri" select="'http://data.uaruhr.de/resource/'" />

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
        <xsl:variable name="recordIdentifier" select="current()/mods:recordInfo/mods:recordIdentifier"/>
        <xsl:variable name="creationDate" select="current()/mods:recordInfo/mods:recordCreationDate"/>
        <xsl:variable name="changeDate" select="current()/mods:recordInfo/mods:recordChangeDate"/>
        <xsl:variable name="uuid" select="uuid:randomUUID()"/>

        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; <xsl:choose>
        <xsl:when test="$identifierName">"[<xsl:value-of select="$identifierName"/>] <xsl:value-of select="$output"/>" .</xsl:when>
        <xsl:otherwise>"<xsl:value-of select="$output"/>" .</xsl:otherwise>
    </xsl:choose>
        }};
        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;<xsl:value-of select="$uri"/>&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; .
        }};
    </xsl:template>

    <xsl:template name="title-uuid">
        <xsl:param name="output"/>
        <xsl:param name="uri"/>
        <xsl:param name="subTitle"/>
        <xsl:variable name="recordIdentifier" select="current()/mods:recordInfo/mods:recordIdentifier"/>
        <xsl:variable name="creationDate" select="current()/mods:recordInfo/mods:recordCreationDate"/>
        <xsl:variable name="changeDate" select="current()/mods:recordInfo/mods:recordChangeDate"/>
        <xsl:variable name="uuid" select="uuid:randomUUID()"/>

        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
        <xsl:variable name="titleString"><xsl:value-of select="$output" /><xsl:if test="$subTitle"><xsl:value-of select="concat(' : ', $subTitle)" /></xsl:if></xsl:variable>
        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid" />&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:call-template name="string-replace-all"><xsl:with-param name="text" select="$titleString" /><xsl:with-param name="replace" select="'&quot;'" /><xsl:with-param name="by" select="'\&quot;'" /></xsl:call-template>" .
        }};
        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;<xsl:value-of select="$uri"/>&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; .
        }};
    </xsl:template>
    
    <xsl:template name="person">
		<xsl:param name="vivoweb"/>
		<xsl:variable name="uuid" select="uuid:randomUUID()"/>
		<xsl:variable name="recordIdentifier" select="current()/mods:recordInfo/mods:recordIdentifier"/>
        <xsl:variable name="creationDate" select="current()/mods:recordInfo/mods:recordCreationDate"/>
        <xsl:variable name="changeDate" select="current()/mods:recordInfo/mods:recordChangeDate"/>
                   
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#<xsl:value-of select="$vivoweb"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about-meta&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="$creationDate"/>" .
                    <xsl:if test="$changeDate != ''">
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    </xsl:if>
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
                    }};
		
    </xsl:template>
    
    <xsl:template match="/">

        <xsl:for-each select="//mods:mods">

            <xsl:if test="current()/mods:titleInfo and current()/mods:recordInfo and (current()/mods:originInfo/mods:dateIssued or current()/mods:relatedItem[@type='host']/mods:part/mods:date)">
                <xsl:variable name="recordIdentifier" select="current()/mods:recordInfo/mods:recordIdentifier"/>
                <xsl:variable name="creationDate" select="current()/mods:recordInfo/mods:recordCreationDate"/>
                <xsl:variable name="changeDate" select="current()/mods:recordInfo/mods:recordChangeDate"/>

                INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfResPubl&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F22_Self-Contained_Expression&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Expression&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Document&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about-meta&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                <xsl:if test="$changeDate != ''">
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                </xsl:if>
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)" />&gt; .
                }};


                <xsl:if test="current()/mods:titleInfo/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo/mods:subTitle"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='abbreviated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='abbreviated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='abbreviated']/mods:subTitle"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='translated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='translated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='translated']/mods:subTitle"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='uniform']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='uniform']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='uniform']/mods:subTitle"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='alternative']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='alternative']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/alternative' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='alternative']/mods:subTitle"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='enumerated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='enumerated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='enumerated']/mods:subTitle"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:originInfo/mods:dateIssued">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="mods:originInfo/mods:dateIssued"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#issued' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:date">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:relatedItem[@type='host']/mods:part/mods:date"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#issued' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:language/mods:languageTerm">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:language/mods:languageTerm"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#language' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='doi']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='doi']"/>
                        <xsl:with-param name="identifierName" select=" 'DOI' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='isbn']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='isbn']"/>
                        <xsl:with-param name="identifierName" select=" 'ISBN' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='issn']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='issn']"/>
                        <xsl:with-param name="identifierName" select=" 'ISSN' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='pm']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='pm']"/>
                        <xsl:with-param name="identifierName" select=" 'PM' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='isi']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='isi']"/>
                        <xsl:with-param name="identifierName" select=" 'ISI' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:physicalDescription/mods:extent">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:physicalDescription/mods:extent"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#extent' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:physicalDescription/mods:internetMediaType">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:physicalDescription/mods:internetMediaType"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/MediaType' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:recordInfo/mods:recordCreationDate">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:recordInfo/mods:recordCreationDate"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/recordinfo.html#recordcreationdate' "/>
                    </xsl:call-template>
                </xsl:if>                

                <xsl:if test="current()/mods:recordInfo/mods:recordChangeDate">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:recordInfo/mods:recordChangeDate"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/recordinfo.html#recordchangedate' "/>
                    </xsl:call-template>
                </xsl:if>                 

                <xsl:if test="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="current()/mods:abstract">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:abstract"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/abstract' "/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="current()/mods:abstract[@shareable='no']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:abstract[@shareable='no']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/abstract' "/>
                    </xsl:call-template>
                </xsl:if>
                <!-- Publisher -->
                <xsl:for-each select="current()/mods:originInfo/mods:publisher">
                    <xsl:variable name="publisher-uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/#Organization&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/#name&gt; "<xsl:value-of select="current()"/>" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about-meta&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                    <xsl:if test="$changeDate != ''">
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    </xsl:if>
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                    }};
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://purl.org/dc/terms#publisher&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$publisher-uuid"/>&gt; .
                    }};
                </xsl:for-each>
                <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'aut'">
                    <xsl:variable name="authorship-uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#Authorship&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about-meta&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="$creationDate"/>" .
                    <xsl:if test="$changeDate != ''">
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    </xsl:if>
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
                    }};
                    <!-- Persons with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .

                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        }};
                    </xsl:for-each>
                    <!-- Persons without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and not(@authority='gnd') and not(starts-with(@valueURI, 'http://d-nb.info/gnd/')) ]">
                        <xsl:variable name="per-uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/familyName&gt; "<xsl:value-of select="current()/mods:namePart[@type='family']"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/givenName&gt; "<xsl:value-of select="current()/mods:namePart[@type='given']"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="concat(current()/mods:namePart[@type='family'],', ',current()/mods:namePart[@type='given'])"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; .
                        }};
                    </xsl:for-each>
                    <!-- Corprate body without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and not(@authority='gnd') and not(starts-with(@valueURI, 'http://d-nb.info/gnd/')) ]">
                        <xsl:variable name="cb-uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="current()/mods:namePart"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; .
                        }};
                    </xsl:for-each>
                    <!-- Corprate body with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd' and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$authorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        }};
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'edt'">
                    <xsl:variable name="editorship-uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://vivoweb.org/ontology/core#relatedBy&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://vivoweb.org/ontology/core#Editorship&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about-meta&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created> "<xsl:value-of select="$creationDate"/>" .
                    <xsl:if test="$changeDate != ''">
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    </xsl:if>
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights> "public" .
                    }};
                    <!-- Person with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .

                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>" .

                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        }};
                    </xsl:for-each>
                    <!-- Person without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        <xsl:variable name="per-uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfPers&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F10_Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Person&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/familyName&gt; "<xsl:value-of select="current()/mods:namePart[@type='family']"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/givenName&gt; "<xsl:value-of select="current()/mods:namePart[@type='given']"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="concat(current()/mods:namePart[@type='family'],', ',current()/mods:namePart[@type='given'])"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .

                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#researcherid&gt; "researcherid:<xsl:value-of select="$per-uuid"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#orcidid&gt; "orcidid:<xsl:value-of select="$per-uuid"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#scopusid&gt; "scopusid:<xsl:value-of select="$per-uuid"/>" .

                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$per-uuid"/>&gt; .
                        }};
                    </xsl:for-each>
                    <!-- Corporate body with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="@valueURI"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="substring-after(@valueURI, 'gnd/')"/>&gt; .
                        }};
                    </xsl:for-each>
                    <!-- Corporate body without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        <xsl:variable name="cb-uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/CorporateBody&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/name&gt; "<xsl:value-of select="current()/mods:namePart"/>" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about-meta&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                        <xsl:if test="$changeDate != ''">
                            &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                        </xsl:if>
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$editorship-uuid"/>&gt; &lt;http://vivoweb.org/ontology/core#relates&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$cb-uuid"/>&gt; .
                        }};
                    </xsl:for-each>
                </xsl:if>
                <!-- Subjects -->
                <xsl:for-each select="current()/mods:subject[not(@authority)]">
                    <xsl:variable name="uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2004/02/skos/core#Concept&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2004/02/skos/core#prefLabel&gt; "<xsl:value-of select="current()/mods:topic"/>" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about-meta&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                    <xsl:if test="$changeDate != ''">
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    </xsl:if>
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                    }};

                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://purl.org/dc/terms#subject&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; .
                    }};
                    <xsl:variable name="work-uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-internal-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$work-uuid"/>&gt; &lt;http://rdaregistry.info/Elements/w/subjectRelationship&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$uuid"/>&gt; .
                    }};
                </xsl:for-each>

                <xsl:if test="current()/mods:subject[@authority='mesh']/mods:topic">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='mesh']/mods:topic"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/MESH' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:subject[@authority='thesoz']/mods:topic">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='thesoz']/mods:topic"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/subject' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:subject[@authority='stw']/mods:topic">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='stw']/mods:topic"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/subject' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:subject[@authority='lcsh']/mods:topic">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='lcsh']/mods:topic"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/LCSH' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:tableOfContents[@xlink:href]">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:tableOfContents/@xlink:href"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/tableOfContents' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:typeOfResource">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:typeOfResource"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:accessCondition[@type='use and reproduction']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:accessCondition[@type='use and reproduction']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/accessRights' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:accessCondition[@type='restriction on access']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:accessCondition[@type='restriction on access']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/accessRights' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:note">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note"/>
                        <xsl:with-param name="uri" select="'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:note[@type='publication status']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note[@type='publication status']"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:note[@displayLabel='Preis']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note[@displayLabel='Preis']"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:note[@displayLabel='Titelzusaetze']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note[@displayLabel='Titelzusaetze']"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:location/mods:physicalLocation">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:location/mods:physicalLocation"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:location/mods:shelfLocator">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:location/mods:shelfLocator"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:location/mods:url">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:location/mods:url"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:relatedItem[@type='host']">
                    <xsl:variable name="journal-uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F18_Serial_Work&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Work&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Journal&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about-meta&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;http://www.ub.rub.de&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "Ruhr-Universit\u00E4t Bochum, University Library" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
                    }};
                    <!-- isPartOf / hasPart -->
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://purl.org/dc/terms#isPartOf&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; .
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#hasPart&gt; &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$recordIdentifier"/>&gt; .
                    }};

                    <xsl:variable name="journal-title-uuid" select="uuid:randomUUID()"/>
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$journal-title-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
                    &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$journal-title-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:title"/>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:subTitle">
                        <xsl:value-of select="concat(' : ', current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:subTitle)"/>
                    </xsl:if>" .
                    }};
                    INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                    &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#title&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$journal-title-uuid"/>&gt; .
                    }};

                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='volume']/mods:number">
                        <xsl:variable name="uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='volume']/mods:number"/>" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/ontology/bibo/volume&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; .
                        }};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='issue']/mods:number">
                        <xsl:variable name="uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='issue']/mods:number"/>" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/ontology/bibo/issue&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; .
                        }};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:identifier[@type='issn']">
                        <xsl:variable name="uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "[ISSN] <xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:identifier[@type='issn']"/>" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#identifier&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; .
                        }};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:identifier[@type='isbn']">
                        <xsl:variable name="uuid" select="uuid:randomUUID()"/>
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
                        &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "[ISBN] <xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:identifier[@type='isbn']"/>" .
                        }};
                        INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
                        &lt;<xsl:value-of select="$baseuri" /><xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#identifier&gt; &lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$uuid"/>&gt; .
                        }};
                    </xsl:if>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
