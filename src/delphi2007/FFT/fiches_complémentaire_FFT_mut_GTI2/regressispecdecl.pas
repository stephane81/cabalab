unit regressispecdecl;

interface
const RegressiBLOC1SPECdBV:array[0..115] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�3 NOM VAR',
'f',
'SPEC1',
'SPEC2',
'�3 GENRE VAR',
'0',
'0',
'0',
'�3 UNITE VAR',
'Hz',
'dBV',
'dBV',
'�3 FORMAT VAR',
'0',
'0',
'0',
'�3 AFF VAR',
'0',
'0',
'0',
'�3 PRECISION VAR',
'4',
'4',
'4',
'�3 MECA VAR',
'0',
'0',
'0',
'�3 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'Spectre2',
'�3 INCERTITUDE',
'',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�2 DATETIME',
'dd/MM/yyyy',
'hh:mm:ss',
'�5 MEMO GRANDEURS',
''''+'Spectre d''amplitude',
''''+'f=Frequence',
''''+'SPEC1=20*LOG(Spectre1(valeur efficace)))',
''''+'SPEC2=20*LOG(Spectre2(valeur efficace)))',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&2 X',
'f',
'f',
'&2 Y',
'SPEC1',
'SPEC2',
'&2 TRACE',
'0',
'0',
'&2 MONDE',
'1',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECdB:array[0..115] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�3 NOM VAR',
'f',
'SPEC1',
'SPEC2',
'�3 GENRE VAR',
'0',
'0',
'0',
'�3 UNITE VAR',
'Hz',
'dB',
'dB',
'�3 FORMAT VAR',
'0',
'0',
'0',
'�3 AFF VAR',
'0',
'0',
'0',
'�3 PRECISION VAR',
'4',
'4',
'4',
'�3 MECA VAR',
'0',
'0',
'0',
'�3 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'Spectre2',
'�3 INCERTITUDE',
'',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�2 DATETIME',
'dd/MM/yyyy',
'hh:mm:ss',
'�5 MEMO GRANDEURS',
''''+'Spectre d''amplitude',
''''+'f=Frequence',
''''+'SPEC1=20*LOG(Spectre1(valeur max))',
''''+'SPEC2=20*LOG(Spectre2(valeur max))',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&2 X',
'f',
'f',
'&2 Y',
'SPEC1',
'SPEC2',
'&2 TRACE',
'0',
'0',
'&2 MONDE',
'1',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPEC:array[0..105] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�3 NOM VAR',
'f',
'SPEC1',
'SPEC2',
'�3 GENRE VAR',
'0',
'0',
'0',
'�3 UNITE VAR',
'Hz',
'V',
'V',
'�3 FORMAT VAR',
'0',
'0',
'0',
'�3 PRECISION VAR',
'4',
'4',
'4',
'�3 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'Spectre2',
'�3 INCERTITUDE',
'',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�2 DATETIME',
'dd/MM/yyyy',
'hh:mm:ss',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC1=Spectre1(valeur max)',
''''+'SPEC2=Spectre2(valeur max)',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&2 X',
'f',
'f',
'&2 Y',
'SPEC1',
'SPEC2',
'&2 TRACE',
'0',
'0',
'&2 MONDE',
'1',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECEFF:array[0..105] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�3 NOM VAR',
'f',
'SPEC1',
'SPEC2',
'�3 GENRE VAR',
'0',
'0',
'0',
'�3 UNITE VAR',
'Hz',
'V',
'V',
'�3 FORMAT VAR',
'0',
'0',
'0',
'�3 PRECISION VAR',
'4',
'4',
'4',
'�3 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'Spectre2',
'�3 INCERTITUDE',
'',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�2 DATETIME',
'dd/MM/yyyy',
'hh:mm:ss',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC1=Spectre1(valeur efficace)',
''''+'SPEC2=Spectre2(valeur efficace)',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&2 X',
'f',
'f',
'&2 Y',
'SPEC1',
'SPEC2',
'&2 TRACE',
'0',
'0',
'&2 MONDE',
'1',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECdBVCH1:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC1',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'dBV',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC1=20*LOG(Spectre1(valeur efficace))',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC1',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECdBCH1:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC1',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'dB',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC1=20*LOG(Spectre1(valeur max))',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC1',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECCH1:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC1',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'V',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC1=Spectre1(valeur max)',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC1',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECEFFCH1:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC1',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'V',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre1',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC1=Spectre1(valeur efficace)',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC1',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECdBVCH2:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC1',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'dBV',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre2',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC2=20*LOG(Spectre2(valeur efficace))',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC2',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECdBCH2:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC2',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'dB',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre2',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC2=20*LOG(Spectre2(valeur max))',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC2',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECCH2:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC2',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'V',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre2',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC2=Spectre2(valeur max)',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC2',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');

const RegressiBLOC1SPECEFFCH2:array[0..97] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'f',
'SPEC2',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'Hz',
'V',
'�2 FORMAT VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 SIGNIF VAR',
'FREQUENCE',
'Spectre2',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�5 MEMO GRANDEURS',
''''+'Spectre d amplitude',
''''+'f=Frequence',
''''+'SPEC2=Spectre2(valeur efficace)',
'',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&1 LIGNE',
'0',
'&1 COULEUR',
'-16777198',
'&1 MOTIF',
'0',
'&1 X',
'f',
'&1 Y',
'SPEC2',
'&1 TRACE',
'1',
'&1 MONDE',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');


const RegressiBLOC2SPEC:array[0..28] of shortstring=('',
'&2 OPTIONS',
'1',
'1',
'&10 VALEUR PARAM',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'&10 INCERT PARAM',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'&1 ORIGINE TEMPS',
'20/10/2003',
'');
{ }



const RegressiBLOC1:array[0..113] of  shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�3 NOM VAR',
't',
'v1',
'v2',
'�3 GENRE VAR',
'0',
'0',
'0',
'�3 UNITE VAR',
's',
'V',
'V',
'�3 FORMAT VAR',
'0',
'0',
'0',
'�3 AFF VAR',
'0',
'0',
'0',
'�3 PRECISION VAR',
'4',
'4',
'4',
'�3 MECA VAR',
'0',
'0',
'0',
'�3 SIGNIF VAR',
'',
'',
'',
'�3 INCERTITUDE',
'',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'0',
'�1 uniteSI',
'0',
'�2 ACQUISITION',
'CLAVIER',
'',
'�0 GRAPHE VAR',
'&2 LIGNE',
'0',
'0',
'&2 COULEUR',
'16711680',
'255',
'&2 MOTIF',
'0',
'0',
'&2 X',
't',
't',
'&2 Y',
'v1',
'v2',
'&2 TRACE',
'0',
'0',
'&2 MONDE',
'1',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');
{ }


const RegressiBLOC2:array[0..28] of shortstring=('',
'&2 OPTIONS',
'1',
'1',
'&10 VALEUR PARAM',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'&10 INCERT PARAM',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'&1 ORIGINE TEMPS',
'20/10/2003',
'');
{ }



const RegressiBLOC1MesuresCaba:array[0..95] of shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�2 NOM VAR',
'v1',
'v2',
'�2 GENRE VAR',
'0',
'0',
'�2 UNITE VAR',
'V',
'V',
'�2 FORMAT VAR',
'0',
'0',
'�2 AFF VAR',
'0',
'0',
'�2 PRECISION VAR',
'4',
'4',
'�2 MECA VAR',
'0',
'0',
'�2 SIGNIF VAR',
'voie 1',
'voie 2',
'�2 INCERTITUDE',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�4 MEMO GRANDEURS',
''''+'Caract�ristiqueXY',
''''+'v1=voie 1',
''''+'v2=voie 2',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR ',
'&0 LIGNE',
'&0 COULEUR',
'&0 MOTIF',
'&0 X',
'&0 Y',
'&0 TRACE',
'&0 MONDE',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&16 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'5',
'0',
'1',
'1');


const RegressiBLOC2MesuresCaba:array[0..39] of shortstring=('',
'&2 OPTIONS',
'1',
'1',
'&10 VALEUR PARAM',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'&10 INCERT PARAM',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'&10 STDEV PARAM',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'&1 ORIGINE TEMPS',
'20/10/2003',
'');


const RegressiBLOC1BOD:array[0..130] of  shortstring=('',
'EVARISTE REGRESSI WINDOWS 1.0',
'�6 NOM VAR',
'f',
'G',
'phi',
'Ve',
'Vs',
'T',
'�6 GENRE VAR',
'0',
'0',
'0',
'0',
'0',
'0',
'�6 UNITE VAR',
'Hz',
'dB',
'V',
'V',
'V',
'rad',
'�6 FORMAT VAR',
'0',
'0',
'0',
'0',
'0',
'0',
'�6 PRECISION VAR',
'4',
'4',
'4',
'4',
'4',
'4',
'�6 SIGNIF VAR',
'Fr�quence',
'Gain',
'Phase',
'Tension eff d entr�e',
'Tension eff de sortie',
'Transmittance',
'�3 INCERTITUDE',
'',
'',
'',
'�10 NOM SAUVE',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�10 UNITE PARAM',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'�1 TRIGO',
'1',
'�1 uniteSI',
'0',
'�2 DATETIME',
'dd/MM/yyyy',
'hh:mm:ss',
'�1 LOGBOX',
'0',
'�8 MEMO GRANDEURS',
''''+'Diagramme de Bode',
''''+'f=Frequence',
''''+'G=Gain',
''''+'phi=Phase',
''''+'Ve=Tension eff d entr�e',
''''+'Vs=Tension eff de sortie',
''''+'T=Transmittance',
'',
'�2 ACQUISITION',
'FICHIER',
'',
'�0 GRAPHE VAR',
'&2 X',
't',
't',
'&2 Y',
'v1',
'v2',
'&2 TRACE',
'0',
'0',
'&2 MONDE',
'1',
'1',
'&3 GRADUATION',
'0',
'0',
'0',
'&3 ZERO',
'1',
'1',
'1',
'&15 OPTIONS',
'1',
'2',
'0',
'3',
'3',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'6',
'0',
'1',
'&2 ANIMATION temporelle',
'1',
'TRUE');


const RegressiBLOC2BOD:array[0..27] of  shortstring=('',
'&2 OPTIONS',
'1',
'1',
'&10 VALEUR PARAM',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'1E-26',
'&10 INCERT PARAM',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'0',
'&1 ORIGINE TEMPS',
'22/10/2003');






implementation

end.
