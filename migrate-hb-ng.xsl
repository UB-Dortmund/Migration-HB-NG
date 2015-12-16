<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:dcterms="http://dublincore.org/documents/dcmi-terms">

    <xsl:include href="migrate-hb-ng-templates.xsl"/>

    <xsl:output method="text" indent="yes" encoding="UTF-8"/>

    <xsl:param name="hasVersion" select="'migrated'"/>
    <xsl:param name="dateOfProcessing" select="'2015-12-02'"/>
    <xsl:param name="baseuri" select="'http://data.uaruhr.de/resource/'"/>
    <xsl:param name="ccAttributionName" select="'TU Dortmund University, University Library'"/>
    <xsl:param name="ccAttributionURL" select="'http://www.ub.tu-dortmund.de'"/>
    <xsl:param name="collectionURI" select="'http://data.uaruhr.de/resource/collection:hb:tudo'"/>

    <xsl:template match="/">

        <!-- TODO collection metadata -->
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$collectionURI"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/DataCatalog&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$collectionURI"/>/about-meta&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$collectionURI"/>&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$dateOfProcessing"/>" .
&lt;<xsl:value-of select="$collectionURI"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};

        <xsl:for-each select="//mods:mods">
        

            <xsl:variable name="recordIdentifier" select="current()/mods:recordInfo/mods:recordIdentifier"/>
            <xsl:variable name="creationDate" select="current()/mods:recordInfo/mods:recordCreationDate"/>
            <xsl:variable name="changeDate" select="current()/mods:recordInfo/mods:recordChangeDate"/>

            <xsl:if test="current()/mods:titleInfo and current()/mods:recordInfo and (current()/mods:originInfo/mods:dateIssued or current()/mods:relatedItem[@type='host']/mods:originInfo/mods:dateIssued or current()/mods:relatedItem[@type='host']/mods:part/mods:date)">

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/DataCatalog&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about-meta&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$dateOfProcessing"/>" .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
}};

                <xsl:if test="not(current()/mods:genre[@authority='local']='Patent')">

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfResPubl&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F3_Manifestation_Product_Type&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Manifestation&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Document&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about-meta&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                <xsl:if test="$changeDate != ''">
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                </xsl:if>
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)"/>&gt; .
&lt;<xsl:value-of select="$collectionURI"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; .
}};

                <xsl:if test="current()/mods:titleInfo[not(@type)]/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[not(@type)]/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[not(@type)]/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:titleInfo/mods:title[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:titleInfo/mods:title/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='abbreviated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='abbreviated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/ontology/bibo/shortTitle' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='abbreviated']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:titleInfo[@type='abbreviated']/mods:title[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:titleInfo[@type='abbreviated']/mods:title/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO eigenes Werk/Expression -->
                <xsl:if test="current()/mods:titleInfo[@type='translated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='translated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='translated']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:titleInfo[@type='translated']/mods:title[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:titleInfo[@type='translated']/mods:title/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <!-- Work title -->
                <xsl:if test="current()/mods:titleInfo[@type='uniform']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='uniform']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='uniform']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:titleInfo[@type='uniform']/mods:title[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:titleInfo[@type='uniform']/mods:title/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='alternative']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='alternative']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/alternative' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='alternative']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>  
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:titleInfo[@type='alternative']/mods:title[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:titleInfo[@type='alternative']/mods:title/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                                                
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO kommt aktuell in den Daten nicht vor
                <xsl:if test="current()/mods:titleInfo[@type='enumerated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='enumerated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle"
                                        select="current()/mods:titleInfo[@type='enumerated']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                    </xsl:call-template>
                </xsl:if>
                -->

                    <xsl:if test="not(current()/mods:relatedItem[@type='host'])">
                        <xsl:call-template name="uuid">
                            <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:independent_publication'"/>
                            <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                            <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                            <!--fieldname muss als Parameter übergeben werden, da output nicht mehr den Pfad beinhaltet-->
                            <xsl:with-param name="fieldname" select="'genre'"/>
                        </xsl:call-template>
                    </xsl:if>


                    <xsl:choose>
                    <xsl:when test="current()/mods:genre[@authority='local']='Lecture' ">
                        <xsl:call-template name="uuid">
                            <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:lecture'"/>
                            <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                            <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                            <!--fieldname muss als Parameter übergeben werden, da output nicht mehr den Pfad beinhaltet-->
                            <xsl:with-param name="fieldname" select="'genre'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="current()/mods:genre[@authority='local']='Contribution' ">
                        <xsl:call-template name="uuid">
                            <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:contribution_in_conference'"/>
                            <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                            <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                            <xsl:with-param name="fieldname" select="'genre'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="current()/mods:genre[@authority='local']='UnpublishedWork' ">
                        <xsl:call-template name="uuid">
                            <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:other'"/>
                            <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                            <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                            <xsl:with-param name="fieldname" select="'genre'"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>

					
					
                <xsl:if test="current()/mods:originInfo/mods:dateIssued">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="mods:originInfo/mods:dateIssued"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#issued' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:originInfo/mods:dateIssued[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:originInfo/mods:dateIssued/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                    <!-- TODO das wird in der ÜO unten gebraucht, nicht hier
                <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:date">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:relatedItem[@type='host']/mods:part/mods:date"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#issued' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:date[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:part/mods:date/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                          
                    </xsl:call-template>
                </xsl:if>
                -->

                <xsl:if test="current()/mods:language/mods:languageTerm">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:language/mods:languageTerm"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#language' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='doi']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='doi']"/>
                        <xsl:with-param name="identifierName" select=" 'DOI' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:identifier[@type='doi' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:identifier[@type='doi']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                             
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='isbn']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='isbn']"/>
                        <xsl:with-param name="identifierName" select=" 'ISBN' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:identifier[@type='isbn' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:identifier[@type='isbn']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='issn']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='issn']"/>
                        <xsl:with-param name="identifierName" select=" 'ISSN' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:identifier[@type='issn' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:identifier[@type='issn']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='pm']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='pm']"/>
                        <xsl:with-param name="identifierName" select=" 'PM' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:identifier[@type='pm' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:identifier[@type='pm']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@type='isi']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@type='isi']"/>
                        <xsl:with-param name="identifierName" select=" 'ISI' "/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#identifier' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:identifier[@type='isi' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:identifier[@type='isi']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>
			
                    <xsl:if test="current()/mods:physicalDescription/mods:extent">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:physicalDescription/mods:extent"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#extent' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:physicalDescription/mods:extent[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:physicalDescription/mods:extent/@valueURI"/>
							</xsl:if>
						</xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:physicalDescription/mods:internetMediaType">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:physicalDescription/mods:internetMediaType"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/MediaType' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:physicalDescription/mods:internetMediaType[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:physicalDescription/mods:internetMediaType/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                    <!-- TODO wird nicht benötigt !
                <xsl:if test="current()/mods:recordInfo/mods:recordCreationDate">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:recordInfo/mods:recordCreationDate"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/recordinfo.html#recordcreationdate' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:recordInfo/mods:recordCreationDate[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:recordInfo/mods:recordCreationDate/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                         
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:recordInfo/mods:recordChangeDate">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:recordInfo/mods:recordChangeDate"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/recordinfo.html#recordchangedate' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:recordInfo/mods:recordChangeDate[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:recordInfo/mods:recordChangeDate/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                            
                    </xsl:call-template>
                </xsl:if>
                -->

                <xsl:if test="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                          
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:abstract">
                    <xsl:call-template name="abstract">
                        <xsl:with-param name="output" select="current()/mods:abstract"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/abstract' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:abstract[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:abstract/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:abstract[@shareable='no']">
                    <xsl:call-template name="abstractShareable">
                        <xsl:with-param name="output" select="current()/mods:abstract[@shareable='no']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/abstract' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:abstract[@shareable='no' and @valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:abstract[@shareable='no']/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                          
                    </xsl:call-template>
                </xsl:if>

                <xsl:for-each select="current()/mods:originInfo/mods:publisher">
					   <xsl:variable name="type" select=" 'expression' "/>
					   <xsl:variable name="position" select="position()"/>
                       <xsl:variable name="fieldname" select="name()"/>
                      <xsl:variable name="uuid">
						  <xsl:choose>
									<xsl:when test="@valueURI and @authority='hbng'">
										<xsl:value-of select="@valueURI"/>
									</xsl:when>
									<xsl:otherwise>
										   <xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/>
									</xsl:otherwise>
            		  		</xsl:choose>
            		  </xsl:variable>
            		  
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://xmlns.com/foaf/0.1/#Organization&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfOrgUnit&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Organization&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F11_Corporate_Body&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Organization&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://xmlns.com/foaf/0.1/#name&gt; "<xsl:value-of select="current()"/>" .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$uuid"/>/about&gt; .
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
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)"/>&gt; .
&lt;<xsl:value-of select="$collectionURI"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$uuid"/>/about&gt; .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://purl.org/dc/terms#publisher&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
}};
                </xsl:for-each>

                <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'aut'">

                <xsl:variable name="authorship-uuid"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-authorship'"/></xsl:variable>

                    <xsl:call-template name="person">
                        <xsl:with-param name="vivoweb" select=" 'Authorship' "/>
                        <xsl:with-param name="output" select="current()/mods:name/mods:role/mods:roleTerm"/> <!--Bei anderem Pfad Fehlermeldung-->
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="creationDate" select="$creationDate"/>
                        <xsl:with-param name="changeDate" select="$changeDate"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:name/mods:role/mods:roleTerm[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:name/mods:role/mods:roleTerm/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                          
                    </xsl:call-template>

                    <!-- Persons with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">

                        <xsl:call-template name="withGND">
                            <xsl:with-param name="persOrg" select=" 'Person' "/>
                            <xsl:with-param name="cerifURI" select=" 'Pers' "/>
                            <xsl:with-param name="crmURI" select=" 'F10_Person' "/>
                            <xsl:with-param name="rdaURI" select=" 'Person' "/>
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                           <xsl:with-param name="uuid" select="$authorship-uuid"/>                           
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Persons without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and not(@authority='gnd') and not(starts-with(@valueURI, 'http://d-nb.info/gnd/')) ]">
                        <xsl:call-template name="withoutGND">
                            <xsl:with-param name="persOrg" select=" 'Person' "/>
                            <xsl:with-param name="cerifURI" select=" 'Pers' "/>
                            <xsl:with-param name="crmURI" select=" 'F10_Person' "/>
                            <xsl:with-param name="rdaURI" select=" 'Person' "/>
							<xsl:with-param name="output" select="'name'"/>
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>                            
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="position" select="position()"/>
                            <xsl:with-param name="type" select=" 'authorship' "/> 
							<xsl:with-param name="newURI">					
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                                         
                        </xsl:call-template>
                        <xsl:call-template name="withoutSec">
							<xsl:with-param name="shipUUID" select="$authorship-uuid"/>
							<xsl:with-param name="output" select="'name'"/>
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>                            
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'authorship' "/>                   
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                                              
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Corprate body without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and not(@authority='gnd') and not(starts-with(@valueURI, 'http://d-nb.info/gnd/')) ]">

                        <xsl:call-template name="withoutGND">
                            <xsl:with-param name="persOrg" select=" 'Organization' "/>
                            <xsl:with-param name="cerifURI" select=" 'OrgUnit' "/>
                            <xsl:with-param name="crmURI" select=" 'F11_CorporateBody' "/>
                            <xsl:with-param name="rdaURI" select=" 'CorporateBody' "/>
							<xsl:with-param name="output" select="'name'"/>                            
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'authorship' "/>             
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                             
                        </xsl:call-template>
                        <xsl:call-template name="withoutSec">
                            <xsl:with-param name="shipUUID" select="$authorship-uuid"/>
							<xsl:with-param name="output" select="'name'"/>                            
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'authorship' "/> 
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                                                                 
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Corprate body with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd' and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        <xsl:call-template name="withGND">
                            <xsl:with-param name="persOrg" select=" 'Organization' "/>
                            <xsl:with-param name="cerifURI" select=" 'OrgUnit' "/>
                            <xsl:with-param name="crmURI" select=" 'F11_CorporateBody' "/>
                            <xsl:with-param name="rdaURI" select=" 'CorporateBody' "/>
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="uuid" select="$authorship-uuid"/>                            
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:if>

                <!--Herausgeber-->
                <xsl:if test="//mods:name/mods:role/mods:roleTerm = 'edt'">
                    <xsl:variable name="editorship-uuid"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-editorship'"/></xsl:variable>

                    <xsl:call-template name="person">
                        <xsl:with-param name="vivoweb" select=" 'Editorship' "/>
                        <xsl:with-param name="output" select="current()/mods:name/mods:role/mods:roleTerm"/> <!--Bei anderem Pfad Fehlermeldung-->                        
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="creationDate" select="$creationDate"/>
                        <xsl:with-param name="changeDate" select="$changeDate"/>
						<xsl:with-param name="newURI">					
							<xsl:if test="current()/mods:name/mods:role/mods:roleTerm[@valueURI and @authority='hbng']">
								<xsl:value-of select="current()/mods:name/mods:role/mods:roleTerm/@valueURI"/>
							</xsl:if>
						</xsl:with-param>                          
                    </xsl:call-template>

                    <!-- Person with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd' and starts-with(@valueURI, 'http://d-nb.info/gnd/')]">
                        <xsl:call-template name="withGND">
                            <xsl:with-param name="persOrg" select=" 'Person' "/>
                            <xsl:with-param name="cerifURI" select=" 'Pers' "/>
                            <xsl:with-param name="crmURI" select=" 'F10_Person' "/>
                            <xsl:with-param name="rdaURI" select=" 'Person' "/>
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="uuid" select="$editorship-uuid"/>                            
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Person without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='personal' and not(@authority='gnd')and not(starts-with(@valueURI, 'http://d-nb.info/gnd/'))]">
                        <xsl:call-template name="withoutGND">
                            <xsl:with-param name="persOrg" select=" 'Person' "/>
                            <xsl:with-param name="cerifURI" select=" 'Pers' "/>
                            <xsl:with-param name="crmURI" select=" 'F10_Person' "/>
                            <xsl:with-param name="rdaURI" select=" 'Person' "/>
							<xsl:with-param name="output" select="'name'"/>                            
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'editorship' "/> 
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                                           
                        </xsl:call-template>
                        <xsl:call-template name="withoutEdtCor">
							<xsl:with-param name="shipUUID" select="$editorship-uuid"/>                        
							<xsl:with-param name="output" select="'name'"/> 
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'editorship' "/> 
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                               
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Corporate body with GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        <xsl:call-template name="withGND">
                            <xsl:with-param name="persOrg" select=" 'Organization' "/>
                            <xsl:with-param name="cerifURI" select=" 'OrgUnit' "/>
                            <xsl:with-param name="crmURI" select=" 'F11_CorporateBody' "/>
                            <xsl:with-param name="rdaURI" select=" 'CorporateBody' "/>
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="uuid" select="$editorship-uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- Corporate body without GND-ID -->
                    <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                        <xsl:call-template name="withoutGND">
                            <xsl:with-param name="persOrg" select=" 'Organization' "/>
                            <xsl:with-param name="cerifURI" select=" 'OrgUnit' "/>
                            <xsl:with-param name="crmURI" select=" 'F11_CorporateBody' "/>
                            <xsl:with-param name="rdaURI" select=" 'CorporateBody' "/>
							<xsl:with-param name="output" select="'name'"/>                             
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                            <xsl:with-param name="creationDate" select="$creationDate"/>
                            <xsl:with-param name="changeDate" select="$changeDate"/>
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'editorship' "/>            
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                             
                        </xsl:call-template>
                        <xsl:call-template name="withoutSec">
							<xsl:with-param name="shipUUID" select="$editorship-uuid"/>                           
							<xsl:with-param name="output" select="'name'"/> 
							<xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                            <xsl:with-param name="position" select="position()"/>  
                            <xsl:with-param name="type" select=" 'editorship' "/>                            
							<xsl:with-param name="newURI">								
								<xsl:if test="@valueURI and @authority='hbng'">
									<xsl:value-of select="@valueURI"/>
								</xsl:if>
							</xsl:with-param>                             
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:if>

                <!-- Subjects -->
                <xsl:for-each select="current()/mods:subject[not(@authority!='hbng')]">
					   <xsl:variable name="type" select=" 'expression' "/>
					   <xsl:variable name="position" select="position()"/>
                       <xsl:variable name="fieldname" select="name()"/>
                      <xsl:variable name="uuid">
						  <xsl:choose>
									<xsl:when test="@valueURI and @authority='hbng'">
										<xsl:value-of select="@valueURI"/>
									</xsl:when>
									<xsl:otherwise>
										   <xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/>
									</xsl:otherwise>
            		  		</xsl:choose>
            		  	</xsl:variable>
            		  	<xsl:variable name="subject-uuid">
								<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="$type"/>-<xsl:value-of select="$position"/>-<xsl:value-of select="$fieldname"/>/subject
            		  	</xsl:variable>


INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2004/02/skos/core#Concept&gt; .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2004/02/skos/core#prefLabel&gt; "<xsl:value-of select="current()/mods:topic"/>" .
&lt;<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$uuid"/>/about&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$uuid"/>/about-meta&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$uuid"/>&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
                    <xsl:if test="$changeDate != ''">
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
                    </xsl:if>
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
&lt;<xsl:value-of select="$uuid"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)"/>&gt; .
&lt;<xsl:value-of select="$collectionURI"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$uuid"/>/about&gt; .
}};

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://purl.org/dc/terms#subject&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
}};


INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-internal-public&gt; {
&lt;<xsl:value-of select="$subject-uuid"/>&gt; &lt;http://rdaregistry.info/Elements/w/subjectRelationship&gt; &lt;<xsl:value-of select="$uuid"/>&gt; .
}};
                </xsl:for-each>

                <xsl:if test="current()/mods:subject[@authority='mesh']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='mesh']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/MESH' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
					    <xsl:with-param name="position" select="position()"/>   				                         
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:subject[@authority='thesoz']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='thesoz']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/subject' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
					    <xsl:with-param name="position" select="position()"/>                        					    
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:subject[@authority='stw']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='stw']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/subject' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
					    <xsl:with-param name="position" select="position()"/>                  						            
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:subject[@authority='lcsh']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:subject[@authority='lcsh']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/LCSH' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
					    <xsl:with-param name="position" select="position()"/>     						                          
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:tableOfContents[@xlink:href]">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:tableOfContents/@xlink:href"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/tableOfContents' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:tableOfContents[@xlink:href and @valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:tableOfContents[@xlink:href]/@valueURI"/>
								</xsl:if>
							</xsl:with-param> 	                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:typeOfResource">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:typeOfResource"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:typeOfResource[@valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:typeOfResource/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                         
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:accessCondition[@type='use and reproduction']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:accessCondition[@type='use and reproduction']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/accessRights' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:accessCondition[@type='use and reproduction' and @valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:accessCondition[@type='use and reproduction']/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                            
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:accessCondition[@type='restriction on access']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:accessCondition[@type='restriction on access']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/accessRights' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
						<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:accessCondition[@type='restriction on access' and @valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:accessCondition[@type='restriction on access']/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:note">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note"/>
                        <xsl:with-param name="uri" select="'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>      
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:note[@valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:note/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                          
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO uri nicht definiert-->
                <xsl:if test="current()/mods:note[@type='publication status']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note[@type='publication status']"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>       
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:note[@type='publication status' and @valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:note[@type='publication status']/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                            
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO uri nicht definiert-->
                <xsl:if test="current()/mods:note[@displayLabel='Preis']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note[@displayLabel='Preis']"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>       
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:note[@displayLabel='Preis' and @valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:note[@displayLabel='Preis']/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                           
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO uri nicht definiert-->
                <xsl:if test="current()/mods:note[@displayLabel='Titelzusaetze']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:note[@displayLabel='Titelzusaetze']"/>
                        <xsl:with-param name="uri" select=" 'http://www.loc.gov/standards/mods/userguide/note.html' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>        
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:note[@displayLabel='Titelzusaetze' and @valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:note[@displayLabel='Titelzusaetze']/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                   
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:location/mods:physicalLocation">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:location/mods:physicalLocation"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>     
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:location/mods:physicalLocation[@valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:location/mods:physicalLocation/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                           
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:location/mods:shelfLocator">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:location/mods:shelfLocator"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>     
							<xsl:with-param name="newURI">								
								<xsl:if test="current()/mods:location/mods:shelfLocator[@valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:location/mods:shelfLocator/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                                           
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:location/mods:url">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:location/mods:url"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>   
                        <xsl:with-param name="newURI">
								<xsl:if test="current()/mods:location/mods:url[@valueURI and @authority='hbng']">
									<xsl:value-of select="current()/mods:location/mods:url/@valueURI"/>
								</xsl:if>
							</xsl:with-param>                     
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO dies hier war und ist ein Provisorium! -->
                
                <xsl:if test="current()/mods:relatedItem[@type='host']">

                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:dependent_publication'"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <!--fieldname muss als Parameter übergeben werden, da output nicht mehr den Pfad beinhaltet-->
                        <xsl:with-param name="fieldname" select="'genre'"/>
                    </xsl:call-template>

                    <xsl:variable name="journal-uuid"><xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0'"/></xsl:variable>

                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:independent_publication'"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                        <xsl:with-param name="recordIdentifier" select="$journal-uuid"/>
                        <!--fieldname muss als Parameter übergeben werden, da output nicht mehr den Pfad beinhaltet-->
                        <xsl:with-param name="fieldname" select="'genre'"/>
                    </xsl:call-template>

                    <!-- TODO genre Proceeding -->
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='Book'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:book&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='BookEdited'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:other&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>							
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='UnpublishedWork'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:other&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>				
        
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='Patent'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:patent&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	        
        
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='periodical'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:other&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	                        
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='CollectedWorks'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:collected_work&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	    			
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='Broadcast'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:radio_tv_programm&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	    									
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='LegalCommentary'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:legal_commentary&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	  
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='InternetDocument'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/internet_document:patent&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	    	
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='ComputerProgram'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:software&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	    
																	  						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='Thesis'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:thesis&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	    
												
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='PressRelease'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:press_release&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	    						
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='AudioBook'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:other&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	  					

						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='AudioOrVideoDocument'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:audio_or_video_document&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	  						
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='SpecialIssue'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:special_issue&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	  		
						
						<xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']='Standard'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:standard&lt;/dcterms:type&gt;
							&lt;relatedItem:constituent&gt;
								genre:<xsl:value-of select="mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;							
						</xsl:if>	  										
						
						<!--Angabe der Unterordnungen mit ihren jeweiligen Überordnungen-->
     					<xsl:if test="mods:genre[@authority='local']='Contribution'">
							<xsl:choose>
								<xsl:when test="mods:relatedItem[@type='host']/mods:genre[@authority='local']='ConferenceProceedings'">&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:contribution_in_conference&lt;/dcterms:type&gt;</xsl:when>
								<xsl:otherwise>&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:contribution_in_compilation&lt;/dcterms:type&gt;</xsl:otherwise>
							</xsl:choose>
							&lt;relatedItem:host&gt;
								genre:<xsl:value-of select="mods:relatedItem[@type='host']/mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;
						</xsl:if>
						
     					<xsl:if test="mods:genre[@authority='local']='ContributionInLegalCommentary'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:contribution_in_legal_commentary&lt;/dcterms:type&gt;
							&lt;relatedItem:host&gt;
								genre:<xsl:value-of select="mods:relatedItem[@type='host']/mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;
						</xsl:if>						

     					<xsl:if test="mods:genre[@authority='local']='JournalArticle'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:journal_article&lt;/dcterms:type&gt;
							&lt;relatedItem:host&gt;
								genre:<xsl:value-of select="mods:relatedItem[@type='host']/mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;
						</xsl:if>		
						
     					<xsl:if test="mods:genre[@authority='local']='NewspaperArticle'">
							&lt;dcterms:type&gt;http://data.uaruhr.de/resource/concept:newspaper_article&lt;/dcterms:type&gt;
							&lt;relatedItem:host&gt;
								genre:<xsl:value-of select="mods:relatedItem[@type='host']/mods:genre[@authority='local']"/>
								recordIdentifier:<xsl:value-of select="mods:recordInfo/mods:recordIdentifier"/>
							&lt;/relatedItem:constituent&gt;
						</xsl:if>								
							

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/efrbroo/121016/F18_Serial_Work&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://rdaregistry.info/Elements/c/Work&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Journal&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$journal-uuid"/>/about&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$journal-uuid"/>/about-meta&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$journal-uuid"/>&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
&lt;<xsl:value-of select="$journal-uuid"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)"/>&gt; .
&lt;<xsl:value-of select="$collectionURI"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$journal-uuid"/>/about&gt; .
}};
<!-- isPartOf / hasPart -->
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://purl.org/dc/terms#isPartOf&gt; &lt;<xsl:value-of select="$journal-uuid"/>&gt; .
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#hasPart&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; .
}};

                    <xsl:variable name="journal-title-uuid"><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-title'"/></xsl:variable>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$journal-title-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$baseuri" />const/<xsl:value-of select="$journal-title-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/120111/E35_Title&gt; .
                    <xsl:variable name="journalTitleString">
                        <xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:title"/>
                        <xsl:if test="current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:subTitle">
                            <xsl:value-of select="concat(' : ', current()/mods:relatedItem[@type='host']/mods:titleInfo[not(@type)]/mods:subTitle)"/>
                        </xsl:if>
                    </xsl:variable>
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$journal-title-uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:call-template name="string-replace-all"><xsl:with-param name="text" select="$journalTitleString"/><xsl:with-param name="replace" select="'&quot;'"/><xsl:with-param name="by" select="'\&quot;'"/></xsl:call-template>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#title&gt; &lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$journal-title-uuid"/>&gt; .
}};

                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='volume']/mods:number">
                        <xsl:variable name="uuid"><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-volume'"/></xsl:variable>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='volume']/mods:number"/>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/ontology/bibo/volume&gt; &lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; .
}};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='issue']/mods:number">
                        <xsl:variable name="uuid"><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-issue'"/></xsl:variable>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:part/mods:detail[@type='issue']/mods:number"/>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/ontology/bibo/issue&gt; &lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; .
}};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:identifier[@type='issn']">
                        <xsl:variable name="uuid"><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-issn'"/></xsl:variable>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "[ISSN] <xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:identifier[@type='issn']"/>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#identifier&gt; &lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; .
}};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:identifier[@type='isbn']">
                        <xsl:variable name="uuid"><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-isbn'"/></xsl:variable>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "[ISBN] <xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:identifier[@type='isbn']"/>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#identifier&gt; &lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; .
}};
                    </xsl:if>
                    <xsl:if test="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']">
                        <xsl:variable name="uuid"><xsl:value-of select="$recordIdentifier"/>/<xsl:value-of select="'work'"/>-<xsl:value-of select="'0-genre'"/></xsl:variable>
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2000/01/rdf-schema#Resource&gt; .
&lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#value&gt; "<xsl:value-of select="current()/mods:relatedItem[@type='host']/mods:genre[@authority='local']"/>" .
}};
INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/ap-vivo-public&gt; {
&lt;<xsl:value-of select="$journal-uuid"/>&gt; &lt;http://purl.org/dc/terms#identifier&gt; &lt;<xsl:value-of select="$baseuri"/>const/<xsl:value-of select="$uuid"/>&gt; .
}};
                    </xsl:if>                    
                </xsl:if>
            </xsl:if>
            </xsl:if>

            <!-- Patent -->
            <xsl:if test="current()/mods:genre[@authority='local']='Patent'">

INSERT DATA { GRAPH &lt;http://data.ub.tu-dortmund.de/graph/main-entities-public&gt; {
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.eurocris.org/ontologies/semcerif/1.3#cfResPat&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://erlangen-crm.org/120111/E31_Document&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://purl.org/ontology/bibo/Document&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/2007/05/powder-s#Document&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://www.w3.org/ns/prov#Entity&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#type&gt; &lt;http://schema.org/Dataset&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://www.w3.org/2007/05/powder-s#describedby&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about-meta&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://erlangen-crm.org/efrbroo/121016/P70_documents&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#licence&gt; &lt;http://creativecommons.org/publicdomain/zero/1.0/legalcode&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionURL&gt; &lt;<xsl:value-of select="$ccAttributionURL" />&gt; .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://creativecommons.org/ns#attributionName&gt; "<xsl:value-of select="$ccAttributionName" />" .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#created&gt; "<xsl:value-of select="$creationDate"/>" .
<xsl:if test="$changeDate != ''">
    &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#modified&gt; "<xsl:value-of select="$changeDate"/>" .
</xsl:if>
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#accessRights&gt; "public" .
&lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; &lt;http://purl.org/dc/terms#hasVersion&gt; &lt;<xsl:value-of select="concat($baseuri, 'concept:', $hasVersion)"/>&gt; .
&lt;<xsl:value-of select="$collectionURI"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; .
&lt;<xsl:value-of select="$baseuri"/>datacatalog:<xsl:value-of select="$recordIdentifier"/>&gt; &lt;http://schema.org/dataset&gt; &lt;<xsl:value-of select="$baseuri"/><xsl:value-of select="$recordIdentifier"/>/about&gt; .
}};

                <xsl:if test="current()/mods:titleInfo[not(@type)]/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[not(@type)]/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[not(@type)]/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:titleInfo/mods:title[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:titleInfo/mods:title/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='abbreviated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='abbreviated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/ontology/bibo/shortTitle' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='abbreviated']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:titleInfo[@type='abbreviated']/mods:title[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:titleInfo[@type='abbreviated']/mods:title/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <!-- TODO eigenes Werk/Expression -->
                <xsl:if test="current()/mods:titleInfo[@type='translated']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='translated']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='translated']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:titleInfo[@type='translated']/mods:title[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:titleInfo[@type='translated']/mods:title/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <!-- Work title -->
                <xsl:if test="current()/mods:titleInfo[@type='uniform']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='uniform']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#title' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='uniform']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:titleInfo[@type='uniform']/mods:title[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:titleInfo[@type='uniform']/mods:title/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:titleInfo[@type='alternative']/mods:title">
                    <xsl:call-template name="title-uuid">
                        <xsl:with-param name="output" select="current()/mods:titleInfo[@type='alternative']/mods:title"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/alternative' "/>
                        <xsl:with-param name="subTitle" select="current()/mods:titleInfo[@type='alternative']/mods:subTitle"/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:titleInfo[@type='alternative']/mods:title[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:titleInfo[@type='alternative']/mods:title/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:call-template name="uuid">
                    <xsl:with-param name="output" select="'http://data.uaruhr.de/resource/concept:patent'"/>
                    <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/type' "/>
                    <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                    <!--fieldname muss als Parameter übergeben werden, da output nicht mehr den Pfad beinhaltet-->
                    <xsl:with-param name="fieldname" select="'genre'"/>
                </xsl:call-template>

                <xsl:if test="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/Location' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text' and @valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:originInfo/mods:place/mods:placeTerm[@type='text']/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:abstract">
                    <xsl:call-template name="abstract">
                        <xsl:with-param name="output" select="current()/mods:abstract"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/abstract' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:abstract[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:abstract/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:abstract[@shareable='no']">
                    <xsl:call-template name="abstractShareable">
                        <xsl:with-param name="output" select="current()/mods:abstract[@shareable='no']"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms/abstract' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:abstract[@shareable='no' and @valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:abstract[@shareable='no']/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:originInfo/mods:dateIssued">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="mods:originInfo/mods:dateIssued"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#issued' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:originInfo/mods:dateIssued[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:originInfo/mods:dateIssued/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:originInfo/mods:dateOther">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="mods:originInfo/mods:dateOther"/>
                        <xsl:with-param name="uri" select=" 'http://vivoweb.org/ontology/core#filingDate' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:originInfo/mods:dateIssued[@valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:originInfo/mods:dateIssued/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:language/mods:languageTerm">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:language/mods:languageTerm"/>
                        <xsl:with-param name="uri" select=" 'http://purl.org/dc/terms#language' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@displayLabel='Veröffentlichungs-Nr']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@displayLabel='Veröffentlichungs-Nr']"/>
                        <xsl:with-param name="uri" select=" 'http://vivoweb.org/ontology/core#patentNumber' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:identifier[@displayLabel='Veröffentlichungs-Nr' and @valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:identifier[@displayLabel='Veröffentlichungs-Nr']/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

                <xsl:if test="current()/mods:identifier[@displayLabel='Anmeldenummer']">
                    <xsl:call-template name="uuid">
                        <xsl:with-param name="output" select="current()/mods:identifier[@displayLabel='Anmeldenummer']"/>
                        <xsl:with-param name="uri" select=" 'http://vivoweb.org/ontology/core#filingNumber' "/>
                        <xsl:with-param name="recordIdentifier" select="$recordIdentifier"/>
                        <xsl:with-param name="newURI">
                            <xsl:if test="current()/mods:identifier[@displayLabel='Anmeldenummer' and @valueURI and @authority='hbng']">
                                <xsl:value-of select="current()/mods:identifier[@displayLabel='Anmeldenummer']/@valueURI"/>
                            </xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

            </xsl:if>

            <!-- Persons with GND-ID -->
            <xsl:for-each select="current()/mods:name[@type='personal' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">

                <xsl:call-template name="withGND">
                    <xsl:with-param name="persOrg" select=" 'Person' "/>
                    <xsl:with-param name="cerifURI" select=" 'Pers' "/>
                    <xsl:with-param name="crmURI" select=" 'F10_Person' "/>
                    <xsl:with-param name="rdaURI" select=" 'Person' "/>
                    <xsl:with-param name="creationDate" select="$creationDate"/>
                    <xsl:with-param name="changeDate" select="$changeDate"/>
                    <xsl:with-param name="uuid" select="$recordIdentifier"/>
                    <xsl:with-param name="isPatent" select="true()"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- Corporate body with GND-ID -->
            <xsl:for-each select="current()/mods:name[@type='corporate' and @authority='gnd'and starts-with(@valueURI, 'http://d-nb.info/gnd/') ]">
                <xsl:call-template name="withGND">
                    <xsl:with-param name="persOrg" select=" 'Organization' "/>
                    <xsl:with-param name="cerifURI" select=" 'OrgUnit' "/>
                    <xsl:with-param name="crmURI" select=" 'F11_CorporateBody' "/>
                    <xsl:with-param name="rdaURI" select=" 'CorporateBody' "/>
                    <xsl:with-param name="creationDate" select="$creationDate"/>
                    <xsl:with-param name="changeDate" select="$changeDate"/>
                    <xsl:with-param name="uuid" select="$recordIdentifier"/>
                    <xsl:with-param name="isPatent" select="true()"/>
                </xsl:call-template>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
