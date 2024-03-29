<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    abstractSpecialty.sch :
    Contenu :
        Contrôle de l'élement code (spécialité d'un PS) par rapport aux JDV définis dans CI-SIS_StructurationMinimale.sch
        
    Paramètres d'appel :
        $path_jdv1 : chemin du jeu de valeurs externe (fichier conforme au schéma CI-SIS_jeuDeValeurs.xsd)
        $path_jdv2 : chemin du jeu de valeurs externe (fichier conforme au schéma CI-SIS_jeuDeValeurs.xsd)
        $path_jdv3 : chemin du jeu de valeurs externe (fichier conforme au schéma CI-SIS_jeuDeValeurs.xsd)
        $path_jdv4 : chemin du jeu de valeurs externe (fichier conforme au schéma CI-SIS_jeuDeValeurs.xsd)
        $path_jdv5 : chemin du jeu de valeurs externe (fichier conforme au schéma CI-SIS_jeuDeValeurs.xsd)
        $path_jdv6 : chemin du jeu de valeurs externe (fichier conforme au schéma CI-SIS_jeuDeValeurs.xsd)
        $vue_elt : chaine affichable représentant le chemin de l'élément codé à contrôler dans le document courant
        $xpath_elt : contexte xpath de l'élément codé dans le document courant
        $nullFlavor (0/1) : nullFlavor autorisé (1) ou non (0)
    Historique :
        11/12/2020 : SBM : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="abstractSpecialty" abstract="true" 
    xmlns:svs="urn:ihe:iti:svs:2008">
    <p>Contrôle de l'appartenance du code spécialité du PS par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="$xpath_elt">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(
            (@code and @codeSystem and @displayName) or
            ($nullFlavor and 
            (@nullFlavor='UNK' or 
            @nullFlavor='NA' or 
            @nullFlavor='NASK' or 
            @nullFlavor='ASKU' or 
            @nullFlavor='NI' or 
            @nullFlavor='NAV' or 
            @nullFlavor='MSK' or 
            @nullFlavor='OTH')) or
            (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))
            )">
            [abstractSpecialty] L'élément "<value-of select="$vue_elt"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(
            @nullFlavor or
            (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or 
            (document($path_jdv1)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]) or  (document($path_jdv2)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])
            or  (document($path_jdv3)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])or (document($path_jdv4)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])
            or  (document($path_jdv5)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]) or (document($path_jdv5)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]))">
            <!--  débrayage du contrôle sur le displayName qui risque de générer un trop grand nombre d'assert-failed en raison d'une différence 
              non significative de libellé (pb de casse d'un caractère, un espace en trop, un caractère "'" mal codé ...
        <assert test="@nullFlavor or 
                     (document($path_jdv1)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem and @displayName=$att_displayName])">
        -->
            [abstractSpecialty] L'élément <value-of select="$vue_elt"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$path_jdv1"/> ou <value-of select="$path_jdv2"/> ou <value-of select="$path_jdv3"/> ou <value-of select="$path_jdv4"/>
            ou <value-of select="$path_jdv5"/> ou <value-of select="$path_jdv6"/>.
        </assert>
    </rule>
</pattern>   
