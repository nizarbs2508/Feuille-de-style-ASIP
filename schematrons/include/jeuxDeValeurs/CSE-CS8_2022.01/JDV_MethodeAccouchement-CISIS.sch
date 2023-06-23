<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    JDV_MethodeAccouchement-CISIS.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :        
        01/06/2021 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_MethodeAccouchement-CISIS" is-a="dansJeuDeValeurs">
    <p></p>
    <param name="path_jdv" value="$JDV_MethodeAccouchement-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13' and cda:code/@code='57071-3']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>