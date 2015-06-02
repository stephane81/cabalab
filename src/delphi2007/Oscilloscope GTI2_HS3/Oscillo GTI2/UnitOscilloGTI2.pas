unit UnitOscilloGTI2;

// Oscillo V:37

{$DEFINE CABALABin}           //: fonctionne DANS CABALAB
//{$DEFINE Independant}           //: pour utiliser sans cabalab

{$IFDEF Independant}            //: dans cabalab les DEFINE sont fais par CABALABHS3 ou CABALABGTI2//
  {$DEFINE GTI2}
  //{$DEFINE HS3}
{$ENDIF}

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls,dlldecl,Inifiles, Buttons,
  ToolWin, ImgList;

{definition de l'objet configuration, de l'interface utilisateur, oscillo}
type config = record

   Start   : Boolean;       //true: timer en route, variable controlé par le button Run/Stop

   Trigger : integer;     //0 : sans, 1 : Y1, 2 : Y2, 3 : Y3, 4 : Y4.
   front   : integer;     //1 : montant, 0 decendant.
   Level   : double;        //?????

   PreTrig : boolean;
   TrigOK  : boolean;
   PointTrig   : integer;
   HYSTPreTrig :real;

   VoieVisible : array [1..4] of boolean; //[a]:=true : Ya visible     [a]:=false : Ya INvisible et non acqui
   couleurs    : array [0..5] of Tcolor;  //0: fond d'écran ; 1,2,3,4 couleurs des traces des voies 1234  ; 5:GRILLE
   PenWidth    : integer;                 //épaisseur des traces à l'écran;

   NbVoiesVisible : integer; //0,1,2,3,4 pour le nb d'écrab en mode 1 écran/voie...

   SondeVoie   : array [1..4] of boolean; //[a]:=true : Ya x10         [a]:=false : Ya x1
   Unipolaire  : array [1..4] of boolean; //[a]:=true : Ya UNIPOLAIRE  [a]:=false : Ya DIFFERENTIEL
   sensibilitee: array [1..4] of integer; //[a]: voie Ya, valeurs : cf numéros index combobox

   Invertion   : array [1..4] of boolean; //[a]:=true : Ya INV  [a]:=false : Ya normal

   DecalZeros : boolean;                  //true = oui...
   ValeursDecalZERO   : array [1..4]  of integer;


   UniDiffFacade :boolean;                    //true = oui...

   MULTI         : boolean;                  //true = oui...
   Enregistrement: boolean;                  //true = oui...
   MONOCOUP      : boolean;                  //true = oui...
   Acumul        : boolean;

   EXAO          : boolean;                  //true = oui...
   EXAO_FREQ     : dword  ;
   EXAO_FREQ_ITEM : integer;                 //pour les enrg et charg comfig
   EXAO_LongEnrg_temporaire : integer  ;
   EXAO_LongEnrg : integer  ;

   BaseDetemps   : integer;                 //Cf numéros de base de temps (valeurs scrollbarre)
   TimeOut       : integer;                 //no menu du time out "getusbdata" avec retour 0 pas de trig ou pas de data
   timeoutVALEURutilisateur : integer;                 // NB de  "getusbdata" avec retour 0 pas de trig ou pas de data  avant un reset écrans

   Vitesse  : integer;                    //1 : trés lent/ trés précis; 2 : lent/ précis; 3 :+rapide -précis  ; 4 :++rapide --précis
   affichage : integer;                   //1:normal;  2:1écran par voie

   ConfigOscillo : integer;
end;

{definition de l'objet courbe, pour les enregistrements}
type courbe = record
   Valide : boolean;
   voie1        : dArray; //Array [0..recordlength] of double;   
   voie2        : dArray; //Array [0..recordlength] of double;
   voie3        : dArray; //Array [0..recordlength] of double;
   voie4        : dArray; //Array [0..recordlength] of double;

   freq_ech     : dword;
   long_ech     : dword;
   
   PreTrig : boolean;
   PointTrig   : integer;


   BDT          : integer;
   calibCh1_ech : double;
   calibCh2_ech : double;
   calibCh3_ech : double;
   calibCh4_ech : double;
   
  // CouplageCH1DC  : boolean;
  // CouplageCH2DC  : boolean;
   INVCH1       : boolean;
   INVCH2       : boolean;
   INVCH3       : boolean;
   INVCH4       : boolean;

   Unipol_Y1     : boolean;
   Unipol_Y2     : boolean;
   Unipol_Y3     : boolean;
   Unipol_Y4     : boolean;
   
   //ADD          : boolean;
   mode         : ( ch1 , ch2 ,ch3,ch4, chop );
   Tmode         : array [0..4] of boolean;     //[0]=true : les 4   ; [i]=true : la voie i +...
   //XY          : boolean;
   couleur1     : Tcolor;
   couleur2     : Tcolor;
   couleur3     : Tcolor;
   couleur4     : Tcolor;

   nom          : string[255];
   visible      : boolean;
end;





type
  TFormOscilloGTI2 = class(TForm)
    PaintBoxECRAN: TPaintBox;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    GroupBoxTrigger: TGroupBox;
    GroupBoxVOIES: TGroupBox;
    GroupBoxBaseDeTemps_1: TGroupBox;
    GroupBoxVOIE1: TGroupBox;
    RadioButtonTriggerCH2: TRadioButton;
    RadioButtonTriggerCH3: TRadioButton;
    RadioButtonTriggerCH4: TRadioButton;
    RadioButtonTriggerSANS: TRadioButton;
    RadioButtonTriggerCH1: TRadioButton;
    GroupBoxFrontTrigger: TGroupBox;
    RadioButtonFrontMontant: TRadioButton;
    RadioButtonFrontDescendant: TRadioButton;
    Config: TMenuItem;
    ALLuni: TMenuItem;
    ALLdiff: TMenuItem;
    ComboBoxY1: TComboBoxEx;
    RadioButtonY1SondeX1: TRadioButton;
    RadioButtonY1SondeX10: TRadioButton;
    GroupBoxVOIE3: TGroupBox;
    ComboBoxY3: TComboBoxEx;
    RadioButtonY3SondeX1: TRadioButton;
    RadioButtonY3SondeX10: TRadioButton;
    GroupBoxVOIE4: TGroupBox;
    ComboBoxY4: TComboBoxEx;
    RadioButtonY4SondeX1: TRadioButton;
    RadioButtonY4SondeX10: TRadioButton;
    GroupBoxVOIE2: TGroupBox;
    ComboBoxY2: TComboBoxEx;
    RadioButtonY2SondeX1: TRadioButton;
    RadioButtonY2SondeX10: TRadioButton;
    CheckBoxY1Visible: TCheckBox;
    CheckBoxY2Visible: TCheckBox;
    CheckBoxY3Visible: TCheckBox;
    CheckBoxY4Visible: TCheckBox;
    GroupBoxLEVEL: TGroupBox;
    ScrollBarLevelTrigger: TScrollBar;
    ScrollBarBDT_1: TScrollBar;
    RadioButtonBDT4_1: TRadioButton;
    RadioButtonBDT5_1: TRadioButton;
    RadioButtonBDT6_1: TRadioButton;
    RadioButtonBDT7_1: TRadioButton;
    RadioButtonBDT8_1: TRadioButton;
    RadioButtonBDT9_1: TRadioButton;
    RadioButtonBDT10_1: TRadioButton;
    RadioButtonBDT11_1: TRadioButton;
    RadioButtonBDT12_1: TRadioButton;
    RadioButtonBDT1_1: TRadioButton;
    RadioButtonBDT2_1: TRadioButton;
    RadioButtonBDT3_1: TRadioButton;
    ScrollBarDecalBDT_1: TScrollBar;
    BDT: TMenuItem;
    MenuDecalBDT: TMenuItem;
    GroupBoxEnregistrement: TGroupBox;
    Options: TMenuItem;
    menuEnregistrement: TMenuItem;
    N1: TMenuItem;
    UniY1: TMenuItem;
    UniY2: TMenuItem;
    UniY3: TMenuItem;
    UniY4: TMenuItem;
    N2: TMenuItem;
    DiffY1: TMenuItem;
    N3: TMenuItem;
    DiffY2: TMenuItem;
    DiffY3: TMenuItem;
    DiffY4: TMenuItem;
    Timer1: TTimer;
    VitesseAqcuisition1: TMenuItem;
    Vlent: TMenuItem;
    Vrapide: TMenuItem;
    VUrapide: TMenuItem;
    OptionEcran: TMenuItem;
    Normal: TMenuItem;
    ecranPV: TMenuItem;
    PaintBoxECRAN1: TPaintBox;
    PaintBoxECRAN2: TPaintBox;
    PaintBoxECRAN3: TPaintBox;
    PaintBoxECRAN4: TPaintBox;
    CheckBoxINVCH1: TCheckBox;
    CheckBoxINVCH2: TCheckBox;
    CheckBoxINVCH3: TCheckBox;
    CheckBoxINVCH4: TCheckBox;
    ScrollBar0CH1: TScrollBar;
    ScrollBar0CH2: TScrollBar;
    ScrollBar0CH3: TScrollBar;
    ScrollBar0CH4: TScrollBar;
    MenuDecalZeros: TMenuItem;
    Button0DECALCH1: TButton;
    Button0DECALCH2: TButton;
    Button0DECALCH3: TButton;
    Button0DECALCH4: TButton;
    Button0LEVEL: TButton;
    Timer2: TTimer;
    LabelWARNING: TLabel;
    CheckBoxXY: TCheckBox;
    PageControlMesures: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    LabelVch1AC: TLabel;
    LabelVch1ACDC: TLabel;
    LabelVch1Max: TLabel;
    LabelVch1Min: TLabel;
    LabelTch1: TLabel;
    LabelFch1: TLabel;
    LabelVch1DC: TLabel;
    LabelVch2DC: TLabel;
    LabelVch2AC: TLabel;
    LabelVch2Max: TLabel;
    LabelVch2Min: TLabel;
    LabelFch2: TLabel;
    LabelVch3DC: TLabel;
    LabelVch3AC: TLabel;
    LabelVch3ACDC: TLabel;
    LabelVch3Max: TLabel;
    LabelVch3Min: TLabel;
    LabelTch3: TLabel;
    LabelFch3: TLabel;
    LabelVch4DC: TLabel;
    LabelVch4AC: TLabel;
    LabelVch4ACDC: TLabel;
    LabelVch4Max: TLabel;
    LabelVch4Min: TLabel;
    LabelTch4: TLabel;
    LabelFch4: TLabel;
    LabelVch2ACDC: TLabel;
    LabelTch2: TLabel;
    MULTI: TMenuItem;
    ButtonCH1Enreg: TButton;
    ButtonCH2Enreg: TButton;
    ButtonCH3Enreg: TButton;
    ButtonCH4Enreg: TButton;
    ButtonDUALEnreg: TButton;
    PaintBoxA: TPaintBox;
    ButtonSUPRenrg: TButton;
    ScrollBarEnregistrements: TScrollBar;
    RegressiBR: TMenuItem;
    RegressiBR2: TMenuItem;
    VUlent: TMenuItem;
    ConfigOscilo800600: TMenuItem;
    ConfigOscilo1024768: TMenuItem;
    ConfigOscilo1280960: TMenuItem;
    PaintBoxXY: TPaintBox;
    TempoET_XY: TMenuItem;
    LabelLEVEL: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    menutimeout: TMenuItem;
    menutimeout1: TMenuItem;
    menutimeout2: TMenuItem;
    menutimeout3: TMenuItem;
    N6: TMenuItem;
    menutimeout4: TMenuItem;
    PaintBoxTRIGlevel: TPaintBox;
    MenuInterfaceTaille: TMenuItem;
    MenuEnregConfig: TMenuItem;
    Charger1: TMenuItem;
    menuMONOCOUP: TMenuItem;
    GroupBoxMONOCOUP: TGroupBox;
    menuTIMEOUEUTILISATEURREGLAGE: TMenuItem;
    ProgressBar1: TProgressBar;
    ButtonStartMonoCoup: TButton;
    ButtonStopMonoCoup: TButton;
    ScrollBarTimeOutMonoCoup: TScrollBar;
    Label2: TLabel;
    Label3: TLabel;
    menuCouleurs: TMenuItem;
    RegressiDDE: TMenuItem;
    N8: TMenuItem;
    MenuRegUtilisateur: TMenuItem;
    PaintBoxColor1: TPaintBox;
    PaintBoxColor2: TPaintBox;
    PaintBoxColor3: TPaintBox;
    PaintBoxColor4: TPaintBox;
    MenuAcumul: TMenuItem;
    MenuApropos: TMenuItem;
    Apropo: TMenuItem;
    Enregistrement1: TMenuItem;
    Chargement1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    menu_TregressiInst_NEWfichier: TMenuItem;
    menu_TregressiInst_NEWpage: TMenuItem;
    LabelEnreg: TLabel;
    GroupBoxBaseDeTemps_II: TGroupBox;
    ComboBoxEx_BDT_II_FREQ: TComboBoxEx;
    Edit_BDTII_NB_POINTS: TEdit;
    Label_BDT_II_dt: TLabel;
    Label_BDT_II_T_total: TLabel;
    Label_BDT_II_ECRAN: TLabel;
    Button_BDT_II_VALIDATION: TButton;
    menu_BDT_II: TMenuItem;
    Label1: TLabel;
    Label4: TLabel;
    CheckBoxPreTrig: TCheckBox;
    menuHYST_PRE_TRIG: TMenuItem;
    menu_HYST_PRETRIG_10mV: TMenuItem;
    menu_HYST_PRETRIG_20mV: TMenuItem;
    menu_HYST_PRETRIG_50mV: TMenuItem;
    menu_HYST_PRETRIG_100mV: TMenuItem;
    menu_HYST_PRETRIG_UTILISATEUR: TMenuItem;
    menuOptionVoies: TMenuItem;
    menuOptionSondes: TMenuItem;
    menuOptionINV: TMenuItem;
    menuOptionUniDiffFacade: TMenuItem;
    N11: TMenuItem;
    CheckBoxUniDiff1: TCheckBox;
    CheckBoxUniDiff2: TCheckBox;
    CheckBoxUniDiff3: TCheckBox;
    CheckBoxUniDiff4: TCheckBox;
    GroupBoxBaseDeTemps: TGroupBox;
    ScrollBarBDT: TScrollBar;
    RadioButtonBDT7: TRadioButton;
    RadioButtonBDT8: TRadioButton;
    RadioButtonBDT9: TRadioButton;
    RadioButtonBDT10: TRadioButton;
    RadioButtonBDT11: TRadioButton;
    RadioButtonBDT12: TRadioButton;
    RadioButtonBDT13: TRadioButton;
    RadioButtonBDT14: TRadioButton;
    RadioButtonBDT15: TRadioButton;
    RadioButtonBDT4: TRadioButton;
    RadioButtonBDT5: TRadioButton;
    RadioButtonBDT6: TRadioButton;
    ScrollBarDecalBDT: TScrollBar;
    RadioButtonBDT1: TRadioButton;
    RadioButtonBDT2: TRadioButton;
    RadioButtonBDT3: TRadioButton;
    Label5: TLabel;
    Label6: TLabel;
    GroupBoxBaseDeTemps_IV_FREQ_ECH: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ValideFregPossiblr: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    ToolButton_cabalab: TToolButton;
    ToolButton_GBF: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton_ecran_1_4: TToolButton;
    ToolButton_monocoup: TToolButton;
    ToolButton_boite_enregistrements: TToolButton;
    ToolBar4: TToolBar;
    ToolButton8: TToolButton;
    ToolButton_new_fichier: TToolButton;
    ToolButton_Newpage: TToolButton;
    ToolButton19: TToolButton;
    ToolButton_enrg_mutipage: TToolButton;
    ToolButton_enrg_monopage: TToolButton;
    ToolButton_regressi_utilisateur: TToolButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ToolButton_Multimetre: TToolButton;
    GroupBoxBaseDeTemps_III_CHOIX: TGroupBox;
    Button_BDT_OSCILLO: TButton;
    Button_BDT_EXAO: TButton;
    Configurationdesvoies1: TMenuItem;
    N5: TMenuItem;
    ChargerSauverlaconfiguration1: TMenuItem;
    N13: TMenuItem;
    Remiseazrodelaconfiguration1: TMenuItem;
    Dclenchement1: TMenuItem;
    ModePrdclenchementPrTrig1: TMenuItem;
    PrsentationOscilloscope1: TMenuItem;
    N7: TMenuItem;
    Image1: TImage;
    ToolButtonrunstop: TToolButton;
    ToolButton2: TToolButton;
    ButtonRunStop: TButton;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    MenuUniDiffFacade: TMenuItem;
    N4: TMenuItem;


    procedure ApropoClick(Sender: TObject);
    
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure BoxCabaLabClick(Sender: TObject);

    procedure ResetEcran (sender: Tpaintbox);
    procedure ResetEcran_bitmap (sender: Tbitmap);
    procedure ResetEcran3DIV (sender: Tpaintbox);
    procedure ResetEcranXY (sender: Tpaintbox);

    procedure resetConfiguration (sender: Tobject);
    procedure ValidationConfiguration (sender: Tobject);
    procedure ValidConfigINTERFACE_GTI2 (sender: Tobject);

    procedure TriggerChange (sender: Tobject);
    procedure YChange (sender: Tobject);
    procedure XChange (sender: Tobject);
    procedure XChange_II (sender: Tobject);
    procedure XChange_II_NBdePOINTS_click (sender: Tobject);
    procedure XChange_II_CALCUL (sender: Tobject);

    procedure Button_BDT_OSCILLO_EXAO_Click(Sender: TObject);

    procedure Menu_BDT_II_Click(Sender: TObject);
    procedure Menu_HYST_PRETRIG_Click(Sender: TObject);
    procedure MenuDecalBDTClick(Sender: TObject);
    procedure MenuTimeOutClick(Sender: TObject);
    procedure UniDiffChange (sender: Tobject);
    procedure MenuECRANClick(Sender: TObject);
    procedure MenuDECALAGEZEROClick(Sender: TObject);
    procedure MenuOPTIONSClick(Sender: TObject);
    procedure MenuConfigCOULEURSClick(Sender: TObject);
    procedure MenuChargerConfigFichier(Sender: TObject);
    procedure MenuEnregistrerConfigFichier(Sender: TObject);
    procedure MenuChargerConfig(Sender: TObject);
    procedure MenuEnregistrerConfig(Sender: TObject{; var Action :TCloseAction});
    procedure MenuConfigOscilloClick(Sender: TObject);
    procedure MenuRESETconfigClick(Sender: TObject);

    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
   // procedure Affichage_voies(Sender: TPaintBox);
    procedure Affichage_voiesXY(Sender: TPaintBox);

    procedure SearchTrigPoint (sender: Tobject);

    procedure Affichage_voie_CHX(Sender: TPaintBox ; voie:integer);

    procedure Affichage_voie_CHX_bitmap(Sender: Tbitmap ; voie:integer);

    procedure affichageEnregistrements(Sender: Tpaintbox);

    procedure Timer2Timer(Sender: TObject);


    procedure DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double;var Amax3:double ;var Amax4:double ;var Amin3:double ;var Amin4:double );
    procedure MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);
    procedure MESURES(Sender: Tobject);
   
    procedure ScrollBarEnregistrementsChange(Sender: TObject);
    procedure ButtonEnregClick(Sender: TObject);
    procedure SuprimerEnregistrementClick(Sender: TObject);

    procedure REGRESSIBR1Click(Sender: TObject);
    procedure Regressi2Click(Sender: TObject);




    procedure AffichageBarreTrig(sender: Tpaintbox);
    procedure TriggerBARREChange (sender: Tobject);
    procedure ValideFregPossiblrClick(Sender: TObject);

    procedure MONOCOUP_START_Click(Sender: TObject);
    procedure MONOCOUP_STOP_Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure RegressiDDEClick(Sender: TObject);
    procedure MenuRegUtilisateurClick(Sender: TObject);
    procedure MenuRegUtilisateurClick_RETOUR(Sender: TObject);
   
    procedure EnvoieDonneesGTI( ch1,ch2,ch3,ch4,NewFichier:boolean );
    procedure Quitter1Click(Sender: TObject);

    procedure resetPositions (sender: Tobject);
    procedure Edit_BDTII_NB_POINTSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    
  


    procedure ResetEcran_BLEU (sender: Tpaintbox);
    procedure Edit1Change(Sender: TObject);
  

    procedure Affichage_voiS_BLEU_DYN(Destination: Tpaintbox);
    procedure Affichage_voiS_par_vois_BLEU_DYN(Destination: Tpaintbox;No_voie:integer);
    procedure Affichage_voiesXY_bitmap(Sender: Tbitmap);
    procedure Affichage_XY_BLEU_DYN(Destination: Tpaintbox);
    procedure ResetEcranXY_bitmap (sender: Tbitmap);

    procedure RESET_Normal_BLEU_DYN(Destination: Tpaintbox);
    procedure RESET_XY_BLEU_DYN(Destination: Tpaintbox);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton_enrg_mutipageClick(Sender: TObject);
    procedure ToolButton_enrg_monopageClick(Sender: TObject);

    





    




  private
    { Déclarations privées }
  public
    { Déclarations publiques }
     CompteurTIMEOUT : integer;
  end;

var
  FormOscilloGTI2: TFormOscilloGTI2;        //POURQUOI?

  TchXDoubleArray : array [1..4]of darray;  //tableau des tableaux de données

  congiguration  : config;
  TensionMaxEcran: array[0..9] of double;   //valeurs des tension max de l'écran fonction des réglage de sensib
  MCV: array [0..4,0..1] of Tmenuitem;      //tableau des Tmenuitem du menu : cofigurations des voies

  TRadioButTriggerMode : array [0..4] of   TradioButton; //voie du trigger  (0:sans)
  TRadioButtonFront    : array [0..1] of   TradioButton; //Front du trigger

  GroupBoxVOIE:array[1..4] of TgroupBox;   //sous boxs des VOIES
  ComboSensiB :array[1..4] of TcomboBoxEx;  //sensib
  TcheckBoxVoieVisible : array[1..4] of TCheckBox; //croix des voies visibles ou non
  TRadioButtonYxSondeX1  : array[1..4] of  TradioButton;    //sondes X1
  TRadioButtonYxSondeX10  : array[1..4] of  TradioButton;   //sondes X10 (inutilisé car binaire avec les X1)
  TCheckBoxINVCH : array[1..4] of TCheckBox; //Invertion des voies
  TCheckBoxUNIDIFF : array[1..4] of TCheckBox; //UNi Diff Facade
  TpaintBoxColorYx : array[1..4] of TpaintBox; //affichage des couleurs de voies si changement utilisateur

  Tecrans:array[0..5] of Tpaintbox;         //0: principal; 1234 écrans séparés; 5 XY

  TscrollBarCH:array[1..4] of TscrollBar ;  //scrolbar de décalage des zéros
  TButton0DECALCH:array[1..4]of Tbutton;    //mise à zéro centrale des traces

  FrequenceEch: dword     ;
  LongEnregistrement: dword  ;
  Sensibilite15 :double;
  Sensibilite75 :double;

  courbes:array[1..10]of courbe;            //enregistrements
  nb_courbes_stockees:integer;              //nb d'enregistrement du moment
  num_de_courbe:integer;                    //num de la courbe visible ds la boite d'enregistrement
  courbe_options:integer;                   //pas util pour l'instant

  erreur: word ;

  PositionEcransTOP : array [1..4,1..4] of integer; //[a,b] a: nb d'écrans ;b=1 TOP
  PositionEcransHEIGHT : array [1..4] of integer; //[a] a: nb d'écrans

  ACQUI: boolean;               // ture si rappatriment en cours des data gti2
  compteurNOTRIG:integer;       // compteur équivalent timeout
  Bool_reset_ecran : boolean;   // true si on doit fair un reset des écrans                 (pour le onpaint, gérer par le timer)
  Bool_affichage   : boolean;   // true si on doit afficher les tableaux de données dispo.  (pour le onpaint, gérer par le timer)

  //boolLabelEchecMonoCoup : boolean; //pour l'affichage du label ECHEC monocoup

  monoCoupRunning:boolean;      //gére par l'appui sur le bouton lancer du mono coup : si TRUE : la procédure d'attente_trig/rapatriment du mono coup est en train de tourner

  TempoAffichMesures  : integer; //compteur ds le timer1

  EnterKeyTempo:boolean;


implementation

{$IFDEF CABALABin}     //GTI2
uses    UnitOscilloGTI2TIMEOUT{, UnitOscilloGTI2GestionCouleursCourbes}, UnitOsciG2GestCoulCou{, Demodde}{, UnitOscilloGTI2TransfertRegressiUtilisateur},UnitOsciG2TransRegUtil,UnitCabalab, UnitGBF, UnitAPropos,UnitTransfertRegressi,clipbrd;
{$ENDIF}

{$IFDEF Independant}   //GTI2
uses    UnitOscilloGTI2TIMEOUT{, UnitOscilloGTI2GestionCouleursCourbes}, UnitOsciG2GestCoulCou{, Demodde}{, UnitOscilloGTI2TransfertRegressiUtilisateur},UnitOsciG2TransRegUtil{,UnitCabalab, UnitGBF, UnitAPropos},UnitTransfertRegressi,clipbrd;
{$ENDIF}

{$R *.dfm}
function TSL_TO_RVB_TCOLOR(T,S,L:integer):Tcolor ;
var
    T0,M,n,delta:real;
    i,r,g,b:integer;

begin
     T0:=6*T/240;
     if L<=120 then
     begin
          M:=(255/240)*L*(1+S/240);
          n:=(255/240)*L*(1-S/240);
     end;
     if L>120 then
     begin
          M:=((255/240)*L*(1-S/240))+(255/240)*S;
          n:=((255/240)*L*(1+S/240))-(255/240)*S;
     end;
     delta:=M-n;
     i:=trunc(T0);
     case i of
              0 : begin b:=round(n); g:=round(n+T0*delta);      r:=round(M);  end;
              1 : begin b:=round(n); r:=round(n+(2-T0)*delta);  r:=round(M);  end;
              2 : begin r:=round(n); b:=round(n+(T0-2)*delta);  g:=round(M);  end;
              3 : begin r:=round(n); g:=round(n+(4-T0)*delta);  b:=round(M);  end;
              4 : begin g:=round(n); r:=round(n+(T0-4)*delta);  b:=round(M);  end;
              5 : begin g:=round(n); b:=round(n+(6-T0)*delta);  r:=round(M);  end;
     end;
     TSL_TO_RVB_TCOLOR:=r + (g*$100) + (b*$10000);



end;


procedure TFormOscilloGTI2.BoxCabaLabClick(Sender: TObject);
begin
     if sender=ButtonRunStop then
     begin
          if congiguration.Start=true then
          begin
               if (timer1.enabled) and (@timer1.OnTimer <> nil) then
               begin
                    Timer1.enabled       := False;
                    congiguration.Start  := false;
                    ButtonRunStop.Caption:='Start';
              end;
          end
          else
          begin
               Timer1.enabled       := True;
               congiguration.Start  :=True;
               ButtonRunStop.Caption:='Stop';

          end;
     end;

     if sender=ToolButtonrunstop then
     begin
          if congiguration.Start=true then
          begin
               if (timer1.enabled) and (@timer1.OnTimer <> nil) then
               begin
                    Timer1.enabled       := False;
                    congiguration.Start  := false;
                    //ButtonRunStop.Caption:='Start';
                    ToolButtonrunstop.ImageIndex:=5;
              end;
          end
          else
          begin
               Timer1.enabled       := True;
               congiguration.Start  :=True;
               //ButtonRunStop.Caption:='Stop';
                ToolButtonrunstop.ImageIndex:=6;

          end;
     end;


     if ({(sender=SpeedButtonCabaLab) or} (sender=ToolButton_cabalab)) then
     begin
        {$IFDEF CABALABin}
        FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
        FormCabaLab.BringToFront;
        {$ENDIF}
     end;
     if ({(sender=ButtonGBF) or }(sender=ToolButton_GBF)) then
     begin
        {$IFDEF CABALABin}
        formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
        formGBF.BringToFront;
        {$ENDIF}
     end;
end;

procedure TFormOscilloGTI2.resetPositions (sender: Tobject);
begin
     TempoAffichMesures:=0;
 //if GTI2  then            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!??????????????????????????????????????????
 //begin
 FormOscilloGTI2.Top:=0;
 FormOscilloGTI2.left:=0;
 FormOscilloGTI2.width:=800;
 FormOscilloGTI2.height:=671;

// Formtimeout.Top:=0;
// Formtimeout.left:=0;

// FormConfigCouleurs.Top:=0;
// FormConfigCouleurs.left:=0;

 PageControlMesures.Top:=504;
 PageControlMesures.left:=0;
 GroupBoxEnregistrement.Top:=504;
 GroupBoxEnregistrement.left:=0;
 GroupBoxMONOCOUP.Top:=504;
 GroupBoxMONOCOUP.left:=0;
 GroupBoxBaseDeTemps.Top:=384;
 GroupBoxBaseDeTemps.left:=0;
 GroupBoxBaseDeTemps_II.Top:=384;
 GroupBoxBaseDeTemps_II.left:=0;
 GroupBoxBaseDeTemps_III_CHOIX.Top:=384;
 GroupBoxBaseDeTemps_III_CHOIX.left:=0;
 GroupBoxBaseDeTemps_IV_FREQ_ECH.Top:=384;
 GroupBoxBaseDeTemps_IV_FREQ_ECH.left:=0;

 PositionEcransTOP[1,1]:=16;
 PositionEcransTOP[2,1]:=16;
 PositionEcransTOP[2,2]:=272;
 PositionEcransTOP[3,1]:=16;
 PositionEcransTOP[3,2]:=173;
 PositionEcransTOP[3,3]:=346;
 PositionEcransTOP[4,1]:=16;
 PositionEcransTOP[4,2]:=144;
 PositionEcransTOP[4,3]:=272;
 PositionEcransTOP[4,4]:=400;
end;


procedure TFormOscilloGTI2.FormCreate(Sender: TObject);
//var coulForm:Tcolor;
begin
 //coulForm:=TSL_TO_RVB_TCOLOR(160,0,200);
 //FormOscilloGTI2.Color :=coulForm;
 EnterKeyTempo:=false;

 {$IFDEF Independant}   //GTI2
 InitInstrument ($308);   //valeur du HS3!
 Timer1.enabled:=true;
 {$ENDIF}

 TchXDoubleArray[1]:=Ch1DoubleArray;       //pas utilisé encore mais a faire....
 TchXDoubleArray[2]:=Ch2DoubleArray;
 TchXDoubleArray[3]:=Ch3DoubleArray;
 TchXDoubleArray[4]:=Ch4DoubleArray;

 MCV[0,0]:=ALLuni;
 MCV[1,0]:=UniY1;
 MCV[2,0]:=UniY2;
 MCV[3,0]:=UniY3;
 MCV[4,0]:=UniY4;
 MCV[0,1]:=ALLdiff;
 MCV[1,1]:=DiffY1;
 MCV[2,1]:=DiffY2;
 MCV[3,1]:=DiffY3;
 MCV[4,1]:=DiffY4;

 TRadioButTriggerMode[0]:=RadioButtonTriggerSANS;
 TRadioButTriggerMode[1]:=RadioButtonTriggerCH1;
 TRadioButTriggerMode[2]:=RadioButtonTriggerCH2;
 TRadioButTriggerMode[3]:=RadioButtonTriggerCH3;
 TRadioButTriggerMode[4]:=RadioButtonTriggerCH4;

 TRadioButtonFront[1]:=RadioButtonFrontMontant;
 TRadioButtonFront[0]:=RadioButtonFrontDescendant;

 GroupBoxVOIE[1]:=GroupBoxVOIE1;
 GroupBoxVOIE[2]:=GroupBoxVOIE2;
 GroupBoxVOIE[3]:=GroupBoxVOIE3;
 GroupBoxVOIE[4]:=GroupBoxVOIE4;

 ComboSensiB[1]:=ComboBoxY1;
 ComboSensiB[2]:=ComboBoxY2;
 ComboSensiB[3]:=ComboBoxY3;
 ComboSensiB[4]:=ComboBoxY4;

 TcheckBoxVoieVisible[1]:=CheckBoxY1Visible;
 TcheckBoxVoieVisible[2]:=CheckBoxY2Visible;
 TcheckBoxVoieVisible[3]:=CheckBoxY3Visible;
 TcheckBoxVoieVisible[4]:=CheckBoxY4Visible;

 TRadioButtonYxSondeX1[1]:=RadioButtonY1SondeX1;
 TRadioButtonYxSondeX1[2]:=RadioButtonY2SondeX1;
 TRadioButtonYxSondeX1[3]:=RadioButtonY3SondeX1;
 TRadioButtonYxSondeX1[4]:=RadioButtonY4SondeX1;

 TRadioButtonYxSondeX10[1]:=RadioButtonY1SondeX10;
 TRadioButtonYxSondeX10[2]:=RadioButtonY2SondeX10;
 TRadioButtonYxSondeX10[3]:=RadioButtonY3SondeX10;
 TRadioButtonYxSondeX10[4]:=RadioButtonY4SondeX10;

 TCheckBoxINVCH[1]:=CheckBoxINVCH1;
 TCheckBoxINVCH[2]:=CheckBoxINVCH2;
 TCheckBoxINVCH[3]:=CheckBoxINVCH3;
 TCheckBoxINVCH[4]:=CheckBoxINVCH4;

 TCheckBoxUNIDIFF[1]:=CheckBoxUniDiff1;
 TCheckBoxUNIDIFF[2]:=CheckBoxUniDiff2;
 TCheckBoxUNIDIFF[3]:=CheckBoxUniDiff3;
 TCheckBoxUNIDIFF[4]:=CheckBoxUniDiff4;

 TpaintBoxColorYx[1]:=PaintBoxColor1;
 TpaintBoxColorYx[2]:=PaintBoxColor2;
 TpaintBoxColorYx[3]:=PaintBoxColor3;
 TpaintBoxColorYx[4]:=PaintBoxColor4;

 Tecrans[0]:=PaintBoxECRAN;
 Tecrans[1]:=PaintBoxECRAN1;
 Tecrans[2]:=PaintBoxECRAN2;
 Tecrans[3]:=PaintBoxECRAN3;
 Tecrans[4]:=PaintBoxECRAN4;
 Tecrans[5]:=PaintBoxXY;

 TscrollBarCH[1]:=ScrollBar0CH1;
 TscrollBarCH[2]:=ScrollBar0CH2;
 TscrollBarCH[3]:=ScrollBar0CH3;
 TscrollBarCH[4]:=ScrollBar0CH4;

 TButton0DECALCH[1]:=Button0DECALCH1;
 TButton0DECALCH[2]:=Button0DECALCH2;
 TButton0DECALCH[3]:=Button0DECALCH3;
 TButton0DECALCH[4]:=Button0DECALCH4;

 TensionMaxEcran[0]:=15;
 TensionMaxEcran[1]:=20;
 TensionMaxEcran[2]:=8;
 TensionMaxEcran[3]:=4;
 TensionMaxEcran[4]:=2;                     //40_base38
 TensionMaxEcran[5]:=0.8;                //modification des calibre a problèmes...
 TensionMaxEcran[6]:=0.4;
 TensionMaxEcran[7]:=0.2;
 TensionMaxEcran[8]:=0.08;
 TensionMaxEcran[9]:=0.04;

 resetPositions (sender);
 resetConfiguration (sender);
 ValidationConfiguration (sender);

 {$IFDEF Independant}
  erreur := StartMeasurementFrancois();    // Lance l'acquisition
  if erreur <> E_NO_ERRORS then
  ShowMessage('Appareil non Lance acquisition');
 {$ENDIF}

 ValidConfigINTERFACE_GTI2(sender);

 ACQUI:=false;
 compteurNOTRIG:=0;
 Timer1.enabled    := false;

 nb_courbes_stockees := 0;
 //end;

end;


procedure TFormOscilloGTI2.Timer2Timer(Sender: TObject);
begin
if LabelWARNING.Visible=true then LabelWARNING.Visible:=false else LabelWARNING.Visible:=true;
end;









procedure TFormOscilloGTI2.Timer1Timer(Sender: TObject);
var
i,j:integer;

//erreur: word ;
begin

    if (timer1.enabled) and (@timer1.OnTimer <> nil) then
    begin
        Timer1.enabled    := False;
        TempoAffichMesures:=TempoAffichMesures+1;   //temporisation de l'affichage des msures : plus LISIBLE A L'OoEIL!!!!

        if ACQUI=false then // si aucun transfert de données en cours depuis gti2
        begin
            ValidConfigINTERFACE_GTI2(sender);
            erreur := StartMeasurementFrancois();    // Lance l'acquisition
            if erreur <> E_NO_ERRORS then
            begin
                ShowMessage('Appareil non initialisé');
            end
            else ACQUI:=true;
        end;  // si aucun transfert de données en cours depuis gti2

        erreur := GetMeasurementFrancois( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.
        if erreur <> E_NO_ERRORS then // si pas d'erreur 
        begin
            RadioButton2.Checked:=true;      //non pas trig/data
        end
        else
        begin
            RadioButton1.Checked:=true;       //oui un trig/data
        end;



        if erreur = E_NO_ERRORS then
        begin

            if congiguration.MULTI=true then    // multimetrre
            begin
                TempoAffichMesures:=TempoAffichMesures+1;
                if TempoAffichMesures>10 then
                begin
                    MESURES(Sender);
                    TempoAffichMesures:=0;
                end;
            end;

            Bool_reset_ecran:=true;
            Bool_affichage:=true; // affichage ecran au prochain on paint
            FormPaint(Sender);

            erreur := ADC_ABORT();    // STOP l'acquisition
            if erreur <> E_NO_ERRORS then
            begin
                ShowMessage('PB de stop acqui');
            end
            else ACQUI:=false;

            compteurNOTRIG:=0;
        //////////////////////////////////////////////////////////////////////////////////
        end
        else   {if erreur = E_NO_ERRORS}
        begin
            compteurNOTRIG:=compteurNOTRIG+1;
            if compteurNOTRIG>=CompteurTIMEOUT then
            begin
                Bool_reset_ecran:=true;
                Bool_affichage:=false;
                FormPaint(Sender);
            end;
        end;    {else if erreur = E_NO_ERRORS}

        TriggerBARREChange(sender);
    end; {if (timer1.enabled)...}

Timer1.enabled    := true;

end;

procedure TFormOscilloGTI2.FormActivate(Sender: TObject);
begin
timer1.Enabled:=true;
end;

procedure TFormOscilloGTI2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     {$IFDEF CABALABin}
      timer1.Enabled:=false;

      resetPositions (sender);
      resetConfiguration (sender);
      ValidationConfiguration (sender);

      passif[1]:=true;
      Formcabalab.SpeedButtonOscillo.down:=false;
      Formcabalab.GestionButtons(sender);
     {$ENDIF}
end;

procedure TFormOscilloGTI2.Quitter1Click(Sender: TObject);
begin
     {$IFDEF CABALABin}
      timer1.Enabled:=false;

      resetPositions (sender);
      resetConfiguration (sender);
      ValidationConfiguration (sender);
      
      passif[1]:=true;
      Formcabalab.SpeedButtonOscillo.down:=false;
      Formcabalab.GestionButtons(sender);
      FormOscilloGTI2.visible:=false;
     {$ENDIF}
end;


procedure TFormOscilloGTI2.FormResize(Sender: TObject);
begin
     //
     //
end;







procedure textesondes (X:integer;var ComboModif : TcomboBoxEx);
begin
    if X=1 then
    begin
        ComboModif.ItemsEx[0].Caption:='5 V/div PE';
        ComboModif.ItemsEx[1].Caption:='5 V/div';
        ComboModif.ItemsEx[2].Caption:='2 V/div';
        ComboModif.ItemsEx[3].Caption:='1 V/div';
        ComboModif.ItemsEx[4].Caption:='500 mV/div';
        ComboModif.ItemsEx[5].Caption:='200 mV/div';
        ComboModif.ItemsEx[6].Caption:='100 mV/div';
        ComboModif.ItemsEx[7].Caption:='50  mV/div';
        ComboModif.ItemsEx[8].Caption:='20  mV/div';
        ComboModif.ItemsEx[9].Caption:='10  mV/div';
    end;
    if X=10 then
    begin
        ComboModif.ItemsEx[0].Caption:='50  V/div PE';
        ComboModif.ItemsEx[1].Caption:='50  V/div';
        ComboModif.ItemsEx[2].Caption:='20  V/div';
        ComboModif.ItemsEx[3].Caption:='10  V/div';
        ComboModif.ItemsEx[4].Caption:='5   V/div';
        ComboModif.ItemsEx[5].Caption:='2   V/div';
        ComboModif.ItemsEx[6].Caption:='1   V/div';
        ComboModif.ItemsEx[7].Caption:='500 mV/div';
        ComboModif.ItemsEx[8].Caption:='200 mV/div';
        ComboModif.ItemsEx[9].Caption:='100 mV/div';
    end;
end;



procedure TFormOscilloGTI2.resetConfiguration (sender: Tobject);
var coul:Tcolor;
r,v,b:integer;
begin

   congiguration.Start  := true;

   TempoAffichMesures:=0;

   congiguration.Trigger:=0;
   congiguration.front  :=1;
   congiguration.Level  :=0;

   congiguration.PreTrig:=false;
   congiguration.HYSTPreTrig:=0.05;


   congiguration.VoieVisible[1]:=true;
   congiguration.VoieVisible[2]:=true;
   congiguration.VoieVisible[3]:=true;
   congiguration.VoieVisible[4]:=true;


   congiguration.couleurs[0]:=119 ;

   r:=255;
   v:=0;
   b:=0;
   coul:=r + (v*$100) + (b*$10000);
   congiguration.couleurs[1]:=coul;
   r:=102;
   v:=255;
   b:=102;
   coul:=r + (v*$100) + (b*$10000);
   congiguration.couleurs[2]:=coul;
   r:=255;
   v:=200;
   b:=0;
   coul:=r + (v*$100) + (b*$10000);
   congiguration.couleurs[3]:=coul;
   r:=0;
   v:=0;
   b:=255;
   coul:=r + (v*$100) + (b*$10000);
   congiguration.couleurs[4]:=coul;

   congiguration.couleurs[5]:=clsilver;

   congiguration.PenWidth:=2;

   congiguration.NbVoiesVisible:=4;

   congiguration.SondeVoie[1]:=false;
   congiguration.SondeVoie[2]:=false;
   congiguration.SondeVoie[3]:=false;
   congiguration.SondeVoie[4]:=false;

   congiguration.Unipolaire[1]:=true;
   congiguration.Unipolaire[2]:=true;
   congiguration.Unipolaire[3]:=true;
   congiguration.Unipolaire[4]:=true;

   congiguration.Invertion[1]:=false;
   congiguration.Invertion[2]:=false;
   congiguration.Invertion[3]:=false;
   congiguration.Invertion[4]:=false;

   congiguration.UniDiffFacade:=false;

   congiguration.DecalZeros     :=false;
   congiguration.MULTI          :=false;
   congiguration.Enregistrement :=false;
   congiguration.MONOCOUP       :=false;
   congiguration.Acumul         :=false;

   congiguration.EXAO           :=false;
   congiguration.EXAO_FREQ      :=1000000;
   congiguration.EXAO_FREQ_ITEM :=3;
   congiguration.EXAO_LongEnrg_temporaire:=2000;
   congiguration.EXAO_LongEnrg:=2000;

   congiguration.ValeursDecalZERO[1]:=50;
   congiguration.ValeursDecalZERO[2]:=50;
   congiguration.ValeursDecalZERO[3]:=50;
   congiguration.ValeursDecalZERO[4]:=50;

   congiguration.sensibilitee[1]:=1;
   congiguration.sensibilitee[2]:=1;
   congiguration.sensibilitee[3]:=1;
   congiguration.sensibilitee[4]:=1;

   congiguration.BaseDetemps:=8;
   congiguration.Vitesse:=2;
   congiguration.TimeOut:=2;
  // congiguration.timeoutVALEURutilisateur:=

   congiguration.affichage:=1;

   congiguration.ConfigOscillo:=1;

end;

procedure TFormOscilloGTI2.ValidationConfiguration (sender: Tobject);
var
i : integer;
x : integer;
begin
     case congiguration.Trigger of
        0 :  RadioButtonTriggerSANS.checked:=true;
        1 :  RadioButtonTriggerCH1.checked:=true;
        2 :  RadioButtonTriggerCH2.checked:=true;
        3 :  RadioButtonTriggerCH3.checked:=true;
        4 :  RadioButtonTriggerCH4.checked:=true;
   end;

   if congiguration.Trigger=0 then
   begin
        GroupBoxLEVEL.Visible:=false;
        GroupBoxFrontTrigger.Visible:=false;
   end
   else
   begin
        GroupBoxLEVEL.Visible:=true;
        GroupBoxFrontTrigger.Visible:=true;
   end;

   case congiguration.front of
        1 :  RadioButtonFrontMontant.checked:=true;
        0 :  RadioButtonFrontDescendant.checked:=true;
   end;

    if congiguration.PreTrig=true then CheckBoxPreTrig.Checked:=true else CheckBoxPreTrig.Checked:=false;


   //congiguration.Level  :=0;
   //LEVEL
   // congiguration.Level:=15-30*(ScrollBarLevelTrigger.position/2048);
    LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
    ScrollBarLevelTrigger.position:=4095-round((congiguration.Level+15)*(4095/30));


   if congiguration.VoieVisible[1]=true then CheckBoxY1Visible.Checked:=true else CheckBoxY1Visible.Checked:=false;
   if congiguration.VoieVisible[2]=true then CheckBoxY2Visible.Checked:=true else CheckBoxY2Visible.Checked:=false;
   if congiguration.VoieVisible[3]=true then CheckBoxY3Visible.Checked:=true else CheckBoxY3Visible.Checked:=false;
   if congiguration.VoieVisible[4]=true then CheckBoxY4Visible.Checked:=true else CheckBoxY4Visible.Checked:=false;

   GroupBoxVOIE1.visible:=congiguration.VoieVisible[1];
   GroupBoxVOIE2.visible:=congiguration.VoieVisible[2];
   GroupBoxVOIE3.visible:=congiguration.VoieVisible[3];
   GroupBoxVOIE4.visible:=congiguration.VoieVisible[4];

   ButtonCH1Enreg.visible:=congiguration.VoieVisible[1];
   ButtonCH2Enreg.visible:=congiguration.VoieVisible[2];
   ButtonCH3Enreg.visible:=congiguration.VoieVisible[3];
   ButtonCH4Enreg.visible:=congiguration.VoieVisible[4];

   if congiguration.SondeVoie[1]=false then RadioButtonY1SondeX1.Checked:=true else RadioButtonY1SondeX10.Checked:=true;
   if congiguration.SondeVoie[2]=false then RadioButtonY2SondeX1.Checked:=true else RadioButtonY2SondeX10.Checked:=true;
   if congiguration.SondeVoie[3]=false then RadioButtonY3SondeX1.Checked:=true else RadioButtonY3SondeX10.Checked:=true;
   if congiguration.SondeVoie[4]=false then RadioButtonY4SondeX1.Checked:=true else RadioButtonY4SondeX10.Checked:=true;


   CheckBoxINVCH1.Checked:=congiguration.Invertion[1];
   CheckBoxINVCH2.Checked:=congiguration.Invertion[2];
   CheckBoxINVCH3.Checked:=congiguration.Invertion[3];
   CheckBoxINVCH4.Checked:=congiguration.Invertion[4];


   MenuDecalZeros.Checked:=congiguration.DecalZeros;

   if congiguration.DecalZeros=true then
            begin
                for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then
                    begin
                      TscrollBarCH[i].Visible:=true;
                      TButton0DECALCH[i].Visible:=true;
                    end
                    else
                    begin
                      TscrollBarCH[i].Visible:=false;
                      TButton0DECALCH[i].Visible:=false;
                    end;
                end;
            end
            else
            begin
                for i:=1 to 4 do
                begin
                    TscrollBarCH[i].Visible:=false;
                    TButton0DECALCH[i].Visible:=false;
                end;
            end;

   MULTI.Checked:=congiguration.MULTI;
   PageControlMesures.Visible:=congiguration.MULTI;
   
   menuEnregistrement.Checked:=congiguration.Enregistrement;
   GroupBoxEnregistrement.Visible:=congiguration.Enregistrement;

   menuMONOCOUP.checked:=congiguration.MONOCOUP;
   GroupBoxMONOCOUP.Visible:=congiguration.MONOCOUP;

   

   //a ne pas faire PB d'écriture en mémoire???????
   //textes des items....
   {
   for i:=1 to 4 do
   begin
   if congiguration.SondeVoie[i]=false then x:=1 else x:=10;
   textesondes (X,ComboSensiB[i]);
   end;
   }


   ComboBoxY1.ItemIndex:=congiguration.sensibilitee[1];
   ComboBoxY2.ItemIndex:=congiguration.sensibilitee[2];
   ComboBoxY3.ItemIndex:=congiguration.sensibilitee[3];
   ComboBoxY4.ItemIndex:=congiguration.sensibilitee[4];


   if congiguration.UniDiffFacade=true then
   begin
       MenuUniDiffFacade.Checked:=true;
       menuOptionINV.Checked:=false;
       for i:=1 to 4 do
       begin
       TCheckBoxINVCH[i].Visible:=false;
       TCheckBoxUNIDIFF[i].Visible:=true;
       end;
   end
   else
   begin
       MenuUniDiffFacade.Checked:=false;
       menuOptionINV.Checked:=true;
       for i:=1 to 4 do
       begin
       TCheckBoxINVCH[i].Visible:=true;
       TCheckBoxUNIDIFF[i].Visible:=false;
       end;
   end;

   for i:=1 to 4 do
   begin
       if  congiguration.Unipolaire[i]=true then
                                            begin
                                                  MCV[i,0].checked:=true;
                                                  TCheckBoxUNIDIFF[i].Checked:=false;
                                                  GroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
                                                  TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
                                                  TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
                                            end
                                            else
                                            begin
                                                  MCV[i,1].checked:=true ;
                                                  TCheckBoxUNIDIFF[i].Checked:=true;
                                                  GroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
                                                  TcheckBoxVoieVisible[i].caption:='YD'+inttostr(i-1);
                                                  TRadioButTriggerMode[i].Caption:='YD'+inttostr(i-1);
                                            end;
   end;




   if (congiguration.Unipolaire[1]=true) and
      (congiguration.Unipolaire[2]=true) and
      (congiguration.Unipolaire[3]=true) and
      (congiguration.Unipolaire[4]=true)     then   MCV[0,0].checked:=true ;

   if (congiguration.Unipolaire[1]=false) and
      (congiguration.Unipolaire[2]=false) and
      (congiguration.Unipolaire[3]=false) and
      (congiguration.Unipolaire[4]=false)     then   MCV[0,1].checked:=true ;

   menu_BDT_II.Checked:=congiguration.EXAO;                                 //box exao/bos base temps classique
   GroupBoxBaseDeTemps_II.Visible:=congiguration.EXAO;
   if congiguration.EXAO=true then
   begin
        if congiguration.EXAO_FREQ_ITEM<>13 then ComboBoxEx_BDT_II_FREQ.ItemIndex:=congiguration.EXAO_FREQ_ITEM
                                            else ComboBoxEx_BDT_II_FREQ.ItemIndex:=0;
        Edit_BDTII_NB_POINTS.Text:=inttostr(congiguration.EXAO_LongEnrg);
        XChange_II_CALCUL (sender);
        //congiguration.EXAO_LongEnrg_temporaire:=congiguration.EXAO_LongEnrg;
        if ComboBoxEx_BDT_II_FREQ.ItemIndex=0  then  begin congiguration.EXAO_FREQ:=10000000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 100 ns'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=1  then  begin congiguration.EXAO_FREQ:= 6000000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 167 ns'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=2  then  begin congiguration.EXAO_FREQ:= 2500000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 400 ns'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=3  then  begin congiguration.EXAO_FREQ:= 1000000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   1 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=4  then  begin congiguration.EXAO_FREQ:=  500000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   2 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=5  then  begin congiguration.EXAO_FREQ:=  250000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   4 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=6  then  begin congiguration.EXAO_FREQ:=  100000; Label_BDT_II_dt.Caption:='Pèriode (dt) :  10 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=7  then  begin congiguration.EXAO_FREQ:=   50000; Label_BDT_II_dt.Caption:='Pèriode (dt) :  20 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=8  then  begin congiguration.EXAO_FREQ:=   25000; Label_BDT_II_dt.Caption:='Pèriode (dt) :  40 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=9  then  begin congiguration.EXAO_FREQ:=   10000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 100 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=10  then  begin congiguration.EXAO_FREQ:=   5000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 200 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=11  then  begin congiguration.EXAO_FREQ:=   2500; Label_BDT_II_dt.Caption:='Pèriode (dt) : 400 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=12  then  begin congiguration.EXAO_FREQ:=   1000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   1 ms'; end;

   end;
   if congiguration.EXAO=false then GroupBoxBaseDeTemps.Visible:=true;

   ScrollBarBDT.Position:=congiguration.BaseDetemps;
   if congiguration.BaseDetemps=1 then RadioButtonBDT1.Checked:=true;
   if congiguration.BaseDetemps=2 then RadioButtonBDT2.Checked:=true;
   if congiguration.BaseDetemps=3 then RadioButtonBDT3.Checked:=true;
   if congiguration.BaseDetemps=4 then RadioButtonBDT4.Checked:=true;
   if congiguration.BaseDetemps=5 then RadioButtonBDT5.Checked:=true;
   if congiguration.BaseDetemps=6 then RadioButtonBDT6.Checked:=true;
   if congiguration.BaseDetemps=7 then RadioButtonBDT7.Checked:=true;
   if congiguration.BaseDetemps=8 then RadioButtonBDT8.Checked:=true;
   if congiguration.BaseDetemps=9 then RadioButtonBDT9.Checked:=true;
   if congiguration.BaseDetemps=10 then RadioButtonBDT10.Checked:=true;
   if congiguration.BaseDetemps=11 then RadioButtonBDT11.Checked:=true;
   if congiguration.BaseDetemps=12 then RadioButtonBDT12.Checked:=true;
   if congiguration.BaseDetemps=13 then RadioButtonBDT13.Checked:=true;
   if congiguration.BaseDetemps=14 then RadioButtonBDT14.Checked:=true;
   if congiguration.BaseDetemps=15 then RadioButtonBDT15.Checked:=true;

   if congiguration.TimeOut=1 then begin CompteurTIMEOUT:=5;   menutimeout1.Checked:=true; end;
   if congiguration.TimeOut=2 then begin CompteurTIMEOUT:=10;  menutimeout2.Checked:=true; end;
   if congiguration.TimeOut=3 then begin CompteurTIMEOUT:=20;  menutimeout3.Checked:=true; end;
   if congiguration.TimeOut=4 then begin CompteurTIMEOUT:=congiguration.timeoutVALEURutilisateur;  menutimeout4.Checked:=true; end;
  // Formtimeout.TrackBarTIMEOUT.position:=CompteurTIMEOUT;



   if congiguration.Vitesse=1 then VUlent.Checked:=true;
   if congiguration.Vitesse=2 then Vlent.Checked:=true;
   if congiguration.Vitesse=3 then Vrapide.Checked:=true;
   if congiguration.Vitesse=4 then VUrapide.Checked:=true;

   if congiguration.affichage=1 then  Normal.checked:=true;
   if congiguration.affichage=2 then  ecranPV.checked:=true;


   if congiguration.ConfigOscillo=1 then
   begin
        ConfigOscilo800600.Checked:=true;
        //FormOscilloGTI2.width:=800;
        //FormOscilloGTI2.height:=600;
   end;

   if congiguration.ConfigOscillo=2 then
   begin
        ConfigOscilo1024768.Checked:=true;
        //FormOscilloGTI2.width:=1024;
        //FormOscilloGTI2.height:=768;
   end;

   if congiguration.ConfigOscillo=3 then
   begin
        ConfigOscilo1280960.Checked:=true;
        //FormOscilloGTI2.width:=1280;
        //FormOscilloGTI2.height:=960;
   end;


end;


procedure TFormOscilloGTI2.ValidConfigINTERFACE_GTI2 (sender: Tobject);
var
i:integer;

//FrequenceEch: dword     ;          //var globales?????
//LongEnregistrement: dword  ;
//Sensibilite15 :double;
//Sensibilite75 :double;
begin
     //StopMeasurement;
{
if (timer1.enabled) and (@timer1.OnTimer <> nil) then
begin
Timer1.enabled    := False;
}
      if ACQUI=true then
     begin
     erreur := ADC_ABORT();    // stop l'acquisition
      if erreur <> E_NO_ERRORS then
      ShowMessage('PB de stop acqui');
      ACQUI:=false;
      end;




     if congiguration.Trigger=0 then SetTriggerSource( ltsNoTrig );
     if congiguration.Trigger=1 then SetTriggerSource( ltsCh1 );
     if congiguration.Trigger=2 then SetTriggerSource( ltsCh2 );
     if congiguration.Trigger=3 then SetTriggerSource( ltsCh3 );
     if congiguration.Trigger=4 then SetTriggerSource( ltsCh4 );

     if congiguration.front=0   then SetTriggerMode ( ltkFalling );
     if congiguration.front=1   then SetTriggerMode ( ltkRising );

     if congiguration.Trigger<>0 then
     SetTriggerLevel( congiguration.Trigger,    congiguration.Level );

     if congiguration.PreTrig=true then SetTriggerPreTrig(1) else SetTriggerPreTrig(0);

     if congiguration.VoieVisible[1]=true then  SetCh1InputOn(1) else SetCh1InputOn(0);
     if congiguration.VoieVisible[2]=true then  SetCh2InputOn(1) else SetCh2InputOn(0);
     if congiguration.VoieVisible[3]=true then  SetCh3InputOn(1) else SetCh3InputOn(0);
     if congiguration.VoieVisible[4]=true then  SetCh4InputOn(1) else SetCh4InputOn(0);

     if congiguration.Unipolaire[1]=true  then  SetCh1DiffOn(0)  else SetCh1DiffOn(1);
     if congiguration.Unipolaire[2]=true  then  SetCh2DiffOn(0)  else SetCh2DiffOn(1);
     if congiguration.Unipolaire[3]=true  then  SetCh3DiffOn(0)  else SetCh3DiffOn(1);
     if congiguration.Unipolaire[4]=true  then  SetCh4DiffOn(0)  else SetCh4DiffOn(1);

     Sensibilite15 :=15;
     Sensibilite75 :=7.5;

     if congiguration.sensibilitee[1]<3   then  SetSensitivity ( 1, @Sensibilite15 ) else  SetSensitivity ( 1, @Sensibilite75 );
     if congiguration.sensibilitee[2]<3   then  SetSensitivity ( 2, @Sensibilite15 ) else  SetSensitivity ( 2, @Sensibilite75 );
     if congiguration.sensibilitee[3]<3   then  SetSensitivity ( 3, @Sensibilite15 ) else  SetSensitivity ( 3, @Sensibilite75 );
     if congiguration.sensibilitee[4]<3   then  SetSensitivity ( 4, @Sensibilite15 ) else  SetSensitivity ( 4, @Sensibilite75 );

     if congiguration.EXAO=false then
     begin

     if congiguration.Vitesse=1 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;  LongEnregistrement:=  100 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=10000000;  LongEnregistrement:=  200 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=10000000;  LongEnregistrement:=  500 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=10000000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=10000000;  LongEnregistrement:= 2000 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=10000000;  LongEnregistrement:= 5000 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=10000000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:= 6000000;  LongEnregistrement:=12000 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:= 2000000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:= 1000000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=  500000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=  200000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=13      then begin FrequenceEch:=  100000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=14      then begin FrequenceEch:=   50000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=15      then begin FrequenceEch:=   20000;  LongEnregistrement:=10000 ;  end;


       end;

     if congiguration.Vitesse=2 then
     begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;  LongEnregistrement:=  100 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=10000000;  LongEnregistrement:=  200 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=10000000;  LongEnregistrement:=  500 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=10000000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:= 6000000;  LongEnregistrement:= 1200 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:= 2000000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:= 1000000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=  500000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=  200000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=  100000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=   50000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=   20000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=13      then begin FrequenceEch:=   10000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=14      then begin FrequenceEch:=    5000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=15      then begin FrequenceEch:=    2000;  LongEnregistrement:= 1000 ;  end;

     end;
     if congiguration.Vitesse=3 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;  LongEnregistrement:= 100 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=10000000;  LongEnregistrement:= 200 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=10000000;  LongEnregistrement:= 500 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=  6000000;  LongEnregistrement:=600 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=  3000000;  LongEnregistrement:=600 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=  1000000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=   500000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=   250000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=   100000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=    50000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=    25000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=    10000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=13      then begin FrequenceEch:=     5000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=14      then begin FrequenceEch:=     2500;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=15      then begin FrequenceEch:=     1000;  LongEnregistrement:=500;   end;

     end;

     if congiguration.Vitesse=4 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=  125000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=    50000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=    25000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=    12500;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=     5000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=  10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=  10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=  10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=  10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=  10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=     10000;   LongEnregistrement:=250;   end;
         // if congiguration.BaseDetemps=13      then begin FrequenceEch:=;  LongEnregistrement:=   ;  end;
         // if congiguration.BaseDetemps=14      then begin FrequenceEch:=;  LongEnregistrement:=   ;  end;
         // if congiguration.BaseDetemps=15      then begin FrequenceEch:=;  LongEnregistrement:=   ;   end;
     end;

     if congiguration.PreTrig=true then
     begin
     LongEnregistrement:=LongEnregistrement+500;
     end;


     SetRecordLength    (LongEnregistrement ) ;
     SetSampleFrequency (@FrequenceEch) ;

     end
     else   //si EXAO
     begin
          LongEnregistrement:=congiguration.EXAO_LongEnrg;
          if congiguration.PreTrig=true then
              begin
              LongEnregistrement:=LongEnregistrement+500;
              end;

          SetRecordLength    (LongEnregistrement ) ;

          FrequenceEch:=congiguration.EXAO_FREQ ;
          SetSampleFrequency (@FrequenceEch) ;
     end;
     ///////////////////////////////////////////////////////////////////////
      {
      erreur := StartMeasurementFrancois();    // Lance l'acquisition
      if erreur <> E_NO_ERRORS then
      ShowMessage('Appareil non Lance acquisition');

      }

     //////////////////////////////////////////////////////////FAIS par Le TIMER   !!!???
{
Timer1.enabled    := true;
end;
}
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///                            MENUS                                                                                            ///
///                                                                                                                             ///
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFormOscilloGTI2.MenuRegUtilisateurClick(Sender: TObject);
begin
     if congiguration.Start=true then
          begin
               if (timer1.enabled) and (@timer1.OnTimer <> nil) then
               begin
                    Timer1.enabled       := False;
                    congiguration.Start  := false;
                    ButtonRunStop.Caption:='Start';
              end;
          end;

     FormOscilloGTI2TransfertRegressiUtilisateur.visible:=true;
     FormOscilloGTI2TransfertRegressiUtilisateur.BringToFront;
end;

procedure TFormOscilloGTI2.MenuRegUtilisateurClick_RETOUR(Sender: TObject);
begin
     if congiguration.Start=false then
          begin
               Timer1.enabled       := True;
               congiguration.Start  :=True;
               ButtonRunStop.Caption:='Stop';
               ToolButtonrunstop.ImageIndex:=6;
          end;
end;






procedure TFormOscilloGTI2.RegressiDDEClick(Sender: TObject);
begin
    //formDDE.visible:=true;
    //formDDE.BringToFront;
     if ((sender=menu_TregressiInst_NEWfichier) or (sender=ToolButton_new_fichier)) then
     begin
          EnvoieDonneesGTI( congiguration.VoieVisible[1],
                       congiguration.VoieVisible[2],
                       congiguration.VoieVisible[3],
                       congiguration.VoieVisible[4],true);
     end;
     if ((sender=menu_TregressiInst_NEWpage) or (sender=ToolButton_Newpage)) then
     begin
          EnvoieDonneesGTI( congiguration.VoieVisible[1],
                       congiguration.VoieVisible[2],
                       congiguration.VoieVisible[3],
                       congiguration.VoieVisible[4],false);
     end;

     //FormTransfertRegressi.EnvoieDonnees
end;


procedure TFormOscilloGTI2.ToolButton_enrg_monopageClick(Sender: TObject);
begin
     FormOscilloGTI2TransfertRegressiUtilisateur.EnvoieDonneesGTI_Enreg_Mono_ALL;
end;

procedure TFormOscilloGTI2.ToolButton_enrg_mutipageClick(Sender: TObject);
begin
     FormOscilloGTI2TransfertRegressiUtilisateur.TRANSMultiALL(Sender);
end;



procedure TFormOscilloGTI2.EnvoieDonneesGTI( ch1,ch2,ch3,ch4,NewFichier:boolean );
var i : integer;
    ligne : string;
    BouLigne : string;
    zero,coeff : single;
    zero1,zero2,zero3,zero4: single;
    coeff1, coeff2, coeff3, coeff4: single;
    freq:dword;
    Recordlength:dword;
const
    Ndata = 32;
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';
begin
     FormTransfertRegressi.Donnees := TstringList.create;
     With FormTransfertRegressi.Donnees do
     begin


          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Oscilloscope Instantané'); // 3ème = Titre de pagebegin

          ligne := 't';
          if ch1 then
                      if congiguration.Unipolaire[1]=true then ligne :=ligne +crTab+'Y0' else ligne :=ligne +crTab+'YD0';
          if ch2 then 
                      if congiguration.Unipolaire[2]=true then ligne :=ligne +crTab+'Y1' else ligne :=ligne +crTab+'YD1';
          if ch3 then
                      if congiguration.Unipolaire[3]=true then ligne :=ligne +crTab+'Y2' else ligne :=ligne +crTab+'YD2';
          if ch4 then
                      if congiguration.Unipolaire[4]=true then ligne :=ligne +crTab+'Y3' else ligne :=ligne +crTab+'YD3';
          Add(ligne);

          ligne := 's';
          if ch1 then ligne :=ligne +crTab+'V';
          if ch2 then ligne :=ligne +crTab+'V';
          if ch3 then ligne :=ligne +crTab+'V';
          if ch4 then ligne :=ligne +crTab+'V';
          Add(ligne);

          if congiguration.PreTrig=false then
              begin
              freq        :=GetSampleFrequency();
              Recordlength:=GetRecordLength();
              for i:=0 to (Recordlength-1) do
              begin
                ligne :=FloatToStr(i/freq);
                    if ch1 then ligne :=ligne +crTab+FloatToStr(Ch1DoubleArray [i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(Ch2DoubleArray [i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(Ch3DoubleArray [i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(Ch4DoubleArray [i]);
                Add(ligne);
              end;
              end;
          if congiguration.PreTrig=true then
              begin
              freq        :=GetSampleFrequency();
              Recordlength:=GetRecordLength();
              //for i:=0 to (Recordlength-500) do
              for i:=0 to (Recordlength-500+congiguration.PointTrig) do
              begin
                ligne :=FloatToStr((i-congiguration.PointTrig)/freq);
                    if ch1 then ligne :=ligne +crTab+FloatToStr(Ch1DoubleArray [i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(Ch2DoubleArray [i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(Ch3DoubleArray [i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(Ch4DoubleArray [i]);
                Add(ligne);
              end;
              end;

          ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          if NewFichier=true then   FormTransfertRegressi.Execute('ClIP|LOAD');
          if NewFichier=false then   FormTransfertRegressi.Execute('ClIP|ADD');
    end;
    FormTransfertRegressi.Donnees.free;
      {
     ClipBoard.AsText := Donnees.text;

     case RadioGroupTypeDeTransfert.itemIndex of
          0 : Execute('CLIP|LOAD');           //0 charger en tant que New fichier
          1 : Execute('ClIP|ADD');            //1                     New page
     end;
     RadioGroupTypeDeTransfert.itemIndex := 1;     //passage a "nouvelle page " du radio item
end;
     Donnees.free; }
end;






procedure TFormOscilloGTI2.UniDiffChange (sender: Tobject);
var
i:integer;
begin
    //menuOptionINV

    if sender=menuOptionINV then
    begin
         if menuOptionINV.Checked=true then
         begin
            menuOptionINV.Checked:=false;
            menuOptionUniDiffFacade.Checked:=true;
            congiguration.UniDiffFacade:=true;
            for i:=1 to 4 do
            begin
            TCheckBoxINVCH[i].Visible:=false;
            TCheckBoxUNIDIFF[i].Visible:=true;
            end;
         end
         else
         begin
            menuOptionINV.Checked:=true;
            menuOptionUniDiffFacade.Checked:=false;
            congiguration.UniDiffFacade:=false;
            for i:=1 to 4 do
            begin
            TCheckBoxINVCH[i].Visible:=true;
            TCheckBoxUNIDIFF[i].Visible:=false;
            end;
         end;


    end;




    if sender=menuOptionUniDiffFacade then
    begin
         if menuOptionUniDiffFacade.Checked=false then
         begin
            menuOptionINV.Checked:=false;
            menuOptionUniDiffFacade.Checked:=true;
            congiguration.UniDiffFacade:=true;
            for i:=1 to 4 do
            begin
            TCheckBoxINVCH[i].Visible:=false;
            TCheckBoxUNIDIFF[i].Visible:=true;
            end;
         end
         else
         begin
            menuOptionINV.Checked:=true;
            menuOptionUniDiffFacade.Checked:=false;
            congiguration.UniDiffFacade:=false;
            for i:=1 to 4 do
            begin
            TCheckBoxINVCH[i].Visible:=true;
            TCheckBoxUNIDIFF[i].Visible:=false;
            end;
         end;


    end;

    if  sender=MCV[0,0] then         //ALL UNIPOLAIRE
    begin

        MCV[0,0].checked:=true;
        MCV[1,0].checked:=true;
        MCV[2,0].checked:=true;
        MCV[3,0].checked:=true;
        MCV[4,0].checked:=true;
        {
        congiguration.Unipolaire[1]:=true;
        congiguration.Unipolaire[2]:=true;
        congiguration.Unipolaire[3]:=true;
        congiguration.Unipolaire[4]:=true;
        GroupBoxVOIE[1].caption:='Y'+inttostr(1-1);
        GroupBoxVOIE[2].caption:='Y'+inttostr(2-1);
        GroupBoxVOIE[3].caption:='Y'+inttostr(3-1);
        GroupBoxVOIE[4].caption:='Y'+inttostr(4-1);
        }
        for i:=1 to 4 do
          begin
              TCheckBoxUNIDIFF[i].Checked:=false;
              congiguration.Unipolaire[i]:=true;
              GroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
              TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
              TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
          end;
    end;

    if  sender=MCV[0,1] then        //ALL DIFFerentiel
    begin
        MCV[0,1].checked:=true;
        MCV[1,1].checked:=true;
        MCV[2,1].checked:=true;
        MCV[3,1].checked:=true;
        MCV[4,1].checked:=true;
        {
        congiguration.Unipolaire[1]:=false;
        congiguration.Unipolaire[2]:=false;
        congiguration.Unipolaire[3]:=false;
        congiguration.Unipolaire[4]:=false;
        GroupBoxVOIE[1].caption:='YD'+inttostr(1-1);
        GroupBoxVOIE[2].caption:='YD'+inttostr(2-1);
        GroupBoxVOIE[3].caption:='YD'+inttostr(3-1);
        GroupBoxVOIE[4].caption:='YD'+inttostr(4-1);
        }
        for i:=1 to 4 do
          begin
              congiguration.Unipolaire[i]:=false;
              TCheckBoxUNIDIFF[i].Checked:=true;
              GroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
              TcheckBoxVoieVisible[i].caption:='YD'+inttostr(i-1);
              TRadioButTriggerMode[i].Caption:='YD'+inttostr(i-1);
          end;
    end;

    for i:=1 to 4 do              //Yi UNI ou Diff
    begin
    if sender=MCV[i,0] then
      begin
          MCV[i,0].Checked:=true;
          TCheckBoxUNIDIFF[i].Checked:=false;
          congiguration.Unipolaire[i]:=true;
          GroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
          TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
          TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
      end;
    if sender=MCV[i,1] then
      begin
          MCV[i,1].Checked:=true;
          TCheckBoxUNIDIFF[i].Checked:=true;
          congiguration.Unipolaire[i]:=false;
          GroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
          TcheckBoxVoieVisible[i].caption:='YD'+inttostr(i-1);
          TRadioButTriggerMode[i].Caption:='YD'+inttostr(i-1);
      end;
    end;

                                //Yi UNI ou Diff FACADE
    for i:=1 to 4 do
    begin
    if sender=TCheckBoxUNIDIFF[i] then
      begin
           if TCheckBoxUNIDIFF[i].Checked=false then
           begin
           congiguration.Unipolaire[i]:=true ;
           MCV[i,0].Checked:=true;
           congiguration.Unipolaire[i]:=true;
           GroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
           TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
           TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
           end
           else
           begin
           congiguration.Unipolaire[i]:=false ;
           MCV[i,1].Checked:=true;
           congiguration.Unipolaire[i]:=false;
           GroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
           TcheckBoxVoieVisible[i].caption:='YD'+inttostr(i-1);
           TRadioButTriggerMode[i].Caption:='YD'+inttostr(i-1);
           end;
      end;
    end;


                                 //teste ALL UNI ou DIFF
   if (congiguration.Unipolaire[1]=true) and
      (congiguration.Unipolaire[2]=true) and
      (congiguration.Unipolaire[3]=true) and
      (congiguration.Unipolaire[4]=true)     then   MCV[0,0].checked:=true else MCV[0,0].checked:=false ;

   if (congiguration.Unipolaire[1]=false) and
      (congiguration.Unipolaire[2]=false) and
      (congiguration.Unipolaire[3]=false) and
      (congiguration.Unipolaire[4]=false)     then   MCV[0,1].checked:=true else MCV[0,1].checked:=false;

   //ValidConfigINTERFACE_GTI2(sender);      //fais par le timer
end;

procedure TFormOscilloGTI2.Button_BDT_OSCILLO_EXAO_Click(Sender: TObject);
begin
    if sender=Button_BDT_OSCILLO then
    begin
    congiguration.EXAO:=false;
    menu_BDT_II.Checked:=false;
    PrsentationOscilloscope1.Checked:=true;
    GroupBoxBaseDeTemps.Visible:=true;
    GroupBoxBaseDeTemps_II.Visible:=false;
    end;

    if sender=Button_BDT_EXAO then
    begin
    congiguration.EXAO:=true;
    menu_BDT_II.Checked:=true;
    PrsentationOscilloscope1.Checked:=false;
    GroupBoxBaseDeTemps.Visible:=false;
    GroupBoxBaseDeTemps_II.Visible:=true;
    end;

    GroupBoxBaseDeTemps_III_CHOIX.Visible:=false;
    ToolButton13.Visible:=true;
    ValidationConfiguration (sender);        // V_42
    ValidConfigINTERFACE_GTI2(sender);       // V_42
end;


procedure TFormOscilloGTI2.Menu_BDT_II_Click(Sender: TObject);
begin

   if sender=PrsentationOscilloscope1 then
   begin
        congiguration.EXAO:=false;
   end;
   if sender=menu_BDT_II then
   begin
        congiguration.EXAO:=true;
   end;

   if sender=ToolButton13 then
   begin
        if congiguration.EXAO=true then congiguration.EXAO:=false else  congiguration.EXAO:=true;
        
   end;


   if congiguration.EXAO=true then
      begin
      //congiguration.EXAO:=false;
      menu_BDT_II.Checked:=true;
      PrsentationOscilloscope1.Checked:=false;
      GroupBoxBaseDeTemps.Visible:=false;
      GroupBoxBaseDeTemps_II.Visible:=true;
      if ComboBoxEx_BDT_II_FREQ.ItemIndex=14 then  ComboBoxEx_BDT_II_FREQ.Itemsex[14].caption:='';
      end
   else
      begin
      //congiguration.EXAO:=true;
      menu_BDT_II.Checked:=false;
      PrsentationOscilloscope1.Checked:=true;
      GroupBoxBaseDeTemps.Visible:=true;
      GroupBoxBaseDeTemps_II.Visible:=false;

      end;

      ValidationConfiguration (sender);          // V_42
     ValidConfigINTERFACE_GTI2(sender);          // V_42
end;

procedure TFormOscilloGTI2.Menu_HYST_PRETRIG_Click(Sender: TObject);
begin
    if sender=menu_HYST_PRETRIG_10mV  then begin congiguration.HYSTPreTrig:=0.01;  menu_HYST_PRETRIG_10mV.Checked:=true; end;
    if sender=menu_HYST_PRETRIG_20mV  then begin congiguration.HYSTPreTrig:=0.02;  menu_HYST_PRETRIG_20mV.Checked:=true; end;
    if sender=menu_HYST_PRETRIG_50mV  then begin congiguration.HYSTPreTrig:=0.05;  menu_HYST_PRETRIG_50mV.Checked:=true; end;
    if sender=menu_HYST_PRETRIG_100mV then begin congiguration.HYSTPreTrig:=0.1;   menu_HYST_PRETRIG_100mV.Checked:=true; end;
end;



procedure TFormOscilloGTI2.MenuDecalBDTClick(Sender: TObject);
begin
    if MenuDecalBDT.Checked=false then
    begin
        MenuDecalBDT.Checked:=true;
        ScrollBarDecalBDT.Visible:=true;
        Timer2.Enabled:=true;
    end
    else
    begin
        MenuDecalBDT.Checked:=false;
        ScrollBarDecalBDT.Visible:=false;
        ScrollBarDecalBDT.Position:=1000;
        Timer2.Enabled:=false;
    end;
end;


procedure TFormOscilloGTI2.MenuTimeOutClick(Sender: TObject);
begin
    if sender=menutimeout1 then begin CompteurTIMEOUT:=5;                         menutimeout1.Checked:=true; congiguration.TimeOut:=1;end;
    if sender=menutimeout2 then begin CompteurTIMEOUT:=10;                        menutimeout2.Checked:=true; congiguration.TimeOut:=2;end;
    if sender=menutimeout3 then begin CompteurTIMEOUT:=20;                        menutimeout3.Checked:=true; congiguration.TimeOut:=3;end;

    Formtimeout.TrackBarTIMEOUT.position:=CompteurTIMEOUT;

    if sender=menutimeout4 then begin CompteurTIMEOUT:=Formtimeout.TrackBarTIMEOUT.position;  menutimeout4.Checked:=true; congiguration.TimeOut:=4;end;
    if sender=menuTIMEOUEUTILISATEURREGLAGE then begin formtimeout.Visible:=true; menutimeout4.Checked:=true; congiguration.TimeOut:=4;end;
    congiguration.timeoutVALEURutilisateur:=Formtimeout.TrackBarTIMEOUT.position;
    //ScrollBar1.Position:=CompteurTIMEOUT;

end;






procedure TFormOscilloGTI2.MenuECRANClick(Sender: TObject);
var i:integer;
begin


    if sender=ToolButton_ecran_1_4 then
    begin
        if congiguration.affichage=1 then
        begin
        ecranPV.Checked:=true;
        congiguration.affichage:=2;
        CheckBoxXY.Visible:=true;
        end
        else
            if  congiguration.affichage=2 then
            begin
            Normal.Checked:=true;
            congiguration.affichage:=1;
            CheckBoxXY.Visible:=true;
            end
            else
                if congiguration.affichage=3 then
                begin
                Normal.Checked:=true;
                congiguration.affichage:=1;
                CheckBoxXY.Visible:=true;
                end;
    end;


    if sender=Normal then
    begin
        Normal.Checked:=true;
        congiguration.affichage:=1;
        CheckBoxXY.Visible:=true;
    end;

    if sender=ecranPV then
    begin
        ecranPV.Checked:=true;
        congiguration.affichage:=2;
        CheckBoxXY.Visible:=true;
    end;

    if sender=TempoET_XY then
    begin
        TempoET_XY.Checked:=true;
        congiguration.affichage:=3;
        if  CheckBoxXY.Checked=true then CheckBoxXY.Checked:=false;
        CheckBoxXY.Visible:=false;
    end;

    for i:=1 to 4 do          //retour de 1 écran par voies avec la sensib a 5V/div PE vers un autre mode
    begin
        if congiguration.affichage<>2 then
        begin
            if ComboSensiB[i].ItemIndex=0 then ComboSensiB[i].ItemIndex:=1;
            congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
        end
        else congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
    end;

    FormResize(Sender);
    TriggerBARREChange (sender);
end;

procedure TFormOscilloGTI2.MenuDECALAGEZEROClick(Sender: TObject);
var
i:integer;
begin
    if MenuDecalZeros.checked=true then
    begin
        MenuDecalZeros.checked:=false;
        congiguration.DecalZeros:=false;
        for i:=1 to 4 do TscrollBarCH[i].Position:=round(TscrollBarCH[i].max/2);
    end
    else
    begin
         MenuDecalZeros.checked:=true;
         congiguration.DecalZeros:=true;
         FormResize(Sender);
    end;
end;

procedure TFormOscilloGTI2.MenuOPTIONSClick(Sender: TObject);
begin
    {
    MULTI.checked             :=false;
    if congiguration.ConfigOscillo=1 then menuEnregistrement.checked:=false;
    menuMONOCOUP.checked      :=false;

    if congiguration.ConfigOscillo=1 then GroupBoxEnregistrement.Visible:=false;
    PageControlMesures.Visible    :=false;
    GroupBoxMONOCOUP.Visible      :=false;
    }
    if ((sender=MULTI) or (sender=ToolButton_Multimetre)) then
    begin
        if congiguration.MULTI=true then
        begin
            MULTI.checked:=false;
            ToolButton_Multimetre.Down:=false;
            congiguration.MULTI:=false;
            PageControlMesures.Visible:=false;
        end
        else
        begin
            MULTI.checked:=true;
            ToolButton_Multimetre.Down:=true;
            congiguration.MULTI:=true;
            PageControlMesures.Visible:=true;

            if (congiguration.ConfigOscillo=1) then
            begin
            menuEnregistrement.checked:=false;
            ToolButton_boite_enregistrements.Down:=false;
            congiguration.Enregistrement  :=false;
            GroupBoxEnregistrement.Visible:=false;
            menuMONOCOUP.checked      :=false;
            ToolButton_monocoup.Down:=false;
            congiguration.MONOCOUP        :=false;
            GroupBoxMONOCOUP.Visible      :=false;
            //congiguration.MULTI           :=false;
            //MULTI.checked                 :=false;
            //PageControlMesures.Visible    :=false;
            end;
            if (congiguration.ConfigOscillo=2) then
            begin
            //menuEnregistrement.checked:=false;
            //congiguration.Enregistrement  :=false;
            //GroupBoxEnregistrement.Visible:=false;
            menuMONOCOUP.checked      :=false;
            ToolButton_monocoup.Down:=false;
            congiguration.MONOCOUP        :=false;
            GroupBoxMONOCOUP.Visible      :=false;
            //congiguration.MULTI           :=false;
            //MULTI.checked                 :=false;
            //PageControlMesures.Visible    :=false;
            end;

        end;
    end;

    if ((sender=menuEnregistrement) or (sender=ToolButton_boite_enregistrements)) then
    begin
        if congiguration.Enregistrement=true then
        begin
            menuEnregistrement.checked:=false;
            ToolButton_boite_enregistrements.Down:=false;
            congiguration.Enregistrement:=false;
            GroupBoxEnregistrement.Visible:=false;
        end
        else
        begin
            menuEnregistrement.checked:=true;
            ToolButton_boite_enregistrements.Down:=true;
            congiguration.Enregistrement:=true;
            GroupBoxEnregistrement.Visible:=true;

            if congiguration.ConfigOscillo=1 then
            begin
            //menuEnregistrement.checked:=false;
            //congiguration.Enregistrement  :=false;
            //GroupBoxEnregistrement.Visible:=false;
            menuMONOCOUP.checked          :=false;
            ToolButton_monocoup.Down:=false;
            congiguration.MONOCOUP        :=false;
            GroupBoxMONOCOUP.Visible      :=false;
            congiguration.MULTI           :=false;
            MULTI.checked                 :=false;
            ToolButton_Multimetre.Down:=false;
            PageControlMesures.Visible    :=false;
            end;
        end;
    end;

    if ((sender=menuMONOCOUP) {or (sender=ButtonMONOcoup)} or (sender=ToolButton_monocoup)) then
    begin
        if congiguration.MONOCOUP=true then
        begin
            menuMONOCOUP.checked      :=false;
            ToolButton_monocoup.Down:=false;
            congiguration.MONOCOUP:=false;
            GroupBoxMONOCOUP.Visible      :=false;
            MenuTimeOutClick(Sender);
            Timer1.enabled    := true;

        end
        else
        begin
            menuMONOCOUP.checked:=true;
            ToolButton_monocoup.Down:=true;
            congiguration.MONOCOUP:=true;
            GroupBoxMONOCOUP.Visible:=true;

            if (congiguration.ConfigOscillo=1) then
            begin
            menuEnregistrement.checked:=false;
            ToolButton_boite_enregistrements.Down:=false;
            congiguration.Enregistrement  :=false;
            GroupBoxEnregistrement.Visible:=false;
           // menuMONOCOUP.checked      :=false;
           // congiguration.MONOCOUP        :=false;
           // GroupBoxMONOCOUP.Visible      :=false;
            congiguration.MULTI           :=false;
            MULTI.checked                 :=false;
            ToolButton_Multimetre.Down:=false;
            PageControlMesures.Visible    :=false;
            end;
            if (congiguration.ConfigOscillo=2) then
            begin
            //menuEnregistrement.checked:=false;
            //congiguration.Enregistrement  :=false;
            //GroupBoxEnregistrement.Visible:=false;
            //menuMONOCOUP.checked      :=false;
            //congiguration.MONOCOUP        :=false;
            //GroupBoxMONOCOUP.Visible      :=false;
            congiguration.MULTI           :=false;
            MULTI.checked                 :=false;
            ToolButton_Multimetre.Down:=false;
            PageControlMesures.Visible    :=false;
            end;
            ValidationConfiguration (sender);//1_31
        end;
    end;

    if sender=menuAcumul then
    begin
        if congiguration.Acumul=true then
        begin
            menuAcumul.checked      :=false;
            congiguration.Acumul:=false;
        end
        else
        begin
            menuAcumul.checked:=true;
            congiguration.Acumul:=true;
        end;
    end;

    if GroupBoxEnregistrement.Visible=true then
    begin
         //voir click enregistrement !!!!!
         
    end
    else
    begin
         ToolButton_enrg_mutipage.Visible:=false;
         ToolButton_enrg_monopage.Visible:=false;
    end;









    {
    if congiguration.MULTI=true then
    begin
        //menuEnregistrement.checked:=false;
        //congiguration.Enregistrement:=false;
        //GroupBoxEnregistrement.Visible:=false;

        PageControlMesures.Visible:=true;
    end;
    if congiguration.Enregistrement=true then
    begin
        //MULTI.checked:=false;
        //congiguration.MULTI:=false;
        //PageControlMesures.Visible:=false;

        GroupBoxEnregistrement.Visible:=true;
    end;
     }
end;







procedure TFormOscilloGTI2.MenuConfigCOULEURSClick(Sender: TObject);
begin

FormConfigCouleursOscilloGTI2.visible:=true;
FormConfigCouleursOscilloGTI2.BringToFront;

end;


procedure TFormOscilloGTI2.MenuChargerConfigFichier(Sender: TObject);
var
    ini:TInifile;
begin

     Opendialog1.InitialDir:=ExtractFilePath(Application.ExeName);
     if Opendialog1.Execute then Ini := TIniFile.Create(  Opendialog1.FileName  );

if (timer1.enabled) and (@timer1.OnTimer <> nil) then
begin
    Timer1.enabled    := False;

    if ACQUI=true then
    begin
        erreur := ADC_ABORT();    // stop l'acquisition
        if erreur <> E_NO_ERRORS then
        ShowMessage('PB de stop acqui');
        ACQUI:=false;
    end;




 // Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, 'OscilloGTI2.INI' ) );
 // Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+'OscilloGTI2.INI'  );
  try
    FormOscilloGTI2.Top     := Ini.ReadInteger( 'Form', 'Top', 0 );
    FormOscilloGTI2.Left    := Ini.ReadInteger( 'Form', 'Left', 0 );
    FormOscilloGTI2.Height  := Ini.ReadInteger( 'Form', 'Height', 800 );
    FormOscilloGTI2.Width   := Ini.ReadInteger( 'Form', 'Width', 600 );



    {
    Caption := Ini.ReadString( 'Form', 'Caption', 'New Form' );
    if Ini.ReadBool( 'Form', 'InitMax', false ) then
      WindowState := wsMaximized
    else

      WindowState := wsNormal;
     }

    congiguration.Trigger       :=Ini.ReadInteger( 'Config', 'Trigger'       , 0);
    congiguration.front         :=Ini.ReadInteger( 'Config', 'Front'         , 1);
    congiguration.Level         :=Ini.ReadFloat  ( 'Config', 'Level'         , 0);

    congiguration.PreTrig:=       Ini.ReadBool   ( 'Config', 'PreTrig'  , false);

    congiguration.VoieVisible[1]:=Ini.ReadBool   ( 'Config', 'VoieVisible1'  , true);
    congiguration.VoieVisible[2]:=Ini.ReadBool   ( 'Config', 'VoieVisible2'  , true);
    congiguration.VoieVisible[3]:=Ini.ReadBool   ( 'Config', 'VoieVisible3'  , true);
    congiguration.VoieVisible[4]:=Ini.ReadBool   ( 'Config', 'VoieVisible4'  , true);


    //congiguration.couleurs[0]   :=Ini.ReadInteger( 'Config', 'couleur0'      , clblack);
    congiguration.couleurs[0]   :=Ini.ReadInteger( 'Config', 'couleur0'      , 119);
    congiguration.couleurs[1]   :=Ini.ReadInteger( 'Config', 'couleur1'      , clblue);
    congiguration.couleurs[2]   :=Ini.ReadInteger( 'Config', 'couleur2'      , clgreen);
    congiguration.couleurs[3]   :=Ini.ReadInteger( 'Config', 'couleur3'      , clyellow);
    congiguration.couleurs[4]   :=Ini.ReadInteger( 'Config', 'couleur4'      , clred);
    //congiguration.couleurs[5]   :=Ini.ReadInteger( 'Config', 'couleur5'      , clsilver);


    congiguration.PenWidth      :=Ini.ReadInteger( 'Config', 'PenWidth'      , 1);

    congiguration.NbVoiesVisible:=Ini.ReadInteger( 'Config', 'NbVoiesVisible', 4 );

    congiguration.SondeVoie[1]  :=Ini.ReadBool   ( 'Config', 'SondeVoie1'    , false);
    congiguration.SondeVoie[2]  :=Ini.ReadBool   ( 'Config', 'SondeVoie2'    , false);
    congiguration.SondeVoie[3]  :=Ini.ReadBool   ( 'Config', 'SondeVoie3'    , false);
    congiguration.SondeVoie[4]  :=Ini.ReadBool   ( 'Config', 'SondeVoie4'    , false);

    congiguration.Unipolaire[1] :=Ini.ReadBool   ( 'Config', 'Unipolaire1'   , true);
    congiguration.Unipolaire[2] :=Ini.ReadBool   ( 'Config', 'Unipolaire2'   , true);
    congiguration.Unipolaire[3] :=Ini.ReadBool   ( 'Config', 'Unipolaire3'   , true);
    congiguration.Unipolaire[4] :=Ini.ReadBool   ( 'Config', 'Unipolaire4'   , true);

    congiguration.sensibilitee[1]:=Ini.ReadInteger( 'Config', 'sensibilitee1' , 1);
    congiguration.sensibilitee[2]:=Ini.ReadInteger( 'Config', 'sensibilitee2' , 1);
    congiguration.sensibilitee[3]:=Ini.ReadInteger( 'Config', 'sensibilitee3' , 1);
    congiguration.sensibilitee[4]:=Ini.ReadInteger( 'Config', 'sensibilitee4' , 1);

    congiguration.Invertion[1]  :=Ini.ReadBool   ( 'Config', 'Invertion1'    , false);
    congiguration.Invertion[2]  :=Ini.ReadBool   ( 'Config', 'Invertion2'    , false);
    congiguration.Invertion[3]  :=Ini.ReadBool   ( 'Config', 'Invertion3'    , false);
    congiguration.Invertion[4]  :=Ini.ReadBool   ( 'Config', 'Invertion4'    , false);

    congiguration.UniDiffFacade    :=Ini.ReadBool   ( 'Config', 'UniDiffFac'    , false);

    congiguration.DecalZeros    :=Ini.ReadBool   ( 'Config', 'DecalZeros'    , false);

    congiguration.ValeursDecalZERO[1]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO1', 50);
    congiguration.ValeursDecalZERO[2]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO2', 50);
    congiguration.ValeursDecalZERO[3]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO3', 50);
    congiguration.ValeursDecalZERO[4]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO4', 50);

    congiguration.MULTI         :=Ini.ReadBool   ( 'Config', 'MULTI '         , false );
    congiguration.Enregistrement:=Ini.ReadBool   ( 'Config', 'Enregistrement ', false);
    congiguration.MONOCOUP      :=Ini.ReadBool   ( 'Config', 'MONOCOUP '      , false );

    congiguration.EXAO          :=Ini.ReadBool   ( 'Config', 'EXAO '          , false );
    congiguration.EXAO_FREQ_ITEM:=Ini.ReadInteger( 'Config', 'EXAO_freq_item ', 0);
    congiguration.EXAO_LongEnrg :=Ini.ReadInteger( 'Config', 'EXAO_Long_Enrg ', 1000);

    congiguration.BaseDetemps   :=Ini.ReadInteger( 'Config', 'BaseDetemps'    , 1);
    congiguration.TimeOut       :=Ini.ReadInteger( 'Config', 'TimeOut'        , 2);
    congiguration.timeoutVALEURutilisateur:=Ini.ReadInteger( 'Config', 'timeoutVALEURutilisateur'  , 10);
    congiguration.Vitesse       :=Ini.ReadInteger( 'Config', 'Vitesse'        , 2);
    congiguration.affichage     :=Ini.ReadInteger( 'Config', 'affichage'      , 1);
    congiguration.ConfigOscillo :=Ini.ReadInteger( 'Config', 'ConfigOscillo'  , 1);

    ValidationConfiguration (sender);





  finally
    Ini.free;
  end;

end;
    Timer1.enabled    := true;
end;



procedure TFormOscilloGTI2.MenuEnregistrerConfigFichier(Sender: TObject);
var
    ini:TInifile;
begin

     SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
     SaveDialog1.FileName:='*.CL3';
     if SaveDialog1.Execute then Ini := TIniFile.Create(  SaveDialog1.FileName  );

try
    Ini.WriteInteger( 'Form', 'Top'   , FormOscilloGTI2.Top);
    Ini.WriteInteger( 'Form', 'Left'  , FormOscilloGTI2.Left);
    Ini.WriteInteger( 'Form', 'Height', FormOscilloGTI2.Height);
    Ini.WriteInteger( 'Form', 'Width' , FormOscilloGTI2.Width);

    {
    Ini.WriteString( 'Form', 'Caption', Caption );
    Ini.WriteBool( 'Form', 'InitMax', WindowState = wsMaximized );
    }

    Ini.WriteInteger( 'Config', 'Trigger'       , congiguration.Trigger);
    Ini.WriteInteger( 'Config', 'Front'         , congiguration.front);
    Ini.WriteFloat  ( 'Config', 'Level'         , congiguration.Level);

    Ini.WriteBool   ( 'Config', 'PreTrig'  , congiguration.PreTrig);

    Ini.WriteBool   ( 'Config', 'VoieVisible1'  , congiguration.VoieVisible[1]);
    Ini.WriteBool   ( 'Config', 'VoieVisible2'  , congiguration.VoieVisible[2]);
    Ini.WriteBool   ( 'Config', 'VoieVisible3'  , congiguration.VoieVisible[3]);
    Ini.WriteBool   ( 'Config', 'VoieVisible4'  , congiguration.VoieVisible[4]);

    Ini.WriteInteger( 'Config', 'couleur0'      , congiguration.couleurs[0]);
    Ini.WriteInteger( 'Config', 'couleur1'      , congiguration.couleurs[1]);
    Ini.WriteInteger( 'Config', 'couleur2'      , congiguration.couleurs[2]);
    Ini.WriteInteger( 'Config', 'couleur3'      , congiguration.couleurs[3]);
    Ini.WriteInteger( 'Config', 'couleur4'      , congiguration.couleurs[4]);
    //Ini.WriteInteger( 'Config', 'couleur5'      , congiguration.couleurs[5]);

    Ini.WriteInteger( 'Config', 'PenWidth'      , congiguration.PenWidth );

    Ini.WriteInteger( 'Config', 'NbVoiesVisible', congiguration.NbVoiesVisible );

    Ini.WriteBool   ( 'Config', 'SondeVoie1'    , congiguration.SondeVoie[1]);
    Ini.WriteBool   ( 'Config', 'SondeVoie2'    , congiguration.SondeVoie[2]);
    Ini.WriteBool   ( 'Config', 'SondeVoie3'    , congiguration.SondeVoie[3]);
    Ini.WriteBool   ( 'Config', 'SondeVoie4'    , congiguration.SondeVoie[4]);

    Ini.WriteBool   ( 'Config', 'Unipolaire1'   , congiguration.Unipolaire[1]);
    Ini.WriteBool   ( 'Config', 'Unipolaire2'   , congiguration.Unipolaire[2]);
    Ini.WriteBool   ( 'Config', 'Unipolaire3'   , congiguration.Unipolaire[3]);
    Ini.WriteBool   ( 'Config', 'Unipolaire4'   , congiguration.Unipolaire[4]);

    Ini.WriteInteger( 'Config', 'sensibilitee1' , congiguration.sensibilitee[1]);
    Ini.WriteInteger( 'Config', 'sensibilitee2' , congiguration.sensibilitee[2]);
    Ini.WriteInteger( 'Config', 'sensibilitee3' , congiguration.sensibilitee[3]);
    Ini.WriteInteger( 'Config', 'sensibilitee4' , congiguration.sensibilitee[4]);

    Ini.WriteBool   ( 'Config', 'Invertion1'    , congiguration.Invertion[1]);
    Ini.WriteBool   ( 'Config', 'Invertion2'    , congiguration.Invertion[2]);
    Ini.WriteBool   ( 'Config', 'Invertion3'    , congiguration.Invertion[3]);
    Ini.WriteBool   ( 'Config', 'Invertion4'    , congiguration.Invertion[4]);

    Ini.WriteBool   ( 'Config', 'UniDiffFac'    , congiguration.UniDiffFacade);

    Ini.WriteBool   ( 'Config', 'DecalZeros'    , congiguration.DecalZeros);

    Ini.WriteInteger( 'Config', 'ValeursDecalZERO1', congiguration.ValeursDecalZERO[1]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO2', congiguration.ValeursDecalZERO[2]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO3', congiguration.ValeursDecalZERO[3]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO4', congiguration.ValeursDecalZERO[4]);

    Ini.WriteBool   ( 'Config', 'MULTI '         , congiguration.MULTI );
    Ini.WriteBool   ( 'Config', 'Enregistrement ', congiguration.Enregistrement );
    Ini.WriteBool   ( 'Config', 'MONOCOUP '      , congiguration.MONOCOUP );

    Ini.WriteBool   ( 'Config', 'EXAO '          , congiguration.EXAO );
    Ini.Writeinteger( 'Config', 'EXAO_freq_item ', congiguration.EXAO_FREQ_ITEM );
    Ini.Writeinteger( 'Config', 'EXAO_Long_Enrg ', congiguration.EXAO_LongEnrg );

    Ini.WriteInteger( 'Config', 'BaseDetemps'    , congiguration.BaseDetemps);
    Ini.WriteInteger( 'Config', 'TimeOut'        , congiguration.TimeOut);
    Ini.WriteInteger( 'Config', 'timeoutVALEURutilisateur'  , congiguration.timeoutVALEURutilisateur);
    Ini.WriteInteger( 'Config', 'Vitesse'        , congiguration.Vitesse);
    Ini.WriteInteger( 'Config', 'affichage'      , congiguration.affichage);
    Ini.WriteInteger( 'Config', 'ConfigOscillo'  , congiguration.ConfigOscillo);

finally
Ini.Free;
end;

end;








procedure TFormOscilloGTI2.MenuChargerConfig(Sender: TObject);
var
  Ini: TIniFile;
begin

if (timer1.enabled) and (@timer1.OnTimer <> nil) then
begin
    Timer1.enabled    := False;

    if ACQUI=true then
    begin
        erreur := ADC_ABORT();    // stop l'acquisition
        if erreur <> E_NO_ERRORS then
        ShowMessage('PB de stop acqui');
        ACQUI:=false;
    end;




 // Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, 'OscilloGTI2.INI' ) );
  Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+'OscilloGTI2.INI'  );
  try
    FormOscilloGTI2.Top     := Ini.ReadInteger( 'Form', 'Top', 0 );
    FormOscilloGTI2.Left    := Ini.ReadInteger( 'Form', 'Left', 0 );
    FormOscilloGTI2.Height  := Ini.ReadInteger( 'Form', 'Height', 800 );
    FormOscilloGTI2.Width   := Ini.ReadInteger( 'Form', 'Width', 600 );



    {
    Caption := Ini.ReadString( 'Form', 'Caption', 'New Form' );
    if Ini.ReadBool( 'Form', 'InitMax', false ) then
      WindowState := wsMaximized
    else

      WindowState := wsNormal;
     }

    congiguration.Trigger       :=Ini.ReadInteger( 'Config', 'Trigger'       , 0);
    congiguration.front         :=Ini.ReadInteger( 'Config', 'Front'         , 1);
    congiguration.Level         :=Ini.ReadFloat  ( 'Config', 'Level'         , 0);

    congiguration.PreTrig:=       Ini.ReadBool   ( 'Config', 'PreTrig'  , false);

    congiguration.VoieVisible[1]:=Ini.ReadBool   ( 'Config', 'VoieVisible1'  , true);
    congiguration.VoieVisible[2]:=Ini.ReadBool   ( 'Config', 'VoieVisible2'  , true);
    congiguration.VoieVisible[3]:=Ini.ReadBool   ( 'Config', 'VoieVisible3'  , true);
    congiguration.VoieVisible[4]:=Ini.ReadBool   ( 'Config', 'VoieVisible4'  , true);


    //congiguration.couleurs[0]   :=Ini.ReadInteger( 'Config', 'couleur0'      , clblack);
    congiguration.couleurs[0]   :=Ini.ReadInteger( 'Config', 'couleur0'      , 119);
    congiguration.couleurs[1]   :=Ini.ReadInteger( 'Config', 'couleur1'      , clblue);
    congiguration.couleurs[2]   :=Ini.ReadInteger( 'Config', 'couleur2'      , clgreen);
    congiguration.couleurs[3]   :=Ini.ReadInteger( 'Config', 'couleur3'      , clyellow);
    congiguration.couleurs[4]   :=Ini.ReadInteger( 'Config', 'couleur4'      , clred);
    //congiguration.couleurs[5]   :=Ini.ReadInteger( 'Config', 'couleur5'      , clwhite);


    congiguration.PenWidth      :=Ini.ReadInteger( 'Config', 'PenWidth'      , 1);

    congiguration.NbVoiesVisible:=Ini.ReadInteger( 'Config', 'NbVoiesVisible', 4 );

    congiguration.SondeVoie[1]  :=Ini.ReadBool   ( 'Config', 'SondeVoie1'    , false);
    congiguration.SondeVoie[2]  :=Ini.ReadBool   ( 'Config', 'SondeVoie2'    , false);
    congiguration.SondeVoie[3]  :=Ini.ReadBool   ( 'Config', 'SondeVoie3'    , false);
    congiguration.SondeVoie[4]  :=Ini.ReadBool   ( 'Config', 'SondeVoie4'    , false);

    congiguration.Unipolaire[1] :=Ini.ReadBool   ( 'Config', 'Unipolaire1'   , true);
    congiguration.Unipolaire[2] :=Ini.ReadBool   ( 'Config', 'Unipolaire2'   , true);
    congiguration.Unipolaire[3] :=Ini.ReadBool   ( 'Config', 'Unipolaire3'   , true);
    congiguration.Unipolaire[4] :=Ini.ReadBool   ( 'Config', 'Unipolaire4'   , true);

    congiguration.sensibilitee[1]:=Ini.ReadInteger( 'Config', 'sensibilitee1' , 1);
    congiguration.sensibilitee[2]:=Ini.ReadInteger( 'Config', 'sensibilitee2' , 1);
    congiguration.sensibilitee[3]:=Ini.ReadInteger( 'Config', 'sensibilitee3' , 1);
    congiguration.sensibilitee[4]:=Ini.ReadInteger( 'Config', 'sensibilitee4' , 1);

    congiguration.Invertion[1]  :=Ini.ReadBool   ( 'Config', 'Invertion1'    , false);
    congiguration.Invertion[2]  :=Ini.ReadBool   ( 'Config', 'Invertion2'    , false);
    congiguration.Invertion[3]  :=Ini.ReadBool   ( 'Config', 'Invertion3'    , false);
    congiguration.Invertion[4]  :=Ini.ReadBool   ( 'Config', 'Invertion4'    , false);

    congiguration.UniDiffFacade    :=Ini.ReadBool   ( 'Config', 'UniDiffFac'    , false);

    congiguration.DecalZeros    :=Ini.ReadBool   ( 'Config', 'DecalZeros'    , false);

    congiguration.ValeursDecalZERO[1]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO1', 50);
    congiguration.ValeursDecalZERO[2]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO2', 50);
    congiguration.ValeursDecalZERO[3]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO3', 50);
    congiguration.ValeursDecalZERO[4]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO4', 50);

    congiguration.MULTI         :=Ini.ReadBool   ( 'Config', 'MULTI '         , false );
    congiguration.Enregistrement:=Ini.ReadBool   ( 'Config', 'Enregistrement ', false);
    congiguration.MONOCOUP      :=Ini.ReadBool   ( 'Config', 'MONOCOUP '      , false );


    congiguration.EXAO          :=Ini.ReadBool   ( 'Config', 'EXAO '          , false );
    congiguration.EXAO_FREQ_ITEM:=Ini.ReadInteger( 'Config', 'EXAO_freq_item ', 0);
    congiguration.EXAO_LongEnrg :=Ini.ReadInteger( 'Config', 'EXAO_Long_Enrg ', 1000);

    congiguration.BaseDetemps   :=Ini.ReadInteger( 'Config', 'BaseDetemps'    , 1);
    congiguration.TimeOut       :=Ini.ReadInteger( 'Config', 'TimeOut'        , 2);
    congiguration.timeoutVALEURutilisateur:=Ini.ReadInteger( 'Config', 'timeoutVALEURutilisateur'  , 10);
    congiguration.Vitesse       :=Ini.ReadInteger( 'Config', 'Vitesse'        , 2);
    congiguration.affichage     :=Ini.ReadInteger( 'Config', 'affichage'      , 1);
    congiguration.ConfigOscillo :=Ini.ReadInteger( 'Config', 'ConfigOscillo'  , 1);

    ValidationConfiguration (sender);





  finally
    Ini.free;
  end;

end;
    Timer1.enabled    := true;

end;

procedure TFormOscilloGTI2.MenuEnregistrerConfig(Sender: TObject{; var Action :TCloseAction});
var
  Ini: TIniFile;
begin
 // Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+ 'OscilloGTI2.INI'  );
  try
    Ini.WriteInteger( 'Form', 'Top'   , FormOscilloGTI2.Top);
    Ini.WriteInteger( 'Form', 'Left'  , FormOscilloGTI2.Left);
    Ini.WriteInteger( 'Form', 'Height', FormOscilloGTI2.Height);
    Ini.WriteInteger( 'Form', 'Width' , FormOscilloGTI2.Width);

    {
    Ini.WriteString( 'Form', 'Caption', Caption );
    Ini.WriteBool( 'Form', 'InitMax', WindowState = wsMaximized );
    }

    Ini.WriteInteger( 'Config', 'Trigger'       , congiguration.Trigger);
    Ini.WriteInteger( 'Config', 'Front'         , congiguration.front);
    Ini.WriteFloat  ( 'Config', 'Level'         , congiguration.Level);

    Ini.WriteBool   ( 'Config', 'PreTrig'  , congiguration.PreTrig);

    Ini.WriteBool   ( 'Config', 'VoieVisible1'  , congiguration.VoieVisible[1]);
    Ini.WriteBool   ( 'Config', 'VoieVisible2'  , congiguration.VoieVisible[2]);
    Ini.WriteBool   ( 'Config', 'VoieVisible3'  , congiguration.VoieVisible[3]);
    Ini.WriteBool   ( 'Config', 'VoieVisible4'  , congiguration.VoieVisible[4]);

    Ini.WriteInteger( 'Config', 'couleur0'      , congiguration.couleurs[0]);
    Ini.WriteInteger( 'Config', 'couleur1'      , congiguration.couleurs[1]);
    Ini.WriteInteger( 'Config', 'couleur2'      , congiguration.couleurs[2]);
    Ini.WriteInteger( 'Config', 'couleur3'      , congiguration.couleurs[3]);
    Ini.WriteInteger( 'Config', 'couleur4'      , congiguration.couleurs[4]);
    //Ini.WriteInteger( 'Config', 'couleur5'      , congiguration.couleurs[5]);

    Ini.WriteInteger( 'Config', 'PenWidth'      , congiguration.PenWidth );

    Ini.WriteInteger( 'Config', 'NbVoiesVisible', congiguration.NbVoiesVisible );

    Ini.WriteBool   ( 'Config', 'SondeVoie1'    , congiguration.SondeVoie[1]);
    Ini.WriteBool   ( 'Config', 'SondeVoie2'    , congiguration.SondeVoie[2]);
    Ini.WriteBool   ( 'Config', 'SondeVoie3'    , congiguration.SondeVoie[3]);
    Ini.WriteBool   ( 'Config', 'SondeVoie4'    , congiguration.SondeVoie[4]);

    Ini.WriteBool   ( 'Config', 'Unipolaire1'   , congiguration.Unipolaire[1]);
    Ini.WriteBool   ( 'Config', 'Unipolaire2'   , congiguration.Unipolaire[2]);
    Ini.WriteBool   ( 'Config', 'Unipolaire3'   , congiguration.Unipolaire[3]);
    Ini.WriteBool   ( 'Config', 'Unipolaire4'   , congiguration.Unipolaire[4]);

    Ini.WriteInteger( 'Config', 'sensibilitee1' , congiguration.sensibilitee[1]);
    Ini.WriteInteger( 'Config', 'sensibilitee2' , congiguration.sensibilitee[2]);
    Ini.WriteInteger( 'Config', 'sensibilitee3' , congiguration.sensibilitee[3]);
    Ini.WriteInteger( 'Config', 'sensibilitee4' , congiguration.sensibilitee[4]);

    Ini.WriteBool   ( 'Config', 'Invertion1'    , congiguration.Invertion[1]);
    Ini.WriteBool   ( 'Config', 'Invertion2'    , congiguration.Invertion[2]);
    Ini.WriteBool   ( 'Config', 'Invertion3'    , congiguration.Invertion[3]);
    Ini.WriteBool   ( 'Config', 'Invertion4'    , congiguration.Invertion[4]);

    Ini.WriteBool   ( 'Config', 'UniDiffFac'    , congiguration.UniDiffFacade);

    Ini.WriteBool   ( 'Config', 'DecalZeros'    , congiguration.DecalZeros);

    Ini.WriteInteger( 'Config', 'ValeursDecalZERO1', congiguration.ValeursDecalZERO[1]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO2', congiguration.ValeursDecalZERO[2]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO3', congiguration.ValeursDecalZERO[3]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO4', congiguration.ValeursDecalZERO[4]);

    Ini.WriteBool   ( 'Config', 'MULTI '         , congiguration.MULTI );
    Ini.WriteBool   ( 'Config', 'Enregistrement ', congiguration.Enregistrement );
    Ini.WriteBool   ( 'Config', 'MONOCOUP '      , congiguration.MONOCOUP );

    Ini.WriteBool   ( 'Config', 'EXAO '          , congiguration.EXAO );
    Ini.Writeinteger( 'Config', 'EXAO_freq_item ', congiguration.EXAO_FREQ_ITEM );
    Ini.Writeinteger( 'Config', 'EXAO_Long_Enrg ', congiguration.EXAO_LongEnrg );

    Ini.WriteInteger( 'Config', 'BaseDetemps'    , congiguration.BaseDetemps);
    Ini.WriteInteger( 'Config', 'TimeOut'        , congiguration.TimeOut);
    Ini.WriteInteger( 'Config', 'timeoutVALEURutilisateur'  , congiguration.timeoutVALEURutilisateur);
    Ini.WriteInteger( 'Config', 'Vitesse'        , congiguration.Vitesse);
    Ini.WriteInteger( 'Config', 'affichage'      , congiguration.affichage);
    Ini.WriteInteger( 'Config', 'ConfigOscillo'  , congiguration.ConfigOscillo);

  finally
    Ini.Free;
  end;
end;




procedure TFormOscilloGTI2.MenuConfigOscilloClick(Sender: TObject);
begin
     if sender=ConfigOscilo800600 then
     begin
         congiguration.ConfigOscillo:=1;
     end;
     if sender=ConfigOscilo1024768 then
     begin
         congiguration.ConfigOscillo:=2;
     end;
     if sender=ConfigOscilo1280960 then
     begin
         congiguration.ConfigOscillo:=3;
     end;

   if congiguration.ConfigOscillo=1 then
   begin
        ConfigOscilo800600.Checked:=true;
        FormOscilloGTI2.width:=800;
        FormOscilloGTI2.height:=600;
        GroupBoxEnregistrement.Top:=432;
   end;

   if congiguration.ConfigOscillo=2 then
   begin
        ConfigOscilo1024768.Checked:=true;
        FormOscilloGTI2.width:=1024;
        FormOscilloGTI2.height:=712;
        GroupBoxEnregistrement.Top:=544;
   end;

   if congiguration.ConfigOscillo=3 then
   begin
        ConfigOscilo1280960.Checked:=true;
        FormOscilloGTI2.width:=1280;
        FormOscilloGTI2.height:=960;
        GroupBoxEnregistrement.Top:=432;
   end;

   {  démarage :
   PageControlMesures.Top:=424;
   PageControlMesures.left:=0;
   GroupBoxEnregistrement.Top:=536;
   GroupBoxEnregistrement.left:=0;
   GroupBoxMONOCOUP.Top:=424;
   GroupBoxMONOCOUP.left:=0;
   }


end;


procedure TFormOscilloGTI2.MenuRESETconfigClick(Sender: TObject);
begin
     resetConfiguration (sender);
     ValidationConfiguration (sender);
end;


procedure TFormOscilloGTI2.TriggerChange (sender: Tobject);
var x: integer;
ValeurrealOrdonnee:double;
Curseur_Ordonnee:integer;
i:integer;
begin

     if sender=CheckBoxPreTrig then
     begin
          if CheckBoxPreTrig.Checked=true  then
          begin
          congiguration.PreTrig:=true  ;
          ModePrdclenchementPrTrig1.Checked:=true;
          end
          else
          begin
          congiguration.PreTrig:=false ;
          ModePrdclenchementPrTrig1.Checked:=false;
          end;
     end;

     if sender=ModePrdclenchementPrTrig1 then
     begin
          if congiguration.PreTrig=true  then
          begin
          congiguration.PreTrig:=false  ;
          ModePrdclenchementPrTrig1.Checked:=false;
          CheckBoxPreTrig.Checked:=false;
          end
          else
          begin
          congiguration.PreTrig:=true ;
          ModePrdclenchementPrTrig1.Checked:=true;
          CheckBoxPreTrig.Checked:=true;
          end;
     end;
     


     for i:=0 to 4 do
     begin
        if sender=TRadioButTriggerMode[i]then
        begin
             if TRadioButTriggerMode[i].checked=true   then congiguration.Trigger:=i;
              ValidationConfiguration (sender);
        end;
     end;

     if TRadioButtonFront[1].checked=true    then congiguration.front:=1;
     if TRadioButtonFront[0].checked=true    then congiguration.front:=0;

     if sender=ScrollBarLevelTrigger then
     begin
         congiguration.Level:=(4095-ScrollBarLevelTrigger.position-2048)*(30/4096);
         LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,3,2	)+' V';
         //TriggerBARREChange (sender);
     end;

     if sender=Button0LEVEL then
     begin
        ScrollBarLevelTrigger.position:=2048;
        congiguration.Level:=0;
        LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
     end;

     TriggerBARREChange (sender);

     ValidConfigINTERFACE_GTI2(sender);
    {
    if RadioButtonTriggerSANS.checked=true     then congiguration.Trigger:=0;
    if RadioButtonTriggerCH1.checked=true      then congiguration.Trigger:=1;
    if RadioButtonTriggerCH2.checked=true      then congiguration.Trigger:=2;
    if RadioButtonTriggerCH3.checked=true      then congiguration.Trigger:=3;
    if RadioButtonTriggerCH4.checked=true      then congiguration.Trigger:=4;
     }


    {
    if TRadioButTriggerMode[0].checked=true   then congiguration.Trigger:=0;
    if TRadioButTriggerMode[1].checked=true   then congiguration.Trigger:=1;
    if TRadioButTriggerMode[2].checked=true   then congiguration.Trigger:=2;
    if TRadioButTriggerMode[3].checked=true   then congiguration.Trigger:=3;
    if TRadioButTriggerMode[4].checked=true   then congiguration.Trigger:=4;
     }

    {
    if RadioButtonFrontMontant.checked=true    then congiguration.front:=1;
    if RadioButtonFrontDescendant.checked=true then congiguration.front:=0;
    }
    //LEVEL




    {
    congiguration.Level:=(4095-ScrollBarLevelTrigger.position-2048)*(15/2047);
    LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
    TriggerBARREChange (sender);
    }

    {
    if congiguration.Trigger=0 then
    begin
    ScrollBarLevelTrigger.Visible:=false;
    PaintBoxTRIGlevel.Visible:=false;
    end
    else
    begin
    ScrollBarLevelTrigger.Visible:=true;
    PaintBoxTRIGlevel.Visible:=true;
    AffichageBarreTrig(PaintBoxTRIGlevel);
    end;
    }

   // FormResize(Sender);
   // ValidConfigINTERFACE_GTI2(sender);      //fais par le timer

end;


procedure TFormOscilloGTI2.TriggerBARREChange (sender: Tobject);
var
i:integer;
PositionBarreTrig:integer;
begin


    if congiguration.Trigger=0 then
    begin
    ScrollBarLevelTrigger.Visible:=false;
    PaintBoxTRIGlevel.Visible:=false;
    end
    else
    begin
        ScrollBarLevelTrigger.Visible:=true;
        PaintBoxTRIGlevel.Visible:=true;

        if congiguration.affichage=1 then
        begin
           PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[1];
           PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
        end;

        if congiguration.affichage=2 then
        begin
            PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible   ];

            PositionBarreTrig:=1;

            if congiguration.VoieVisible[congiguration.Trigger]=true then
            begin
                for i:=1 to congiguration.Trigger-1 do
                begin
                     if congiguration.VoieVisible[i]=true then PositionBarreTrig:=PositionBarreTrig+1;
                end;
                PaintBoxTRIGlevel.top:=PositionEcransTOP[congiguration.NbVoiesVisible  ,PositionBarreTrig];
            end
            else
            begin
                PaintBoxTRIGlevel.Visible:=false;
            end;
        end;

        if congiguration.affichage=3 then
        begin
        PaintBoxTRIGlevel.Height:=round(FormOscilloGTI2.ClientHeight/2)-4-16;
        PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
        end;

        if  congiguration.VoieVisible[congiguration.Trigger]=true  then
        AffichageBarreTrig(PaintBoxTRIGlevel);

    end; {else if congiguration.Trigger=0}
  

end;


procedure TFormOscilloGTI2.YChange (sender: Tobject);
var
x,i : integer;
begin

     for i:=1 to 4 do
     begin
          if sender=TButton0DECALCH[i] then  TscrollBarCH[i].Position:=round(TscrollBarCH[i].max/2);

          if  (sender=TcheckBoxVoieVisible[i]) then
          begin
                if  TcheckBoxVoieVisible[i].Checked then  congiguration.VoieVisible[i]:=true else congiguration.VoieVisible[i]:=false;
                congiguration.NbVoiesVisible:=0;
                if  congiguration.VoieVisible[1]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
                if  congiguration.VoieVisible[2]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
                if  congiguration.VoieVisible[3]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
                if  congiguration.VoieVisible[4]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
          end;

          if (sender=TRadioButtonYxSondeX1[i]) or (sender=TRadioButtonYxSondeX10[i])then
          begin
              if TRadioButtonYxSondeX1[i].Checked then congiguration.SondeVoie[i]:=false else congiguration.SondeVoie[i]:=true ;
              if congiguration.SondeVoie[i]=false then x:=1 else x:=10;
              textesondes (X,ComboSensiB[i]);
          end;

          if sender=TCheckBoxINVCH[i] then
          begin
              congiguration.Invertion[i]:=TCheckBoxINVCH[i].Checked;
          end;

          if sender=ComboSensiB[i] then
          begin
              //congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
              if congiguration.affichage<>2 then
              begin
                   if ComboSensiB[i].ItemIndex=0 then ComboSensiB[i].ItemIndex:=1;
                   congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
              end
              else congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
          end;
     end;

     validationConfiguration(sender);
     ValidConfigINTERFACE_GTI2(sender);             //obligatoir sinon si aucune voies visibles on peu pas redémarrer!!!


     {
     if sender=TButton0DECALCH[1] then  TscrollBarCH[1].Position:=50;
     if sender=TButton0DECALCH[2] then  TscrollBarCH[2].Position:=50;
     if sender=TButton0DECALCH[3] then  TscrollBarCH[3].Position:=50;
     if sender=TButton0DECALCH[4] then  TscrollBarCH[4].Position:=50;

    if  (sender=TcheckBoxVoieVisible[1]) or
        (sender=TcheckBoxVoieVisible[2]) or
        (sender=TcheckBoxVoieVisible[3]) or
        (sender=TcheckBoxVoieVisible[4]) then
    begin

        for i:=1 to 4 do
        begin

            if  (sender=TcheckBoxVoieVisible[i]) then
            begin
                if  TcheckBoxVoieVisible[i].Checked then  congiguration.VoieVisible[i]:=true else congiguration.VoieVisible[i]:=false;
            end;

        end; {for i:=1 to 4}
       {
        congiguration.NbVoiesVisible:=0;
        if  congiguration.VoieVisible[1]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
        if  congiguration.VoieVisible[2]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
        if  congiguration.VoieVisible[3]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;
        if  congiguration.VoieVisible[4]=true then  congiguration.NbVoiesVisible:=congiguration.NbVoiesVisible+1;

    end;

    if TRadioButtonYxSondeX1[1].Checked then congiguration.SondeVoie[1]:=false else congiguration.SondeVoie[1]:=true ;
    if TRadioButtonYxSondeX1[2].Checked then congiguration.SondeVoie[2]:=false else congiguration.SondeVoie[2]:=true ;
    if TRadioButtonYxSondeX1[3].Checked then congiguration.SondeVoie[3]:=false else congiguration.SondeVoie[3]:=true ;
    if TRadioButtonYxSondeX1[4].Checked then congiguration.SondeVoie[4]:=false else congiguration.SondeVoie[4]:=true ;

    for i:=1 to 4 do
    begin
        if congiguration.SondeVoie[i]=false then x:=1 else x:=10;
        textesondes (X,ComboSensiB[i]);
    end;

    congiguration.Invertion[1]:=TCheckBoxINVCH[1].Checked;
    congiguration.Invertion[2]:=TCheckBoxINVCH[2].Checked;
    congiguration.Invertion[3]:=TCheckBoxINVCH[3].Checked;
    congiguration.Invertion[4]:=TCheckBoxINVCH[4].Checked;

    congiguration.sensibilitee[1]:=ComboSensiB[1].ItemIndex;
    congiguration.sensibilitee[2]:=ComboSensiB[2].ItemIndex;
    congiguration.sensibilitee[3]:=ComboSensiB[3].ItemIndex;
    congiguration.sensibilitee[4]:=ComboSensiB[4].ItemIndex;

         }




end;




procedure TFormOscilloGTI2.XChange (sender: Tobject);
begin
    if sender=ScrollBarBDT then
    begin
        congiguration.BaseDetemps:=ScrollBarBDT.Position;
        if congiguration.BaseDetemps=1 then RadioButtonBDT1.Checked:=true;
        if congiguration.BaseDetemps=2 then RadioButtonBDT2.Checked:=true;
        if congiguration.BaseDetemps=3 then RadioButtonBDT3.Checked:=true;
        if congiguration.BaseDetemps=4 then RadioButtonBDT4.Checked:=true;
        if congiguration.BaseDetemps=5 then RadioButtonBDT5.Checked:=true;
        if congiguration.BaseDetemps=6 then RadioButtonBDT6.Checked:=true;
        if congiguration.BaseDetemps=7 then RadioButtonBDT7.Checked:=true;
        if congiguration.BaseDetemps=8 then RadioButtonBDT8.Checked:=true;
        if congiguration.BaseDetemps=9 then RadioButtonBDT9.Checked:=true;
        if congiguration.BaseDetemps=10 then RadioButtonBDT10.Checked:=true;
        if congiguration.BaseDetemps=11 then RadioButtonBDT11.Checked:=true;
        if congiguration.BaseDetemps=12 then RadioButtonBDT12.Checked:=true;
        if congiguration.BaseDetemps=13 then RadioButtonBDT13.Checked:=true;
        if congiguration.BaseDetemps=14 then RadioButtonBDT14.Checked:=true;
        if congiguration.BaseDetemps=15 then RadioButtonBDT15.Checked:=true;
    end
    else
    begin
        if RadioButtonBDT1.Checked=true then congiguration.BaseDetemps:=1;
        if RadioButtonBDT2.Checked=true then congiguration.BaseDetemps:=2;
        if RadioButtonBDT3.Checked=true then congiguration.BaseDetemps:=3;
        if RadioButtonBDT4.Checked=true then congiguration.BaseDetemps:=4;
        if RadioButtonBDT5.Checked=true then congiguration.BaseDetemps:=5;
        if RadioButtonBDT6.Checked=true then congiguration.BaseDetemps:=6;
        if RadioButtonBDT7.Checked=true then congiguration.BaseDetemps:=7;
        if RadioButtonBDT8.Checked=true then congiguration.BaseDetemps:=8;
        if RadioButtonBDT9.Checked=true then congiguration.BaseDetemps:=9;
        if RadioButtonBDT10.Checked=true then congiguration.BaseDetemps:=10;
        if RadioButtonBDT11.Checked=true then congiguration.BaseDetemps:=11;
        if RadioButtonBDT12.Checked=true then congiguration.BaseDetemps:=12;
        if RadioButtonBDT13.Checked=true then congiguration.BaseDetemps:=13;
        if RadioButtonBDT14.Checked=true then congiguration.BaseDetemps:=14;
        if RadioButtonBDT15.Checked=true then congiguration.BaseDetemps:=15;

        ScrollBarBDT.Position:=congiguration.BaseDetemps;
    end;

    if sender=VUlent       then
    begin
         VUlent.Checked:=true;
         congiguration.Vitesse:=1;
    end;



    if sender=Vlent       then
    begin
         Vlent.Checked:=true;
         congiguration.Vitesse:=2;
    end;

    if sender=Vrapide     then
    begin
         Vrapide.Checked:=true;
         congiguration.Vitesse:=3;
    end;

    if sender=VUrapide    then
    begin
         VUrapide.Checked:=true;
         congiguration.Vitesse:=4;
    end;

    ValidConfigINTERFACE_GTI2(sender);    //fais par le timer et félicie, aussi !
end;


procedure TFormOscilloGTI2.XChange_II_NBdePOINTS_click (sender: Tobject);
begin
     Edit_BDTII_NB_POINTS.Text:='';
     //Button_BDT_II_VALIDATION.Visible:=true;
end;

procedure TFormOscilloGTI2.XChange_II_CALCUL (sender: Tobject);
begin
     {
     if congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ < 1        then
     begin
     Label_BDT_II_T_total.Caption:='Durée    : '+floattostr(1000*congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)+' ms';
     Label_BDT_II_ECRAN.Caption:=  'Ecran     : '+floattostr(100 *congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)+' ms/div';
     end;

     if congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ < 0.001    then
     begin
     Label_BDT_II_T_total.Caption:='Durée    : '+floattostr(1000000*congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)+' µs';
     Label_BDT_II_ECRAN.Caption:=  'Ecran     : '+floattostr(100000 *congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)+' µs/div';
     end;

     if congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ < 0.000001 then
     begin
     Label_BDT_II_T_total.Caption:='Durée    : '+floattostr(1000000000*congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)+' ns';
     Label_BDT_II_ECRAN.Caption:=  'Ecran     : '+floattostr(100000000 *congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)+' ns/div';
     end;
     }
     if congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ < 1        then
     begin
     Label_BDT_II_T_total.Caption:='Durée            : '+floattostrf(1000*congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ,ffFixed,4,2)+' ms';
     Label_BDT_II_ECRAN.Caption:=  'Ecran             : '+floattostrf(100 *congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ,ffFixed,4,2)+' ms/div';
     end;

     if congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ < 0.001    then
     begin
     Label_BDT_II_T_total.Caption:='Durée            : '+floattostrf((100000*congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ)*10,ffFixed,4,2)+' µs';
     Label_BDT_II_ECRAN.Caption:=  'Ecran            : '+floattostrf(100000 *congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ,ffFixed,4,2)+' µs/div';
     end;

     if congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ < 0.000001 then
     begin
     Label_BDT_II_T_total.Caption:='Durée            : '+floattostrf(1000000000*congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ,ffFixed,4,2)+' ns';
     Label_BDT_II_ECRAN.Caption:=  'Ecran             : '+floattostrf(100000000 *congiguration.EXAO_LongEnrg_temporaire/congiguration.EXAO_FREQ,ffFixed,4,2)+' ns/div';
     end;

end;

procedure TFormOscilloGTI2.Edit_BDTII_NB_POINTSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=VK_RETURN	 then
    begin
        EnterKeyTempo:=true;
        XChange_II (sender);
    end;
end;
{
procedure TFormOscilloGTI2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var frequence_teste : dword;
    frequence_possible : dword;
begin
      if key=VK_RETURN	 then
      begin
           frequence_teste:=strtoint(Edit1.Text);
           frequence_possible:=GetSampleFrequencyPossible (@frequence_teste) ;
           Edit2.Text:=floattostr(frequence_possible);
      end;
end;
}
procedure TFormOscilloGTI2.Edit1Change(Sender: TObject);
var frequence_teste : dword;
    frequence_possible : dword;
begin
     try
     frequence_teste:=strtoint(Edit1.Text);
     frequence_possible:=GetSampleFrequencyPossible (@frequence_teste) ;
     Edit2.Text:=floattostr(frequence_possible);
     except
     end;
end;
procedure TFormOscilloGTI2.ValideFregPossiblrClick(Sender: TObject);
var freque:integer;
    perio:real;
begin
     freque:=strtoint(Edit2.Text);
     if freque>=1000000 then  ComboBoxEx_BDT_II_FREQ.Itemsex[14].caption:=floattostr(freque/1000000) + ' MHz';
     if ((freque<1000000) and (freque>=1000)) then  ComboBoxEx_BDT_II_FREQ.Itemsex[14].caption:=floattostr(freque/1000) + ' KHz';
     if freque<1000 then  ComboBoxEx_BDT_II_FREQ.Itemsex[14].caption:=floattostr(freque) + ' Hz';

     ComboBoxEx_BDT_II_FREQ.ItemIndex:=14;

     congiguration.EXAO_FREQ:= strtoint(Edit2.Text);

     perio:=1/freque;
     if perio<0.000001 then  Label_BDT_II_dt.Caption:='Pèriode (dt) : '+ floattostr(perio*1000000000)+' ns';
     if ((perio<0.001) and (perio>=0.000001)) then  Label_BDT_II_dt.Caption:='Pèriode (dt) : '+ floattostr(perio*1000000)+' µs';
     if ((perio<1) and (perio>=0.001)) then  Label_BDT_II_dt.Caption:='Pèriode (dt) : '+ floattostr(perio*1000)+' ms';

     XChange_II_CALCUL (sender);
     GroupBoxBaseDeTemps_IV_FREQ_ECH.Visible:=false;
     GroupBoxBaseDeTemps_II.Visible:=true;
end;


procedure TFormOscilloGTI2.XChange_II (sender: Tobject);
var
stringtemp:shortstring;
EXAO_LongEnrg:integer;
begin

     if sender=ComboBoxEx_BDT_II_FREQ then
          begin

          congiguration.EXAO_FREQ_ITEM:=ComboBoxEx_BDT_II_FREQ.ItemIndex;

          if ComboBoxEx_BDT_II_FREQ.ItemIndex=0  then  begin congiguration.EXAO_FREQ:=10000000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 100 ns'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=1  then  begin congiguration.EXAO_FREQ:= 6000000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 167 ns'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=2  then  begin congiguration.EXAO_FREQ:= 2500000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 400 ns'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=3  then  begin congiguration.EXAO_FREQ:= 1000000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   1 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=4  then  begin congiguration.EXAO_FREQ:=  500000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   2 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=5  then  begin congiguration.EXAO_FREQ:=  250000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   4 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=6  then  begin congiguration.EXAO_FREQ:=  100000; Label_BDT_II_dt.Caption:='Pèriode (dt) :  10 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=7  then  begin congiguration.EXAO_FREQ:=   50000; Label_BDT_II_dt.Caption:='Pèriode (dt) :  20 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=8  then  begin congiguration.EXAO_FREQ:=   25000; Label_BDT_II_dt.Caption:='Pèriode (dt) :  40 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=9  then  begin congiguration.EXAO_FREQ:=   10000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 100 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=10  then  begin congiguration.EXAO_FREQ:=   5000; Label_BDT_II_dt.Caption:='Pèriode (dt) : 200 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=11  then  begin congiguration.EXAO_FREQ:=   2500; Label_BDT_II_dt.Caption:='Pèriode (dt) : 400 µs'; end;
          if ComboBoxEx_BDT_II_FREQ.ItemIndex=12  then  begin congiguration.EXAO_FREQ:=   1000; Label_BDT_II_dt.Caption:='Pèriode (dt) :   1 ms'; end;

          if ComboBoxEx_BDT_II_FREQ.ItemIndex=13  then
          begin
                GroupBoxBaseDeTemps_IV_FREQ_ECH.Visible:=true;
                GroupBoxBaseDeTemps_II.Visible:=false;

          
                //congiguration.EXAO_FREQ:=   1000;
                //Label_BDT_II_dt.Caption:='Pèriode :   1 ms';
          end;

          XChange_II_CALCUL (sender);

          //validation effective sur la GTI2
          //FrequenceEch:=congiguration.EXAO_FREQ;
          //SetSampleFrequency (@FrequenceEch) ;

          end;

     if (sender=Edit_BDTII_NB_POINTS) and (Edit_BDTII_NB_POINTS.Text<>'')then
          begin
          //pare fou!!?
          if strtoint( Edit_BDTII_NB_POINTS.Text)>14500 then
              begin
              Edit_BDTII_NB_POINTS.Text:='14500' ;
              Label_BDT_II_T_total.Caption:='xxx';
              Label_BDT_II_ECRAN.Caption:='xxx';
              end;

          if strtoint( Edit_BDTII_NB_POINTS.Text)<=0    then
              begin
              Edit_BDTII_NB_POINTS.Text:='1' ;
              Label_BDT_II_T_total.Caption:='xxx';
              Label_BDT_II_ECRAN.Caption:='xxx';
              end;

          if (strtoint( Edit_BDTII_NB_POINTS.Text)>0) and (strtoint( Edit_BDTII_NB_POINTS.Text)<=14500) then
              begin
              congiguration.EXAO_LongEnrg_temporaire:=strtoint( Edit_BDTII_NB_POINTS.Text);
              XChange_II_CALCUL (sender);
              Button_BDT_II_VALIDATION.Visible:=true;
              end;

          congiguration.EXAO_LongEnrg_temporaire:=strtoint( Edit_BDTII_NB_POINTS.Text);


          end;

     if (sender=Button_BDT_II_VALIDATION)or(EnterKeyTempo=true)  then
          begin
          Button_BDT_II_VALIDATION.Visible:=false;
          congiguration.EXAO_LongEnrg:=congiguration.EXAO_LongEnrg_temporaire;
          EnterKeyTempo:=false;
          {if congiguration.PreTrig=true then
              LongEnregistrement:=congiguration.EXAO_LongEnrg+500
          else
              LongEnregistrement:=congiguration.EXAO_LongEnrg;
          SetRecordLength    (LongEnregistrement ) ;   }
          //validation effective sur la GTI2
          end;



end;






/////////////////////////////////////////////////////////////////////////////////
/////////               DEBUT DES                                         ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////              PROCEDURES D'AFFICHAGE                           ///////// ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

procedure TFormOscilloGTI2.ResetEcran (sender: Tpaintbox);
var
X,Y,t:integer;
r,v,b:integer;
LARGEUR:integer;
i:integer;
coulFOND,coulGRILLE:tcolor;
luminanceGrille:integer;
Hauteur:integer;
couleurpourtour:tcolor;
begin

//couleur de fond

      sender.Canvas.Pen.Width :=1;
      sender.Canvas.pen.Color :=clblack ;
      //coulFOND:=TSL_TO_RVB_TCOLOR(140,225,FormConfigCouleursOscilloGTI2.ScrollBarLuminositeFondEcran.position)  ;        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0])  ;
      sender.Canvas.Brush.Color := congiguration.couleurs[0];
      sender.Canvas.Rectangle(0, 0, sender.Width - 1, sender.Height - 1);

      LARGEUR:=10;

      for i:=1 to largeur do
      begin

         // coul:=TSL_TO_RVB_TCOLOR(140,225,140-5*(largeur-i))  ;

          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0]-5*(largeur-i))  ;

          sender.Canvas.Pen.Width :=1;
          sender.Canvas.pen.Color :=coulFOND ;
          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0])  ;        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          sender.Canvas.Brush.Color := coulFOND;
          sender.Canvas.Rectangle(i, i, sender.Width - 1 - i, sender.Height - 1 - i);
      end;


//contraste
    if congiguration.couleurs[0]>=160 then luminanceGrille:=0;
    if congiguration.couleurs[0]<=159 then luminanceGrille:=240;
    //luminanceGrille:=240;
    coulGRILLE:=TSL_TO_RVB_TCOLOR(160,0,luminanceGrille);


    Sender.Canvas.Pen.Color := coulGRILLE;
//grille
    Hauteur:=Sender.height;
    for x:=1 to 9 do
    begin
        for Y:=0 to 7 do
        begin
            if Y>0 then
            begin
            Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/8)-1);
            Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Hauteur/8)+2);
            Sender.Canvas.moveTo(x*round(Sender.Width/10)-1, y*round(Hauteur/8));
            Sender.Canvas.LineTo(x*round(Sender.Width/10)+2, y*round(Hauteur/8));
            end;
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/8) + t*round(Hauteur/40)  );
                Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Hauteur/8)+ t*round(Hauteur/40) +1);
            end;

        end;
    end;

    for x:=0 to 9 do
    begin
        for Y:=1 to 7 do
        begin
            //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/100)  );
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Hauteur/8));
                Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Hauteur/8));
            end;
        end;
    end;
//pourtour d'ecran
    for x:=1 to 9 do
    begin
         Sender.Canvas.MoveTo(x*round(Sender.Width/10)-1, 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/10)+2, 1);
         Sender.Canvas.moveTo(x*round(Sender.Width/10), 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/10), 3);

         Sender.Canvas.MoveTo(x*round(Sender.Width/10)-1, Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/10)+2, Sender.height-3);
         Sender.Canvas.moveTo(x*round(Sender.Width/10), Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/10), Sender.height-5);
    end;

    for Y:=1 to 7 do
    begin
        Sender.Canvas.MoveTo(1, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(1, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(1, y*round(Hauteur/8));
        Sender.Canvas.LineTo(3, y*round(Hauteur/8));

        Sender.Canvas.MoveTo(Sender.Width-3, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(Sender.Width-3, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(Sender.Width-3, y*round(Hauteur/8));
        Sender.Canvas.LineTo(Sender.Width-5, y*round(Hauteur/8));
    end;





// ligne de 0

    if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := coulGRILLE;                    /////pas dans le config !!!!!!!!!!
    Sender.Canvas.MoveTo(0, 4*round(Sender.Height/8)+1 );
    Sender.Canvas.LineTo(Sender.Width , 4*round(Sender.Height/8)+1);
    end;

// LIGNE PRE TRIG
    if congiguration.PreTrig=true then
    begin
    Sender.Canvas.Pen.Color := coulGRILLE;            /////pas dans le config !!!!!!!!!!
    Sender.Canvas.MoveTo(round(Sender.Width/10), 0 );
    Sender.Canvas.LineTo(round(Sender.Width/10) , Sender.Height);
    end;










end;

procedure TFormOscilloGTI2.ResetEcran_bitmap (sender: Tbitmap);
var
X,Y,t:integer;
r,v,b:integer;
LARGEUR:integer;
i:integer;
coulFOND,coulGRILLE:tcolor;
luminanceGrille:integer;
Hauteur:integer;
couleurpourtour:tcolor;
begin

//couleur de fond

      sender.Canvas.Pen.Width :=1;
      sender.Canvas.pen.Color :=clblack ;
      //coulFOND:=TSL_TO_RVB_TCOLOR(140,225,FormConfigCouleursOscilloGTI2.ScrollBarLuminositeFondEcran.position)  ;        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0])  ;
      sender.Canvas.Brush.Color := congiguration.couleurs[0];
      sender.Canvas.Rectangle(0, 0, sender.Width - 1, sender.Height - 1);

      LARGEUR:=10;

      for i:=1 to largeur do
      begin

         // coul:=TSL_TO_RVB_TCOLOR(140,225,140-5*(largeur-i))  ;

          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0]-5*(largeur-i))  ;

          sender.Canvas.Pen.Width :=1;
          sender.Canvas.pen.Color :=coulFOND ;
          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0])  ;        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          sender.Canvas.Brush.Color := coulFOND;
          sender.Canvas.Rectangle(i, i, sender.Width - 1 - i, sender.Height - 1 - i);
      end;


//contraste
    if congiguration.couleurs[0]>=160 then luminanceGrille:=0;
    if congiguration.couleurs[0]<=159 then luminanceGrille:=240;
    //luminanceGrille:=240;
    coulGRILLE:=TSL_TO_RVB_TCOLOR(160,0,luminanceGrille);


    Sender.Canvas.Pen.Color := coulGRILLE;
//grille
    Hauteur:=Sender.height;
    for x:=1 to 9 do
    begin
        for Y:=0 to 7 do
        begin
            if Y>0 then
            begin
            Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/8)-1);
            Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Hauteur/8)+2);
            Sender.Canvas.moveTo(x*round(Sender.Width/10)-1, y*round(Hauteur/8));
            Sender.Canvas.LineTo(x*round(Sender.Width/10)+2, y*round(Hauteur/8));
            end;
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/8) + t*round(Hauteur/40)  );
                Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Hauteur/8)+ t*round(Hauteur/40) +1);
            end;

        end;
    end;

    for x:=0 to 9 do
    begin
        for Y:=1 to 7 do
        begin
            //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/100)  );
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Hauteur/8));
                Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Hauteur/8));
            end;
        end;
    end;
//pourtour d'ecran
    for x:=1 to 9 do
    begin
         Sender.Canvas.MoveTo(x*round(Sender.Width/10)-1, 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/10)+2, 1);
         Sender.Canvas.moveTo(x*round(Sender.Width/10), 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/10), 3);

         Sender.Canvas.MoveTo(x*round(Sender.Width/10)-1, Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/10)+2, Sender.height-3);
         Sender.Canvas.moveTo(x*round(Sender.Width/10), Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/10), Sender.height-5);
    end;

    for Y:=1 to 7 do
    begin
        Sender.Canvas.MoveTo(1, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(1, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(1, y*round(Hauteur/8));
        Sender.Canvas.LineTo(3, y*round(Hauteur/8));

        Sender.Canvas.MoveTo(Sender.Width-3, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(Sender.Width-3, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(Sender.Width-3, y*round(Hauteur/8));
        Sender.Canvas.LineTo(Sender.Width-5, y*round(Hauteur/8));
    end;





// ligne de 0

    if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := coulGRILLE;                    /////pas dans le config !!!!!!!!!!
    Sender.Canvas.MoveTo(0, 4*round(Sender.Height/8)+1 );
    Sender.Canvas.LineTo(Sender.Width , 4*round(Sender.Height/8)+1);
    end;

// LIGNE PRE TRIG
    if congiguration.PreTrig=true then
    begin
    Sender.Canvas.Pen.Color := coulGRILLE;            /////pas dans le config !!!!!!!!!!
    Sender.Canvas.MoveTo(round(Sender.Width/10), 0 );
    Sender.Canvas.LineTo(round(Sender.Width/10) , Sender.Height);
    end;










end;



procedure TFormOscilloGTI2.ResetEcran_bleu (sender: Tpaintbox);
var
X,Y,t:integer;
begin
// effaçage
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.pen.Color := congiguration.couleurs[0];
    Sender.Canvas.Brush.Color := congiguration.couleurs[0];
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

// traçé grille

    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    for x:=1 to 9 do
    begin
    for Y:=0 to 10 do
    begin
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.height/8) + t*round(Sender.height/40)  );
    Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
    end;
    Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.Height/8)+2);
    Sender.Canvas.moveTo(x*round(Sender.Width/10)+1, y*round(Sender.Height/8)+1);
    Sender.Canvas.LineTo(x*round(Sender.Width/10)-1, y*round(Sender.Height/8)+1);
    end;
    end;
    for x:=0 to 9 do
    begin
    for Y:=1 to 10 do
    begin
    //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Sender.height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Sender.height/8));

    end;
    end;
    end;

// ligne de 0

    if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    end;

// LIGNE PRE TRIG
    if congiguration.PreTrig=true then
    begin
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(round(Sender.Width/10), 0 );
    Sender.Canvas.LineTo(round(Sender.Width/10) , Sender.Height);
    end;


end;

procedure TFormOscilloGTI2.ResetEcran3DIV (sender: Tpaintbox);
var
X,Y,t:integer;
begin
// effaçage
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.pen.Color := congiguration.couleurs[0];
    Sender.Canvas.Brush.Color := congiguration.couleurs[0];
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

// traçé grille

    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    for x:=1 to 9 do
    begin
      for Y:=0 to 10 do
      begin
        for t:=1 to 4 do
        begin
        Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.height/6) + t*round(Sender.height/30)  );
        Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.height/6)+ t*round(Sender.height/30) +1);
        end;
      Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/6));
      Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.Height/6)+2);
      Sender.Canvas.moveTo(x*round(Sender.Width/10)+1, y*round(Sender.Height/6)+1);
      Sender.Canvas.LineTo(x*round(Sender.Width/10)-1, y*round(Sender.Height/6)+1);
      end;
    end;

    for x:=0 to 9 do
    begin
      for Y:=1 to 10 do
      begin
    //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
        for t:=1 to 4 do
        begin
          Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Sender.height/6));
          Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Sender.height/6));
        end;
      end;
    end;

// ligne de 0
    if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    end;
end;

{
procedure TFormOscilloGTI2.ResetEcranXY (sender: Tpaintbox);
var
x,y,t:integer;
begin
// effaçage
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.pen.Color   := congiguration.couleurs[0];
    Sender.Canvas.Brush.Color := congiguration.couleurs[0];
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

// traçé grille  perso1 XY
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    for x:=1 to 9 do
    begin
    for Y:=0 to 9 do
    begin
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.height/8) + t*round(Sender.height/40)  );
    Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
    end;
    Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.Height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.Height/8)+2);
    Sender.Canvas.moveTo(x*round(Sender.Width/8)+1, y*round(Sender.Height/8)+1);
    Sender.Canvas.LineTo(x*round(Sender.Width/8)-1, y*round(Sender.Height/8)+1);
    end;
    end;

    for x:=0 to 9 do
    begin
    for Y:=1 to 9 do
    begin
    //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40), y*round(Sender.height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40)+1, y*round(Sender.height/8));

    end;
    end;
    end;


// lignes de 0
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    Sender.Canvas.MoveTo( round(Sender.Width/2),0 );
    Sender.Canvas.LineTo(round(Sender.Width/2) , Sender.Height);

end;
}

procedure TFormOscilloGTI2.ResetEcranXY (sender: Tpaintbox);
var
x,y,t,i:integer;
largeur:integer;
coulFOND,coulGRILLE:Tcolor;
luminanceGrille,Hauteur:integer;
begin
///couleur de fond

      sender.Canvas.Pen.Width :=1;
      sender.Canvas.pen.Color :=clblack ;
      sender.Canvas.Brush.Color := clblack;
      sender.Canvas.Rectangle(0, 0, sender.Width - 1, sender.Height - 1);

      LARGEUR:=10;

      for i:=1 to largeur do
      begin

         // coul:=TSL_TO_RVB_TCOLOR(140,225,140-5*(largeur-i))  ;

          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0]-5*(largeur-i))  ;

          sender.Canvas.Pen.Width :=1;
          sender.Canvas.pen.Color :=coulFOND ;
          sender.Canvas.Brush.Color := coulFOND;
          sender.Canvas.Rectangle(i, i, sender.Width - 1 - i, sender.Height - 1 - i);
      end;


//contraste
    if congiguration.couleurs[0]>=160 then luminanceGrille:=0;
    if congiguration.couleurs[0]<=159 then luminanceGrille:=240;
    //luminanceGrille:=240;
    coulGRILLE:=TSL_TO_RVB_TCOLOR(160,0,luminanceGrille);


    Sender.Canvas.Pen.Color := coulGRILLE;

// traçé grille  perso1 XY

    Hauteur:=Sender.height;
    for x:=1 to 9 do
    begin
        for Y:=0 to 7 do
        begin
            if Y>0 then
            begin
            Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Hauteur/8)-1);
            Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Hauteur/8)+2);
            Sender.Canvas.moveTo(x*round(Sender.Width/8)-1, y*round(Hauteur/8));
            Sender.Canvas.LineTo(x*round(Sender.Width/8)+2, y*round(Hauteur/8));
            end;
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Hauteur/8) + t*round(Hauteur/40)  );
                Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Hauteur/8)+ t*round(Hauteur/40) +1);
            end;

        end;
    end;

    for x:=0 to 9 do
    begin
        for Y:=1 to 7 do
        begin
            //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/100)  );
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/8)+ t*round(Sender.Width/50), y*round(Hauteur/8));
                Sender.Canvas.LineTo(x*round(Sender.Width/8)+ t*round(Sender.Width/50)+1, y*round(Hauteur/8));
            end;
        end;
    end;


// lignes de 0
    Sender.Canvas.Pen.Color := coulGRILLE;
    Sender.Canvas.MoveTo(0, 4*round(Sender.Height/8)+1 );
    Sender.Canvas.LineTo(Sender.Width-1 , 4*round(Sender.Height/8)+1);
    Sender.Canvas.MoveTo( 4*round(Sender.Width/8)-1,0 );
    Sender.Canvas.LineTo(4*round(Sender.Width/8)-1 , Sender.Height-1);

//pourtour d'ecran  XY
    for x:=1 to 7 do
    begin
         Sender.Canvas.MoveTo(x*round(Sender.Width/8)-1, 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/8)+2, 1);
         Sender.Canvas.moveTo(x*round(Sender.Width/8), 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/8), 3);

         Sender.Canvas.MoveTo(x*round(Sender.Width/8)-1, Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/8)+2, Sender.height-3);
         Sender.Canvas.moveTo(x*round(Sender.Width/8), Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/8), Sender.height-5);
    end;

    for Y:=1 to 7 do
    begin
        Sender.Canvas.MoveTo(1, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(1, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(1, y*round(Hauteur/8));
        Sender.Canvas.LineTo(3, y*round(Hauteur/8));

        Sender.Canvas.MoveTo(Sender.Width-3, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(Sender.Width-3, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(Sender.Width-3, y*round(Hauteur/8));
        Sender.Canvas.LineTo(Sender.Width-5, y*round(Hauteur/8));
    end;


end;

procedure TFormOscilloGTI2.ResetEcranXY_bitmap (sender: Tbitmap);
var
x,y,t,i:integer;
largeur:integer;
coulFOND,coulGRILLE:Tcolor;
luminanceGrille,Hauteur:integer;
begin
///couleur de fond

      sender.Canvas.Pen.Width :=1;
      sender.Canvas.pen.Color :=clinfobk ;
      sender.Canvas.Brush.Color := clinfobk;
      sender.Canvas.Rectangle(0, 0, sender.Width - 1, sender.Height - 1);

      LARGEUR:=10;

      for i:=1 to largeur do
      begin

         // coul:=TSL_TO_RVB_TCOLOR(140,225,140-5*(largeur-i))  ;

          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0]-5*(largeur-i))  ;

          sender.Canvas.Pen.Width :=1;
          sender.Canvas.pen.Color :=coulFOND ;
          sender.Canvas.Brush.Color := coulFOND;
          sender.Canvas.Rectangle(i, i, sender.Width - 1 - i, sender.Height - 1 - i);
      end;


//contraste
    if congiguration.couleurs[0]>=160 then luminanceGrille:=0;
    if congiguration.couleurs[0]<=159 then luminanceGrille:=240;
    //luminanceGrille:=240;
    coulGRILLE:=TSL_TO_RVB_TCOLOR(160,0,luminanceGrille);


    Sender.Canvas.Pen.Color := coulGRILLE;

// traçé grille  perso1 XY

    Hauteur:=Sender.height;
    for x:=1 to 9 do
    begin
        for Y:=0 to 7 do
        begin
            if Y>0 then
            begin
            Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Hauteur/8)-1);
            Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Hauteur/8)+2);
            Sender.Canvas.moveTo(x*round(Sender.Width/8)-1, y*round(Hauteur/8));
            Sender.Canvas.LineTo(x*round(Sender.Width/8)+2, y*round(Hauteur/8));
            end;
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Hauteur/8) + t*round(Hauteur/40)  );
                Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Hauteur/8)+ t*round(Hauteur/40) +1);
            end;

        end;
    end;

    for x:=0 to 9 do
    begin
        for Y:=1 to 7 do
        begin
            //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Hauteur/100)  );
            for t:=1 to 4 do
            begin
                Sender.Canvas.MoveTo(x*round(Sender.Width/8)+ t*round(Sender.Width/50), y*round(Hauteur/8));
                Sender.Canvas.LineTo(x*round(Sender.Width/8)+ t*round(Sender.Width/50)+1, y*round(Hauteur/8));
            end;
        end;
    end;


// lignes de 0
    Sender.Canvas.Pen.Color := coulGRILLE;
    Sender.Canvas.MoveTo(0, 4*round(Sender.Height/8)+1 );
    Sender.Canvas.LineTo(Sender.Width-1 , 4*round(Sender.Height/8)+1);
    Sender.Canvas.MoveTo( 4*round(Sender.Width/8)-1,0 );
    Sender.Canvas.LineTo(4*round(Sender.Width/8)-1 , Sender.Height-1);

//pourtour d'ecran  XY
    for x:=1 to 7 do
    begin
         Sender.Canvas.MoveTo(x*round(Sender.Width/8)-1, 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/8)+2, 1);
         Sender.Canvas.moveTo(x*round(Sender.Width/8), 1);
         Sender.Canvas.LineTo(x*round(Sender.Width/8), 3);

         Sender.Canvas.MoveTo(x*round(Sender.Width/8)-1, Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/8)+2, Sender.height-3);
         Sender.Canvas.moveTo(x*round(Sender.Width/8), Sender.height-3);
         Sender.Canvas.LineTo(x*round(Sender.Width/8), Sender.height-5);
    end;

    for Y:=1 to 7 do
    begin
        Sender.Canvas.MoveTo(1, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(1, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(1, y*round(Hauteur/8));
        Sender.Canvas.LineTo(3, y*round(Hauteur/8));

        Sender.Canvas.MoveTo(Sender.Width-3, y*round(Hauteur/8)-1);
        Sender.Canvas.LineTo(Sender.Width-3, y*round(Hauteur/8)+2);
        Sender.Canvas.moveTo(Sender.Width-3, y*round(Hauteur/8));
        Sender.Canvas.LineTo(Sender.Width-5, y*round(Hauteur/8));
    end;


end;




procedure TFormOscilloGTI2.AffichageBarreTrig(sender: Tpaintbox);
var
ValeurrealOrdonnee:double;
Curseur_Ordonnee:integer;
calibre:double;
INV:integer;

begin
    //pb de l'invertion
    //pb des calibres
    //pb de l'invisible qd trigger sur une voie pas affichée

    // effaçage  de la paintbox de marquage du trig
    sender.Canvas.Pen.Width:=1;

    sender.Canvas.Pen.color:=TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0]);
    sender.Canvas.Brush.Color := TSL_TO_RVB_TCOLOR(140,225,congiguration.couleurs[0]);
    sender.Canvas.Rectangle(0, 0, sender.Width - 1, sender.Height - 1);

    //trig point  ds la paintbox de marquage du trig
    sender.Canvas.Pen.Color := clWhite	;


    if congiguration.Invertion[congiguration.Trigger]=true then   INV:=-1 else  INV:=1;
    Calibre:=TensionMaxEcran[congiguration.sensibilitee[congiguration.Trigger]];

    ValeurrealOrdonnee:=         -(INV)*congiguration.Level * (sender.Height/2) / Calibre + (TscrollBarCH[congiguration.Trigger].Position*sender.Height/TscrollBarCH[congiguration.Trigger].max)  ;
    Curseur_Ordonnee  := Round(  -(INV)*congiguration.Level * (sender.Height/2) / Calibre + (TscrollBarCH[congiguration.Trigger].Position*sender.Height/TscrollBarCH[congiguration.Trigger].max) );


    Sender.Canvas.Pen.Color :=congiguration.couleurs[congiguration.Trigger];

    if (ValeurrealOrdonnee)>=0 then  //Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
    begin
    sender.Canvas.Pen.Width:=2;
    sender.Canvas.MoveTo(sender.Width - 2,Curseur_Ordonnee);
    sender.Canvas.LineTo(0,Curseur_Ordonnee-10);
    sender.Canvas.LineTo(0,Curseur_Ordonnee+10) ;
    sender.Canvas.LineTo(sender.Width - 2,Curseur_Ordonnee) ;
    sender.Canvas.MoveTo(sender.Width - 2,Curseur_Ordonnee);
    sender.Canvas.LineTo(0,Curseur_Ordonnee) ;
    end;  //sinon le marqeur est hors de l'écran donc on affiche pas...
          //si limite du bas pas de pb


    if congiguration.front=0 then                  //1 : montant, 0 decendant.       //dessin de la flèche
    begin
    sender.Canvas.Pen.Width:=2;
    sender.Canvas.MoveTo(0,Curseur_Ordonnee+15);
    sender.Canvas.LineTo(5,Curseur_Ordonnee+15);
    sender.Canvas.LineTo(5,Curseur_Ordonnee+30);
    sender.Canvas.LineTo(9,Curseur_Ordonnee+30);

    sender.Canvas.Pen.Width:=2;
    sender.Canvas.MoveTo(2,Curseur_Ordonnee+20);
    sender.Canvas.LineTo(5,Curseur_Ordonnee+25);
    sender.Canvas.LineTo(7,Curseur_Ordonnee+20);
    end;

    if congiguration.front=1 then                  //1 : montant, 0 decendant.        //dessin de la flèche
    begin
    sender.Canvas.Pen.Width:=2;
    sender.Canvas.MoveTo(0,Curseur_Ordonnee-15);
    sender.Canvas.LineTo(5,Curseur_Ordonnee-15);
    sender.Canvas.LineTo(5,Curseur_Ordonnee-30);
    sender.Canvas.LineTo(9,Curseur_Ordonnee-30);

    sender.Canvas.Pen.Width:=2;
    sender.Canvas.MoveTo(2,Curseur_Ordonnee-20);
    sender.Canvas.LineTo(5,Curseur_Ordonnee-25);
    sender.Canvas.LineTo(7,Curseur_Ordonnee-20);
    end;


end;


procedure TFormOscilloGTI2.SearchTrigPoint (sender: Tobject);
var
   Longueur_Acquisition : dword;
   Curseur     : Word;
   HYST : real;
   S :boolean;
   smem:boolean;
begin
     Longueur_Acquisition := GetRecordLength();
     congiguration.PointTrig:=0;
     congiguration.TrigOK:=false;

     if congiguration.Trigger<>0 then
          begin
          Curseur := 0;
          //HYST:= ScrollBar1.Position/1000;
          HYST:=congiguration.HYSTPreTrig;
          //Label5.Caption:=floattostr(HYST);

          if TchXDoubleArray[congiguration.Trigger][ 0 ]<congiguration.LEVEL then smem:=false;
          if TchXDoubleArray[congiguration.Trigger][ 0 ]>congiguration.LEVEL then smem:=true;

          while ((congiguration.TrigOK=false) and  (Curseur < {500} Longueur_Acquisition - 1)) do
              begin

              if (TchXDoubleArray[congiguration.Trigger][ 0 ]<congiguration.LEVEL+HYST) and        //quasi improbable (triger ok pour le point 0)
                 (TchXDoubleArray[congiguration.Trigger][ 0 ]>congiguration.LEVEL-HYST) then
                 begin
                 congiguration.TrigOK:=true;
                 congiguration.PointTrig:=0;
                 end
              else
                 begin

                 if congiguration.front=1  then     //front montant
                    begin
                    if (TchXDoubleArray[congiguration.Trigger][ Curseur ]>=congiguration.LEVEL+HYST) {and (smem=false)} then s:=true;
                    if (TchXDoubleArray[congiguration.Trigger][ Curseur ]<=congiguration.LEVEL-HYST) {and (smem=true) } then s:=false;
                    if (smem<>s) and (s=true) and (Curseur>2) then
                        begin
                        congiguration.TrigOK:=true;
                        congiguration.PointTrig:=Curseur;
                        end;
                    smem:=s;
                    end; //front montant

                 if congiguration.front=0  then       //front descendant
                    begin
                    if (TchXDoubleArray[congiguration.Trigger][ Curseur ]>=congiguration.LEVEL+HYST) {and (smem=false)} then s:=true;
                    if (TchXDoubleArray[congiguration.Trigger][ Curseur ]<=congiguration.LEVEL-HYST) {and (smem=true)} then s:=false;
                    if (smem<>s) and (s=false) and (Curseur>2) then
                        begin
                        congiguration.TrigOK:=true;
                        congiguration.PointTrig:=Curseur;
                        end;
                    smem:=s;
                    end; //front descendant

                 Curseur := Curseur + 1 ;
                 end;  //else
              end; //while

          end; // if congiguration.Trigger<>0
end;   // SearchTrigPoint







procedure TFormOscilloGTI2.Affichage_voie_CHX(Sender: TPaintBox ; voie:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    calibre : double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;

     DecalPreTrig:integer;
begin

Longueur_Acquisition := GetRecordLength();
Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;

// ligne de 0 en pointillés
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max));
    Sender.Canvas.MoveTo(i+1 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max));
    i:=i+2;
    end;




//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
Sender.Canvas.MoveTo(0, Round(  -TchXDoubleArray[voie][ 0 ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) ));


    if  (congiguration.PreTrig=true) {and (voie=congiguration.Trigger)}  then                  // si PRETRIG
        begin

        //SearchTrigPoint (sender);    //recherche du ponit de trig
        if congiguration.TrigOK=true then     // trig ok
            begin
            DecalPreTrig:=congiguration.PointTrig-round((Longueur_Acquisition-500)/10);
            //CheckBox1.Checked:=true;
            end
        else
            begin                             //trig raté
            DecalPreTrig:=0;
            //CheckBox1.Checked:=false;
            end;
        Longueur_Acquisition :=Longueur_Acquisition-500;

        end
        else DecalPreTrig:=0;     //pas de PRETRIG

      try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
            begin

            if {(voie=congiguration.Trigger) and} (congiguration.PreTrig=true) and (DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) <0) then
              Curseur_Ordonnee  :=round(Sender.Height/2)    //PB  des ponit inexistant avant le PRETRIG
            else
              begin

              ValeurrealOrdonnee:=         -(INV)*TchXDoubleArray[voie][ DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
              Curseur_Ordonnee  := Round(  -(INV)*TchXDoubleArray[voie][ DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000) / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );

              end;

              if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
              if  Curseur_Abscisse=0 then
                   Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
              else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
            end;
      except
      end;

end;
procedure TFormOscilloGTI2.Affichage_voie_CHX_bitmap(Sender: Tbitmap ; voie:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    calibre : double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;

     DecalPreTrig:integer;
begin

sender.Canvas.Pen.Width :=1;
sender.Canvas.pen.Color :=clinfobk ;

sender.Canvas.Brush.Color := clinfobk;
sender.Canvas.Rectangle(0, 0, sender.Width - 1 , sender.Height - 1 );




Longueur_Acquisition := GetRecordLength();
Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;

// ligne de 0 en pointillés
if congiguration.DecalZeros=true then
begin
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max));
    Sender.Canvas.MoveTo(i+1 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max));
    i:=i+2;
    end;
end
else
begin
    //pas de ligne de pointillés si pas de décalage des zéro car ligne blanche ds la grille
end;



//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
Sender.Canvas.MoveTo(0, Round(  -TchXDoubleArray[voie][ 0 ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) ));


    if  (congiguration.PreTrig=true) {and (voie=congiguration.Trigger)}  then                  // si PRETRIG
        begin

        //SearchTrigPoint (sender);    //recherche du ponit de trig
        if congiguration.TrigOK=true then     // trig ok
            begin
            DecalPreTrig:=congiguration.PointTrig-round((Longueur_Acquisition-500)/10);
            //CheckBox1.Checked:=true;
            end
        else
            begin                             //trig raté
            DecalPreTrig:=0;
            //CheckBox1.Checked:=false;
            end;
        Longueur_Acquisition :=Longueur_Acquisition-500;

        end
        else DecalPreTrig:=0;     //pas de PRETRIG

      try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
            begin

            if {(voie=congiguration.Trigger) and} (congiguration.PreTrig=true) and (DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) <0) then
              Curseur_Ordonnee  :=round(Sender.Height/2)    //PB  des ponit inexistant avant le PRETRIG
            else
              begin

              ValeurrealOrdonnee:=         -(INV)*TchXDoubleArray[voie][ DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
              Curseur_Ordonnee  := Round(  -(INV)*TchXDoubleArray[voie][ DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000) / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );

              end;

              if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
              if  Curseur_Abscisse=0 then
                   Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
              else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
            end;
      except
      end;

end;



procedure TFormOscilloGTI2.ApropoClick(Sender: TObject);
begin
    {$IFDEF CABALABin}
      FormApropos.Visible := true ;
      FormApropos.BringToFront;
    {$ENDIF}
end;




procedure TFormOscilloGTI2.Affichage_voiesXY(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 ,Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    x,y,t,i:integer;
    INV1,INV2,INV3,INV4:integer;
    ValeurrealOrdonnee:real;
     ValeurrealAbscisse:real;
begin

Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh1, @Calibre1);
//GetSensitivity( lCh2, @Calibre2);
Calibre1:=TensionMaxEcran[congiguration.sensibilitee[1]];
Calibre2:=TensionMaxEcran[congiguration.sensibilitee[2]];
Calibre3:=TensionMaxEcran[congiguration.sensibilitee[3]];
Calibre4:=TensionMaxEcran[congiguration.sensibilitee[4]];

{
// effaçage
    Sender.Canvas.Brush.Color := clBlack;
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

// traçé grille  perso1 XY
    Sender.Canvas.Pen.Color := clSilver;
    for x:=1 to 9 do
    begin
    for Y:=0 to 9 do
    begin
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.height/8) + t*round(Sender.height/40)  );
    Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
    end;
    Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.Height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.Height/8)+2);
    Sender.Canvas.moveTo(x*round(Sender.Width/8)+1, y*round(Sender.Height/8)+1);
    Sender.Canvas.LineTo(x*round(Sender.Width/8)-1, y*round(Sender.Height/8)+1);
    end;
    end;

    for x:=0 to 9 do
    begin
    for Y:=1 to 9 do
    begin
    //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40), y*round(Sender.height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40)+1, y*round(Sender.height/8));

    end;
    end;
    end;


// lignes de 0
    Sender.Canvas.Pen.Color := clWhite;
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    Sender.Canvas.MoveTo( round(Sender.Width/2),0 );
    Sender.Canvas.LineTo(round(Sender.Width/2) , Sender.Height);

}    

if congiguration.Invertion[1]=true then   INV1:=-1 else  INV1:=1;
if congiguration.Invertion[2]=true then   INV2:=-1 else  INV2:=1;
if congiguration.Invertion[3]=true then   INV3:=-1 else  INV3:=1;
if congiguration.Invertion[4]=true then   INV4:=-1 else  INV4:=1;

// Affichage Voie XY

if congiguration.VoieVisible[2]=true  then
begin
    Sender.Canvas.Pen.Color := clGreen;
    Sender.Canvas.MoveTo( round((INV1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV2)*Ch2DoubleArray[ 1 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;

if congiguration.VoieVisible[3]=true  then
begin

    Sender.Canvas.Pen.Color := clYellow;
    Sender.Canvas.MoveTo( round((INV1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV3)*Ch3DoubleArray[ 1 ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV3)*Ch3DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV3)*Ch3DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;

if congiguration.VoieVisible[4]=true  then
begin
    Sender.Canvas.Pen.Color := clRed;
    Sender.Canvas.MoveTo( round((1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV4)*Ch4DoubleArray[ 1 ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV4)*Ch4DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV4)*Ch4DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra

          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;



// affichage des enregistrements


end;

procedure TFormOscilloGTI2.Affichage_voiesXY_bitmap(Sender: Tbitmap);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 ,Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    x,y,t,i:integer;
    INV1,INV2,INV3,INV4:integer;
    ValeurrealOrdonnee:real;
     ValeurrealAbscisse:real;
begin

sender.Canvas.Pen.Width :=1;
sender.Canvas.pen.Color :=clinfobk ;

sender.Canvas.Brush.Color := clinfobk;
sender.Canvas.Rectangle(0, 0, sender.Width - 1 , sender.Height - 1 );




Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh1, @Calibre1);
//GetSensitivity( lCh2, @Calibre2);
Calibre1:=TensionMaxEcran[congiguration.sensibilitee[1]];
Calibre2:=TensionMaxEcran[congiguration.sensibilitee[2]];
Calibre3:=TensionMaxEcran[congiguration.sensibilitee[3]];
Calibre4:=TensionMaxEcran[congiguration.sensibilitee[4]];

{
// effaçage
    Sender.Canvas.Brush.Color := clBlack;
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

// traçé grille  perso1 XY
    Sender.Canvas.Pen.Color := clSilver;
    for x:=1 to 9 do
    begin
    for Y:=0 to 9 do
    begin
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.height/8) + t*round(Sender.height/40)  );
    Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
    end;
    Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.Height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.Height/8)+2);
    Sender.Canvas.moveTo(x*round(Sender.Width/8)+1, y*round(Sender.Height/8)+1);
    Sender.Canvas.LineTo(x*round(Sender.Width/8)-1, y*round(Sender.Height/8)+1);
    end;
    end;

    for x:=0 to 9 do
    begin
    for Y:=1 to 9 do
    begin
    //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40), y*round(Sender.height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40)+1, y*round(Sender.height/8));

    end;
    end;
    end;


// lignes de 0
    Sender.Canvas.Pen.Color := clWhite;
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    Sender.Canvas.MoveTo( round(Sender.Width/2),0 );
    Sender.Canvas.LineTo(round(Sender.Width/2) , Sender.Height);

}    

if congiguration.Invertion[1]=true then   INV1:=-1 else  INV1:=1;
if congiguration.Invertion[2]=true then   INV2:=-1 else  INV2:=1;
if congiguration.Invertion[3]=true then   INV3:=-1 else  INV3:=1;
if congiguration.Invertion[4]=true then   INV4:=-1 else  INV4:=1;

// Affichage Voie XY

if congiguration.VoieVisible[2]=true  then
begin
    //Sender.Canvas.Pen.Color := clGreen;
    Sender.Canvas.Pen.Color := congiguration.couleurs[2];
    Sender.Canvas.MoveTo( round((INV1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV2)*Ch2DoubleArray[ 1 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;

if congiguration.VoieVisible[3]=true  then
begin

    //Sender.Canvas.Pen.Color := clYellow;
    Sender.Canvas.Pen.Color := congiguration.couleurs[3];
    Sender.Canvas.MoveTo( round((INV1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV3)*Ch3DoubleArray[ 1 ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV3)*Ch3DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV3)*Ch3DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;

if congiguration.VoieVisible[4]=true  then
begin
    //Sender.Canvas.Pen.Color := clRed;
    Sender.Canvas.Pen.Color := congiguration.couleurs[4];
    Sender.Canvas.MoveTo( round((1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV4)*Ch4DoubleArray[ 1 ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV4)*Ch4DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV4)*Ch4DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra

          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;



// affichage des enregistrements


end;



{
procedure TFormOscilloGTI2.Affichage_voies(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    x,y,t,i:integer ;
    Freq_ech_actuelle : dword;
begin

Longueur_Acquisition := GetRecordLength();
GetSensitivity( lCh1, @Calibre1);
GetSensitivity( lCh2, @Calibre2);







// Affichage Voie 1
    if modeCH1=1 then
    begin
    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(0, Round(  (invech1)*Ch1DoubleArray[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));



          Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;


    end;

// Affichage Voie 2
     if modeCH2=1 then
    begin
    Sender.Canvas.Pen.Color := clAqua;
    Sender.Canvas.MoveTo(0, Round(  -(invech2)*Ch2DoubleArray[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));



          Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;

    end;
end;
}


procedure TFormOscilloGTI2.affichageEnregistrements(Sender: Tpaintbox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2, Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
    x,y,t:integer ;
    DecalPreTrig:integer;
begin

if num_de_courbe<=nb_courbes_stockees then
begin




Longueur_Acquisition := courbes [num_de_courbe].long_ech;
Calibre1             := courbes [num_de_courbe].calibCh1_ech;
Calibre2             := courbes [num_de_courbe].calibCh2_ech;
Calibre3             := courbes [num_de_courbe].calibCh3_ech;
Calibre4             := courbes [num_de_courbe].calibCh4_ech;
// effaçage
    Sender.Canvas.Brush.Color := clBlack;
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

// traçé grille

    Sender.Canvas.Pen.Color := clSilver;
    for x:=1 to 9 do
    begin
    for Y:=0 to 10 do
    begin
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.height/8) + t*round(Sender.height/40)  );
    Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
    end;
    Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.Height/8)+2);
    Sender.Canvas.moveTo(x*round(Sender.Width/10)+1, y*round(Sender.Height/8)+1);
    Sender.Canvas.LineTo(x*round(Sender.Width/10)-1, y*round(Sender.Height/8)+1);
    end;
    end;

    for x:=0 to 9 do
    begin
    for Y:=1 to 10 do
    begin
    //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
    for t:=1 to 4 do
    begin
    Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Sender.height/8));
    Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Sender.height/8));

    end;
    end;
    end;

// ligne de 0
    Sender.Canvas.Pen.Color := clWhite;
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));

//ligne de pRETRIG
    if courbes [num_de_courbe].PreTrig=true then
        begin
        Sender.Canvas.Pen.Color := congiguration.couleurs[5];
        Sender.Canvas.MoveTo(round(Sender.Width/10), 0 );
        Sender.Canvas.LineTo(round(Sender.Width/10) , Sender.Height);
        end;
// decalage si PRETRIG

    if  (courbes [num_de_courbe].PreTrig=true) then                  // si PRETRIG
        begin
        DecalPreTrig:=courbes [num_de_courbe].PointTrig-round((Longueur_Acquisition-500)/10);
        Longueur_Acquisition :=Longueur_Acquisition-500;
        end
    else
        begin                             //pas de PREtrig
        DecalPreTrig:=0;
        end;



// Affichage Voie 1
    //if (courbes [num_de_courbe].mode=ch1) or (courbes [num_de_courbe].mode=chop) then
    if (courbes [num_de_courbe].Tmode[1]=true) then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur1;
    Sender.Canvas.MoveTo(0, Round(  {(invech1)*}courbes [num_de_courbe].voie1[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech1)*}courbes [num_de_courbe].voie1[DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;

    Sender.Canvas.Pen.Color := clWhite;
    end;

// Affichage Voie 2
   //  if (courbes [num_de_courbe].mode=ch2) or (courbes [num_de_courbe].mode=chop)then
     if (courbes [num_de_courbe].Tmode[2]=true)  then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur2;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [num_de_courbe].voie2[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie2[DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;

// Affichage Voie 3
    // if (courbes [num_de_courbe].mode=ch3) or (courbes [num_de_courbe].mode=chop)then
     if (courbes [num_de_courbe].Tmode[3]=true)  then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur3;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [num_de_courbe].voie3[ 0 ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie3[DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;

// Affichage Voie 4
   //  if (courbes [num_de_courbe].mode=ch4) or (courbes [num_de_courbe].mode=chop)then
     if (courbes [num_de_courbe].Tmode[4]=true)  then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur4;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [num_de_courbe].voie4[ 0 ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie4[DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;

end; // if courbes [num_de_courbe].Valide
end;




/////////////////////////////////////////////////////////////////////////////////
/////////               FIN DES                                         ///////// //////////////////////////////////////////////////////////////////////////
/////////                                                               ///////// //////////////////////////////////////////////////////////////////////////
/////////              PROCEDURES D'AFFICHAGE                           ///////// //////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////
////  Calculs pour +                                           ////////////////////////////////////////////////////////////////////////////////////////
////             MULITMETRES....                               ////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

procedure TFormOscilloGTI2.DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double;var Amax3:double ;var Amax4:double ;var Amin3:double ;var Amin4:double );
var
j,k:integer;
Long:Dword;
moy:double;
Ch1meanarray:array[0..10000] of double;
Ch2meanarray:array[0..10000] of double;
Ch3meanarray:array[0..10000] of double;
Ch4meanarray:array[0..10000] of double;
begin
if PFLevel=true then
begin
      long:=getrecordlength();
      for j:=16 to (long-17) do
      begin
        moy:=0;
        for k:=-16 to 16 do
          moy:=moy+Ch1Doublearray[j+k];
        Ch1meanarray[j]:= moy/33;
        moy:=0;
        for k:=-16 to 16 do
          moy:=moy+Ch2Doublearray[j+k];
        Ch2meanarray[j]:= moy/33;
        moy:=0;
        for k:=-16 to 16 do
          moy:=moy+Ch3Doublearray[j+k];
        Ch3meanarray[j]:= moy/33;
        moy:=0;
        for k:=-16 to 16 do
          moy:=moy+Ch4Doublearray[j+k];
        Ch4meanarray[j]:= moy/33;
        moy:=0;
      end;  {for}

      Amin1:=Ch1Doublearray[10];
      Amax1:=Ch1Doublearray[10];
      Amin2:=Ch2Doublearray[10];
      Amax2:=Ch2Doublearray[10];
      Amin3:=Ch3Doublearray[10];
      Amax3:=Ch3Doublearray[10];
      Amin4:=Ch4Doublearray[10];
      Amax4:=Ch4Doublearray[10];

      for j:=16 to (long-(16+1)) do
      begin
        if Ch1Doublearray[j]>Amax1 then
          Amax1:=Ch1Doublearray[j];
        if Ch1Doublearray[j]<Amin1 then
          Amin1:=Ch1Doublearray[j];

        if Ch2Doublearray[j]>Amax2 then
          Amax2:=Ch2Doublearray[j];
        if Ch2Doublearray[j]<Amin2 then
          Amin2:=Ch2Doublearray[j];

        if Ch3Doublearray[j]>Amax3 then
          Amax3:=Ch3Doublearray[j];
        if Ch3Doublearray[j]<Amin1 then
          Amin3:=Ch3Doublearray[j];

        if Ch4Doublearray[j]>Amax4 then
          Amax4:=Ch4Doublearray[j];
        if Ch4Doublearray[j]<Amin4 then
          Amin4:=Ch4Doublearray[j];
      end;  {for}

      {                               //PARFOU du TRIGGER TIEPIE
      if trigCH1.tabstop=true then
        begin
          levelmax:=Amax1;
          levelmin:=Amin1;
        end;
      if trigCH2.tabstop=true then
        begin
          levelmax:=Amax2;
          levelmin:=Amin2;
        end;
       }
end;
end;


procedure TFormOscilloGTI2.MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);
var
j,k,i,tx,imax:integer;
inf,sup,ok:byte;
Long,freq:Dword;
moy,vi,vii:double;
ChXmeanarray:array[0..10000] of double;
DigitInfPeriode:boolean;
TiX:array [0..2] of integer; //tableau des temps de passages par valeurs particulières de la pèriode

begin

try
begin
      freq:=getSampleFrequency();
      long:=getrecordlength();
      for j:=16 to (long-17) do
      begin
        moy:=0;
        for k:=-16 to 16 do
          begin
          if voie=1 then moy:=moy+Ch1DoubleArray[j+k];
          if voie=2 then moy:=moy+Ch2DoubleArray[j+k];
          if voie=3 then moy:=moy+Ch3DoubleArray[j+k];
          if voie=4 then moy:=moy+Ch4DoubleArray[j+k];

          end;
        ChXmeanarray[j]:= moy/33;
        moy:=0;
      end;  {for}

      //pré calcule de vdc
      vi:=0;
      for i:=1 to long do
         begin

         if voie=1 then vi:=vi+Ch1DoubleArray[i];
         if voie=2 then vi:=vi+Ch2DoubleArray[i];
         if voie=3 then vi:=vi+Ch3DoubleArray[i];
         if voie=4 then vi:=vi+Ch4DoubleArray[i];
         end;
      vdc:=vi/long;


DigitInfPeriode :=false;

      inf:=0;
      sup:=0;
      tx:=0;
      i:=16;
      tiX[0]:=0;
      tiX[1]:=0 ;
      tiX[2]:=0 ;
      ok:=0;

      repeat
            begin

            if ChXmeanarray[i]<vdc then inf:=1 else inf:=0;
            if ChXmeanarray[i+33]>vdc then sup:=1 else sup:=0;
            i:=i+1;
            if (inf=1) and (sup=1)  or  (inf=0) and (sup=0)then
             begin
              tiX[tx]:=i;
              ok:=1;
             end
            else ok:=0;

            if (tiX[tx]<>0) and (ok=0) then tx:=tx+1;
            if i>(long-50) then DigitInfPeriode :=true;
                                     
            end;
      until (tx=3) or (i>(long-50));


      if   DigitInfPeriode =true  then
        begin
          inf:=0;
          sup:=0;
          tx:=0;
          i:=16;
          tiX[0]:=0;
          tiX[1]:=0 ;
          tiX[2]:=0 ;
          ok:=0;
          DigitInfPeriode :=false;

          repeat
            begin

            if ChXmeanarray[i]<=(Amax*(90/100)) then inf:=1 else inf:=0;
            if ChXmeanarray[i+33]>=(Amax*(90/100)) then sup:=1 else sup:=0;
            i:=i+1;
            if ((inf=1) and (sup=1))  or  ((inf=0) and (sup=0))then
              begin
                tiX[tx]:=i;
                ok:=1;
              end
            else ok:=0;

            if (tiX[tx]<>0) and (ok=0) then tx:=tx+1;
            if i>(long-50) then  DigitInfPeriode :=true;

            end;
            until (tx=3) or (i>(long-50));
          end;

        if   DigitInfPeriode =true  then
            begin
              inf:=0;
              sup:=0;
              tx:=0;
              i:=16;
              tiX[0]:=0;
              tiX[1]:=0 ;
              tiX[2]:=0 ;
              ok:=0;
              DigitInfPeriode :=false;

              repeat
                begin

                if ChXmeanarray[i]<=(Amin*(90/100)) then inf:=1 else inf:=0;
                if ChXmeanarray[i+33]>=(Amin*(90/100)) then sup:=1 else sup:=0;
                i:=i+1;
                if (inf=1) and (sup=1)  or  (inf=0) and (sup=0)then
                  begin
                    tiX[tx]:=i;
                    ok:=1;
                  end
                else ok:=0;

                if (tiX[tx]<>0) and (ok=0) then tx:=tx+1;
                if i>(long-50) then  DigitInfPeriode :=true;

                end;
                until (tx=3) or (i>(long-50));
              end;



        if DigitInfPeriode =false then
            begin

              vi:=0;
              vii:=0;

              imax:=round(int(long/(tiX[2]-tiX[0])))*(tiX[2]-tiX[0]);

              for i:=0 to imax do
                begin
                  if voie=1 then
                  begin
                  vi:=vi+Ch1DoubleArray[i];
                  vii:=vii+ (Ch1DoubleArray[i]*Ch1DoubleArray[i]);

                  end;
                  if voie=2 then
                  begin
                  vi:=vi+Ch2DoubleArray[i];
                  vii:=vii+ (Ch2DoubleArray[i]*Ch2DoubleArray[i]);
                  end;
                  if voie=3 then
                  begin
                  vi:=vi+Ch3DoubleArray[i];
                  vii:=vii+ (Ch3DoubleArray[i]*Ch3DoubleArray[i]);
                  end;
                  if voie=4 then
                  begin
                  vi:=vi+Ch4DoubleArray[i];
                  vii:=vii+ (Ch4DoubleArray[i]*Ch4DoubleArray[i]);
                  end;
                end;

              vdc:=vi/(imax);
              vacdc:=sqrt( vii/(imax) );
              vac:=sqrt(vacdc*vacdc-vdc*vdc);

              T:=(tiX[2]-tiX[0])/freq;
              F:=1/T;



              MesuresPossible:=true;
            //  if voie=1 then showmessage('calcul1');
            end
            else
            begin

            MesuresPossible:=false;
            end;
           tia:=tix[0];
           tib:=tix[2];
end;
 except


end;

end;


procedure TFormOscilloGTI2.MESURES(Sender: Tobject);
var
Amax1,Amax2,Amin1,Amin2:double;
Fch1,Tch1,VDC1,VAC1,VACDC1:double;
Fch2,Tch2,VDC2,VAC2,VACDC2:double;
Amax3,Amax4,Amin3,Amin4:double;
Fch3,Tch3,VDC3,VAC3,VACDC3:double;
Fch4,Tch4,VDC4,VAC4,VACDC4:double;
ti1:array[0..2] of integer;
ti2:array[0..2] of integer;
aff:boolean;
begin
                DetectionCrete( true,false,false,Amax1,Amax2,Amin1,Amin2,Amax3,Amax4,Amin3,Amin4 );

                MultiMetre(1, Amax1, Amin1,aff,ti1[0],ti1[2],Fch1,Tch1,VDC1,VAC1,VACDC1 );
                if Aff=true then
                    begin
                          if LabelTch1.visible=true then
                          begin
                          LabelTch1.caption:='T0 = '+floattostrf(Tch1,ffgeneral,4,3)+'s';       //var globale pour l'affichage a modifier
                          LabelFch1.caption:='F0 = '+floattostrf(Fch1,ffNumber,7,0)+'Hz';
                          end;
                        //  if  GroupBoxVch1Mesures.visible=true then
                        //  begin
                          labelVch1Max.caption:='U0max = ' +floattostrf(Amax1,ffFixed,4,3)+' V';
                          labelVch1Min.caption:='U0min = ' +floattostrf(Amin1,ffFixed,4,3)+' V';
                          labelVch1DC.caption:=  'U0 DC  = ' +floattostrf(vdc1,ffFixed,4,3)+' V';
                          labelVch1AC.caption:=  'U0 AC  = ' +floattostrf(vac1,ffFixed,4,3)+' V';
                          labelVch1ACDC.caption:='U0        = ' +floattostrf(vacdc1,ffFixed,4,3)+' V' + #9'AC+DC';
                        //  end;
                    end
                 else
                    begin
                          if LabelTch1.visible=true then
                          begin
                          LabelTch1.caption:='T0 = ';
                          LabelFch1.caption:='F0 = ';
                          end;
                      //    if  GroupBoxVch1Mesures.visible=true then
                      //    begin
                          labelVch1Max.caption:='U0max = ' +floattostrf(Amax1,ffFixed,4,3)+' V';
                          labelVch1Min.caption:='U0min = ' +floattostrf(Amin1,ffFixed,4,3)+' V';
                          labelVch1DC.caption:=  'U0 DC   ';
                          labelVch1AC.caption:=  'U0 AC   ' ;
                          labelVch1ACDC.caption:='U0        ';
                      //    end;
                    end;


                MultiMetre(2 , Amax2, Amin2,Aff,ti2[0],ti2[2],Fch2,Tch2,VDC2,VAC2,VACDC2 );
                if aff=true then
                    begin
                          if (LabelTch2.visible=true) then
                          begin
                          LabelTch2.caption:='T1 = '+floattostrf(Tch2,ffgeneral,4,3)+'s';
                          LabelFch2.caption:='F1 = '+floattostrf(Fch2,ffNumber,7,0)+'Hz';
                          end;
                     //     if  GroupBoxVch2Mesures.visible=true then
                     //     begin
                          labelVch2Max.caption:='U1max = ' +floattostrf(Amax2,ffFixed,4,3)+' V';
                          labelVch2Min.caption:='U1min = ' +floattostrf(Amin2,ffFixed,4,3)+' V';
                          labelVch2DC.caption:=  'U1 DC  = ' +floattostrf(vdc2,ffFixed,4,3)+' V';
                          labelVch2AC.caption:=  'U1 AC  = ' +floattostrf(vac2,ffFixed,4,3)+' V';
                          labelVch2ACDC.caption:='U1        = ' +floattostrf(vacdc2,ffFixed,4,3)+' V' + #9'AC+DC';
                     //     end;
                    end
                 else
                    begin
                          if (LabelTch2.visible=true) then
                          begin
                          LabelTch2.caption:='T1 = ';
                          LabelFch2.caption:='F1 = ';
                          end;
                      //    if  GroupBoxVch2Mesures.visible=true then
                      //    begin
                          labelVch2Max.caption:='U1max = ' +floattostrf(Amax2,ffFixed,4,3)+' V';
                          labelVch2Min.caption:='U1min = ' +floattostrf(Amin2,ffFixed,4,3)+' V';
                          labelVch2DC.caption:=  'U1 DC   ';
                          labelVch2AC.caption:=  'U1 AC   ' ;
                          labelVch2ACDC.caption:='U1        ';
                     //     end;
                    end;


                MultiMetre(3 , Amax3, Amin3,Aff,ti2[0],ti2[2],Fch3,Tch3,VDC3,VAC3,VACDC3 );
                if aff=true then
                    begin
                          if (LabelTch3.visible=true) then
                          begin
                          LabelTch3.caption:='T2 = '+floattostrf(Tch3,ffgeneral,4,3)+'s';
                          LabelFch3.caption:='F2 = '+floattostrf(Fch3,ffNumber,7,0)+'Hz';
                          end;
                     //     if  GroupBoxVch2Mesures.visible=true then
                     //     begin
                          labelVch3Max.caption:='U2max = ' +floattostrf(Amax3,ffFixed,4,3)+' V';
                          labelVch3Min.caption:='U2min = ' +floattostrf(Amin3,ffFixed,4,3)+' V';
                          labelVch3DC.caption:=  'U2 DC  = ' +floattostrf(vdc3,ffFixed,4,3)+' V';
                          labelVch3AC.caption:=  'U2 AC  = ' +floattostrf(vac3,ffFixed,4,3)+' V';
                          labelVch3ACDC.caption:='U2        = ' +floattostrf(vacdc3,ffFixed,4,3)+' V' + #9'AC+DC';
                     //     end;
                    end
                 else
                    begin
                          if (LabelTch3.visible=true) then
                          begin
                          LabelTch3.caption:='T2 = ';
                          LabelFch3.caption:='F2 = ';
                          end;
                      //    if  GroupBoxVch2Mesures.visible=true then
                      //    begin
                          labelVch3Max.caption:='U2max = ' +floattostrf(Amax3,ffFixed,4,3)+' V';
                          labelVch3Min.caption:='U2min = ' +floattostrf(Amin3,ffFixed,4,3)+' V';
                          labelVch3DC.caption:=  'U2 DC   ';
                          labelVch3AC.caption:=  'U2 AC   ' ;
                          labelVch3ACDC.caption:='U2        ';
                     //     end;
                    end;



                MultiMetre(4 , Amax4, Amin4,Aff,ti2[0],ti2[2],Fch4,Tch4,VDC4,VAC4,VACDC4 );
                if aff=true then
                    begin
                          if (LabelTch4.visible=true) then
                          begin
                          LabelTch4.caption:='T3 = '+floattostrf(Tch4,ffgeneral,4,3)+'s';
                          LabelFch4.caption:='F3 = '+floattostrf(Fch4,ffNumber,7,0)+'Hz';
                          end;
                     //     if  GroupBoxVch2Mesures.visible=true then
                     //     begin
                          labelVch4Max.caption:='U3max = ' +floattostrf(Amax4,ffFixed,4,3)+' V';
                          labelVch4Min.caption:='U3min = ' +floattostrf(Amin4,ffFixed,4,3)+' V';
                          labelVch4DC.caption:=  'U3 DC  = ' +floattostrf(vdc4,ffFixed,4,3)+' V';
                          labelVch4AC.caption:=  'U3 AC  = ' +floattostrf(vac4,ffFixed,4,3)+' V';
                          labelVch4ACDC.caption:='U3        = ' +floattostrf(vacdc4,ffFixed,4,3)+' V' + #9'AC+DC';
                     //     end;
                    end
                 else
                    begin
                          if (LabelTch4.visible=true) then
                          begin
                          LabelTch4.caption:='T3 = ';
                          LabelFch4.caption:='F3 = ';
                          end;
                      //    if  GroupBoxVch2Mesures.visible=true then
                      //    begin
                          labelVch4Max.caption:='U3max = ' +floattostrf(Amax3,ffFixed,4,3)+' V';
                          labelVch4Min.caption:='U3min = ' +floattostrf(Amin3,ffFixed,4,3)+' V';
                          labelVch4DC.caption:=  'U3 DC   ';
                          labelVch4AC.caption:=  'U3 AC   ' ;
                          labelVch4ACDC.caption:='U3        ';
                     //     end;
                    end;




end;




//de MESURES


//////////////////////////////////////////////////////////////////
////  FIN des Calculs pour                                          ////////////////////////////////////////////////////////////////////////////////////////
////             MULITMETRES....                               ////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////                ////////////////////////////////////////////////////////////////////
//         gestion des ENREGISTREMENTS                  ///                ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                 ////////////////////////////////////////////////////////////////////


 {
procedure TFormOscilloGTI2.ENRGBRclick(Sender: TObject);
begin
     If  EnrgbBR.checked=false then
         begin

              EnrgbBR.checked:=true;

         end
     else
         begin

              EnrgbBR.checked:=false;


         end;

end;
  }

procedure TFormOscilloGTI2.ScrollBarEnregistrementsChange(Sender: TObject);

begin
     //CheckBoxA.caption:='C'+inttostr(ScrollBarEnregistrements.position);
     LabelEnreg.caption:='C'+inttostr(ScrollBarEnregistrements.position);
     //CheckBoxB.caption:='C'+inttostr(ScrollBarEnregistrements.position+1);
     //LabelCalCh1A.visible:=false;
     //LabelCalCh1B.visible:=false;
     //LabelCalCh2A.visible:=false;
     //LabelCalCh2B.visible:=false;
     //Label1BDTA.visible:=false;
     //LabelBDTB.visible:=false;
     //OptionsA.visible:=false;
     //OptionsB.visible:=false;
     //SuprimerA.Visible:=false;
     //SuprimerB.Visible:=false;

     if  ScrollBarEnregistrements.position= nb_courbes_stockees then
         begin

                        //CheckBoxA.caption:=courbes [ScrollBarEnregistrements.position].nom;
                       // CheckBoxA.checked:=courbes [ScrollBarEnregistrements.position].visible;
                        LabelEnreg.caption:=courbes [ScrollBarEnregistrements.position].nom;

                        num_de_courbe:=ScrollBarEnregistrements.position;
                        affichageEnregistrements( paintboxA);
                      //  OptionsA.visible:=true;
                        //SuprimerA.Visible:=true;

                        {
                        if (courbes [num_de_courbe].mode=ch1) or (courbes [num_de_courbe].mode=chop) then
                           begin
                                LabelCalCh1A.visible:=true;
                                Label1BDTA.visible:=true;
                                LabelCalCh1A.font.color:=courbes [num_de_courbe].couleur1;
                                LabelCalCh1A.caption := 'Cal CH1 = '+floattostr(courbes [num_de_courbe].calibCh1_ech/4)+' V/div';
                                Label1BDTA.caption := 'BDT = '+inttostr(courbes [num_de_courbe].BDT);
                           end;
                        if (courbes [num_de_courbe].mode=ch2) or (courbes [num_de_courbe].mode=chop) then
                           begin
                                LabelCalCh2A.visible:=true;
                                Label1BDTA.visible:=true;
                                LabelCalCh2A.font.color:=courbes [num_de_courbe].couleur2;
                                LabelCalCh2A.caption := 'Cal CH2 = '+floattostr(courbes [num_de_courbe].calibCh2_ech/4)+' V/div';
                                Label1BDTA.caption := 'BDT = '+inttostr(courbes [num_de_courbe].BDT);
                           end;

                           }
                      //  LabelBDTA    := courbes [ScrollBarEnregistrements.position].calibCh2_ech;
                       // CheckBoxB.caption:=courbes [ScrollBarEnregistrements.position+1].nom ;

         end ;
     if  ScrollBarEnregistrements.position< nb_courbes_stockees then
         begin

                        //CheckBoxA.caption:=courbes [ScrollBarEnregistrements.position].nom;
                        //CheckBoxA.checked:=courbes [ScrollBarEnregistrements.position].visible;
                        LabelEnreg.caption:=courbes [ScrollBarEnregistrements.position].nom;

                        num_de_courbe:=ScrollBarEnregistrements.position;
                        affichageEnregistrements( paintboxA);
                      //  OptionsA.visible:=true;
                        //SuprimerA.Visible:=true;

                        {
                        if (courbes [num_de_courbe].mode=ch1) or (courbes [num_de_courbe].mode=chop) then
                           begin
                                Label1BDTA.visible:=true;
                                LabelCalCh1A.visible:=true;
                                LabelCalCh1A.font.color:=courbes [num_de_courbe].couleur1;
                                LabelCalCh1A.caption := 'Cal CH1 = '+floattostr(courbes [num_de_courbe].calibCh1_ech/4)+' V/div';
                                Label1BDTA.caption := 'BDT = '+inttostr(courbes [num_de_courbe].BDT);
                           end;
                        if (courbes [num_de_courbe].mode=ch2) or (courbes [num_de_courbe].mode=chop) then
                           begin
                                Label1BDTA.visible:=true;
                                LabelCalCh2A.visible:=true;
                                LabelCalCh2A.font.color:=courbes [num_de_courbe].couleur2;
                                LabelCalCh2A.caption := 'Cal CH2 = '+floattostr(courbes [num_de_courbe].calibCh2_ech/4)+' V/div';
                                Label1BDTA.caption := 'BDT = '+inttostr(courbes [num_de_courbe].BDT);
                           end;

                        }


                 {
                        CheckBoxB.caption:=courbes [ScrollBarEnregistrements.position+1].nom ;
                        CheckBoxB.checked:=courbes [ScrollBarEnregistrements.position+1].visible;
                        num_de_courbe:=ScrollBarEnregistrements.position+1;


                  if portable=0 then
                  begin
                        affichageEnregistrements( paintboxB);
                      //  OptionsB.visible:=true;
                        SuprimerB.Visible:=true;
                        if (courbes [num_de_courbe].mode=ch1) or (courbes [num_de_courbe].mode=chop) then
                           begin
                                LabelCalCh1B.visible:=true;
                                LabelBDTB.visible:=true;
                                LabelCalCh1B.font.color:=courbes [num_de_courbe].couleur1;
                                LabelCalCh1B.caption := 'Cal CH1 = '+floattostr(courbes [num_de_courbe].calibCh1_ech/4)+' V/div';
                                LabelBDTB.caption := 'BDT = '+inttostr(courbes [num_de_courbe].BDT);
                           end;
                        if (courbes [num_de_courbe].mode=ch2) or (courbes [num_de_courbe].mode=chop) then
                           begin
                                LabelCalCh2B.visible:=true;
                                LabelBDTB.visible:=true;
                                LabelCalCh2B.font.color:=courbes [num_de_courbe].couleur2;
                                LabelCalCh2B.caption := 'Cal CH2 = '+floattostr(courbes [num_de_courbe].calibCh2_ech/4)+' V/div';
                                LabelBDTB.caption := 'BDT = '+inttostr(courbes [num_de_courbe].BDT);
                           end;   
                 end;

                 }
         end ;

     {
     if  ScrollBarEnregistrements.position>= nb_courbes_stockees then
         begin
             PaintBoxB.Canvas.Brush.Color := clBlack;
             PaintBoxB.Canvas.Rectangle(0, 0, PaintBoxB.Width - 1, PaintBoxB.Height - 1);
             CheckBoxB.checked:=false;
         end;
     }

     if  ScrollBarEnregistrements.position> nb_courbes_stockees then
         begin
             PaintBoxA.Canvas.Brush.Color := clBlack;
             PaintBoxA.Canvas.Rectangle(0, 0, PaintBoxA.Width - 1, PaintBoxA.Height - 1);
             num_de_courbe:=ScrollBarEnregistrements.position;
             //CheckBoxA.checked:=false;
         end;
end;

procedure TFormOscilloGTI2.ButtonEnregClick(Sender: TObject);
var
   calibre1,calibre2,calibre3,calibre4:double;
   StringTemp:string;
begin

     if ( nb_courbes_stockees < 10 ) then

        begin


        nb_courbes_stockees := nb_courbes_stockees + 1 ;
        if nb_courbes_stockees>=1 then ToolButton_enrg_monopage.Visible:=true  else ToolButton_enrg_monopage.Visible:=false;
        if nb_courbes_stockees>=2 then ToolButton_enrg_mutipage.Visible:=true  else ToolButton_enrg_mutipage.Visible:=false;
         //modif gestions de Tool buttons



        courbes[nb_courbes_stockees].Valide := true ;    //last modif!!!
        courbes[ nb_courbes_stockees ].visible:=true;
        //compteur_courbes_stockees :=  compteur_courbes_stockees + 1 ;

       

        {stockage de la courbe }
        if (sender=ButtonCH1Enreg) or  ((sender=ButtonDUALEnreg)and (congiguration.VoieVisible[1]=true) )then
         courbes [nb_courbes_stockees].voie1    := Ch1doubleArray;

        if (sender=ButtonCH2Enreg) or  ((sender=ButtonDUALEnreg) and (congiguration.VoieVisible[2]=true) )then
         courbes [nb_courbes_stockees].voie2    := Ch2doubleArray;

        if (sender=ButtonCH3Enreg) or  ((sender=ButtonDUALEnreg) and (congiguration.VoieVisible[3]=true) )then
         courbes [nb_courbes_stockees].voie3    := Ch3doubleArray;

        if (sender=ButtonCH4Enreg) or  ((sender=ButtonDUALEnreg) and (congiguration.VoieVisible[4]=true) )then
         courbes [nb_courbes_stockees].voie4    := Ch4doubleArray;


        courbes [nb_courbes_stockees].Tmode[0] := false;
        courbes [nb_courbes_stockees].Tmode[1] := false;
        courbes [nb_courbes_stockees].Tmode[2] := false;
        courbes [nb_courbes_stockees].Tmode[3] := false;
        courbes [nb_courbes_stockees].Tmode[4] := false;

        courbes [nb_courbes_stockees].Unipol_Y1 := congiguration.Unipolaire[1];
        courbes [nb_courbes_stockees].Unipol_Y2 := congiguration.Unipolaire[2];
        courbes [nb_courbes_stockees].Unipol_Y3 := congiguration.Unipolaire[3];
        courbes [nb_courbes_stockees].Unipol_Y4 := congiguration.Unipolaire[4];

         if Sender = ButtonCH1Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch1;

                 courbes [nb_courbes_stockees].Tmode[1] := true;

                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y0)' ;
            end;
         if Sender = ButtonCH2Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch2;
                 courbes [nb_courbes_stockees].Tmode[2] := true;
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y1)' ;
            end;

         if Sender = ButtonCH3Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch3;
                 courbes [nb_courbes_stockees].Tmode[3] := true;
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y2)' ;
            end;
         if Sender = ButtonCH4Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch4;
                 courbes [nb_courbes_stockees].Tmode[4] := true;
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y3)' ;
            end;
         if Sender = ButtonDUALEnreg then
            begin
                 courbes [nb_courbes_stockees].mode := Chop;
                 courbes [nb_courbes_stockees].Tmode[0] := true;
                 courbes [nb_courbes_stockees].Tmode[1] := congiguration.VoieVisible[1];
                 courbes [nb_courbes_stockees].Tmode[2] := congiguration.VoieVisible[2];
                 courbes [nb_courbes_stockees].Tmode[3] := congiguration.VoieVisible[3];
                 courbes [nb_courbes_stockees].Tmode[4] := congiguration.VoieVisible[4];

                 StringTemp:=' (';
                 if congiguration.VoieVisible[1] then StringTemp:=StringTemp+' Y0';
                 if congiguration.VoieVisible[2] then StringTemp:=StringTemp+' Y1';
                 if congiguration.VoieVisible[3] then StringTemp:=StringTemp+' Y2';
                 if congiguration.VoieVisible[4] then StringTemp:=StringTemp+' Y3';
                 StringTemp:=StringTemp+' )';
             //    courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voies Y 1,2,3 et 4)' ;   //a revoir!!!!!!
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + StringTemp ;   //a revoir!!!!!!
            end
            else
            begin
                 courbes [nb_courbes_stockees].Tmode[0] := false;
            end;


         //courbes [nb_courbes_stockees].couleur1 := clBlue;
         //courbes [nb_courbes_stockees].couleur2 := clGreen;
         //courbes [nb_courbes_stockees].couleur3 := clYellow;
         //courbes [nb_courbes_stockees].couleur4 := clRed;

         courbes [nb_courbes_stockees].couleur1 := congiguration.couleurs[1];
         courbes [nb_courbes_stockees].couleur2 := congiguration.couleurs[2];
         courbes [nb_courbes_stockees].couleur3 := congiguration.couleurs[3];
         courbes [nb_courbes_stockees].couleur4 := congiguration.couleurs[4];

         courbes [nb_courbes_stockees].freq_ech:= GetSampleFrequency();
         courbes [nb_courbes_stockees].long_ech:= GetRecordLength();
         if congiguration.Trigger<>0 then    //sinon bug car la valeur de poit trig n'existe pas : erreur floating poit...
         begin
         courbes [nb_courbes_stockees].PreTrig:= congiguration.PreTrig;
         courbes [nb_courbes_stockees].PointTrig:= congiguration.PointTrig;
         end;

         courbes [nb_courbes_stockees].BDT:= congiguration.BaseDetemps;
     //    courbes [nb_courbes_stockees].BDT:=ScrollBar5.position;

     //    courbes [nb_courbes_stockees].CouplageCH1DC := COUPLAGECH1DC.checked;
     //    courbes [nb_courbes_stockees].CouplageCH2DC := COUPLAGECH2DC.checked;

     //    courbes [nb_courbes_stockees].INVCH1 := INVch1.checked;
     //    courbes [nb_courbes_stockees].INVCH2 := INVch2.checked;
     //    courbes [nb_courbes_stockees].INVCH3 := INVch3.checked;
     //    courbes [nb_courbes_stockees].INVCH4 := INVch4.checked;

     //    courbes [nb_courbes_stockees].ADD    := ADDButton.checked;

     //    courbes [nb_courbes_stockees].XY    := XYButton.checked;

      //   courbes [nb_courbes_stockees].BDT:=

         GetSensitivity( lCh1, @Calibre1);
         GetSensitivity( lCh2, @Calibre2);
         GetSensitivity( lCh3, @Calibre3);
         GetSensitivity( lCh4, @Calibre4);

         courbes [nb_courbes_stockees].calibCh1_ech:= Calibre1;
         courbes [nb_courbes_stockees].calibCh2_ech:= Calibre2;
         courbes [nb_courbes_stockees].calibCh3_ech:= Calibre3;
         courbes [nb_courbes_stockees].calibCh4_ech:= Calibre4;





        {
         if  nb_courbes_stockees=1 then
             begin
                  ScrollBarEnregistrements.position:=nb_courbes_stockees;
                  ScrollBarEnregistrementsChange(Sender) ;
             end
         else
             begin
                  ScrollBarEnregistrements.position:=nb_courbes_stockees-1;
                  ScrollBarEnregistrementsChange(Sender) ;
             end;
         }
         ScrollBarEnregistrements.position:=nb_courbes_stockees;
         ScrollBarEnregistrementsChange(Sender) ;

{Affichage du bouton}
 {  cochages[nb_courbes_stockees].Visible  := True;
   cochages[nb_courbes_stockees].Caption  := courbes [nb_courbes_stockees].nom ;
   cochages[nb_courbes_stockees].Checked  := True;
   boutons [nb_courbes_stockees].Visible  := True;
 }
   end
else
   begin
   showmessage('Vous ne pouvez stocker plus de 10 courbes');
   end;





end;



{
procedure TFormOscilloGTI2.CheckBoxAClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position].visible:=CheckBoxA.checked;
end;

procedure TOscilloCaba.CheckBoxBClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position+1].visible:=CheckBoxB.checked;
end;

procedure TFormOscilloGTI2.OptionsAClick(Sender: TObject);
begin
     if nb_courbes_stockees<>0 then
     begin
     courbe_options:=ScrollBarEnregistrements.position;
     oscillocaba.visible:=false;
     Options.visible:=true;
     end;

end;

procedure TFormOscilloGTI2.OptionsBClick(Sender: TObject);
begin
     courbe_options:=ScrollBarEnregistrements.position+1;
     oscillocaba.visible:=false;
     Options.visible:=true;

end;
}

procedure TFormOscilloGTI2.SuprimerEnregistrementClick(Sender: TObject);
var
i : integer ;
//Treset : array [0..1] of double;
begin
  // Treset[0]:=0;
  // Treset[1]:=0;
   if nb_courbes_stockees>0 then
   begin
       courbe_options:=ScrollBarEnregistrements.position{+1};
       if courbe_options <> nb_courbes_stockees then
          for i:= courbe_options to nb_courbes_stockees - 1 do
          courbes[i] := courbes[i+1];

       //courbes[nb_courbes_stockees].valide:=false;
       courbes[ScrollBarEnregistrements.position].valide:=false;

       nb_courbes_stockees := nb_courbes_stockees - 1 ;
       ScrollBarEnregistrementsChange(sender);
   end;
   if ScrollBarEnregistrements.position>nb_courbes_stockees then
      ScrollBarEnregistrements.position:=ScrollBarEnregistrements.position-1;

   if nb_courbes_stockees>=1 then ToolButton_enrg_monopage.Visible:=true  else ToolButton_enrg_monopage.Visible:=false;
   if nb_courbes_stockees>=2 then ToolButton_enrg_mutipage.Visible:=true  else ToolButton_enrg_mutipage.Visible:=false;


   {
   for i:=nb_courbes_stockees to 10 do
   begin
   courbes[nb_courbes_stockees].voie1:=Treset;
   end;
   }

end;

{
procedure TFormOscilloGTI2.SuprimerBClick(Sender: TObject);
var i : integer ;
begin
   courbe_options:=ScrollBarEnregistrements.position+2;
   if courbe_options <> nb_courbes_stockees then
      for i:= courbe_options to nb_courbes_stockees - 1 do
          courbes[i] := courbes[i+1];

   courbes[nb_courbes_stockees].valide:=false;
   nb_courbes_stockees := nb_courbes_stockees - 1 ;
   ScrollBarEnregistrementsChange(sender);
end;
}

///////////////////////////////////////////////////////////                     ////////////////////////////////////////////////////////////////////
//    FIN     gestion des ENREGISTREMENTS              ///                      ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                      ////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////
//
//         gestion MONO COUP
//////////////////////////////////////////////////////////////////////////////////////




procedure TFormOscilloGTI2.MONOCOUP_START_Click(Sender: TObject);
var reussiteMONOCOUP : boolean;
    i,j:integer;
begin
//  stop timer et acqui ///////////////////////////////////////////////////////////////////////////////////////////

    Timer1.enabled    := false;
    erreur := ADC_ABORT();    // STOP l'acquisition
    if erreur <> E_NO_ERRORS then
    begin
        ShowMessage('PB de stop acqui');
    end
    else ACQUI:=false;

//reset ////////////////////////////////////////////////////////////////////////////////////////////////////////
    reussiteMONOCOUP:=false;
    compteurNOTRIG:=0;
    ProgressBar1.Position:=0;

    
// lancement du monocoup /////////////////////////////////////////////////////////////////////////////////////////
    CompteurTIMEOUT:=ScrollBarTimeOutMonoCoup.Position;
    ProgressBar1.Max:=CompteurTIMEOUT;
    monoCoupRunning:=true;

// reset affichage
    Bool_reset_ecran:=true;
    Bool_affichage:=false;
    FormPaint(Sender);

    repeat
    begin

        if ACQUI=false then
        begin
            ValidConfigINTERFACE_GTI2(sender);
            erreur := StartMeasurementFrancois();    // Lance l'acquisition
            if erreur <> E_NO_ERRORS then
            begin
            ShowMessage('Appareil non initialisé');
            end
            else ACQUI:=true;
        end;  {if ACQUI=false}

        erreur := GetMeasurementFrancois( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.
        if erreur <> E_NO_ERRORS then
        begin
            RadioButton2.Checked:=true;
        end
        else
        begin
            RadioButton1.Checked:=true;       //oui un trig
        end;  {if erreur <> E_NO_ERRORS}

        if erreur = E_NO_ERRORS then
        begin
            reussiteMONOCOUP:=true;

            Bool_reset_ecran:=true;
            Bool_affichage:=true;
            FormPaint(Sender);

            erreur := ADC_ABORT();    // STOP l'acquisition
            if erreur <> E_NO_ERRORS then
            begin
                ShowMessage('PB de stop acqui');
            end
            else ACQUI:=false;

            compteurNOTRIG:=0;
        end
        else   {if erreur = E_NO_ERRORS}
        begin
            compteurNOTRIG:=compteurNOTRIG+1;
            ProgressBar1.Position:=compteurNOTRIG;
            Bool_reset_ecran:=false;
            Bool_affichage:=false;

            if compteurNOTRIG>=CompteurTIMEOUT then
            begin
                erreur := ADC_ABORT();    // STOP l'acquisition
                if erreur <> E_NO_ERRORS then
                begin
                    ShowMessage('PB de stop acqui');
                end
                else ACQUI:=false;

                Timer1.enabled    := true;
            end;

        end;{else if erreur = E_NO_ERRORS}
        TriggerBARREChange(sender);
    end;
    //application.ProcessMessages;
    until  ((compteurNOTRIG>=CompteurTIMEOUT)or(reussiteMONOCOUP=true));
    monoCoupRunning:=false;
end;


procedure TFormOscilloGTI2.MONOCOUP_STOP_Click(Sender: TObject);
begin
//
if monoCoupRunning then
begin
    erreur := ADC_ABORT();    // STOP l'acquisition
    if erreur <> E_NO_ERRORS then
    begin
        ShowMessage('PB de stop acqui');
    end
    else ACQUI:=false;

    Timer1.enabled    := true;
end;

//LabelEchecMonoCoup.caption:='';
end;










//////////////////////////////////////////////////////////////////////////////////////
//            FIN
//         gestion MONO COUP
//////////////////////////////////////////////////////////////////////////////////////


procedure TFormOscilloGTI2.REGRESSIBR1Click(Sender: TObject);
var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    t,v1,v2,v3,v4               : double;
    fichier                : textfile;
    bloc1                  : textfile;
    bloc2                  : textfile;

    fichier2                : textfile;

    inc ,j                   : integer;
    calibre1,calibre2      : double;
    freqR                  : dword;
    Recordlength           : dword;
    chaine                 : shortstring;
    chemin_de_regressi     : shortstring;

begin

try
assignfile(fichier2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\cheminregcabalab.txt');
reset(fichier2);
readln(fichier2,chemin_de_regressi);
closefile(fichier2);
except
end;



freqR:=getSampleFrequency();
Recordlength:=GetRecordLength();
GetSensitivity( 1, @calibre1);
GetSensitivity( 2, @calibre2);

GetWindowsDirectory(@chemin_windows,255);
chemin:=shortstring(chemin_windows)+'\temp\regtemp.rw3';

assignfile(fichier,chemin);
rewrite(fichier);




assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2.txt');

reset(bloc1);
   while not (eof(bloc1)) do
         begin
              readln(bloc1,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc1);




{
for inc:=1 to 113 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC1[inc]);
}




writeln(fichier,'£1 PAGE COMMENT');
writeln(fichier,'Enregistrement Oscilloscope GTI2 page 1');
writeln(fichier,'&' + inttostr(round(Recordlength/10)) +' VALEUR VAR');

   for inc:=0 to round(Recordlength/10)-1 do
       begin
            t:=10*inc/freqR;
            v1:=(Ch1DoubleArray [inc*10]);
            v2:=(Ch2DoubleArray [inc*10]);
            v3:=(Ch3DoubleArray [inc*10]);
            v4:=(Ch4DoubleArray [inc*10]);

            writeln(fichier,t,' ',v1,' ',v2,' ',v3,' ',v4);
       end;



reset(bloc2);
   while not (eof(bloc2)) do
         begin
              readln(bloc2,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc2);


{
for inc:=1 to 27 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC2[inc]);
}



{écriture voies stockées
 if nb_courbes_stockees<>0 then
 begin

         for j:=1 to nb_courbes_stockees do
             begin

                  writeln(fichier,'£1 PAGE COMMENT');
                  writeln(fichier,courbes[j].nom);
                  writeln(fichier,'&' + inttostr(round(courbes[j].long_ech/10)) +' VALEUR VAR');


                  for inc:=0 to round(courbes[j].long_ech/10)-1 do
                      begin
                           t:=10*inc/courbes[j].freq_ech;
                           if ( courbes[j].mode=Ch1 ) or ( courbes[j].mode=Chop)
                           then v1:=courbes[j].voie1[inc*10]
                           else v1:=0;
                           if ( courbes[j].mode=Ch2 ) or ( courbes[j].mode=Chop)
                           then v2:=courbes[j].voie2[inc*10]
                           else v2:=0;
                           writeln(fichier,t,' ',v1,' ',v2);
                      end;

                  reset(bloc2);
                  while not (eof(bloc2)) do
                  begin
                  readln(bloc2,chaine);
                  writeln(fichier,chaine);
                  end;
                  closefile(bloc2);

             end;
  end; }

closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;









procedure TFormOscilloGTI2.Regressi2Click(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    t,v1,v2,v3,v4               : double;
    fichier                : textfile;
    bloc1                  : textfile;
    bloc2                  : textfile;

    fichier2                : textfile;

    inc ,j                   : integer;
    calibre1,calibre2      : double;
    freqR                  : dword;
    Recordlength           : dword;
    chaine                 : shortstring;
    chemin_de_regressi     : shortstring;

begin

try
assignfile(fichier2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\cheminregcabalab.txt');
reset(fichier2);
readln(fichier2,chemin_de_regressi);
closefile(fichier2);
except
end;



freqR:=getSampleFrequency();
Recordlength:=GetRecordLength();
GetSensitivity( 1, @calibre1);
GetSensitivity( 2, @calibre2);

GetWindowsDirectory(@chemin_windows,255);
chemin:=shortstring(chemin_windows)+'\temp\regtemptxt.txt';

assignfile(fichier,chemin);
rewrite(fichier);







//GetWindowsDirectory(@chemin_windows,255);
//chemin:=shortstring(chemin_windows)+'\temp\bode.clp';
//assignfile(fichier,chemin);
//rewrite(fichier);
writeln(fichier,'OscilloCaba MonoPage Y1234');

write(fichier,'t',#9);

write(fichier,'Y1',inttostr(j),#9);
write(fichier,'Y2',inttostr(j),#9);
write(fichier,'Y3',inttostr(j),#9);
write(fichier,'Y4',inttostr(j),#9);
writeln(fichier);
write(fichier,'s',#9);
write(fichier,'V',#9,'V',#9,'V',#9,'V',#9);
{
inc:=0;
for j:=1 to nb_courbes_stockees do
begin
if ( courbes[j].mode=Ch1 ) or ( courbes[j].mode=Chop) then
begin
inc:=inc+1 ;
write(fichier,'v1',inttostr(j),#9);
end;
if ( courbes[j].mode=Ch2 ) or ( courbes[j].mode=Chop) then
begin
inc:=inc+1;
write(fichier,'v2',inttostr(j),#9);
end;
end;
writeln(fichier);
write(fichier,'s',#9);
for j:=1 to inc do
begin
write(fichier,'V',#9,'V',#9);

end;
}
writeln(fichier);

//writeln(fichier,'frequence',#9,'gain',#9,'phase');

  { for inc:=0 to Bode.indice_derniere_mesure do
   begin
   x1:=Balayage.frequence[inc];
   y1:=Bode.gain[inc];
   z1:=Bode.phase[inc];
   writeln(fichier,x1,#9,y1,#9,z1);
   end;}

for inc:=0 to round(Recordlength{/10})-1 do
       begin
            t:={10*}inc/freqR;
            v1:=(Ch1DoubleArray [inc{*10}]);
            v2:=(Ch2DoubleArray [inc{*10}]);
            v3:=(Ch3DoubleArray [inc{*10}]);
            v4:=(Ch4DoubleArray [inc{*10}]);

            writeln(fichier,t,#9,v1,#9,v2,#9,v3,#9,v4);
       end;
{

     for inc:=0 to round(courbes[1].long_ech/10)-1 do
         begin
              t:=10*inc/courbes[1].freq_ech;
              write(fichier,t);
              for j:=1 to nb_courbes_stockees do
                  begin
                       if ( courbes[j].mode=Ch1 ) or ( courbes[j].mode=Chop)
                       then
                       begin
                       v1:=courbes[j].voie1[inc*10];
                       write(fichier,#9,v1);
                       end;

                       if ( courbes[j].mode=Ch2 ) or ( courbes[j].mode=Chop)
                       then
                       begin
                       v2:=courbes[j].voie2[inc*10];
                       write(fichier,#9,v2);
                       end;
                  end;
              writeln(fichier);
         end;
}

closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;






procedure TFormOscilloGTI2.FormPaint(Sender: TObject);
var
    i,j:integer;
begin


    {$IFDEF CABALABin}

    if unitcabalab.passif[2]= false then
      ToolButton_GBF.Visible:=true
    else
      ToolButton_GBF.Visible:=false;
    {$ENDIF}

    if ((congiguration.Enregistrement=true) and (courbes[num_de_courbe].valide=true)) then affichageEnregistrements( paintboxA);    //a optimiser onshow ??????

//////////RESIZE///////////////////////////////////////////////////////////////////////////////////////////////////
//Bool_RESIZE:=true;
//if Bool_RESIZE=true then
//begin
    PaintBoxECRAN.Width :=FormOscilloGTI2.ClientWidth-279  ;
    PaintBoxECRAN1.Width:=FormOscilloGTI2.ClientWidth-279  ;
    PaintBoxECRAN2.Width:=FormOscilloGTI2.ClientWidth-279  ;
    PaintBoxECRAN3.Width:=FormOscilloGTI2.ClientWidth-279  ;
    PaintBoxECRAN4.Width:=FormOscilloGTI2.ClientWidth-279  ;

    PaintBoxXY.Top:=round(FormOscilloGTI2.ClientHeight/2);
    PaintBoxXY.Width:=FormOscilloGTI2.ClientWidth-279  ;
    PaintBoxXY.height:=round(FormOscilloGTI2.ClientHeight/2)-16;

    if congiguration.affichage=3 then
    begin
         PaintBoxECRAN.height:=round(FormOscilloGTI2.ClientHeight/2)-4-16;
    end
    else PaintBoxECRAN.height:=FormOscilloGTI2.ClientHeight-32;

    //ScrollBarLevelTrigger.Height:=FormOscilloGTI2.ClientHeight;
    ScrollBar0CH1.Left:=FormOscilloGTI2.ClientWidth-24;
    ScrollBar0CH2.Left:=FormOscilloGTI2.ClientWidth-24;
    ScrollBar0CH3.Left:=FormOscilloGTI2.ClientWidth-24;
    ScrollBar0CH4.Left:=FormOscilloGTI2.ClientWidth-24;

    PositionEcransTOP[1,1]:=16;
    PositionEcransTOP[2,1]:=0;
    PositionEcransTOP[2,2]:=round(FormOscilloGTI2.ClientHeight/2);
    PositionEcransTOP[3,1]:=0;
    PositionEcransTOP[3,2]:=round(FormOscilloGTI2.ClientHeight/3);
    PositionEcransTOP[3,3]:=2*round(FormOscilloGTI2.ClientHeight/3);
    PositionEcransTOP[4,1]:=0;
    PositionEcransTOP[4,2]:=round(FormOscilloGTI2.ClientHeight/4);
    PositionEcransTOP[4,3]:=2*round(FormOscilloGTI2.ClientHeight/4);
    PositionEcransTOP[4,4]:=3*round(FormOscilloGTI2.ClientHeight/4);

    PositionEcransHEIGHT[1]:=FormOscilloGTI2.ClientHeight-32;
    PositionEcransHEIGHT[2]:=round(FormOscilloGTI2.ClientHeight/2)-4;
    PositionEcransHEIGHT[3]:=round(FormOscilloGTI2.ClientHeight/3)-4;
    PositionEcransHEIGHT[4]:=round(FormOscilloGTI2.ClientHeight/4)-4;

    if ((congiguration.affichage=1) or ((CheckBoxXY.Checked=true)and(congiguration.affichage=2))) then
    begin
    PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[1];
    PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
    end;
    if ((congiguration.affichage=2) and (CheckBoxXY.Checked=false)) then
    begin
         //toute cette gestion est faite par trigger change

    //PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible   ];
    //corection position trig barre si Y0 pas visible

    //PaintBoxTRIGlevel.top:=PositionEcransTOP[congiguration.NbVoiesVisible  ,congiguration.Trigger];
    end;
    if congiguration.affichage=3 then
    begin
    PaintBoxTRIGlevel.Height:=round(FormOscilloGTI2.ClientHeight/2)-4-16;
    PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
    end;

//Bool_RESIZE:=false;
//end;
///////////////fin RESIZE//////////////////////////////////////////////////////


///////////////couleurs/////////////////////////////////////////////////////////

    for i:=1 to 4 do
    begin
    TpaintBoxColorYx[i].Canvas.Pen.Width :=1;
    TpaintBoxColorYx[i].Canvas.pen.Color := congiguration.couleurs[i];
    TpaintBoxColorYx[i].Canvas.Brush.Color := congiguration.couleurs[i];
    TpaintBoxColorYx[i].Canvas.Rectangle(0, 0, TpaintBoxColorYx[i].Width - 1, TpaintBoxColorYx[i].Height - 1);
    end ;

///////////////FIN couleurs/////////////////////////////////////////////////////////

////////////////// scrollbarres décalages des zéros//////////////////////////////

    if congiguration.DecalZeros=true   then
    begin
        j:=0;
        for i:=1 to 4 do
        begin
            if congiguration.VoieVisible[i]=true then
            begin
                j:=j+1;
                TscrollBarCH[i].Visible:=true;
                TButton0DECALCH[i].Visible:=true;
                TscrollBarCH[i].Top:=PositionEcransTOP[congiguration.NbVoiesVisible,j];
                TscrollBarCH[i].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];
            end
            else
            begin
                TscrollBarCH[i].Visible:=false;
                TButton0DECALCH[i].Visible:=false;
            end;
        end;
    end
    else
    begin
        for i:=1 to 4 do
        begin
            TscrollBarCH[i].Visible:=false;
            TButton0DECALCH[i].Visible:=false;
        end;
    end;  {if congiguration.DecalZeros=true}

////////////////// FIN scrollbarres décalages des zéros//////////////////////////////


///////////////////RESET/////////////////////////////////////////////////////////////

    if  ((Bool_reset_ecran = true) and (congiguration.Acumul=false) and (Bool_affichage = false))then
    begin
       if CheckBoxXY.Checked=true then
          begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=false;

            //ResetEcranXY (PaintBoxECRAN);
            RESET_XY_BLEU_DYN(PaintBoxECRAN);
          end    {if CheckBoxXY.Checked=true}
       else
          begin

          if congiguration.affichage=1 then
            begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=false;

           // ResetEcran (PaintBoxECRAN);
            RESET_Normal_BLEU_DYN(PaintBoxECRAN);
            end;  {if congiguration.affichage=1}

          if congiguration.affichage=2 then
            begin
            Tecrans[0].Visible:=false;
            Tecrans[5].Visible:=false;
            j:=0;
            for i:=1 to 4 do
            begin
                if congiguration.VoieVisible[i]=true then
                begin
                    j:=j+1;

                    Tecrans[i].Visible:=true;
                    Tecrans[i].TOP:=PositionEcransTOP[congiguration.NbVoiesVisible,j];
                    Tecrans[i].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];

                    if congiguration.sensibilitee[i]=0  then
                      ResetEcran3DIV(Tecrans[i])
                    else
                      //ResetEcran (Tecrans[i]);
                        RESET_Normal_BLEU_DYN(Tecrans[i]);
                end
                else
                begin
                    Tecrans[i].Visible:=false;
                    TscrollBarCH[i].Visible:=false;
                end;
            end;{for}
       end; {if congiguration.affichage=2 }


       if congiguration.affichage=3 then
       begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=true;

            //ResetEcran (PaintBoxECRAN);
            RESET_Normal_BLEU_DYN(PaintBoxECRAN);
            //ResetEcranXY (PaintBoxXY);
            RESET_XY_BLEU_DYN(PaintBoxXY);
       end;  {if congiguration.affichage=3}

       end;  {else if CheckBoxXY.Checked=true}

    end;  {if  Bool_reset_ecrab = true and congiguration.Acumul=false}



    if  ((Bool_reset_ecran = true) and (congiguration.Acumul=false) and (Bool_affichage = true))then
    begin
       if CheckBoxXY.Checked=true then
          begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=false;


          end    {if CheckBoxXY.Checked=true}
       else
          begin

          if congiguration.affichage=1 then
            begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=false;


            end;  {if congiguration.affichage=1}

          if congiguration.affichage=2 then
            begin
            Tecrans[0].Visible:=false;
            Tecrans[5].Visible:=false;
            j:=0;
            for i:=1 to 4 do
            begin
                if congiguration.VoieVisible[i]=true then
                begin
                    j:=j+1;

                    Tecrans[i].Visible:=true;
                    Tecrans[i].TOP:=PositionEcransTOP[congiguration.NbVoiesVisible,j];
                    Tecrans[i].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];



                end
                else
                begin
                    Tecrans[i].Visible:=false;
                    TscrollBarCH[i].Visible:=false;
                end;
            end;{for}
       end; {if congiguration.affichage=2 }


       if congiguration.affichage=3 then
       begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=true;


       end;  {if congiguration.affichage=3}

       end;  {else if CheckBoxXY.Checked=true}

    end;  {if  Bool_reset_ecrab = true and congiguration.Acumul=false}
///////////////////FIN RESET/////////////////////////////////////////////////////////////

///////////////////AFFICHAGE/////////////////////////////////////////////////////////////

    if  Bool_affichage = true   then
    begin
        TchXDoubleArray[1]:=Ch1DoubleArray;       //copie des tableaux pour utilisation des indices ds la procédure d'affichage
        TchXDoubleArray[2]:=Ch2DoubleArray;
        TchXDoubleArray[3]:=Ch3DoubleArray;
        TchXDoubleArray[4]:=Ch4DoubleArray;

        if CheckBoxXY.Checked=true then
        begin
           // Affichage_voiesXY(PaintBoxECRAN);
            Affichage_XY_BLEU_DYN(PaintBoxECRAN);
        end
        else    {if CheckBoxXY.Checked=true}
        begin

            if  (congiguration.PreTrig=true)   then  SearchTrigPoint (sender);       // si PRETRIG

            if congiguration.affichage=1 then
            begin
               { for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then Affichage_voie_CHX(PaintBoxECRAN , i)
                end;
               }
                Affichage_voiS_BLEU_DYN(PaintBoxECRAN);
               // PaintBoxECRAN.Canvas.Pen.Color := clWhite;//contour BLANC uniquement en mode 1 ecran pour 4 voies, sinon contour de la couleur de la voie...
            end; {if congiguration.affichage=1}
            if congiguration.affichage=2 then
            begin
                for i:=1 to 4 do
                begin
                    //if congiguration.VoieVisible[i]=true then Affichage_voie_CHX(Tecrans[i] , i)
                    if congiguration.VoieVisible[i]=true then Affichage_voiS_par_vois_BLEU_DYN(Tecrans[i] , i)
                end;
            end;  {if congiguration.affichage=2}
            if congiguration.affichage=3 then
            begin
                {
                for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then Affichage_voie_CHX(PaintBoxECRAN , i)
                end;  }
                Affichage_voiS_BLEU_DYN(PaintBoxECRAN);
              //  PaintBoxECRAN.Canvas.Pen.Color := clWhite;//contour BLANC uniquement en mode 1 ecran pour 4 voies, sinon contour de la couleur de la voie...
              //  Affichage_voiesXY(PaintBoxXY);
                Affichage_XY_BLEU_DYN(PaintBoxXY)
            end;  {if congiguration.affichage=3}

        end;  {else du if CheckBoxXY.Checked=true}
    end; {if  Bool_affichage = true}

    {
    if congiguration.Enregistrement then
    affichageEnregistrements( paintboxA);
    }

///////////////////FIN AFFICHAGE/////////////////////////////////////////////////////////////


end;



procedure TFormOscilloGTI2.Affichage_voiS_BLEU_DYN(Destination: Tpaintbox);
var
T_bmp:array[0..1]of Tbitmap;
rectangle : Trect;
i:integer;
begin
 
    for i:=0 to 1 do
    begin
    T_bmp[i] := Tbitmap.Create;
    T_bmp[i].PixelFormat := pf24bit;
    T_bmp[i].Width:=Destination.width;
    T_bmp[i].Height:=Destination.Height;
    end;

    ResetEcran_bitmap (T_bmp[0]);

    for i:=1 to 4 do
    begin
        if congiguration.VoieVisible[i]=true then
        begin
        Affichage_voie_CHX_bitmap(T_bmp[1] , i);
        T_bmp[1].transparentColor := clinfobk;
        T_bmp[1].transparent := true;
        T_bmp[0].canvas.draw(0,0,T_bmp[1]);
        end;
    end;

    //T_bmp[1].transparentColor := clblack;
    //T_bmp[1].transparent := true;
    //T_bmp[0].canvas.draw(0,0,T_bmp[1]);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);
    Destination.Canvas.CopyRect(rectangle,T_bmp[0].canvas,rectangle);

    for i:=0 to 1 do
    begin
    T_bmp[i].free;
    end;


end;

procedure TFormOscilloGTI2.Affichage_voiS_par_vois_BLEU_DYN(Destination: Tpaintbox;No_voie:integer);
var
T_bmp:array[0..1]of Tbitmap;
rectangle : Trect;
i:integer;
begin

    for i:=0 to 1 do
    begin
    T_bmp[i] := Tbitmap.Create;
    T_bmp[i].PixelFormat := pf24bit;
    T_bmp[i].Width:=Destination.width;
    T_bmp[i].Height:=Destination.Height;
    end;

    ResetEcran_bitmap (T_bmp[0]);

    Affichage_voie_CHX_bitmap(T_bmp[1] , No_voie);

    T_bmp[1].transparentColor := clinfobk;
    T_bmp[1].transparent := true;
    T_bmp[0].canvas.draw(0,0,T_bmp[1]);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);
    Destination.Canvas.CopyRect(rectangle,T_bmp[0].canvas,rectangle);

    for i:=0 to 1 do
    begin
    T_bmp[i].free;
    end;


end;


procedure TFormOscilloGTI2.Affichage_XY_BLEU_DYN(Destination: Tpaintbox);
var
T_bmp:array[0..1]of Tbitmap;
rectangle : Trect;
i:integer;
begin

    for i:=0 to 1 do
    begin
    T_bmp[i] := Tbitmap.Create;
    T_bmp[i].PixelFormat := pf24bit;
    T_bmp[i].Width:=Destination.width;
    T_bmp[i].Height:=Destination.Height;
    end;

    ResetEcranXY_bitmap (T_bmp[0]);

    Affichage_voiesXY_bitmap(T_bmp[1]);

    T_bmp[1].transparentColor := clinfobk;
    T_bmp[1].transparent := true;
    T_bmp[0].canvas.draw(0,0,T_bmp[1]);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);
    Destination.Canvas.CopyRect(rectangle,T_bmp[0].canvas,rectangle);

    for i:=0 to 1 do
    begin
    T_bmp[i].free;
    end;


end;

procedure TFormOscilloGTI2.RESET_Normal_BLEU_DYN(Destination: Tpaintbox);
var
T_bmp:Tbitmap;
rectangle : Trect;
i:integer;
begin
    T_bmp := Tbitmap.Create;
    T_bmp.PixelFormat := pf24bit;
    T_bmp.Width:=Destination.width;
    T_bmp.Height:=Destination.Height;

    ResetEcran_bitmap (T_bmp);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);

    Destination.Canvas.CopyRect(rectangle,T_bmp.canvas,rectangle);

    T_bmp.free;
end;
procedure TFormOscilloGTI2.RESET_XY_BLEU_DYN(Destination: Tpaintbox);
var
T_bmp:Tbitmap;
rectangle : Trect;
i:integer;
begin
    T_bmp := Tbitmap.Create;
    T_bmp.PixelFormat := pf24bit;
    T_bmp.Width:=Destination.width;
    T_bmp.Height:=Destination.Height;

    ResetEcranXY_bitmap (T_bmp);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);

    Destination.Canvas.CopyRect(rectangle,T_bmp.canvas,rectangle);

    T_bmp.free;
end;









procedure TFormOscilloGTI2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if key=VK_RETURN	 then
    begin
        EnterKeyTempo:=true;
        ValideFregPossiblrClick(sender);
    end;
end;

end.
