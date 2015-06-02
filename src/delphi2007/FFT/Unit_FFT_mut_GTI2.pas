unit Unit_FFT_mut_GTI2;

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
  ToolWin;

{definition de l'objet configuration, de l'interface utilisateur, oscillo}

type
  tabint=array[0..65536] of integer; //à diminuer pour GTI2
  config = record

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

   MULTI         : boolean;                  //true = oui...
   Enregistrement: boolean;                  //true = oui...
   MONOCOUP      : boolean;                  //true = oui...
   Acumul        : boolean;

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
  TForm_FFT_mut_GTI2 = class(TForm)
    PaintBoxECRAN: TPaintBox;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    GroupBoxTrigger: TGroupBox;
    GroupBoxVOIES: TGroupBox;
    GroupBoxBaseDeTemps: TGroupBox;
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
    ScrollBarBDT: TScrollBar;
 //   BDT: TMenuItem;
    GroupBoxEnregistrement: TGroupBox;
  //  Options: TMenuItem;
    menuEnregistrement: TMenuItem;
    N1: TMenuItem;
    UniY1: TMenuItem;
    UniY2: TMenuItem;
    UniY3: TMenuItem;
    UniY4: TMenuItem;
    N2: TMenuItem;
    DiffY1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DiffY2: TMenuItem;
    DiffY3: TMenuItem;
    DiffY4: TMenuItem;
    Timer1: TTimer;
    OptionEcran: TMenuItem;
    Normal: TMenuItem;
    ecranPV: TMenuItem;
    PaintBoxECRAN1: TPaintBox;
    PaintBoxECRAN2: TPaintBox;
    PaintBoxECRAN3: TPaintBox;
    PaintBoxECRAN4: TPaintBox;
    ScrollBar0CH1: TScrollBar;
    ScrollBar0CH2: TScrollBar;
    ScrollBar0CH3: TScrollBar;
    ScrollBar0CH4: TScrollBar;
    N5: TMenuItem;
    MenuDecalZeros: TMenuItem;
    Button0DECALCH1: TButton;
    Button0DECALCH2: TButton;
    Button0DECALCH3: TButton;
    Button0DECALCH4: TButton;
    Button0LEVEL: TButton;
    Timer2: TTimer;
    CheckBoxXY: TCheckBox;
    ButtonCH1Enreg: TButton;
    ButtonCH2Enreg: TButton;
    ButtonCH3Enreg: TButton;
    ButtonCH4Enreg: TButton;
    ButtonDUALEnreg: TButton;
    PaintBoxA: TPaintBox;
    ButtonSUPRenrg: TButton;
    ScrollBarEnregistrements: TScrollBar;
    CheckBoxA: TCheckBox;
    RegressiBR: TMenuItem;
    RegressiBR2: TMenuItem;
    ConfigOscillo: TMenuItem;
    ConfigOscilo800600: TMenuItem;
    ConfigOscilo1024768: TMenuItem;
    ConfigOscilo1280960: TMenuItem;
    PaintBoxXY: TPaintBox;
    TempoET_XY: TMenuItem;
    LabelLEVEL: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PaintBoxTRIGlevel: TPaintBox;
    MenuInterfaceTaille: TMenuItem;
    MenuEnregChargConfig: TMenuItem;
    MenuEnregConfig: TMenuItem;
    Charger1: TMenuItem;
    menuCouleurs: TMenuItem;
    RegressiDDE: TMenuItem;
    N7: TMenuItem;
    MenuRegUtilisateur: TMenuItem;
    MenuAcumul: TMenuItem;
    N9: TMenuItem;
    Apropo: TMenuItem;
    N10: TMenuItem;
    Enregistrement1: TMenuItem;
    Chargement1: TMenuItem;
    menuRESETconfig: TMenuItem;
    ButtonRunStop: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    menu_TregressiInst_NEWfichier: TMenuItem;
    menu_TregressiInst_NEWpage: TMenuItem;
    GroupboxVOIE3new: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    shapecalibre3: TShape;
    Shape3: TShape;
    sensibilite34: TRadioButton;
    sensibilite32: TRadioButton;
    sensibilite33: TRadioButton;
    sensibilite31: TRadioButton;
    sensibilite36: TRadioButton;
    sensibilite37: TRadioButton;
    sensibilite38: TRadioButton;
    sensibilite30: TRadioButton;
    GetCh3SensBoxdB: TEdit;
    sensibilite35: TRadioButton;
    GroupboxVOIE4new: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Shapecalibre4: TShape;
    Shape4: TShape;
    sensibilite43: TRadioButton;
    sensibilite44: TRadioButton;
    sensibilite45: TRadioButton;
    sensibilite46: TRadioButton;
    sensibilite47: TRadioButton;
    sensibilite48: TRadioButton;
    sensibilite42: TRadioButton;
    sensibilite40: TRadioButton;
    Edit2: TEdit;
    sensibilite41: TRadioButton;
    GroupboxVOIE1new: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Shapecalibre1: TShape;
    Shape1: TShape;
    sensibilite13: TRadioButton;
    sensibilite14: TRadioButton;
    sensibilite150: TRadioButton;
    sensibilite16: TRadioButton;
    sensibilite17: TRadioButton;
    sensibilite18: TRadioButton;
    sensibilite12: TRadioButton;
    sensibilite10: TRadioButton;
    Edit3: TEdit;
    sensibilite11: TRadioButton;
    GroupboxVOIE2new: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Shapecalibre2: TShape;
    Shape2: TShape;
    sensibilite22: TRadioButton;
    sensibilite23: TRadioButton;
    sensibilite24: TRadioButton;
    sensibilite25: TRadioButton;
    sensibilite26: TRadioButton;
    sensibilite27: TRadioButton;
    sensibilite28: TRadioButton;
    sensibilite21: TRadioButton;
    Edit5: TEdit;
    sensibilite20: TRadioButton;
    GetSampleFreqEdit: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Recordlengthbox: TEdit;
    TrackBar1: TTrackBar;
    ProgressBar2: TProgressBar;
    Groupplageanalyse: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SetFreqLabel: TLabel;
    Shapefreq: TShape;
    Shapefreq0: TShape;
    RadioButtonBDT9: TRadioButton;
    RadioButtonBDT11: TRadioButton;
    RadioButtonBDT10: TRadioButton;
    RadioButtonBDT12: TRadioButton;
    RadioButtonBDT8: TRadioButton;
    RadioButtonBDT7: TRadioButton;
    RadioButtonBDT6: TRadioButton;
    RadioButtonBDT5: TRadioButton;
    RadioButtonBDT4: TRadioButton;
    RadioButtonBDT3: TRadioButton;
    RadioButtonBDT2: TRadioButton;
    RadioButtonBDT1: TRadioButton;
    GetFreqPerDiv: TEdit;
    Panel1: TPanel;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    ToolButton12: TToolButton;
    SpeedButtonCabalab: TImage;
    Image6: TImage;
    Image5: TImage;
    Image2: TImage;
    Image3: TImage;
    ToolButton1: TToolButton;
    LabelFreq1: TLabel;
    LabelFreqInit: TLabel;
    ToolButton_new_fichier: TImage;
    ButtonGBF: TImage;
    ToolButton2: TToolButton;
    ToolBar4: TToolBar;
    ToolButton8: TToolButton;
    ToolButton_Newpage: TToolButton;
    ToolButton_new_fichier0: TToolButton;
    ToolButton19: TToolButton;
    LabelFreqEnd: TLabel;
    LabelFreq2: TLabel;
    LabelFreq3: TLabel;
    LabelFreq4: TLabel;
    LabelFreq5: TLabel;
    LabelFreq6: TLabel;
    LabelFreq7: TLabel;
    LabelFreq8: TLabel;
    LabelFreq9: TLabel;
    Labelacquisition: TLabel;
    LabelWARNING2: TLabel;
    LabelWARNING1: TLabel;
    LabelWARNING3: TLabel;
    LabelWARNING4: TLabel;
    TimerDepassementSignal2: TTimer;
    TimerDepassementSignal1: TTimer;
    TimerDepassementSignal3: TTimer;
    TimerDepassementSignal4: TTimer;
    CheckBox1: TCheckBox;
    PageControlMesures: TPageControl;
    TabSheet1: TTabSheet;
    LabelVch1AC: TLabel;
    LabelVch1ACDC: TLabel;
    LabelVch1Max: TLabel;
    LabelVch1Min: TLabel;
    LabelTch1: TLabel;
    LabelFch1: TLabel;
    LabelVch1DC: TLabel;
    TabSheet2: TTabSheet;
    LabelVch2DC: TLabel;
    LabelVch2AC: TLabel;
    LabelVch2ACDC: TLabel;
    LabelVch2Max: TLabel;
    LabelVch2Min: TLabel;
    LabelTch2: TLabel;
    LabelFch2: TLabel;
    TabSheet3: TTabSheet;
    LabelVch3DC: TLabel;
    LabelVch3AC: TLabel;
    LabelVch3ACDC: TLabel;
    LabelVch3Max: TLabel;
    LabelVch3Min: TLabel;
    LabelTch3: TLabel;
    LabelFch3: TLabel;
    TabSheet4: TTabSheet;
    LabelVch4DC: TLabel;
    LabelVch4AC: TLabel;
    LabelVch4ACDC: TLabel;
    LabelVch4Max: TLabel;
    LabelVch4Min: TLabel;
    LabelTch4: TLabel;
    LabelFch4: TLabel;
    ToolButton3: TToolButton;
    CheckBoxPreTrig: TCheckBox;
    GetCh1SensBox: TLabel;
    GetCh2SensBox: TLabel;
    GetCh3SensBox: TLabel;
    GetCh4SensBox: TLabel;
    UnipolaireDiffrentiel1: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure ToolButton_new_fichier0Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ApropoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure BoxCabaLabClick(Sender: TObject);

    procedure ResetEcran (sender: Tpaintbox);
    procedure ResetEcran3DIV (sender: Tpaintbox);
    procedure ResetEcranXY (sender: Tpaintbox);

    procedure resetConfiguration (sender: Tobject);
    procedure ValidationConfiguration (sender: Tobject);
    procedure ValidConfigINTERFACE_GTI2 (sender: Tobject);

    procedure TriggerChange (sender: Tobject);
    procedure YChange (sender: Tobject);
    procedure XChange (sender: Tobject);

    procedure MenuTimeOutClick(Sender: TObject);
    procedure UniDiffChange (sender: Tobject);
    procedure MenuECRANClick(Sender: TObject);
    procedure MenuiconeECRANClick(Sender: TObject);
    procedure Menuicone2ECRANClick(Sender: TObject);
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
    procedure Affichage_voiesXY(Sender: TPaintBox ; voie:integer);

    procedure Affichage_voie_CHX(Sender: TPaintBox ; voie:integer);
    procedure calcul_spectre_CH1(Sender: TObject);
    procedure calcul_spectre_CH2(Sender: TObject);
    procedure calcul_spectre_CH3(Sender: TObject);
    procedure calcul_spectre_CH4(Sender: TObject);
    procedure Affichage_voie_CH1(Sender: TPaintBox);
    procedure Affichage_voie_CH2(Sender: TPaintBox);
    procedure Affichage_voie_CH3(Sender: TPaintBox);
    procedure Affichage_voie_CH4(Sender: TPaintBox);
    procedure affichageEnregistrements(Sender: Tpaintbox);

    procedure Timer2Timer(Sender: TObject);


    procedure DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double;var Amax3:double ;var Amax4:double ;var Amin3:double ;var Amin4:double );
    procedure MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);

    procedure ScrollBarEnregistrementsChange(Sender: TObject);
    procedure ButtonEnregClick(Sender: TObject);
    procedure SuprimerEnregistrementClick(Sender: TObject);

    procedure REGRESSIBR1Click(Sender: TObject);
    procedure Regressi2Click(Sender: TObject);

    procedure TimerDepassementSignal1Timer(Sender: TObject);
    procedure TimerDepassementSignal2Timer(Sender: TObject);
    procedure TimerDepassementSignal3Timer(Sender: TObject);
    procedure TimerDepassementSignal4Timer(Sender: TObject);

    procedure AffichageBarreTrig(sender: Tpaintbox);
    procedure TriggerBARREChange (sender: Tobject);
    procedure Button1Click(Sender: TObject);

    procedure MONOCOUP_START_Click(Sender: TObject);
    procedure MONOCOUP_STOP_Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure RegressiDDEClick(Sender: TObject);
    procedure MenuRegUtilisateurClick(Sender: TObject);

    procedure EnvoieDonneesGTI( ch1,ch2,ch3,ch4,NewFichier:boolean );

    procedure RetourDEMenuRegUtilisateurClick(Sender: TObject);

    procedure Aide1Click(Sender: TObject);
    procedure Aide2Click(Sender: TObject);
    procedure Aide3Click(Sender: TObject);
    procedure Aide3bisClick(Sender: TObject);
    procedure Aide4Click(Sender: TObject);
    procedure Aide5Click(Sender: TObject);
    procedure Aide6Click(Sender: TObject);
    procedure Aide7Click(Sender: TObject);
    procedure Aide8Click(Sender: TObject);
    procedure Aide9Click(Sender: TObject);
    procedure changementcalibre1 (Sender:Tobject);
    procedure calibre1Change (Sender:Tobject);
    procedure changementcalibre2 (Sender:Tobject);
    procedure calibre2Change (Sender:Tobject);
    procedure changementcalibre3 (Sender:Tobject);
    procedure calibre3Change (Sender:Tobject);
    procedure changementcalibre4 (Sender:Tobject);
    procedure calibre4Change (Sender:Tobject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure MESURES(Sender: Tobject);
   function TesterDepassementSignal1( Sender : TObject) : boolean;
   function TesterDepassementSignal2( Sender : TObject) : boolean;
   function TesterDepassementSignal3( Sender : TObject) : boolean;
   function TesterDepassementSignal4( Sender : TObject) : boolean;

    procedure ResetEcran_bitmap (sender: Tbitmap;ZEROTRAI:boolean);
    procedure Affichage_voie_CHX_bitmap(Sender: Tbitmap ; voie:integer);

   procedure Affichage_voiS_BLEU_DYN(Destination: Tpaintbox);
    procedure Affichage_voiS_par_vois_BLEU_DYN(Destination: Tpaintbox;No_voie:integer);
    procedure Affichage_voiesXY_bitmap(Sender: Tbitmap; voie:integer);
    procedure Affichage_XY_BLEU_DYN(Destination: Tpaintbox);
   // procedure ResetEcranXY_bitmap (sender: Tbitmap);

    procedure RESET_Normal_BLEU_DYN(Destination: Tpaintbox);
    procedure RESET_XY_BLEU_DYN(Destination: Tpaintbox);





  private


    { Déclarations privées }
    //    bAllowMeasuring   : boolean;
  public
    { Déclarations publiques }
     CompteurTIMEOUT : integer;
  end;

var
      ximag,xreal            : DArray;
      xxreal,xximag          : DArray;
      tabi                   : DArray;
      tabr                   : DArray;
      spectre1               : DArray;
      spectre2               : DArray;
      spectre3               : DArray;
      spectre4               : DArray;
      FFTre,FFTim            : DArray;
      indice,indice2         : tabint;
      expo,delta,expo2       : integer;
      rLengthOld,NF2,NF3,NF4 : longint;
      changement             : boolean;
      Longueur_Acquisition   : dword;

  Form_FFT_mut_GTI2: TForm_FFT_mut_GTI2;

  TchXDoubleArray : array [1..4] of darray;  //tableau des tableaux de données
  TspectreXDoubleArray:array[1..4] of darray;
  congiguration  : config;
  TensionMaxEcran: array[0..9] of double;   //valeurs des tension max de l'écran fonction des réglage de sensib
  MCV: array [0..4,0..1] of Tmenuitem;      //tableau des Tmenuitem du menu : cofigurations des voies

  TRadioButTriggerMode : array [0..4] of   TradioButton; //voie du trigger  (0:sans)
  TRadioButtonFront    : array [0..1] of   TradioButton; //Front du trigger

  ComboSensiB :array[1..4] of TcomboBoxEx;  //sensib
  TcheckBoxVoieVisible : array[1..4] of TCheckBox; //croix des voies visibles ou non
  TRadioButtonYxSondeX1  : array[1..4] of  TradioButton;    //sondes X1
  TRadioButtonYxSondeX10  : array[1..4] of  TradioButton;   //sondes X10 (inutilisé car binaire avec les X1)
  TCheckBoxINVCH : array[1..4] of TCheckBox; //Invertion des voies
  TpaintBoxColorYx : array[1..4] of TpaintBox; //affichage des couleurs de voies si changement utilisateur
  Tshapecalibre : array[1..4] of Tshape;
  TGroupBoxVoie: array[1..4] of TGroupBox;
  TLabelWARNING: array[1..4] of TLabel;
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


  monoCoupRunning:boolean;      //gére par l'appui sur le bouton lancer du mono coup : si TRUE : la procédure d'attente_trig/rapatriment du mono coup est en train de tourner

  TempoAffichMesures  : integer; //compteur ds le timer1

implementation

{$IFDEF CABALABin}     //GTI2
uses    Unit_FFT_mut_GTI2TIMEOUT, Unit_FFT_mut_GTI2GestionCouleursCourbes{, Demodde}, Unit_FFT_mut_GTI2TransfertRegressiUtilisateur,UnitCabalab, UnitGBF, UnitAPropos,UnitTransfertRegressi,clipbrd,
  Unit_aide_FFT, Unit_aide_FFT_abscisse, Unit_aide_FFT_ordonnee,
  Unit_aide_FFT_frequence, Unit_aide_FFT_BdeT{, Unit_aide_FFT_trigger},
  Unit_aide_FFT_stop, Unit_aide_FFT_logo, Unit_aide_FFT_accu,
  Unit_aide_FFT_transfert, Unit_Base_de_Frequence,
  UnitOsciG2GestClCBLEU   ;
{$ENDIF}

{$IFDEF Independant}   //GTI2
uses    Unit_FFT_mut_GTI2TIMEOUT, Unit_FFT_mut_GTI2GestionCouleursCourbes{, Demodde}, Unit_FFT_mut_GTI2TransfertRegressiUtilisateur{,UnitCabalab, UnitGBF, UnitAPropos},UnitTransfertRegressi,clipbrd;
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


procedure TForm_FFT_mut_GTI2.BoxCabaLabClick(Sender: TObject);
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


     if sender=SpeedButtonCabaLab then
     begin
        {$IFDEF CABALABin}
        FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
        FormCabaLab.BringToFront;
        {$ENDIF}
     end;
     if sender=ButtonGBF then
     begin
        {$IFDEF CABALABin}
        formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
        formGBF.BringToFront;
        {$ENDIF}
     end;
end;


procedure TForm_FFT_mut_GTI2.FormCreate(Sender: TObject);
var i :dword;
alpha :double;
a,b,d,j :integer;
begin
 TempoAffichMesures:=0;
 //if GTI2  then            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!??????????????????????????????????????????
 //begin
 Form_FFT_mut_GTI2.Top:=0;
 Form_FFT_mut_GTI2.left:=0;
 Form_FFT_mut_GTI2.width:=880;
 Form_FFT_mut_GTI2.height:=680;

// form_FFT_mut_TIMEOUT.Top:=0;
// form_FFT_mut_TIMEOUT.left:=0;

// FormConfigCouleurs.Top:=0;
// FormConfigCouleurs.left:=0;

 PageControlMesures.Top:=424;
 PageControlMesures.left:=0;
 GroupBoxEnregistrement.Top:=424;
 GroupBoxEnregistrement.left:=0;
// GroupBoxMONOCOUP.Top:=424;
// GroupBoxMONOCOUP.left:=0;

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

 {$IFDEF Independant}   //GTI2
 InitInstrument ($308);   //valeur du HS3!
 Timer1.enabled:=true;
 {$ENDIF}

 TchXDoubleArray[1]:=Ch1DoubleArray;       //pas utilisé encore mais a faire....
 TchXDoubleArray[2]:=Ch2DoubleArray;
 TchXDoubleArray[3]:=Ch3DoubleArray;
 TchXDoubleArray[4]:=Ch4DoubleArray;
 TspectreXDoubleArray[1]:=Spectre1;       //pas utilisé encore mais a faire....
 TspectreXDoubleArray[2]:=Spectre2;
 TspectreXDoubleArray[3]:=Spectre3;
 TspectreXDoubleArray[4]:=Spectre4;
  TLabelWARNING[1]:=LabelWARNING1;
  TLabelWARNING[2]:=LabelWARNING2;
  TLabelWARNING[3]:=LabelWARNING3;
  TLabelWARNING[4]:=LabelWARNING4;
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

{ TCheckBoxINVCH[1]:=CheckBoxINVCH1;
 TCheckBoxINVCH[2]:=CheckBoxINVCH2;
 TCheckBoxINVCH[3]:=CheckBoxINVCH3;
 TCheckBoxINVCH[4]:=CheckBoxINVCH4;}
{
 TpaintBoxColorYx[1]:=PaintBoxColor1;
 TpaintBoxColorYx[2]:=PaintBoxColor2;
 TpaintBoxColorYx[3]:=PaintBoxColor3;
 TpaintBoxColorYx[4]:=PaintBoxColor4;   }

 Tshapecalibre[1]:=shapecalibre1;
 Tshapecalibre[2]:=shapecalibre2;
 Tshapecalibre[3]:=shapecalibre3;
 Tshapecalibre[4]:=shapecalibre4;

 Tgroupboxvoie[1]:=GroupBoxVOIE1;
 Tgroupboxvoie[2]:=GroupBoxVOIE2;
 Tgroupboxvoie[3]:=GroupBoxVOIE3;
 Tgroupboxvoie[4]:=GroupBoxVOIE4;

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
 TensionMaxEcran[1]:=20;  //10
 TensionMaxEcran[2]:=8;//4
 TensionMaxEcran[3]:=4;
 TensionMaxEcran[4]:=2;
 TensionMaxEcran[5]:=0.8;
 TensionMaxEcran[6]:=0.4;
 TensionMaxEcran[7]:=0.2;
 TensionMaxEcran[8]:=0.08;
 TensionMaxEcran[9]:=0.04;

 resetConfiguration (sender);
 ValidationConfiguration (sender);

         expo := 10;
        delta:=1;
        for i:=1 to expo do
        begin
                 d:=1 shl (i-1);
                 for j:=1 to d do
                 begin
                  indice[j]:=indice[j]*2;
                  indice[j+d]:=indice[j]+1;
                 end;
        end;
        expo2:=expo-2;
        for i:=1 to expo2 do
           begin
                d:=1 shl (i-1);
                for j:=1 to d do
                begin
                    indice2[j]:=indice2[j]*2;
                    indice2[j+d]:=indice2[j]+1;
                end;
            end;
      NF4:=1 shl (expo2);
      NF3:=2*NF4-1;
      NF2:=NF4*4;
  changement:=False;
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

d:=15;
alpha:=1.6;
RadioButtonBDT12.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[0])));
RadioButtonBDT11.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[1])));
RadioButtonBDT10.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[2])));
RadioButtonBDT9.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[3])));
RadioButtonBDT8.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[4])));
RadioButtonBDT7.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[5])));
RadioButtonBDT6.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[6])));
RadioButtonBDT5.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[7])));
RadioButtonBDT4.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[8])));
RadioButtonBDT3.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[9])));
RadioButtonBDT2.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[10])));
RadioButtonBDT1.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(tetaGTI2[11])));
//position12.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[12])));
//position13.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[13])));
//position14.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[14])));
RadioButtonBDT12.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[0])));
RadioButtonBDT11.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[1])));
RadioButtonBDT10.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[2])));
RadioButtonBDT9.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[3])));
RadioButtonBDT8.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[4])));
RadioButtonBDT7.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[5])));
RadioButtonBDT6.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[6])));
RadioButtonBDT5.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[7])));
RadioButtonBDT4.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[8])));
RadioButtonBDT3.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[9])));
RadioButtonBDT2.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[10])));
RadioButtonBDT1.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[11])));
//position12.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[12])));

 alpha:=2;
 d:=15;
  shapecalibre1.Left:=round((GroupboxVOIE1new.width-shapecalibre1.width)/2);
 shapecalibre1.top:=round((GroupboxVOIE1new.height-shapecalibre1.height)/2);
sensibilite10.top:=(shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8]))));
sensibilite11.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
sensibilite12.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
sensibilite13.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
sensibilite14.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
sensibilite150.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
sensibilite16.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
sensibilite17.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
sensibilite18.top:=shapecalibre1.top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));

sensibilite10.left:= (shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8]))));
sensibilite11.left:=shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite12.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
sensibilite13.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
sensibilite14.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
sensibilite150.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
sensibilite16.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
sensibilite17.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
sensibilite18.left:= shapecalibre1.left+ round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

 shapecalibre2.Left:=round((GroupboxVOIE2new.width-shapecalibre2.width)/2);
 shapecalibre2.top:=round((GroupboxVOIE2new.height-shapecalibre2.height)/2);
sensibilite20.top:=(shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8]))));
sensibilite21.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
sensibilite22.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
sensibilite23.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
sensibilite24.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
sensibilite25.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
sensibilite26.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
sensibilite27.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
sensibilite28.top:=shapecalibre2.top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));

sensibilite20.left:= (shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8]))));
sensibilite21.left:=shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite22.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
sensibilite23.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
sensibilite24.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
sensibilite25.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
sensibilite26.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
sensibilite27.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
sensibilite28.left:= shapecalibre2.left+ round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

 shapecalibre3.Left:=round((GroupboxVOIE3new.width-shapecalibre3.width)/2);
 shapecalibre3.top:=round((GroupboxVOIE3new.height-shapecalibre3.height)/2);
sensibilite30.top:=(shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8]))));
sensibilite31.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
sensibilite32.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
sensibilite33.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
sensibilite34.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
sensibilite35.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
sensibilite36.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
sensibilite37.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
sensibilite38.top:=shapecalibre3.top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));

sensibilite30.left:= (shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8]))));
sensibilite31.left:=shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite32.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
sensibilite33.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
sensibilite34.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
sensibilite35.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
sensibilite36.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
sensibilite37.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
sensibilite38.left:= shapecalibre3.left+ round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

 shapecalibre4.Left:=round((GroupboxVOIE4new.width-shapecalibre4.width)/2);
 shapecalibre4.top:=round((GroupboxVOIE4new.height-shapecalibre4.height)/2);
sensibilite40.top:=(shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8]))));
sensibilite41.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
sensibilite42.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
sensibilite43.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
sensibilite44.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
sensibilite45.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
sensibilite46.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
sensibilite47.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
sensibilite48.top:=shapecalibre4.top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));

sensibilite40.left:= (shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8]))));
sensibilite41.left:=shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite42.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
sensibilite43.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
sensibilite44.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
sensibilite45.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
sensibilite46.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
sensibilite47.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
sensibilite48.left:= shapecalibre4.left+ round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));


d:=8;
alpha:=0.95;
shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite12.Checked:=true;
calibre1change(self);
shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite22.Checked:=true;
calibre2change(self);
shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite32.Checked:=true;
calibre3change(self);
shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
sensibilite42.Checked:=true;
calibre4change(self);
GetSampleFreqEdit.Visible:=false;
GetSampleFreqEdit.top:=PaintBoxXY.top;

GetSampleFreqEdit.left:=PaintBoxEcran.left+round((PaintBoxEcran.width-GetSampleFreqEdit.Width)/2);

LabelFreq1.Left:= PaintBoxEcran1.left+round(PaintBoxEcran1.width/10)-round(labelFreq1.width/2);
LabelFreq2.Left:= PaintBoxEcran1.left+2*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq3.Left:= PaintBoxEcran1.left+3*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq4.Left:= PaintBoxEcran1.left+4*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq5.Left:= PaintBoxEcran1.left+5*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq6.Left:= PaintBoxEcran1.left+6*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq7.Left:= PaintBoxEcran1.left+7*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq8.Left:= PaintBoxEcran1.left+8*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq9.Left:= PaintBoxEcran1.left+9*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);

LabelFreqEnd.Left:= PaintBoxEcran1.left+(PaintBoxEcran1.width)-round(labelfreqEnd.width/2);
Labelacquisition.Left:=PaintBoxEcran1.left+round(PaintBoxEcran1.width/2)-round(Labelacquisition.width/2);

image6click(self);
//menuMONOCOUP.checked          :=false;
//congiguration.MONOCOUP        :=false;
Normal.Checked:=True;
image2.Left:=64;
TrackBar1.Position :=3;
progressbar2.Position:=0;
// Normal.Checked:=true  ;

 labelacquisition.visible:=False;
 Timer1.enabled    := false;
 LabelWARNING1.Top:= 0;{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 LabelWARNING2.Top:= 0;{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 LabelWARNING3.Top:= 0;{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 LabelWARNING4.Top:= 0;{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 // LabelWARNING1.Left:=0;
     TimerDepassementSignal1.Enabled:=False;
  LabelWARNING1.Visible:=False;
     TimerDepassementSignal2.Enabled:=False;
  LabelWARNING2.Visible:=False;
     TimerDepassementSignal3.Enabled:=False;
  LabelWARNING3.Visible:=False;
     TimerDepassementSignal4.Enabled:=False;
  LabelWARNING4.Visible:=False;
end;

procedure TForm_FFT_mut_GTI2.Image6Click(Sender: TObject);
begin
    image6.Visible    :=false;
    image5.Visible    :=true;
    Timer1.enabled       := True;
    congiguration.Start  :=True;
   // ACQUI:=True;

end;

procedure TForm_FFT_mut_GTI2.Image5Click(Sender: TObject);
begin
    image5.Visible    :=false;
    image6.Visible    :=true;
   // image6.top:=3;
  //  ACQUI:=False;
    congiguration.Start  :=False;
    Timer1.enabled       :=False;
end;

procedure TForm_FFT_mut_GTI2.Timer2Timer(Sender: TObject);
var i:integer;
begin
for i:=1 to 4 do
    if TLabelWARNING[i].Visible=true then TLabelWARNING[i].Visible:=false else TLabelWARNING[i].Visible:=true;
end;





procedure TForm_FFT_mut_GTI2.ToolButton_new_fichier0Click(Sender: TObject);
begin

    //formDDE.visible:=true;
    //formDDE.BringToFront;
     if {((sender=menu_TregressiInst_NEWfichier) or }(sender=ToolButton_new_fichier){)} then
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
end;
{
procedure TForm_FFT_mut_GTI2.EnvoieDonneesGTI( ch1,ch2,ch3,ch4,NewFichier:boolean );
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
          Add('Analyseur de spectres temps réel'); // 3ème = Titre de pagebegin

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

          //if congiguration.PreTrig=false then
            //  begin
              freq        :=GetSampleFrequency();
              Recordlength:=GetRecordLength();
              for i:=0 to (Recordlength-1) do
              begin
                ligne :=FloatToStr(i/freq);
                    if ch1 then ligne :=ligne +crTab+FloatToStr(spectre1 [i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(spectre2 [i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(spectre3 [i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(spectre4 [i]);
                Add(ligne);
              end;
             // end;
         { if congiguration.PreTrig=true then
              begin
              freq        :=GetSampleFrequency();
              Recordlength:=GetRecordLength();
              for i:=0 to (Recordlength-500) do
              begin
                ligne :=FloatToStr((i-congiguration.PointTrig)/freq);
                    if ch1 then ligne :=ligne +crTab+FloatToStr(Ch1DoubleArray [i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(Ch2DoubleArray [i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(Ch3DoubleArray [i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(Ch4DoubleArray [i]);
                Add(ligne);
              end;
              end;  }

  {        ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
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
//end;






procedure TForm_FFT_mut_GTI2.Timer1Timer(Sender: TObject);

//erreur: word ;
begin

    if (timer1.enabled) and (@timer1.OnTimer <> nil) then
    begin
        Timer1.enabled    := False;
        TempoAffichMesures:=TempoAffichMesures+1;

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

procedure TForm_FFT_mut_GTI2.FormActivate(Sender: TObject);
begin
timer1.Enabled:=true;
end;

procedure TForm_FFT_mut_GTI2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     {$IFDEF CABALABin}
      timer1.Enabled:=false;
      passif[6]:=true;                             //FFT
      resetConfiguration (sender);
      ValidationConfiguration (sender);
      Formcabalab.SpeedButtonFFT.down:=false;       //FFT
      Formcabalab.GestionButtons(sender);
     {$ENDIF}

end;


procedure TForm_FFT_mut_GTI2.FormResize(Sender: TObject);
begin
    {
    PaintBoxECRAN.Width:=Form_FFT_mut_GTI2.ClientWidth-279  ;
    PaintBoxECRAN1.Width:=Form_FFT_mut_GTI2.ClientWidth-279  ;
    PaintBoxECRAN2.Width:=Form_FFT_mut_GTI2.ClientWidth-279  ;
    PaintBoxECRAN3.Width:=Form_FFT_mut_GTI2.ClientWidth-279  ;
    PaintBoxECRAN4.Width:=Form_FFT_mut_GTI2.ClientWidth-279  ;

    PaintBoxXY.Top:=round(Form_FFT_mut_GTI2.ClientHeight/2);
    PaintBoxXY.Width:=Form_FFT_mut_GTI2.ClientWidth-279  ;
    PaintBoxXY.height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-16;

    if congiguration.affichage=3 then
    begin
        PaintBoxECRAN.height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-4-16;
    end
    else
    PaintBoxECRAN.height:=Form_FFT_mut_GTI2.ClientHeight-32;

    //ScrollBarLevelTrigger.Height:=Form_FFT_mut_GTI2.ClientHeight;



    ScrollBar0CH1.Left:=Form_FFT_mut_GTI2.ClientWidth-24;
    ScrollBar0CH2.Left:=Form_FFT_mut_GTI2.ClientWidth-24;
    ScrollBar0CH3.Left:=Form_FFT_mut_GTI2.ClientWidth-24;
    ScrollBar0CH4.Left:=Form_FFT_mut_GTI2.ClientWidth-24;

    PositionEcransTOP[1,1]:=16;
    PositionEcransTOP[2,1]:=0;
    PositionEcransTOP[2,2]:=round(Form_FFT_mut_GTI2.ClientHeight/2);
    PositionEcransTOP[3,1]:=0;
    PositionEcransTOP[3,2]:=round(Form_FFT_mut_GTI2.ClientHeight/3);
    PositionEcransTOP[3,3]:=2*round(Form_FFT_mut_GTI2.ClientHeight/3);
    PositionEcransTOP[4,1]:=0;
    PositionEcransTOP[4,2]:=round(Form_FFT_mut_GTI2.ClientHeight/4);
    PositionEcransTOP[4,3]:=2*round(Form_FFT_mut_GTI2.ClientHeight/4);
    PositionEcransTOP[4,4]:=3*round(Form_FFT_mut_GTI2.ClientHeight/4);

    PositionEcransHEIGHT[1]:=Form_FFT_mut_GTI2.ClientHeight-32;
    PositionEcransHEIGHT[2]:=round(Form_FFT_mut_GTI2.ClientHeight/2)-4;
    PositionEcransHEIGHT[3]:=round(Form_FFT_mut_GTI2.ClientHeight/3)-4;
    PositionEcransHEIGHT[4]:=round(Form_FFT_mut_GTI2.ClientHeight/4)-4;

    if congiguration.affichage=1 then
    begin
    PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[1];
    PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
    end;
    if congiguration.affichage=2 then
    begin
    PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible   ];
    PaintBoxTRIGlevel.top:=PositionEcransTOP[congiguration.NbVoiesVisible  ,congiguration.Trigger];
    end;
    if congiguration.affichage=3 then
    begin
    PaintBoxTRIGlevel.Height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-4-16;
    PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
    end;
    }
    ///////////////////////////////////PB au démarrage§§§§§§§§§§§§§§§§§§§§§§§§§§§§?????????????????????????????????????????
    {
    if congiguration.DecalZeros=true then
    begin
    TscrollBarCH[1].Top:=PositionEcransTOP[4,1];
    TscrollBarCH[2].Top:=PositionEcransTOP[4,2];
    TscrollBarCH[3].Top:=PositionEcransTOP[4,3];
    TscrollBarCH[4].Top:=PositionEcransTOP[4,4];

    TscrollBarCH[1].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];
    TscrollBarCH[2].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];
    TscrollBarCH[3].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];
    TscrollBarCH[4].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];
    end;
     }
LabelFreq1.Left:= PaintBoxEcran1.left+round(PaintBoxEcran1.width/10)-round(labelFreq1.width/2);
LabelFreq2.Left:= PaintBoxEcran1.left+2*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq3.Left:= PaintBoxEcran1.left+3*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq4.Left:= PaintBoxEcran1.left+4*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq5.Left:= PaintBoxEcran1.left+5*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq6.Left:= PaintBoxEcran1.left+6*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq7.Left:= PaintBoxEcran1.left+7*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq8.Left:= PaintBoxEcran1.left+8*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);
LabelFreq9.Left:= PaintBoxEcran1.left+9*round(PaintBoxEcran1.width/10)-round(labelFreq1.Width/2);

LabelFreqEnd.Left:= PaintBoxEcran1.left+(PaintBoxEcran1.width)-round(labelfreqEnd.width/2);
Labelacquisition.Left:=PaintBoxEcran1.left+round(PaintBoxEcran1.width/2)-round(Labelacquisition.width/2);
GetSampleFreqEdit.top:=PaintBoxXY.top;
GetSampleFreqEdit.left:=PaintBoxEcran.left+round((PaintBoxEcran.width-GetSampleFreqEdit.Width)/2);
 LabelWARNING1.Top:= 0{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 LabelWARNING2.Top:= 0{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 LabelWARNING3.Top:= 0{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};
 LabelWARNING4.Top:= 0{Form_FFT_mut_GTI2.ClientHeight-LabelWARNING1.Height};

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



procedure TForm_FFT_mut_GTI2.resetConfiguration (sender: Tobject);
begin

   congiguration.Start  := true;

   TempoAffichMesures:=0;

   congiguration.Trigger:=0;
   congiguration.front  :=1;
   congiguration.Level  :=0;

   congiguration.VoieVisible[1]:=true;
   congiguration.VoieVisible[2]:=true;
   congiguration.VoieVisible[3]:=true;
   congiguration.VoieVisible[4]:=true;
    
   congiguration.PreTrig:=false;
   congiguration.HYSTPreTrig:=0.05;
   //congiguration.couleurs[0]:=clblack;
   congiguration.couleurs[0]:=119 ;     //ecran BLEU
   congiguration.couleurs[1]:=clFuchsia;
   congiguration.couleurs[2]:=cllime;
   congiguration.couleurs[3]:=clyellow;
   congiguration.couleurs[4]:=clred;
   congiguration.couleurs[5]:=clsilver;

   congiguration.PenWidth:=1;

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

   congiguration.DecalZeros     :=false;
   congiguration.MULTI          :=false;
   congiguration.Enregistrement :=false;
   congiguration.MONOCOUP       :=false;
   congiguration.Acumul         :=false;

   congiguration.ValeursDecalZERO[1]:=50;
   congiguration.ValeursDecalZERO[2]:=50;
   congiguration.ValeursDecalZERO[3]:=50;
   congiguration.ValeursDecalZERO[4]:=50;

   congiguration.sensibilitee[1]:=1;sensibilite10.Checked:=true;
   congiguration.sensibilitee[2]:=1;sensibilite20.Checked:=true;
   congiguration.sensibilitee[3]:=1;sensibilite30.Checked:=true;
   congiguration.sensibilitee[4]:=1;sensibilite40.Checked:=true;

   congiguration.BaseDetemps:=4;
   congiguration.Vitesse:=2;
 //  congiguration.Vitesse:=1;
   congiguration.TimeOut:=2;
  // congiguration.timeoutVALEURutilisateur:=

   congiguration.affichage:=1;

   congiguration.ConfigOscillo:=1;

       LongEnregistrement:=1024;
       recordlengthbox.Text:=inttostr(LongEnregistrement);
     SetRecordLength (LongEnregistrement ) ;
              expo := 10;
              delta := 1;
              progressbar2.Position:=0;
end;

procedure TForm_FFT_mut_GTI2.ValidationConfiguration (sender: Tobject);
var
i : integer;
begin
   case congiguration.Trigger of
        0 :  RadioButtonTriggerSANS.checked:=true;
        1 :  RadioButtonTriggerCH1.checked:=true;
        2 :  RadioButtonTriggerCH2.checked:=true;
        3 :  RadioButtonTriggerCH3.checked:=true;
        4 :  RadioButtonTriggerCH4.checked:=true;
   end;

   case congiguration.front of
        1 :  RadioButtonFrontMontant.checked:=true;
        0 :  RadioButtonFrontDescendant.checked:=true;
   end;

   //f congiguration.PreTrig=true then CheckBoxPreTrig.Checked:=true else CheckBoxPreTrig.Checked:=false;



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


  { CheckBoxINVCH1.Checked:=congiguration.Invertion[1];
   CheckBoxINVCH2.Checked:=congiguration.Invertion[2];
   CheckBoxINVCH3.Checked:=congiguration.Invertion[3];
   CheckBoxINVCH4.Checked:=congiguration.Invertion[4];}


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

 //  MULTI.Checked:=congiguration.MULTI;
   PageControlMesures.Visible:=congiguration.MULTI;

   menuEnregistrement.Checked:=congiguration.Enregistrement;
   GroupBoxEnregistrement.Visible:=congiguration.Enregistrement;

 //  menuMONOCOUP.checked:=congiguration.MONOCOUP;
  // GroupBoxMONOCOUP.Visible:=congiguration.MONOCOUP;

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


   for i:=1 to 4 do
   begin
       if  congiguration.Unipolaire[i]=true then  MCV[i,0].checked:=true  else  MCV[i,1].checked:=true ;
   end;

   if (congiguration.Unipolaire[1]=true) and
      (congiguration.Unipolaire[2]=true) and
      (congiguration.Unipolaire[3]=true) and
      (congiguration.Unipolaire[4]=true)     then   MCV[0,0].checked:=true ;

   if (congiguration.Unipolaire[1]=false) and
      (congiguration.Unipolaire[2]=false) and
      (congiguration.Unipolaire[3]=false) and
      (congiguration.Unipolaire[4]=false)     then   MCV[0,1].checked:=true ;




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

 {  if congiguration.TimeOut=1 then begin CompteurTIMEOUT:=5;   menutimeout1.Checked:=true; end;
   if congiguration.TimeOut=2 then begin CompteurTIMEOUT:=10;  menutimeout2.Checked:=true; end;
   if congiguration.TimeOut=3 then begin CompteurTIMEOUT:=20;  menutimeout3.Checked:=true; end;
   if congiguration.TimeOut=4 then begin CompteurTIMEOUT:=congiguration.timeoutVALEURutilisateur;  menutimeout4.Checked:=true; end;
  // form_FFT_mut_TIMEOUT.TrackBarTIMEOUT.position:=CompteurTIMEOUT;
  }


{   if congiguration.Vitesse=1 then VUlent.Checked:=true;
   if congiguration.Vitesse=2 then Vlent.Checked:=true;
   if congiguration.Vitesse=3 then Vrapide.Checked:=true;
   if congiguration.Vitesse=4 then VUrapide.Checked:=true;
 }
   if congiguration.affichage=1 then  Normal.checked:=true;
   if congiguration.affichage=2 then  ecranPV.checked:=true;


   if congiguration.ConfigOscillo=1 then
   begin
        ConfigOscilo800600.Checked:=true;
        //Form_FFT_mut_GTI2.width:=800;
        //Form_FFT_mut_GTI2.height:=600;
   end;

   if congiguration.ConfigOscillo=2 then
   begin
        ConfigOscilo1024768.Checked:=true;
        //Form_FFT_mut_GTI2.width:=1024;
        //Form_FFT_mut_GTI2.height:=768;
   end;

   if congiguration.ConfigOscillo=3 then
   begin
        ConfigOscilo1280960.Checked:=true;
        //Form_FFT_mut_GTI2.width:=1280;
        //Form_FFT_mut_GTI2.height:=960;
   end;


end;


procedure TForm_FFT_mut_GTI2.ValidConfigINTERFACE_GTI2 (sender: Tobject);

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


     if congiguration.VoieVisible[1]=true then  SetCh1InputOn(1) else SetCh1InputOn(0);
     if congiguration.VoieVisible[2]=true then  SetCh2InputOn(1) else SetCh2InputOn(0);
     if congiguration.VoieVisible[3]=true then  SetCh3InputOn(1) else SetCh3InputOn(0);
     if congiguration.VoieVisible[4]=true then  SetCh4InputOn(1) else SetCh4InputOn(0);

     if congiguration.Unipolaire[1]=true  then
        begin
          SetCh1DiffOn(0);
          CheckBoxY1Visible.Caption:='Y0';
        end
     else
        begin
          SetCh1DiffOn(1);
          CheckBoxY1Visible.Caption:='YD0';
        end;
     if congiguration.Unipolaire[2]=true  then
        begin
          SetCh2DiffOn(0);
          CheckBoxY2Visible.Caption:='Y1';
        end
     else
        begin
           SetCh2DiffOn(1);
           CheckBoxY2Visible.Caption:='YD1';
        end;
     if congiguration.Unipolaire[3]=true  then
        begin
          SetCh3DiffOn(0);
          CheckBoxY3Visible.Caption:='Y2';
        end
     else
        begin
           SetCh3DiffOn(1);
           CheckBoxY3Visible.Caption:='YD2';
        end;
     if congiguration.Unipolaire[4]=true  then
        begin
          SetCh4DiffOn(0);
          CheckBoxY4Visible.Caption:='Y3';
        end
        else
        begin
           SetCh4DiffOn(1);
           CheckBoxY4Visible.Caption:='YD3';
        end;
     Sensibilite15 :=15;
     Sensibilite75 :=7.5;

     if congiguration.sensibilitee[1]<3   then  SetSensitivity ( 1, @Sensibilite15 ) else  SetSensitivity ( 1, @Sensibilite75 );
     if congiguration.sensibilitee[2]<3   then  SetSensitivity ( 2, @Sensibilite15 ) else  SetSensitivity ( 2, @Sensibilite75 );
     if congiguration.sensibilitee[3]<3   then  SetSensitivity ( 3, @Sensibilite15 ) else  SetSensitivity ( 3, @Sensibilite75 );
     if congiguration.sensibilitee[4]<3   then  SetSensitivity ( 4, @Sensibilite15 ) else  SetSensitivity ( 4, @Sensibilite75 );

 {    if congiguration.Vitesse=1 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;  LongEnregistrement:= 10000 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=10000000;  LongEnregistrement:= 10000 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:= 8000000;  LongEnregistrement:= 10000 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=10000000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:= 5000000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:= 2500000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:= 1000000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=  500000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=  250000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=  100000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=   50000;  LongEnregistrement:=10000 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=   25000;  LongEnregistrement:=10000;   end;
       end;
  }
     if congiguration.Vitesse=2 then
     begin
          if congiguration.BaseDetemps=12       then begin FrequenceEch:=10000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=11       then begin FrequenceEch:= 5000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=10       then begin FrequenceEch:= 2000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:= 1000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=   500000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=   200000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=   100000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=    50000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=    20000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=3      then begin FrequenceEch:=    10000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=2      then begin FrequenceEch:=     5000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=1      then begin FrequenceEch:=     2000;  LongEnregistrement:=1000;   end;
     end;
{     if congiguration.Vitesse=3 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:= 5000000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:= 2500000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:= 1000000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=   500000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=   250000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=   100000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=    50000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=    25000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=    10000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=     5000;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=     2500;  LongEnregistrement:=500 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=     1000;  LongEnregistrement:=500;   end;
     end;

     if congiguration.Vitesse=4 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;   LongEnregistrement:=250 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=   125000;   LongEnregistrement:=250 ;  end;
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
     end;


  }

    LongEnregistrement:=strtoint(recordlengthbox.Text);
     SetRecordLength    (LongEnregistrement ) ;
     SetSampleFrequency (@FrequenceEch) ;
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


procedure TForm_FFT_mut_GTI2.calibre1Change (Sender: TObject);
var d:integer;
alpha : real;
begin
 d:=8;
alpha:=0.95;

if sensibilite10.Checked=true then
    begin
      congiguration.sensibilitee[1]:=1;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8])));
    end;
if sensibilite11.Checked=true then
    begin
      congiguration.sensibilitee[1]:=2;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
    end;
if sensibilite12.Checked=true then
    begin
      congiguration.sensibilitee[1]:=3;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
    end;
if sensibilite13.Checked=true then
    begin
      congiguration.sensibilitee[1]:=4;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
    end;
if sensibilite14.Checked=true then
    begin
      congiguration.sensibilitee[1]:=5;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
    end;
if sensibilite150.Checked=true then
    begin
      congiguration.sensibilitee[1]:=6;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
    end;
if sensibilite16.Checked=true then
    begin
     congiguration.sensibilitee[1]:=7;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
    end;
if sensibilite17.Checked=true then
    begin
      congiguration.sensibilitee[1]:=8;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
    end;
if sensibilite18.Checked=true then
    begin
      congiguration.sensibilitee[1]:=9;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

    end;

   ComboSensiB[1].ItemIndex:=congiguration.sensibilitee[1];
 changementcalibre1(self);
end;


procedure TForm_FFT_mut_GTI2.changementcalibre1 (Sender:Tobject);
var dHelp :double;
//dHelpdBV : double;
begin
 if ComboSensiB[1].ItemIndex=1 then
        begin
          dHelp := 5;
         // dHelpdBV:=0.025
        end;
  if ComboSensiB[1].ItemIndex=2 then
        begin
          dHelp := 2;
          //dHelpdBV:=0.1
        end;
  if ComboSensiB[1].ItemIndex=3 then
        begin
          dHelp :=  1;
          //dHelpdBV:=0.2
        end;
  if ComboSensiB[1].ItemIndex=4 then
        begin
          dHelp :=  0.5;
          //dHelpdBV:=0.4
        end;
  if ComboSensiB[1].ItemIndex=5 then
        begin
          dHelp :=  0.2;
         // dHelpdBV:=1
        end;
  if ComboSensiB[1].ItemIndex=6 then
        begin
          dHelp :=  0.1;
          //dHelpdBV:=2
        end;

  if ComboSensiB[1].ItemIndex=7 then
        begin
        dHelp :=  50;
        //dHelpdBV:=4
        end;
  if ComboSensiB[1].ItemIndex=8 then
        begin
        dHelp := 20;
      //  dHelpdBV:=10
        end;
  if ComboSensiB[1].ItemIndex=9 then
        begin
        dHelp := 10;
       // dHelpdBV:=20
        end;
   //if calibre3=9 then
     //   begin
       // dHelp := 80.0;
       // dHelpdBV:=40
       // end;

   // SetCh3SensBox.Text := FloatToStr( dHelp );
   { SetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV );}
 {   SetSensitivity( lCh1, @dHelp);
    GetSensitivity( lCh3, @dHelp);}
   if ComboSensiB[1].ItemIndex<7 then GetCh1SensBox.caption := FloatToStr( dHelp ) + ' V/div';
   if ComboSensiB[1].ItemIndex>6 then  GetCh1SensBox.caption := FloatToStr( dHelp ) + ' mV/div';
   // GetCh3SensBoxdB.Text := FloatToStr( dHelpdBV*2 ) + ' dB/div';

   // GetCh3OscSensBox.Text := FloatToStr( dHelp/4 ) + ' V/div';
   {     if volt.Checked or  voltefficace.Checked then
    begin
      sensibilite30.hint:=FloatToStr( dHelp0/8 ) + ' V/div';
      sensibilite31.hint:=FloatToStr( dHelp1/8 ) + ' V/div';
      sensibilite32.hint:=FloatToStr( dHelp2/8 ) + ' V/div';
      sensibilite33.hint:=FloatToStr( dHelp3/8 ) + ' V/div';
      sensibilite34.hint:=FloatToStr( dHelp4/8 ) + ' V/div';
      sensibilite35.hint:=FloatToStr( dHelp5/8 ) + ' V/div';
      sensibilite36.hint:=FloatToStr( dHelp6/8 ) + ' V/div';
      sensibilite37.hint:=FloatToStr( dHelp7/8 ) + ' V/div';
      sensibilite38.hint:=FloatToStr( dHelp8/8 ) + ' V/div';
     // sensibilite19.hint:=FloatToStr( dHelp9/8 ) + ' V/div';
    end
    else
    begin
      sensibilite30.hint:=FloatToStr( dHelpdBV0/8 ) + ' dB/div';
      sensibilite31.hint:=FloatToStr( dHelpdBV1/8 ) + ' dB/div';
      sensibilite32.hint:=FloatToStr( dHelpdBV2/8 ) + ' dB/div';
      sensibilite33.hint:=FloatToStr( dHelpdBV3/8 ) + ' dB/div';
      sensibilite34.hint:=FloatToStr( dHelpdBV4/8 ) + ' dB/div';
      sensibilite35.hint:=FloatToStr( dHelpdBV5/8 ) + ' dB/div';
      sensibilite36.hint:=FloatToStr( dHelpdBV6/8 ) + ' dB/div';
      sensibilite37.hint:=FloatToStr( dHelpdBV7/8 ) + ' dB/div';
      sensibilite38.hint:=FloatToStr( dHelpdBV8/8 ) + ' dB/div';
     // sensibilite39.hint:=FloatToStr( dHelpdBV9/8 ) + ' dB/div';

      end;}
end;

procedure TForm_FFT_mut_GTI2.calibre2Change (Sender: TObject);
var d:integer;
alpha : real;
begin
 d:=8;
alpha:=0.95;

if sensibilite20.Checked=true then
    begin
      congiguration.sensibilitee[2]:=1;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8])));
    end;
if sensibilite21.Checked=true then
    begin
      congiguration.sensibilitee[2]:=2;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
    end;
if sensibilite22.Checked=true then
    begin
      congiguration.sensibilitee[2]:=3;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
    end;
if sensibilite23.Checked=true then
    begin
      congiguration.sensibilitee[2]:=4;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
    end;
if sensibilite24.Checked=true then
    begin
      congiguration.sensibilitee[2]:=5;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
    end;
if sensibilite25.Checked=true then
    begin
      congiguration.sensibilitee[2]:=6;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
    end;
if sensibilite26.Checked=true then
    begin
     congiguration.sensibilitee[2]:=7;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
    end;
if sensibilite27.Checked=true then
    begin
      congiguration.sensibilitee[2]:=8;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
    end;
if sensibilite28.Checked=true then
    begin
      congiguration.sensibilitee[2]:=9;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

    end;

   ComboSensiB[2].ItemIndex:=congiguration.sensibilitee[2];
 changementcalibre2(self);
end;


procedure TForm_FFT_mut_GTI2.changementcalibre2 (Sender:Tobject);
var dHelp:double;
//dHelpdBV : double;
begin
 if ComboSensiB[2].ItemIndex=1 then
        begin
          dHelp := 5;
         // dHelpdBV:=0.025
        end;
  if ComboSensiB[2].ItemIndex=2 then
        begin
          dHelp := 2;
          //dHelpdBV:=0.1
        end;
  if ComboSensiB[2].ItemIndex=3 then
        begin
          dHelp :=  1;
          //dHelpdBV:=0.2
        end;
  if ComboSensiB[2].ItemIndex=4 then
        begin
          dHelp :=  0.5;
          //dHelpdBV:=0.4
        end;
  if ComboSensiB[2].ItemIndex=5 then
        begin
          dHelp :=  0.2;
         // dHelpdBV:=1
        end;
  if ComboSensiB[2].ItemIndex=6 then
        begin
          dHelp :=  0.1;
          //dHelpdBV:=2
        end;
  if ComboSensiB[2].ItemIndex=7 then
        begin
        dHelp :=  50;
        //dHelpdBV:=4
        end;
  if ComboSensiB[2].ItemIndex=8 then
        begin
        dHelp := 20;
      //  dHelpdBV:=10
        end;
  if ComboSensiB[2].ItemIndex=9 then
        begin
        dHelp := 10;
       // dHelpdBV:=20
        end;
   //if calibre3=9 then
     //   begin
       // dHelp := 80.0;
       // dHelpdBV:=40
       // end;

   // SetCh3SensBox.Text := FloatToStr( dHelp );
   { SetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV );}
 {   SetSensitivity( lCh1, @dHelp);
    GetSensitivity( lCh3, @dHelp);}
  //  GetCh2SensBox.Text := FloatToStr( dHelp ) + ' V/div';
     if ComboSensiB[2].ItemIndex<7 then GetCh2SensBox.caption := FloatToStr( dHelp ) + ' V/div';
   if ComboSensiB[2].ItemIndex>6 then  GetCh2SensBox.Caption := FloatToStr( dHelp ) + ' mV/div';


   // GetCh3SensBoxdB.Text := FloatToStr( dHelpdBV*2 ) + ' dB/div';

   // GetCh3OscSensBox.Text := FloatToStr( dHelp/4 ) + ' V/div';
   {     if volt.Checked or  voltefficace.Checked then
    begin
      sensibilite30.hint:=FloatToStr( dHelp0/8 ) + ' V/div';
      sensibilite31.hint:=FloatToStr( dHelp1/8 ) + ' V/div';
      sensibilite32.hint:=FloatToStr( dHelp2/8 ) + ' V/div';
      sensibilite33.hint:=FloatToStr( dHelp3/8 ) + ' V/div';
      sensibilite34.hint:=FloatToStr( dHelp4/8 ) + ' V/div';
      sensibilite35.hint:=FloatToStr( dHelp5/8 ) + ' V/div';
      sensibilite36.hint:=FloatToStr( dHelp6/8 ) + ' V/div';
      sensibilite37.hint:=FloatToStr( dHelp7/8 ) + ' V/div';
      sensibilite38.hint:=FloatToStr( dHelp8/8 ) + ' V/div';
     // sensibilite19.hint:=FloatToStr( dHelp9/8 ) + ' V/div';
    end
    else
    begin
      sensibilite30.hint:=FloatToStr( dHelpdBV0/8 ) + ' dB/div';
      sensibilite31.hint:=FloatToStr( dHelpdBV1/8 ) + ' dB/div';
      sensibilite32.hint:=FloatToStr( dHelpdBV2/8 ) + ' dB/div';
      sensibilite33.hint:=FloatToStr( dHelpdBV3/8 ) + ' dB/div';
      sensibilite34.hint:=FloatToStr( dHelpdBV4/8 ) + ' dB/div';
      sensibilite35.hint:=FloatToStr( dHelpdBV5/8 ) + ' dB/div';
      sensibilite36.hint:=FloatToStr( dHelpdBV6/8 ) + ' dB/div';
      sensibilite37.hint:=FloatToStr( dHelpdBV7/8 ) + ' dB/div';
      sensibilite38.hint:=FloatToStr( dHelpdBV8/8 ) + ' dB/div';
     // sensibilite39.hint:=FloatToStr( dHelpdBV9/8 ) + ' dB/div';

      end;}
end;


procedure TForm_FFT_mut_GTI2.calibre3Change (Sender: TObject);
var d:integer;
alpha : real;
begin
 d:=8;
alpha:=0.95;

if sensibilite30.Checked=true then
    begin
      congiguration.sensibilitee[3]:=1;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8])));
    end;
if sensibilite31.Checked=true then
    begin
      congiguration.sensibilitee[3]:=2;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
    end;
if sensibilite32.Checked=true then
    begin
      congiguration.sensibilitee[3]:=3;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
    end;
if sensibilite33.Checked=true then
    begin
      congiguration.sensibilitee[3]:=4;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
    end;
if sensibilite34.Checked=true then
    begin
      congiguration.sensibilitee[3]:=5;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
    end;
if sensibilite35.Checked=true then
    begin
      congiguration.sensibilitee[3]:=6;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
    end;
if sensibilite36.Checked=true then
    begin
     congiguration.sensibilitee[3]:=7;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
    end;
if sensibilite37.Checked=true then
    begin
      congiguration.sensibilitee[3]:=8;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
    end;
if sensibilite38.Checked=true then
    begin
      congiguration.sensibilitee[3]:=9;
      shape3.top:=shapecalibre3.Top+round((shapecalibre3.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));
      shape3.left:=shapecalibre3.Left+round((shapecalibre3.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

    end;

   ComboSensiB[3].ItemIndex:=congiguration.sensibilitee[3];
 changementcalibre3(self);
end;


procedure TForm_FFT_mut_GTI2.changementcalibre3 (Sender:Tobject);
var dHelp:double;
//dHelpdBV : double;
begin
 if ComboSensiB[3].ItemIndex=1 then
        begin
          dHelp := 5;
         // dHelpdBV:=0.025
        end;
  if ComboSensiB[3].ItemIndex=2 then
        begin
          dHelp := 2;
          //dHelpdBV:=0.1
        end;
  if ComboSensiB[3].ItemIndex=3 then
        begin
          dHelp :=  1;
          //dHelpdBV:=0.2
        end;
  if ComboSensiB[3].ItemIndex=4 then
        begin
          dHelp :=  0.5;
          //dHelpdBV:=0.4
        end;
  if ComboSensiB[3].ItemIndex=5 then
        begin
          dHelp :=  0.2;
         // dHelpdBV:=1
        end;
  if ComboSensiB[3].ItemIndex=6 then
        begin
          dHelp :=  0.1;
          //dHelpdBV:=2
        end;
  if ComboSensiB[3].ItemIndex=7 then
        begin
        dHelp :=  50;
        //dHelpdBV:=4
        end;
  if ComboSensiB[3].ItemIndex=8 then
        begin
        dHelp := 20;
      //  dHelpdBV:=10
        end;
  if ComboSensiB[3].ItemIndex=9 then
        begin
        dHelp := 10;
       // dHelpdBV:=20
        end;
   //if calibre3=9 then
     //   begin
       // dHelp := 80.0;
       // dHelpdBV:=40
       // end;

   // SetCh3SensBox.Text := FloatToStr( dHelp );
   { SetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV );}
 {   SetSensitivity( lCh1, @dHelp);
    GetSensitivity( lCh3, @dHelp);}
   // GetCh3SensBox.Text := FloatToStr( dHelp ) + ' V/div';
      if ComboSensiB[3].ItemIndex<7 then GetCh3SensBox.Caption:= FloatToStr( dHelp ) + ' V/div';
   if ComboSensiB[3].ItemIndex>6 then  GetCh3SensBox.Caption := FloatToStr( dHelp ) + ' mV/div';


   // GetCh3SensBoxdB.Text := FloatToStr( dHelpdBV*2 ) + ' dB/div';

   // GetCh3OscSensBox.Text := FloatToStr( dHelp/4 ) + ' V/div';
   {     if volt.Checked or  voltefficace.Checked then
    begin
      sensibilite30.hint:=FloatToStr( dHelp0/8 ) + ' V/div';
      sensibilite31.hint:=FloatToStr( dHelp1/8 ) + ' V/div';
      sensibilite32.hint:=FloatToStr( dHelp2/8 ) + ' V/div';
      sensibilite33.hint:=FloatToStr( dHelp3/8 ) + ' V/div';
      sensibilite34.hint:=FloatToStr( dHelp4/8 ) + ' V/div';
      sensibilite35.hint:=FloatToStr( dHelp5/8 ) + ' V/div';
      sensibilite36.hint:=FloatToStr( dHelp6/8 ) + ' V/div';
      sensibilite37.hint:=FloatToStr( dHelp7/8 ) + ' V/div';
      sensibilite38.hint:=FloatToStr( dHelp8/8 ) + ' V/div';
     // sensibilite19.hint:=FloatToStr( dHelp9/8 ) + ' V/div';
    end
    else
    begin
      sensibilite30.hint:=FloatToStr( dHelpdBV0/8 ) + ' dB/div';
      sensibilite31.hint:=FloatToStr( dHelpdBV1/8 ) + ' dB/div';
      sensibilite32.hint:=FloatToStr( dHelpdBV2/8 ) + ' dB/div';
      sensibilite33.hint:=FloatToStr( dHelpdBV3/8 ) + ' dB/div';
      sensibilite34.hint:=FloatToStr( dHelpdBV4/8 ) + ' dB/div';
      sensibilite35.hint:=FloatToStr( dHelpdBV5/8 ) + ' dB/div';
      sensibilite36.hint:=FloatToStr( dHelpdBV6/8 ) + ' dB/div';
      sensibilite37.hint:=FloatToStr( dHelpdBV7/8 ) + ' dB/div';
      sensibilite38.hint:=FloatToStr( dHelpdBV8/8 ) + ' dB/div';
     // sensibilite39.hint:=FloatToStr( dHelpdBV9/8 ) + ' dB/div';

      end;}
end;
 
procedure TForm_FFT_mut_GTI2.calibre4Change (Sender: TObject);
var d:integer;
alpha : real;
begin
 d:=8;
alpha:=0.95;

if sensibilite40.Checked=true then
    begin
      congiguration.sensibilitee[4]:=1;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[8])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[8])));
    end;
if sensibilite41.Checked=true then
    begin
      congiguration.sensibilitee[4]:=2;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[7])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[7])));
    end;
if sensibilite42.Checked=true then
    begin
      congiguration.sensibilitee[4]:=3;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[6])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[6])));
    end;
if sensibilite43.Checked=true then
    begin
      congiguration.sensibilitee[4]:=4;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[5])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[5])));
    end;
if sensibilite44.Checked=true then
    begin
      congiguration.sensibilitee[4]:=5;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[4])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[4])));
    end;
if sensibilite45.Checked=true then
    begin
      congiguration.sensibilitee[4]:=6;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[3])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[3])));
    end;
if sensibilite46.Checked=true then
    begin
     congiguration.sensibilitee[4]:=7;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[2])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[2])));
    end;
if sensibilite47.Checked=true then
    begin
      congiguration.sensibilitee[4]:=8;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[1])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[1])));
    end;
if sensibilite48.Checked=true then
    begin
      congiguration.sensibilitee[4]:=9;
      shape4.top:=shapecalibre4.Top+round((shapecalibre4.height-d)/2*(1-alpha*cos(tetasenssibiliteGTI2[0])));
      shape4.left:=shapecalibre4.Left+round((shapecalibre4.width-d)/2*(1-alpha*sin(tetasenssibiliteGTI2[0])));

    end;

   ComboSensiB[4].ItemIndex:=congiguration.sensibilitee[4];
 changementcalibre4(self);
end;


procedure TForm_FFT_mut_GTI2.changementcalibre4 (Sender:Tobject);
var dHelp,dHelpdBV : double;
begin
 if ComboSensiB[4].ItemIndex=1 then
        begin
          dHelp := 5;
         // dHelpdBV:=0.025
        end;
  if ComboSensiB[4].ItemIndex=2 then
        begin
          dHelp := 2;
          //dHelpdBV:=0.1
        end;
  if ComboSensiB[4].ItemIndex=3 then
        begin
          dHelp :=  1;
          //dHelpdBV:=0.2
        end;
  if ComboSensiB[4].ItemIndex=4 then
        begin
          dHelp :=  0.5;
          //dHelpdBV:=0.4
        end;
  if ComboSensiB[4].ItemIndex=5 then
        begin
          dHelp :=  0.2;
         // dHelpdBV:=1
        end;
  if ComboSensiB[4].ItemIndex=6 then
        begin
          dHelp :=  0.1;
          //dHelpdBV:=2
        end;
  if ComboSensiB[4].ItemIndex=7 then
        begin
        dHelp :=  50;
        //dHelpdBV:=4
        end;
  if ComboSensiB[4].ItemIndex=8 then
        begin
        dHelp := 20;
      //  dHelpdBV:=10
        end;
  if ComboSensiB[4].ItemIndex=9 then
        begin
        dHelp := 10;
       // dHelpdBV:=20
        end;
   //if calibre3=9 then
     //   begin
       // dHelp := 80.0;
       // dHelpdBV:=40
       // end;

   // SetCh3SensBox.Text := FloatToStr( dHelp );
   { SetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV );}
 {   SetSensitivity( lCh1, @dHelp);
    GetSensitivity( lCh3, @dHelp);}
  //  GetCh4SensBox.Text := FloatToStr( dHelp ) + ' V/div';

    if ComboSensiB[4].ItemIndex<7 then GetCh4SensBox.caption := FloatToStr( dHelp ) + ' V/div';
   if ComboSensiB[4].ItemIndex>6 then  GetCh4SensBox.Caption := FloatToStr( dHelp ) + ' mV/div';

   // GetCh3SensBoxdB.Text := FloatToStr( dHelpdBV*2 ) + ' dB/div';

   // GetCh3OscSensBox.Text := FloatToStr( dHelp/4 ) + ' V/div';
   {     if volt.Checked or  voltefficace.Checked then
    begin
      sensibilite30.hint:=FloatToStr( dHelp0/8 ) + ' V/div';
      sensibilite31.hint:=FloatToStr( dHelp1/8 ) + ' V/div';
      sensibilite32.hint:=FloatToStr( dHelp2/8 ) + ' V/div';
      sensibilite33.hint:=FloatToStr( dHelp3/8 ) + ' V/div';
      sensibilite34.hint:=FloatToStr( dHelp4/8 ) + ' V/div';
      sensibilite35.hint:=FloatToStr( dHelp5/8 ) + ' V/div';
      sensibilite36.hint:=FloatToStr( dHelp6/8 ) + ' V/div';
      sensibilite37.hint:=FloatToStr( dHelp7/8 ) + ' V/div';
      sensibilite38.hint:=FloatToStr( dHelp8/8 ) + ' V/div';
     // sensibilite19.hint:=FloatToStr( dHelp9/8 ) + ' V/div';
    end
    else
    begin
      sensibilite30.hint:=FloatToStr( dHelpdBV0/8 ) + ' dB/div';
      sensibilite31.hint:=FloatToStr( dHelpdBV1/8 ) + ' dB/div';
      sensibilite32.hint:=FloatToStr( dHelpdBV2/8 ) + ' dB/div';
      sensibilite33.hint:=FloatToStr( dHelpdBV3/8 ) + ' dB/div';
      sensibilite34.hint:=FloatToStr( dHelpdBV4/8 ) + ' dB/div';
      sensibilite35.hint:=FloatToStr( dHelpdBV5/8 ) + ' dB/div';
      sensibilite36.hint:=FloatToStr( dHelpdBV6/8 ) + ' dB/div';
      sensibilite37.hint:=FloatToStr( dHelpdBV7/8 ) + ' dB/div';
      sensibilite38.hint:=FloatToStr( dHelpdBV8/8 ) + ' dB/div';
     // sensibilite39.hint:=FloatToStr( dHelpdBV9/8 ) + ' dB/div';

      end;}
end;


procedure TForm_FFT_mut_GTI2.MenuRegUtilisateurClick(Sender: TObject);
begin

     //stop l'oscillo car rallenti trop l'affichage des enregistrements
     if congiguration.Start=true then
          begin
               if (timer1.enabled) and (@timer1.OnTimer <> nil) then
               begin
                    Timer1.enabled       := False;
                    congiguration.Start  := false;
                    ButtonRunStop.Caption:='Start';
              end;
          end;
          {
          else
          begin
               Timer1.enabled       := True;
               congiguration.Start  :=True;
               ButtonRunStop.Caption:='Stop';

          end;
          }
     Form_FFT_mut_GTI2TransfertRegressiUtilisateur.visible:=true;
     Form_FFT_mut_GTI2TransfertRegressiUtilisateur.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.RetourDEMenuRegUtilisateurClick(Sender: TObject);
begin
     if congiguration.Start=false then
          {begin
               if (timer1.enabled) and (@timer1.OnTimer <> nil) then
               begin
                    Timer1.enabled       := False;
                    congiguration.Start  := false;
                    ButtonRunStop.Caption:='Start';
              end;
          end;

          else}
          begin
               Timer1.enabled       := True;
               congiguration.Start  :=True;
               ButtonRunStop.Caption:='Stop';

          end;


end;



procedure TForm_FFT_mut_GTI2.RegressiDDEClick(Sender: TObject);
begin
    //formDDE.visible:=true;
    //formDDE.BringToFront;
     if sender=menu_TregressiInst_NEWfichier then
     begin
          EnvoieDonneesGTI( congiguration.VoieVisible[1],
                       congiguration.VoieVisible[2],
                       congiguration.VoieVisible[3],
                       congiguration.VoieVisible[4],true);
     end;
     if sender=menu_TregressiInst_NEWpage then
     begin
          EnvoieDonneesGTI( congiguration.VoieVisible[1],
                       congiguration.VoieVisible[2],
                       congiguration.VoieVisible[3],
                       congiguration.VoieVisible[4],false);
     end;
end;

procedure TForm_FFT_mut_GTI2.EnvoieDonneesGTI( ch1,ch2,ch3,ch4,NewFichier:boolean );
var i : integer;
    ligne : string;
 //   zero1,zero2,zero3,zero4: single;
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

     ligne := 'f';
     if ch1 then ligne :=ligne +crTab+'Y1';
     if ch2 then ligne :=ligne +crTab+'Y2';
     if ch3 then ligne :=ligne +crTab+'Y3';
     if ch4 then ligne :=ligne +crTab+'Y4';
     Add(ligne);

     ligne := 'Hz';
     if ch1 then ligne :=ligne +crTab+'V';
     if ch2 then ligne :=ligne +crTab+'V';
     if ch3 then ligne :=ligne +crTab+'V';
     if ch4 then ligne :=ligne +crTab+'V';
     Add(ligne);



     //exemple avec données GTI2/HS3
     freq        :=GetSampleFrequency();
     Recordlength:=GetRecordLength();
     for i:=0 to (Recordlength-1) do
       begin
            ligne :=FloatToStr(freq/2/(recordlength)*i);
                    if ch1 then ligne :=ligne +crTab+FloatToStr(spectre1 [i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(spectre2 [i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(spectre3 [i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(spectre4 [i]);
            Add(ligne);
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






procedure TForm_FFT_mut_GTI2.UniDiffChange (sender: Tobject);
var
i:integer;
begin
    if  sender=MCV[0,0] then         //ALL UNIPOLAIRE
    begin

        MCV[0,0].checked:=true;
        MCV[1,0].checked:=true;
        MCV[2,0].checked:=true;
        MCV[3,0].checked:=true;
        MCV[4,0].checked:=true;
        congiguration.Unipolaire[1]:=true;
        congiguration.Unipolaire[2]:=true;
        congiguration.Unipolaire[3]:=true;
        congiguration.Unipolaire[4]:=true;
    end;

    if  sender=MCV[0,1] then        //ALL DIFFerentiel
    begin
        MCV[0,1].checked:=true;//CheckBoxY1Visible.Caption:='YD0';
        MCV[1,1].checked:=true;
        MCV[2,1].checked:=true;
        MCV[3,1].checked:=true;
        MCV[4,1].checked:=true;
        congiguration.Unipolaire[1]:=false;
        congiguration.Unipolaire[2]:=false;
        congiguration.Unipolaire[3]:=false;
        congiguration.Unipolaire[4]:=false;
    end;

    for i:=1 to 4 do              //Yi UNI ou Diff
    begin
    if sender=MCV[i,0] then begin MCV[i,0].Checked:=true; congiguration.Unipolaire[i]:=true;  end;
    if sender=MCV[i,1] then begin MCV[i,1].Checked:=true; congiguration.Unipolaire[i]:=false;  end;
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


procedure TForm_FFT_mut_GTI2.MenuTimeOutClick(Sender: TObject);
begin
  {  if sender=menutimeout1 then begin CompteurTIMEOUT:=5;                         menutimeout1.Checked:=true; congiguration.TimeOut:=1;end;
    if sender=menutimeout2 then begin CompteurTIMEOUT:=10;                        menutimeout2.Checked:=true; congiguration.TimeOut:=2;end;
    if sender=menutimeout3 then begin CompteurTIMEOUT:=20;                        menutimeout3.Checked:=true; congiguration.TimeOut:=3;end;

    form_FFT_mut_TIMEOUT.TrackBarTIMEOUT.position:=CompteurTIMEOUT;

    if sender=menutimeout4 then begin CompteurTIMEOUT:=form_FFT_mut_TIMEOUT.TrackBarTIMEOUT.position;  menutimeout4.Checked:=true; congiguration.TimeOut:=4;end;
   }// if sender=menuTIMEOUEUTILISATEURREGLAGE then begin form_FFT_mut_TIMEOUT.Visible:=true; menutimeout4.Checked:=true; congiguration.TimeOut:=4;end;
    congiguration.timeoutVALEURutilisateur:=form_FFT_mut_TIMEOUT.TrackBarTIMEOUT.position;
    //ScrollBar1.Position:=CompteurTIMEOUT;

end;

procedure TForm_FFT_mut_GTI2.MenuiconeECRANClick(Sender: TObject);
var i:integer;
begin

    //LabelFreqEnd.Top:={10+PaintboxEcran.Height+PaintboxXY.Height+LabelFreqEnd.Height}Form_FFT_mut_GTI2.Height-LabelFreqEnd.Height-50;
   // LabelFreqEnd.Top:=Form_FFT_mut_GTI2.Height-LabelFreqEnd.Height;
    if Normal.Checked=true then
    begin
        ecranPV.Checked:=true;
        congiguration.affichage:=2;
        GetSampleFreqEdit.Visible:=false;
    end
    else

  //  if ecranPV.Checked=true then
    begin
        Normal.Checked:=true;

        GetSampleFreqEdit.Visible:=false;
        congiguration.affichage:=1;

    end;
    for i:=1 to 4 do          //retour de 1 écran par voies avec la sensib a 5V/div PE vers un autre mode
    begin
        if congiguration.affichage<>2 then
        begin
            if ComboSensiB[i].ItemIndex=0 then ComboSensiB[i].ItemIndex:=1;
            congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
            // LabelFreqEnd.Top:={10+PaintboxEcran.Height+PaintboxXY.Height+LabelFreqEnd.Height}Form_FFT_mut_GTI2.Height-LabelFreqEnd.Height-50;
        end
        else congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
    end;
    Ychange(sender);
    FormResize(Sender);
    TriggerBARREChange (sender);
        if congiguration.Acumul=true then
        begin
            menuAcumul.checked      :=false;
            congiguration.Acumul:=false;
            Labelacquisition.Visible:=False;
        end

end;



procedure TForm_FFT_mut_GTI2.Menuicone2ECRANClick(Sender: TObject);
var i:integer;
begin

    if (Normal.Checked=true) or (ecranPV.Checked=true) then
    begin
        TempoET_XY.Checked:=true;
        congiguration.affichage:=3;
        GetSampleFreqEdit.Visible:=true;

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
    if congiguration.Acumul=true then
        begin
            menuAcumul.checked      :=false;
            congiguration.Acumul:=false;
            Labelacquisition.Visible:=False;
        end  ;
    FormResize(Sender);
    TriggerBARREChange (sender);
end;



procedure TForm_FFT_mut_GTI2.MenuECRANClick(Sender: TObject);
var i:integer;
begin
    if sender=Normal then
    begin
        Normal.Checked:=true;
        congiguration.affichage:=1;
        GetSampleFreqEdit.Visible:=false;
       // CheckBoxXY.Visible:=true;
    end;

    if sender=ecranPV then
    begin
        ecranPV.Checked:=true;
        congiguration.affichage:=2;
        GetSampleFreqEdit.Visible:=false;
//        CheckBoxXY.Visible:=true;
    end;

    if sender=TempoET_XY then
    begin
        TempoET_XY.Checked:=true;
        congiguration.affichage:=3;
        GetSampleFreqEdit.Visible:=true;
//        if  CheckBoxXY.Checked=true then CheckBoxXY.Checked:=false;
  //      CheckBoxXY.Visible:=false;
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
    if congiguration.Acumul=true then
        begin
            menuAcumul.checked      :=false;
            congiguration.Acumul:=false;
            Labelacquisition.Visible:=False;
        end;
    FormResize(Sender);
    TriggerBARREChange (sender);
end;

procedure TForm_FFT_mut_GTI2.MenuDECALAGEZEROClick(Sender: TObject);
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

procedure TForm_FFT_mut_GTI2.MenuOPTIONSClick(Sender: TObject);
begin
    {
    MULTI.checked             :=false;
    if congiguration.ConfigOscillo=1 then menuEnregistrement.checked:=false;
    menuMONOCOUP.checked      :=false;

    if congiguration.ConfigOscillo=1 then GroupBoxEnregistrement.Visible:=false;
    PageControlMesures.Visible    :=false;
    GroupBoxMONOCOUP.Visible      :=false;
    }
  { if sender=MULTI then
    begin
        if congiguration.MULTI=true then
        begin
            MULTI.checked:=false;
            congiguration.MULTI:=false;
            PageControlMesures.Visible:=false;
        end
        else
        begin
            MULTI.checked:=true;
            congiguration.MULTI:=true;
            PageControlMesures.Visible:=true;

            if (congiguration.ConfigOscillo=1) then
            begin
            menuEnregistrement.checked:=false;
            congiguration.Enregistrement  :=false;
            GroupBoxEnregistrement.Visible:=false;
//            menuMONOCOUP.checked      :=false;
   //        congiguration.MONOCOUP        :=false;
 //           GroupBoxMONOCOUP.Visible      :=false;
          //  congiguration.MULTI           :=false;
          //  MULTI.checked                 :=false;
           // PageControlMesures.Visible    :=false;
            end;
            if (congiguration.ConfigOscillo=2) then
            begin
            //menuEnregistrement.checked:=false;
            //congiguration.Enregistrement  :=false;
            //GroupBoxEnregistrement.Visible:=false;
   //         menuMONOCOUP.checked      :=false;
        //    congiguration.MONOCOUP        :=false;
          //  GroupBoxMONOCOUP.Visible      :=false;
        //    congiguration.MULTI           :=false;
          //  MULTI.checked                 :=false;
           // PageControlMesures.Visible    :=false;
            end;

        end;
    end;    }

    if sender=menuEnregistrement then
    begin
        if congiguration.Enregistrement=true then
        begin
            menuEnregistrement.checked:=false;
            congiguration.Enregistrement:=false;
            GroupBoxEnregistrement.Visible:=false;
        end
        else
        begin
            menuEnregistrement.checked:=true;
            congiguration.Enregistrement:=true;
            GroupBoxEnregistrement.Visible:=true;

            if congiguration.ConfigOscillo=1 then
            begin
            //menuEnregistrement.checked:=false;
            //congiguration.Enregistrement  :=false;
            //GroupBoxEnregistrement.Visible:=false;
    //        menuMONOCOUP.checked          :=false;
      //      congiguration.MONOCOUP        :=false;
       //     GroupBoxMONOCOUP.Visible      :=false;
            congiguration.MULTI           :=false;
        //    MULTI.checked                 :=false;
            PageControlMesures.Visible    :=false;
            end;
        end;
    end;

{   if sender=menuMONOCOUP then
    begin
        if congiguration.MONOCOUP=true then
        begin
            menuMONOCOUP.checked      :=false;
            congiguration.MONOCOUP:=false;
            GroupBoxMONOCOUP.Visible      :=false;
            MenuTimeOutClick(Sender);
            Timer1.enabled    := true;

        end
        else
        begin
            menuMONOCOUP.checked:=true;
            congiguration.MONOCOUP:=true;
            GroupBoxMONOCOUP.Visible:=true;

            if (congiguration.ConfigOscillo=1) then
            begin
            menuEnregistrement.checked:=false;
            congiguration.Enregistrement  :=false;
            GroupBoxEnregistrement.Visible:=false;
           // menuMONOCOUP.checked      :=false;
           // congiguration.MONOCOUP        :=false;
           // GroupBoxMONOCOUP.Visible      :=false;
            congiguration.MULTI           :=false;
            MULTI.checked                 :=false;
          //  PageControlMesures.Visible    :=false;
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
       //     PageControlMesures.Visible    :=false;
            end;
        end;
    end;
 }
    if sender=menuAcumul then
    begin
        if congiguration.Acumul=true then
        begin
            menuAcumul.checked      :=false;
            congiguration.Acumul:=false;
            Labelacquisition.Visible:=False;
        end
        else
        begin
            menuAcumul.checked:=true;
            congiguration.Acumul:=true;
            Labelacquisition.Visible:=True;
        end;
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





procedure TForm_FFT_mut_GTI2.MenuConfigCOULEURSClick(Sender: TObject);
begin

//Form_FFT_mut_ConfigCouleursOscilloGTI2.visible:=true;
//Form_FFT_mut_ConfigCouleursOscilloGTI2.BringToFront;


FormConfigCouleursFFTGTI2BLEU.visible:=true;
FormConfigCouleursFFTGTI2BLEU.BringToFront;;
end;


procedure TForm_FFT_mut_GTI2.MenuChargerConfigFichier(Sender: TObject);
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
    Form_FFT_mut_GTI2.Top     := Ini.ReadInteger( 'Form', 'Top', 0 );
    Form_FFT_mut_GTI2.Left    := Ini.ReadInteger( 'Form', 'Left', 0 );
    Form_FFT_mut_GTI2.Height  := Ini.ReadInteger( 'Form', 'Height', 800 );
    Form_FFT_mut_GTI2.Width   := Ini.ReadInteger( 'Form', 'Width', 600 );



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

    congiguration.VoieVisible[1]:=Ini.ReadBool   ( 'Config', 'VoieVisible1'  , true);
    congiguration.VoieVisible[2]:=Ini.ReadBool   ( 'Config', 'VoieVisible2'  , true);
    congiguration.VoieVisible[3]:=Ini.ReadBool   ( 'Config', 'VoieVisible3'  , true);
    congiguration.VoieVisible[4]:=Ini.ReadBool   ( 'Config', 'VoieVisible4'  , true);


    congiguration.couleurs[0]   :=Ini.ReadInteger( 'Config', 'couleur0'      , clblack);
    congiguration.couleurs[1]   :=Ini.ReadInteger( 'Config', 'couleur1'      , clFuchsia);
    congiguration.couleurs[2]   :=Ini.ReadInteger( 'Config', 'couleur2'      , cllime);
    congiguration.couleurs[3]   :=Ini.ReadInteger( 'Config', 'couleur3'      , clyellow);
    congiguration.couleurs[4]   :=Ini.ReadInteger( 'Config', 'couleur4'      , clred);
    congiguration.couleurs[5]   :=Ini.ReadInteger( 'Config', 'couleur5'      , clsilver);


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

    congiguration.DecalZeros    :=Ini.ReadBool   ( 'Config', 'DecalZeros'    , false);

    congiguration.ValeursDecalZERO[1]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO1', 50);
    congiguration.ValeursDecalZERO[2]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO2', 50);
    congiguration.ValeursDecalZERO[3]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO3', 50);
    congiguration.ValeursDecalZERO[4]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO4', 50);

    congiguration.MULTI         :=Ini.ReadBool   ( 'Config', 'MULTI '         , false );
    congiguration.Enregistrement:=Ini.ReadBool   ( 'Config', 'Enregistrement ', false);
    congiguration.MONOCOUP      :=Ini.ReadBool   ( 'Config', 'MONOCOUP '      , false );

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



procedure TForm_FFT_mut_GTI2.MenuEnregistrerConfigFichier(Sender: TObject);
var
    ini:TInifile;
begin

     SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
     SaveDialog1.FileName:='*.CL3';
     if SaveDialog1.Execute then Ini := TIniFile.Create(  SaveDialog1.FileName  );

try
    Ini.WriteInteger( 'Form', 'Top'   , Form_FFT_mut_GTI2.Top);
    Ini.WriteInteger( 'Form', 'Left'  , Form_FFT_mut_GTI2.Left);
    Ini.WriteInteger( 'Form', 'Height', Form_FFT_mut_GTI2.Height);
    Ini.WriteInteger( 'Form', 'Width' , Form_FFT_mut_GTI2.Width);

    {
    Ini.WriteString( 'Form', 'Caption', Caption );
    Ini.WriteBool( 'Form', 'InitMax', WindowState = wsMaximized );
    }

    Ini.WriteInteger( 'Config', 'Trigger'       , congiguration.Trigger);
    Ini.WriteInteger( 'Config', 'Front'         , congiguration.front);
    Ini.WriteFloat  ( 'Config', 'Level'         , congiguration.Level);

    Ini.WriteBool   ( 'Config', 'VoieVisible1'  , congiguration.VoieVisible[1]);
    Ini.WriteBool   ( 'Config', 'VoieVisible2'  , congiguration.VoieVisible[2]);
    Ini.WriteBool   ( 'Config', 'VoieVisible3'  , congiguration.VoieVisible[3]);
    Ini.WriteBool   ( 'Config', 'VoieVisible4'  , congiguration.VoieVisible[4]);

    Ini.WriteInteger( 'Config', 'couleur0'      , congiguration.couleurs[0]);
    Ini.WriteInteger( 'Config', 'couleur1'      , congiguration.couleurs[1]);
    Ini.WriteInteger( 'Config', 'couleur2'      , congiguration.couleurs[2]);
    Ini.WriteInteger( 'Config', 'couleur3'      , congiguration.couleurs[3]);
    Ini.WriteInteger( 'Config', 'couleur4'      , congiguration.couleurs[4]);
    Ini.WriteInteger( 'Config', 'couleur5'      , congiguration.couleurs[5]);

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

    Ini.WriteBool   ( 'Config', 'DecalZeros'    , congiguration.DecalZeros);

    Ini.WriteInteger( 'Config', 'ValeursDecalZERO1', congiguration.ValeursDecalZERO[1]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO2', congiguration.ValeursDecalZERO[2]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO3', congiguration.ValeursDecalZERO[3]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO4', congiguration.ValeursDecalZERO[4]);

    Ini.WriteBool   ( 'Config', 'MULTI '         , congiguration.MULTI );
    Ini.WriteBool   ( 'Config', 'Enregistrement ', congiguration.Enregistrement );
    Ini.WriteBool   ( 'Config', 'MONOCOUP '      , congiguration.MONOCOUP );

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






procedure TForm_FFT_mut_GTI2.MenuChargerConfig(Sender: TObject);
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
    Form_FFT_mut_GTI2.Top     := Ini.ReadInteger( 'Form', 'Top', 0 );
    Form_FFT_mut_GTI2.Left    := Ini.ReadInteger( 'Form', 'Left', 0 );
    Form_FFT_mut_GTI2.Height  := Ini.ReadInteger( 'Form', 'Height', 800 );
    Form_FFT_mut_GTI2.Width   := Ini.ReadInteger( 'Form', 'Width', 600 );



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


    congiguration.couleurs[0]   :=Ini.ReadInteger( 'Config', 'couleur0'      , clblack);
    congiguration.couleurs[1]   :=Ini.ReadInteger( 'Config', 'couleur1'      , clFuchsia);
    congiguration.couleurs[2]   :=Ini.ReadInteger( 'Config', 'couleur2'      , cllime);
    congiguration.couleurs[3]   :=Ini.ReadInteger( 'Config', 'couleur3'      , clyellow);
    congiguration.couleurs[4]   :=Ini.ReadInteger( 'Config', 'couleur4'      , clred);
    congiguration.couleurs[5]   :=Ini.ReadInteger( 'Config', 'couleur5'      , clsilver);


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

    congiguration.DecalZeros    :=Ini.ReadBool   ( 'Config', 'DecalZeros'    , false);

    congiguration.ValeursDecalZERO[1]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO1', 50);
    congiguration.ValeursDecalZERO[2]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO2', 50);
    congiguration.ValeursDecalZERO[3]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO3', 50);
    congiguration.ValeursDecalZERO[4]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO4', 50);

    congiguration.MULTI         :=Ini.ReadBool   ( 'Config', 'MULTI '         , false );
    congiguration.Enregistrement:=Ini.ReadBool   ( 'Config', 'Enregistrement ', false);
    congiguration.MONOCOUP      :=Ini.ReadBool   ( 'Config', 'MONOCOUP '      , false );

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

procedure TForm_FFT_mut_GTI2.MenuEnregistrerConfig(Sender: TObject{; var Action :TCloseAction});
var
  Ini: TIniFile;
begin
 // Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+ 'OscilloGTI2.INI'  );
  try
    Ini.WriteInteger( 'Form', 'Top'   , Form_FFT_mut_GTI2.Top);
    Ini.WriteInteger( 'Form', 'Left'  , Form_FFT_mut_GTI2.Left);
    Ini.WriteInteger( 'Form', 'Height', Form_FFT_mut_GTI2.Height);
    Ini.WriteInteger( 'Form', 'Width' , Form_FFT_mut_GTI2.Width);

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
    Ini.WriteInteger( 'Config', 'couleur5'      , congiguration.couleurs[5]);

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

    Ini.WriteBool   ( 'Config', 'DecalZeros'    , congiguration.DecalZeros);

    Ini.WriteInteger( 'Config', 'ValeursDecalZERO1', congiguration.ValeursDecalZERO[1]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO2', congiguration.ValeursDecalZERO[2]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO3', congiguration.ValeursDecalZERO[3]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO4', congiguration.ValeursDecalZERO[4]);

    Ini.WriteBool   ( 'Config', 'MULTI '         , congiguration.MULTI );
    Ini.WriteBool   ( 'Config', 'Enregistrement ', congiguration.Enregistrement );
    Ini.WriteBool   ( 'Config', 'MONOCOUP '      , congiguration.MONOCOUP );

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




procedure TForm_FFT_mut_GTI2.MenuConfigOscilloClick(Sender: TObject);
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
        Form_FFT_mut_GTI2.width:=800;
        Form_FFT_mut_GTI2.height:=600;
        GroupBoxEnregistrement.Top:=424;
   end;

   if congiguration.ConfigOscillo=2 then
   begin
        ConfigOscilo1024768.Checked:=true;
        Form_FFT_mut_GTI2.width:=1024;
        Form_FFT_mut_GTI2.height:=768;
        GroupBoxEnregistrement.Top:=536;
   end;

   if congiguration.ConfigOscillo=3 then
   begin
        ConfigOscilo1280960.Checked:=true;
        Form_FFT_mut_GTI2.width:=1280;
        Form_FFT_mut_GTI2.height:=960;
        GroupBoxEnregistrement.Top:=424;
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


procedure TForm_FFT_mut_GTI2.MenuRESETconfigClick(Sender: TObject);
begin
     resetConfiguration (sender);
     ValidationConfiguration (sender);
end;


procedure TForm_FFT_mut_GTI2.TriggerChange (sender: Tobject);
var x: integer;
ValeurrealOrdonnee:double;
Curseur_Ordonnee:integer;
i:integer;
begin

     if sender=CheckBoxPreTrig then
     begin
          if CheckBoxPreTrig.Checked=true  then congiguration.PreTrig:=true  ;
          if CheckBoxPreTrig.Checked=false then congiguration.PreTrig:=false ;
     end;



     for i:=0 to 4 do
     begin
        if sender=TRadioButTriggerMode[i]then
        begin
             if TRadioButTriggerMode[i].checked=true   then congiguration.Trigger:=i;
        end;
     end;

     if TRadioButtonFront[1].checked=true    then congiguration.front:=1;
     if TRadioButtonFront[0].checked=true    then congiguration.front:=0;

     if sender=ScrollBarLevelTrigger then
     begin
         congiguration.Level:=(4095-ScrollBarLevelTrigger.position-2048)*(30/4096);
         LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
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
  { for i:=0 to 4 do
     begin
        if sender=TRadioButTriggerMode[i]then
        begin
             if TRadioButTriggerMode[i].checked=true   then congiguration.Trigger:=i;
        end;
     end;

     if TRadioButtonFront[1].checked=true    then congiguration.front:=1;
     if TRadioButtonFront[0].checked=true    then congiguration.front:=0;

     if sender=ScrollBarLevelTrigger then
     begin
         congiguration.Level:=(4095-ScrollBarLevelTrigger.position-2048)*(15/2047);
         LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
         //TriggerBARREChange (sender);
     end;

     if sender=Button0LEVEL then
     begin
        ScrollBarLevelTrigger.position:=2048;
        congiguration.Level:=0;
        LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
     end;

     TriggerBARREChange (sender);
     ValidConfigINTERFACE_GTI2(sender); }
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


procedure TForm_FFT_mut_GTI2.TrackBar1Change(Sender: TObject);
var lSample : dword;
 dwLength,i,d,j    : dword;
    sCurrLength : string;

begin
//changement:=True;
           if TrackBar1.Position=0 then
            begin
              lSample :=8192;
              expo := 13;
              delta:= 8;
              progressbar2.Position:=3;
            end;
           if TrackBar1.Position=1 then
            begin
              lsample:=4096;
              expo := 12;
              delta:= 4;
              progressbar2.Position:=2;
            end;
           if TrackBar1.Position=2 then
            begin
              lSample :=2048;
              expo := 11;
              delta:= 2;
              progressbar2.Position:=1;
            end;
           if TrackBar1.Position=3 then
             begin
              lsample:=1024;
              expo := 10;
              delta := 1;
              progressbar2.Position:=0;
             end;
// resolutionplus.visible:=true;
 Recordlengthbox.text:= IntToStr (lSample);
 dwLength := GetRecordlength;

 sCurrLength := FloatToStr( dwlength );
 if Recordlengthbox.Text <> sCurrLength then
 begin
  rLengthOld :=dwLength;
   dwLength := strToint( RecordLengthBox.Text );
   SetRecordLength( dwLength );
  SetPostSamples( dwLength );
  changement:=True;
 end;
 //SetPostSamples( dwLength );
expo2:=expo-2;
for i:=1 to expo do
     begin
       d:=1 shl (i-1);
       for j:=1 to d do
       begin
         indice[j]:=indice[j]*2;
         indice[j+d]:=indice[j]+1;
       end;
     end;
for i:=1 to expo2 do
     begin
       d:=1 shl (i-1);
       for j:=1 to d do
       begin
         indice2[j]:=indice2[j]*2;
         indice2[j+d]:=indice2[j]+1;
       end;
     end;
     NF4:=1 shl (expo2);
     NF3:=2*NF4-1;
     NF2:=NF4*4;
end;

procedure TForm_FFT_mut_GTI2.TriggerBARREChange (sender: Tobject);
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
        PaintBoxTRIGlevel.Height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-4-16;
        PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
        end;

        if  congiguration.VoieVisible[congiguration.Trigger]=true  then
        AffichageBarreTrig(PaintBoxTRIGlevel);

    end; {else if congiguration.Trigger=0}


end;


procedure TForm_FFT_mut_GTI2.YChange (sender: Tobject);
var
x,i,a : integer;
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
      //    a:=congiguration.NbVoiesVisible;

          if (sender=TRadioButtonYxSondeX1[i]) or (sender=TRadioButtonYxSondeX10[i])then
          begin
              if TRadioButtonYxSondeX1[i].Checked then congiguration.SondeVoie[i]:=false else congiguration.SondeVoie[i]:=true ;
              if congiguration.SondeVoie[i]=false then x:=1 else x:=10;
              textesondes (X,ComboSensiB[i]);
          end;

        {  if sender=TCheckBoxINVCH[i] then
          begin
              congiguration.Invertion[i]:=TCheckBoxINVCH[i].Checked;
          end; }

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

       Labelwarning1.Visible:=False;
       LabelWARNING2.Visible:=false;
       LabelWARNING3.Visible:=false;
       LabelWARNING4.Visible:=false;
end;




procedure TForm_FFT_mut_GTI2.XChange (sender: Tobject);
var d:integer;
alpha:real;
begin
d:=8;
alpha:=0.95;
    if sender=ScrollBarBDT then
    begin
        congiguration.BaseDetemps:=ScrollBarBDT.Position;
        if congiguration.BaseDetemps=1 then RadioButtonBDT12.Checked:=true;
        if congiguration.BaseDetemps=2 then RadioButtonBDT11.Checked:=true;
        if congiguration.BaseDetemps=3 then RadioButtonBDT10.Checked:=true;
        if congiguration.BaseDetemps=4 then RadioButtonBDT9.Checked:=true;
        if congiguration.BaseDetemps=5 then RadioButtonBDT8.Checked:=true;
        if congiguration.BaseDetemps=6 then RadioButtonBDT7.Checked:=true;
        if congiguration.BaseDetemps=7 then RadioButtonBDT6.Checked:=true;
        if congiguration.BaseDetemps=8 then RadioButtonBDT5.Checked:=true;
        if congiguration.BaseDetemps=9 then RadioButtonBDT4.Checked:=true;
        if congiguration.BaseDetemps=10 then RadioButtonBDT3.Checked:=true;
        if congiguration.BaseDetemps=11 then RadioButtonBDT2.Checked:=true;
        if congiguration.BaseDetemps=12 then RadioButtonBDT1.Checked:=true;
    end
    else
    begin
        if RadioButtonBDT1.Checked=true then
        begin
          congiguration.BaseDetemps:=12;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[11])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[11])));
          GetFreqPerDiv.Text:='500 kHz/div';
          LabelFreq1.Caption:='0,5 MHz';
          LabelFreq2.Caption:=' 1 MHz';
          LabelFreq3.Caption:='1,5 MHz';
          LabelFreq4.Caption:=' 2 MHz';
          LabelFreq5.Caption:='2,5 MHz';
          LabelFreq6.Caption:=' 3 MHz';
          LabelFreq7.Caption:='3,5 MHz';
          LabelFreq8.Caption:=' 4 MHz';
          LabelFreq9.Caption:='4,5 MHz';
          LabelFreqEnd.Caption:=' 5 MHz';
          GetSampleFreqEdit.Text:='2 µs/div';
        end;
        if RadioButtonBDT2.Checked=true then
        begin
          congiguration.BaseDetemps:=11;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[10])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[10])));
          GetFreqPerDiv.Text:='250 kHz/div';
          LabelFreq1.Caption:='0,25 MHz';
          LabelFreq2.Caption:='0,5 MHz';
          LabelFreq3.Caption:='0,75 MHz';
          LabelFreq4.Caption:=' 1 MHz';
          LabelFreq5.Caption:='1,25 MHz';
          LabelFreq6.Caption:='1,5 MHz';
          LabelFreq7.Caption:='1,75 MHz';
          LabelFreq8.Caption:=' 2 MHz';
          LabelFreq9.Caption:='2,25 MHz';
          LabelFreqEnd.Caption:='2,5 MHz';
          GetSampleFreqEdit.Text:='4 µs/div';
       end;
        if RadioButtonBDT3.Checked=true then
        begin
          congiguration.BaseDetemps:=10;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[9])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[9])));
          GetFreqPerDiv.Text:='100 kHz/div';
          LabelFreq1.Caption:='100 kHz';
          LabelFreq2.Caption:='200 kHz';
          LabelFreq3.Caption:='300 kHz';
          LabelFreq4.Caption:='400 kHz';
          LabelFreq5.Caption:='500 kHz';
          LabelFreq6.Caption:='600 kHz';
          LabelFreq7.Caption:='700 kHz';
          LabelFreq8.Caption:='800 kHz';
          LabelFreq9.Caption:='900 kHz';
          LabelFreqEnd.Caption:='1 MHz';
          GetSampleFreqEdit.Text:='10 µs/div';
        end;
        if RadioButtonBDT4.Checked=true then
        begin
          congiguration.BaseDetemps:=9;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[8])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[8])));
          GetFreqPerDiv.Text:='50 kHz/div';
          LabelFreq1.Caption:='50 kHz';
          LabelFreq2.Caption:='100 kHz';
          LabelFreq3.Caption:='150 kHz';
          LabelFreq4.Caption:='200 kHz';
          LabelFreq5.Caption:='250 kHz';
          LabelFreq6.Caption:='300 kHz';
          LabelFreq7.Caption:='350 kHz';
          LabelFreq8.Caption:='400 kHz';
          LabelFreq9.Caption:='450 kHz';
          LabelFreqEnd.Caption:='500 kHz';
          GetSampleFreqEdit.Text:='20 µs/div';
        end;
        if RadioButtonBDT5.Checked=true then
        begin
          congiguration.BaseDetemps:=8;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[7])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[7])));
          GetFreqPerDiv.Text:='25 kHz/div';
          LabelFreq1.Caption:='25 kHz';
          LabelFreq2.Caption:='50 kHz';
          LabelFreq3.Caption:='75 kHz';
          LabelFreq4.Caption:='100 kHz';
          LabelFreq5.Caption:='125 kHz';
          LabelFreq6.Caption:='150 kHz';
          LabelFreq7.Caption:='175 kHz';
          LabelFreq8.Caption:='200 kHz';
          LabelFreq9.Caption:='225 kHz';
          LabelFreqEnd.Caption:='250 kHz';
          GetSampleFreqEdit.Text:='40 µs/div';
        end;
        if RadioButtonBDT6.Checked=true then
        begin
          congiguration.BaseDetemps:=7;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[6])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[6])));
          GetFreqPerDiv.Text:='10 kHz/div';
          LabelFreq1.Caption:='10 kHz';
          LabelFreq2.Caption:='20 kHz';
          LabelFreq3.Caption:='30 kHz';
          LabelFreq4.Caption:='40 kHz';
          LabelFreq5.Caption:='50 kHz';
          LabelFreq6.Caption:='60 kHz';
          LabelFreq7.Caption:='70 kHz';
          LabelFreq8.Caption:='80 kHz';
          LabelFreq9.Caption:='90 kHz';
          LabelFreqEnd.Caption:='100 kHz';
          GetSampleFreqEdit.Text:='100 µs/div';
        end;
        if RadioButtonBDT7.Checked=true then
        begin
          congiguration.BaseDetemps:=6;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[5])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[5])));
          GetFreqPerDiv.Text:='5 kHz/div';
          LabelFreq1.Caption:='5 kHz';
          LabelFreq2.Caption:='10 kHz';
          LabelFreq3.Caption:='15 kHz';
          LabelFreq4.Caption:='20 kHz';
          LabelFreq5.Caption:='25 kHz';
          LabelFreq6.Caption:='30 kHz';
          LabelFreq7.Caption:='35 kHz';
          LabelFreq8.Caption:='40 kHz';
          LabelFreq9.Caption:='45 kHz';
          LabelFreqEnd.Caption:='50 kHz';
          GetSampleFreqEdit.Text:='0,2 ms/div';
        end;
        if RadioButtonBDT8.Checked=true then
        begin
          congiguration.BaseDetemps:=5;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[4])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[4])));
          GetFreqPerDiv.Text:='2,5 kHz/div';
          LabelFreq1.Caption:='2,5 kHz';
          LabelFreq2.Caption:=' 5 kHz';
          LabelFreq3.Caption:='7,5 kHz';
          LabelFreq4.Caption:=' 10 kHz';
          LabelFreq5.Caption:='12,5 kHz';
          LabelFreq6.Caption:=' 15 kHz';
          LabelFreq7.Caption:='17,5 kHz';
          LabelFreq8.Caption:=' 20 kHz';
          LabelFreq9.Caption:='22,5 kHz';
          LabelFreqEnd.Caption:=' 25 kHz';
          GetSampleFreqEdit.Text:='0,4 ms/div';
        end;
        if RadioButtonBDT9.Checked=true then
        begin
          congiguration.BaseDetemps:=4;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[3])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[3])));
          GetFreqPerDiv.Text:='1 kHz/div';
          LabelFreq1.Caption:='1 kHz';
          LabelFreq2.Caption:='2 kHz';
          LabelFreq3.Caption:='3 kHz';
          LabelFreq4.Caption:='4 kHz';
          LabelFreq5.Caption:='5 kHz';
          LabelFreq6.Caption:='6 kHz';
          LabelFreq7.Caption:='7 kHz';
          LabelFreq8.Caption:='8 kHz';
          LabelFreq9.Caption:='9 kHz';
          LabelFreqEnd.Caption:='10 kHz';
          GetSampleFreqEdit.Text:='1 ms/div';
        end;
        if RadioButtonBDT10.Checked=true then
        begin
          congiguration.BaseDetemps:=3;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[2])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[2])));
          GetFreqPerDiv.Text:='500 Hz/div';
          LabelFreq1.Caption:='0,5 kHz';
          LabelFreq2.Caption:=' 1 kHz';
          LabelFreq3.Caption:='1,5 kHz';
          LabelFreq4.Caption:=' 2 kHz';
          LabelFreq5.Caption:='2,5 kHz';
          LabelFreq6.Caption:=' 3 kHz';
          LabelFreq7.Caption:='3,5 kHz';
          LabelFreq8.Caption:=' 4 kHz';
          LabelFreq9.Caption:='4,5 kHz';
          LabelFreqEnd.Caption:=' 5 kHz';
          GetSampleFreqEdit.Text:='2 ms/div';
        end;
        if RadioButtonBDT11.Checked=true then
        begin
          congiguration.BaseDetemps:=2;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[1])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[1])));
          GetFreqPerDiv.Text:='250 Hz/div';
          LabelFreq1.Caption:='250 Hz';
          LabelFreq2.Caption:='500 Hz';
          LabelFreq3.Caption:='750 Hz';
          LabelFreq4.Caption:=' 1 kHz';
          LabelFreq5.Caption:='1,25 kHz';
          LabelFreq6.Caption:='1,5 kHz';
          LabelFreq7.Caption:='1,75 kHz';
          LabelFreq8.Caption:='  2 kHz';
          LabelFreq9.Caption:='2,25 kHz';
          LabelFreqEnd.Caption:='2,5 kHz';
          GetSampleFreqEdit.Text:='4 ms/div';
        end;
        if RadioButtonBDT12.Checked=true then
        begin
          congiguration.BaseDetemps:=1;
          shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(tetaGTI2[0])));
          shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(tetaGTI2[0])));
          GetFreqPerDiv.Text:='100 Hz/div';
          LabelFreq1.Caption:='100 Hz';
          LabelFreq2.Caption:='200 Hz';
          LabelFreq3.Caption:='300 Hz';
          LabelFreq4.Caption:='400 Hz';
          LabelFreq5.Caption:='500 Hz';
          LabelFreq6.Caption:='600 Hz';
          LabelFreq7.Caption:='700 Hz';
          LabelFreq8.Caption:='800 Hz';
          LabelFreq9.Caption:='900 Hz';
          LabelFreqEnd.Caption:='1 kHz';
          GetSampleFreqEdit.Text:='10 ms/div';
        end;

        ScrollBarBDT.Position:=congiguration.BaseDetemps;
    end;
  {
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
   }
    ValidConfigINTERFACE_GTI2(sender);    //fais par le timer et félicie, aussi !
end;









/////////////////////////////////////////////////////////////////////////////////
/////////               DEBUT DES                                         ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////              PROCEDURES D'AFFICHAGE                           ///////// ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////




procedure TForm_FFT_mut_GTI2.ResetEcran (sender: Tpaintbox);
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

 {   if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    end;      }
end;

procedure TForm_FFT_mut_GTI2.ResetEcran3DIV (sender: Tpaintbox);
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
  {  if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
   { Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
   { end;      }
end;


procedure TForm_FFT_mut_GTI2.ResetEcranXY (sender: Tpaintbox);
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






procedure TForm_FFT_mut_GTI2.AffichageBarreTrig(sender: Tpaintbox);
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
    sender.Canvas.Pen.color:=clBlack;
    sender.Canvas.Brush.Color := clBlack;
    sender.Canvas.Rectangle(0, 0, sender.Width - 1, sender.Height - 1);

    //trig point  ds la paintbox de marquage du trig
    sender.Canvas.Pen.Color := clWhite	;


    if congiguration.Invertion[congiguration.Trigger]=true then   INV:=-1 else  INV:=1;
    Calibre:=TensionMaxEcran[congiguration.sensibilitee[congiguration.Trigger]];

    ValeurrealOrdonnee:=         -(INV)*congiguration.Level * (sender.Height/2) / Calibre + (TscrollBarCH[congiguration.Trigger].Position*sender.Height/TscrollBarCH[congiguration.Trigger].max)  ;
    Curseur_Ordonnee  := Round(  -(INV)*congiguration.Level * (sender.Height/2) / Calibre + (TscrollBarCH[congiguration.Trigger].Position*sender.Height/TscrollBarCH[congiguration.Trigger].max) );



    if (ValeurrealOrdonnee)>=0 then  //Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
    begin
    sender.Canvas.MoveTo(sender.Width - 2,Curseur_Ordonnee);
    sender.Canvas.LineTo(0,Curseur_Ordonnee-10);
    sender.Canvas.LineTo(0,Curseur_Ordonnee+10) ;
    sender.Canvas.LineTo(sender.Width - 2,Curseur_Ordonnee) ;
    sender.Canvas.MoveTo(sender.Width - 2,Curseur_Ordonnee);
    sender.Canvas.LineTo(0,Curseur_Ordonnee) ;
    end;  //sinon le marqeur est hors de l'écran donc on affiche pas...
          //si limite du bas pas de pb
end;






procedure TForm_FFT_mut_GTI2.ApropoClick(Sender: TObject);
begin
    {$IFDEF CABALABin}
      FormApropos.Visible := true ;
      FormApropos.BringToFront;
    {$ENDIF}
end;

procedure  TForm_FFT_mut_GTI2.calcul_spectre_CH1(Sender: TObject);
var grille,cal,wIndex,rlength,min,max,debut :integer;
    Index,fin,coeff :dWord;
    rSens,wCurrentY, wCurrentX,echelle: Double;
    decale:double;
    Mode: double;
     z,u,d,NbCol,NumCol,NbTre,NumTre,NbPap,NumPap,BasePap,OffsetPap :integer;
     a,b,n,w,c,i,j,nn:longint;
     maxsamples:longint;
     x,y,Freqech,Tech,angle,re,im,co,si,deltaf,coefdBV: double;
     samplefreq : dword;
     Currentlength : string;
begin
     rLength := strtoint(recordlengthbox.text);
  //  rlength:=1024;
                currentlength := IntToStr (rlength);
                samplefreq:= GetSampleFrequency;
                Freqech:=(samplefreq);
                Tech := 1/Freqech;
                maxsamples:=rlength;
                NF4:=1 shl (expo2);
              //  NF3:=2*NF4-1;
              //  NF2:=NF4*4;

                NF2:=2*NF4;
                NF3:=NF4-1;
                NF4:=round((NF3+1)/2);
               // NF4:=1 shl (expo-3);
               // NF3:=2*NF4-1;
               // NF2:=NF4*4;
  //    NF4:=1 shl (expo2);
    //  NF3:=2*NF4-1;
    //  NF2:=NF4*4;
    //  NF2:=NF3+1;
  //    NF3:=NF4-1;
    //  NF4:=round((NF3+1)/2);
//if FFT_simple.Checked=true then
  //begin
{   if (MeasureModeBox.ItemIndex = 0) or
      (MeasureModeBox.ItemIndex = 2) then
    begin
      if MeasureModeBox.ItemIndex = 0 then
      begin
        SetMeasureMode( lCh1 );
      end { if }
 {     else
      begin
        SetmeasureMode( mCh12 );
      end;   }

            //    for a:=1 to rLength do
              //  begin
                    { timearray[a]:=a*Tech;}
                    { xreal[a] :=0;
                //     ximag[a] :=0;}
                  //   tabi[a] :=0;
                   //  tabr[a] :=0;
                     //spectre1[a] :=0;
                     //FFTre[a] :=0;
                     //FFTim[a] :=0;
                //end;
        for a:=1 to NF2 do
          begin
            tabi[a] :=0;
            tabr[a] :=0;
          //  spectre1[a] :=0;
            FFTre[a] :=0;
            FFTim[a] :=0;
          end;

{ if (hanning.checked) then
    begin
 }           for i:=1 to rLength do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                      end;
  {  end
 else if(hamming.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.54+0.46*cos(pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(blackman.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.42+0.5*cos(pi*(2*i-1-maxsamples)/maxsamples)+0.08*cos(2*pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(bartlett.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(1-abs(2*i-1-maxsamples)/maxsamples);
                      end;
    end
else if (kaiser.checked) then
  begin
           for i:=1 to maxsamples do
                      begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*KaiserFile[i*round(64/delta)];
                      end;
    end
else
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767);
                      end;
    end;    }

                  {début FFT}

            for a:=1 to maxsamples do
                begin
                     spectre1[a] :=0;
                end;

       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
        for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;
 for z:=0 to 1 do
        begin
          for u:=0 to 3 do
            begin

                  for nn:=1 to NF3+1 do
                      begin
                        b:=4*(nn-1)+u+1;
                        xxreal[nn]:=xreal[b]*cos(2*pi*z*(nn-1)/(maxsamples/2));
                        xximag[nn]:=-xreal[b]*sin(2*pi*z*(nn-1)/(maxsamples/2));
                 //      xreal[nn]:=(Ch2WordArray [b] - 32767) *(1-cos(2*pi*b/maxsamples))*cos(2*pi*z*(nn-1)/(maxsamples/2));
          //             ximag[nn]:=-(Ch2WordArray [b] - 32767)/32767*(1-cos(2*pi*b/maxsamples))*sin(2*pi*z*(nn-1)/(maxsamples/2));
                      end;

                  {début FFT}

              for i:=1 to NF3+1 do
                begin
                  FFTre[i]:=xxreal[indice2[i]+1];
                  FFTim[i]:=xximag[indice2[i]+1];
                end;
                         NbCol:=expo2;
                         for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                      begin
                                           BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                           for OffsetPap:=0 to NbPap-1 do
                                           begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                           end;
                                      end;
                             end;
                  {fin FFT}
                  for w:=1 to NF3+1 do
                      begin
            	          c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
            end;
        end;
        for i:=1 to NF2 do
          begin
            spectre1[i]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                     {fin du calcul de la première partie du spectre}
          end;
       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
       for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;


          for z:=0 to 1 do
            begin
              for u:=0 to 3 do
                begin
                  for nn:=1 to NF3+1 do
                    begin
                       b:=4*(nn-1)+u+1;
                       xxreal[nn]:=xreal[b]*cos(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                       xximag[nn]:=-xreal[b]*sin(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                    end;

                    {début FFT}

                    for i:=1 to NF3+1 do
                       begin
                        FFTre[i]:=xxreal[indice2[i]+1];
                        FFTim[i]:=xximag[indice2[i]+1];
                       end;
                    NbCol:=expo2;
                    for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                  begin
                                       BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                       for OffsetPap:=0 to NbPap-1 do
                                       begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                       end;
                                  end;
                             end;                  {fin FFT}
                    for w:=1 to NF3+1 do
                      begin
              	        c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
                end;
            end;

          for i:=1 to NF2 do
            begin
              spectre1[i+NF2]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                {fin du calcul de la deuxième partie du spectre}
            end;

          spectre1[1]:=spectre1[1]/2;
          spectre1[2]:=spectre1[2]/2;

{if dB.Checked then
begin
     for i:=1 to 2*NF3-1 do
     begin
      if  spectre1[i]<>0 then
      spectre1[i]:=20*Log10(spectre1[i])
      else
      spectre1[i]:=-80;
      end;
end
else if volt.Checked then
begin
end
else if voltefficace.Checked then
begin
     for i:=2 to 2*NF3-1 do
     begin
      spectre1[i]:=(spectre1[i])*0.707;
     end;
end; }



end;

procedure  TForm_FFT_mut_GTI2.calcul_spectre_CH2(Sender: TObject);
var grille,cal,wIndex,rlength,min,max,debut :integer;
    Index,fin,coeff :dWord;
    rSens,wCurrentY, wCurrentX,echelle: Double;
    decale:double;
    Mode: double;
     z,u,d,NbCol,NumCol,NbTre,NumTre,NbPap,NumPap,BasePap,OffsetPap :integer;
     a,b,n,w,c,i,j,nn:longint;
     maxsamples:longint;
     x,y,Freqech,Tech,angle,re,im,co,si,deltaf,coefdBV: double;
     samplefreq : dword;
     Currentlength : string;
begin
     rLength := (GetPostSamples);
//    rlength:=1024;
                currentlength := IntToStr (rlength);
                samplefreq:= GetSampleFrequency;
                Freqech:=(samplefreq);
                Tech := 1/Freqech;
                maxsamples:=rlength;
                NF4:=1 shl (expo2);
              //  NF3:=2*NF4-1;
              //  NF2:=NF4*4;

                NF2:=2*NF4;
                NF3:=NF4-1;
                NF4:=round((NF3+1)/2);
               // NF4:=1 shl (expo-3);
               // NF3:=2*NF4-1;
               // NF2:=NF4*4;
    //  NF4:=1 shl (expo2);
     // NF3:=2*NF4-1;
     // NF2:=NF4*4;
     // NF2:=NF3+1;
      //NF3:=NF4-1;
      //NF4:=round((NF3+1)/2);
//if FFT_simple.Checked=true then
  //begin
{   if (MeasureModeBox.ItemIndex = 0) or
      (MeasureModeBox.ItemIndex = 2) then
    begin
      if MeasureModeBox.ItemIndex = 0 then
      begin
        SetMeasureMode( lCh1 );
      end { if }
 {     else
      begin
        SetmeasureMode( mCh12 );
      end;   }

            //    for a:=1 to rLength do
              //  begin
                    { timearray[a]:=a*Tech;}
                    { xreal[a] :=0;
                //     ximag[a] :=0;}
                  //   tabi[a] :=0;
                   //  tabr[a] :=0;
                     //spectre1[a] :=0;
                     //FFTre[a] :=0;
                     //FFTim[a] :=0;
                //end;
        for a:=1 to NF2 do
          begin
            tabi[a] :=0;
            tabr[a] :=0;
          //  spectre1[a] :=0;
            FFTre[a] :=0;
            FFTim[a] :=0;
          end;

{ if (hanning.checked) then
    begin
 }           for i:=1 to rLength do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                      end;
  {  end
 else if(hamming.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.54+0.46*cos(pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(blackman.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.42+0.5*cos(pi*(2*i-1-maxsamples)/maxsamples)+0.08*cos(2*pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(bartlett.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(1-abs(2*i-1-maxsamples)/maxsamples);
                      end;
    end
else if (kaiser.checked) then
  begin
           for i:=1 to maxsamples do
                      begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*KaiserFile[i*round(64/delta)];
                      end;
    end
else
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767);
                      end;
    end;    }

                  {début FFT}

            for a:=1 to maxsamples do
                begin
                     spectre2[a] :=0;
                end;

       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
        for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;
 for z:=0 to 1 do
        begin
          for u:=0 to 3 do
            begin

                  for nn:=1 to NF3+1 do
                      begin
                        b:=4*(nn-1)+u+1;
                        xxreal[nn]:=xreal[b]*cos(2*pi*z*(nn-1)/(maxsamples/2));
                        xximag[nn]:=-xreal[b]*sin(2*pi*z*(nn-1)/(maxsamples/2));
                 //      xreal[nn]:=(Ch2WordArray [b] - 32767) *(1-cos(2*pi*b/maxsamples))*cos(2*pi*z*(nn-1)/(maxsamples/2));
          //             ximag[nn]:=-(Ch2WordArray [b] - 32767)/32767*(1-cos(2*pi*b/maxsamples))*sin(2*pi*z*(nn-1)/(maxsamples/2));
                      end;

                  {début FFT}

              for i:=1 to NF3+1 do
                begin
                  FFTre[i]:=xxreal[indice2[i]+1];
                  FFTim[i]:=xximag[indice2[i]+1];
                end;
                         NbCol:=expo2;
                         for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                      begin
                                           BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                           for OffsetPap:=0 to NbPap-1 do
                                           begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                           end;
                                      end;
                             end;
                  {fin FFT}
                  for w:=1 to NF3+1 do
                      begin
            	          c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
            end;
        end;
        for i:=1 to NF2 do
          begin
            spectre2[i]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                     {fin du calcul de la première partie du spectre}
          end;
       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
       for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;


          for z:=0 to 1 do
            begin
              for u:=0 to 3 do
                begin
                  for nn:=1 to NF3+1 do
                    begin
                       b:=4*(nn-1)+u+1;
                       xxreal[nn]:=xreal[b]*cos(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                       xximag[nn]:=-xreal[b]*sin(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                    end;

                    {début FFT}

                    for i:=1 to NF3+1 do
                       begin
                        FFTre[i]:=xxreal[indice2[i]+1];
                        FFTim[i]:=xximag[indice2[i]+1];
                       end;
                    NbCol:=expo2;
                    for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                  begin
                                       BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                       for OffsetPap:=0 to NbPap-1 do
                                       begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                       end;
                                  end;
                             end;                  {fin FFT}
                    for w:=1 to NF3+1 do
                      begin
              	        c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
                end;
            end;

          for i:=1 to NF2 do
            begin
              spectre2[i+NF2]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                {fin du calcul de la deuxième partie du spectre}
            end;

          spectre2[1]:=spectre2[1]/2;
          spectre2[2]:=spectre2[2]/2;

{if dB.Checked then
begin
     for i:=1 to 2*NF3-1 do
     begin
      if  spectre1[i]<>0 then
      spectre1[i]:=20*Log10(spectre1[i])
      else
      spectre1[i]:=-80;
      end;
end
else if volt.Checked then
begin
end
else if voltefficace.Checked then
begin
     for i:=2 to 2*NF3-1 do
     begin
      spectre1[i]:=(spectre1[i])*0.707;
     end;
end; }


end;

procedure  TForm_FFT_mut_GTI2.calcul_spectre_CH3(Sender: TObject);
var grille,cal,wIndex,rlength,min,max,debut :integer;
    Index,fin,coeff :dWord;
    rSens,wCurrentY, wCurrentX,echelle: Double;
    decale:double;
    Mode: double;
     z,u,d,NbCol,NumCol,NbTre,NumTre,NbPap,NumPap,BasePap,OffsetPap :integer;
     a,b,n,w,c,i,j,nn:longint;
     maxsamples:longint;
     x,y,Freqech,Tech,angle,re,im,co,si,deltaf,coefdBV: double;
     samplefreq : dword;
     Currentlength : string;
begin
  //   rLength := (GetPostSamples);
      rLength := strtoint(recordlengthbox.text);
    //rlength:=1024;
                currentlength := IntToStr (rlength);
                samplefreq:= GetSampleFrequency;
                Freqech:=(samplefreq);
                Tech := 1/Freqech;
                maxsamples:=rlength;
                NF4:=1 shl (expo2);
              //  NF3:=2*NF4-1;
              //  NF2:=NF4*4;

                NF2:=2*NF4;
                NF3:=NF4-1;
                NF4:=round((NF3+1)/2);
               // NF4:=1 shl (expo-3);
               // NF3:=2*NF4-1;
               // NF2:=NF4*4;
 //     NF4:=1 shl (expo2);
  //    NF3:=2*NF4-1;
   //   NF2:=NF4*4;
     // NF2:=NF3+1;
     // NF3:=NF4-1;
     // NF4:=round((NF3+1)/2);
//if FFT_simple.Checked=true then
  //begin
{   if (MeasureModeBox.ItemIndex = 0) or
      (MeasureModeBox.ItemIndex = 2) then
    begin
      if MeasureModeBox.ItemIndex = 0 then
      begin
        SetMeasureMode( lCh1 );
      end { if }
 {     else
      begin
        SetmeasureMode( mCh12 );
      end;   }

            //    for a:=1 to rLength do
              //  begin
                    { timearray[a]:=a*Tech;}
                    { xreal[a] :=0;
                //     ximag[a] :=0;}
                  //   tabi[a] :=0;
                   //  tabr[a] :=0;
                     //spectre1[a] :=0;
                     //FFTre[a] :=0;
                     //FFTim[a] :=0;
                //end;
        for a:=1 to NF2 do
          begin
            tabi[a] :=0;
            tabr[a] :=0;
           // spectre1[a] :=0;
            FFTre[a] :=0;
            FFTim[a] :=0;
          end;

{ if (hanning.checked) then
    begin
 }           for i:=1 to rLength do
                     begin
                       xreal[i]:=(ch3WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                      end;
  {  end
 else if(hamming.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.54+0.46*cos(pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(blackman.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.42+0.5*cos(pi*(2*i-1-maxsamples)/maxsamples)+0.08*cos(2*pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(bartlett.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(1-abs(2*i-1-maxsamples)/maxsamples);
                      end;
    end
else if (kaiser.checked) then
  begin
           for i:=1 to maxsamples do
                      begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*KaiserFile[i*round(64/delta)];
                      end;
    end
else
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767);
                      end;
    end;    }

                  {début FFT}

            for a:=1 to maxsamples do
                begin
                     spectre3[a] :=0;
                end;

       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
        for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;
 for z:=0 to 1 do
        begin
          for u:=0 to 3 do
            begin

                  for nn:=1 to NF3+1 do
                      begin
                        b:=4*(nn-1)+u+1;
                        xxreal[nn]:=xreal[b]*cos(2*pi*z*(nn-1)/(maxsamples/2));
                        xximag[nn]:=-xreal[b]*sin(2*pi*z*(nn-1)/(maxsamples/2));
                 //      xreal[nn]:=(Ch2WordArray [b] - 32767) *(1-cos(2*pi*b/maxsamples))*cos(2*pi*z*(nn-1)/(maxsamples/2));
          //             ximag[nn]:=-(Ch2WordArray [b] - 32767)/32767*(1-cos(2*pi*b/maxsamples))*sin(2*pi*z*(nn-1)/(maxsamples/2));
                      end;

                  {début FFT}

              for i:=1 to NF3+1 do
                begin
                  FFTre[i]:=xxreal[indice2[i]+1];
                  FFTim[i]:=xximag[indice2[i]+1];
                end;
                         NbCol:=expo2;
                         for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                      begin
                                           BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                           for OffsetPap:=0 to NbPap-1 do
                                           begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                           end;
                                      end;
                             end;
                  {fin FFT}
                  for w:=1 to NF3+1 do
                      begin
            	          c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
            end;
        end;
        for i:=1 to NF2 do
          begin
            spectre3[i]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                     {fin du calcul de la première partie du spectre}
          end;
       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
       for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;


          for z:=0 to 1 do
            begin
              for u:=0 to 3 do
                begin
                  for nn:=1 to NF3+1 do
                    begin
                       b:=4*(nn-1)+u+1;
                       xxreal[nn]:=xreal[b]*cos(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                       xximag[nn]:=-xreal[b]*sin(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                    end;

                    {début FFT}

                    for i:=1 to NF3+1 do
                       begin
                        FFTre[i]:=xxreal[indice2[i]+1];
                        FFTim[i]:=xximag[indice2[i]+1];
                       end;
                    NbCol:=expo2;
                    for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                  begin
                                       BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                       for OffsetPap:=0 to NbPap-1 do
                                       begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                       end;
                                  end;
                             end;                  {fin FFT}
                    for w:=1 to NF3+1 do
                      begin
              	        c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
                end;
            end;

          for i:=1 to NF2 do
            begin
              spectre3[i+NF2]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                {fin du calcul de la deuxième partie du spectre}
            end;

          spectre3[1]:=spectre3[1]/2;
          spectre3[2]:=spectre3[2]/2;

{if dB.Checked then
begin
     for i:=1 to 2*NF3-1 do
     begin
      if  spectre1[i]<>0 then
      spectre1[i]:=20*Log10(spectre1[i])
      else
      spectre1[i]:=-80;
      end;
end
else if volt.Checked then
begin
end
else if voltefficace.Checked then
begin
     for i:=2 to 2*NF3-1 do
     begin
      spectre1[i]:=(spectre1[i])*0.707;
     end;
end; }


end;

procedure  TForm_FFT_mut_GTI2.calcul_spectre_CH4(Sender: TObject);
var grille,cal,wIndex,rlength,min,max,debut :integer;
    Index,fin,coeff :dWord;
    rSens,wCurrentY, wCurrentX,echelle: Double;
    decale:double;
    Mode: double;
     z,u,d,NbCol,NumCol,NbTre,NumTre,NbPap,NumPap,BasePap,OffsetPap :integer;
     a,b,n,w,c,i,j,nn:longint;
     maxsamples:longint;
     x,y,Freqech,Tech,angle,re,im,co,si,deltaf,coefdBV: double;
     samplefreq : dword;
     Currentlength : string;
begin
  //   rLength := (GetPostSamples);
   // rlength:=1024;
       rLength := strtoint(recordlengthbox.text);
                currentlength := IntToStr (rlength);
                samplefreq:= GetSampleFrequency;
                Freqech:=(samplefreq);
                Tech := 1/Freqech;
                maxsamples:=rlength;
                NF4:=1 shl (expo2);
              //  NF3:=2*NF4-1;
              //  NF2:=NF4*4;

                NF2:=2*NF4;
                NF3:=NF4-1;
                NF4:=round((NF3+1)/2);
               // NF4:=1 shl (expo-3);
               // NF3:=2*NF4-1;
               // NF2:=NF4*4;
  //    NF4:=1 shl (expo2);
   //   NF3:=2*NF4-1;
   //   NF2:=NF4*4;
   //   NF2:=NF3+1;
     // NF3:=NF4-1;
     // NF4:=round((NF3+1)/2);
//if FFT_simple.Checked=true then
  //begin
{   if (MeasureModeBox.ItemIndex = 0) or
      (MeasureModeBox.ItemIndex = 2) then
    begin
      if MeasureModeBox.ItemIndex = 0 then
      begin
        SetMeasureMode( lCh1 );
      end { if }
 {     else
      begin
        SetmeasureMode( mCh12 );
      end;   }

            //    for a:=1 to rLength do
              //  begin
                    { timearray[a]:=a*Tech;}
                    { xreal[a] :=0;
                //     ximag[a] :=0;}
                  //   tabi[a] :=0;
                   //  tabr[a] :=0;
                     //spectre1[a] :=0;
                     //FFTre[a] :=0;
                     //FFTim[a] :=0;
                //end;
        for a:=1 to NF2 do
          begin
            tabi[a] :=0;
            tabr[a] :=0;
           // spectre4[a] :=0;
            FFTre[a] :=0;
            FFTim[a] :=0;
          end;

{ if (hanning.checked) then
    begin
 }           for i:=1 to rLength do
                     begin
                       xreal[i]:=(ch4WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                      end;
  {  end
 else if(hamming.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.54+0.46*cos(pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(blackman.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(0.42+0.5*cos(pi*(2*i-1-maxsamples)/maxsamples)+0.08*cos(2*pi*(2*i-1-maxsamples)/maxsamples));
                      end;
    end
 else if(bartlett.checked) then
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*(1-abs(2*i-1-maxsamples)/maxsamples);
                      end;
    end
else if (kaiser.checked) then
  begin
           for i:=1 to maxsamples do
                      begin
                       xreal[i]:=(ch1WordArray[i]-32767)*2*KaiserFile[i*round(64/delta)];
                      end;
    end
else
    begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767);
                      end;
    end;    }

                  {début FFT}

            for a:=1 to maxsamples do
                begin
                     spectre4[a] :=0;
                end;

       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
        for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;
 for z:=0 to 1 do
        begin
          for u:=0 to 3 do
            begin

                  for nn:=1 to NF3+1 do
                      begin
                        b:=4*(nn-1)+u+1;
                        xxreal[nn]:=xreal[b]*cos(2*pi*z*(nn-1)/(maxsamples/2));
                        xximag[nn]:=-xreal[b]*sin(2*pi*z*(nn-1)/(maxsamples/2));
                 //      xreal[nn]:=(Ch2WordArray [b] - 32767) *(1-cos(2*pi*b/maxsamples))*cos(2*pi*z*(nn-1)/(maxsamples/2));
          //             ximag[nn]:=-(Ch2WordArray [b] - 32767)/32767*(1-cos(2*pi*b/maxsamples))*sin(2*pi*z*(nn-1)/(maxsamples/2));
                      end;

                  {début FFT}

              for i:=1 to NF3+1 do
                begin
                  FFTre[i]:=xxreal[indice2[i]+1];
                  FFTim[i]:=xximag[indice2[i]+1];
                end;
                         NbCol:=expo2;
                         for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                      begin
                                           BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                           for OffsetPap:=0 to NbPap-1 do
                                           begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                           end;
                                      end;
                             end;
                  {fin FFT}
                  for w:=1 to NF3+1 do
                      begin
            	          c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
            end;
        end;
        for i:=1 to NF2 do
          begin
            spectre4[i]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                     {fin du calcul de la première partie du spectre}
          end;
       for a:=1 to NF3+1 do
                begin
                     FFTre[a] :=0;
                     FFTim[a] :=0;
                     xxreal[a]:=0;
                     xximag[a]:=0;
                end;
       for a:=1 to NF2 do
                begin
                     tabi[a] :=0;
                     tabr[a] :=0;
                end;


          for z:=0 to 1 do
            begin
              for u:=0 to 3 do
                begin
                  for nn:=1 to NF3+1 do
                    begin
                       b:=4*(nn-1)+u+1;
                       xxreal[nn]:=xreal[b]*cos(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                       xximag[nn]:=-xreal[b]*sin(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                    end;

                    {début FFT}

                    for i:=1 to NF3+1 do
                       begin
                        FFTre[i]:=xxreal[indice2[i]+1];
                        FFTim[i]:=xximag[indice2[i]+1];
                       end;
                    NbCol:=expo2;
                    for NumCol:=1 to NbCol do
                             begin
                                  NbTre:=1 shl (NbCol-NumCol);
                                  NbPap:=1 shl (NumCol-1);
                                  for NumTre:=1 to NbTre do
                                  begin
                                       BasePap:=(NumTre-1)*(1 shl NumCol)+1;
                                       for OffsetPap:=0 to NbPap-1 do
                                       begin
                                            angle:=2*pi*(OffsetPap)/(1 shl NumCol);
                                            co:=cos(angle);si:=sin(angle);
                                            NumPap:=BasePap+OffsetPap;
                                            re:=co*FFTre[NumPap+NbPap]+si*FFTim[NumPap+NbPap];
                                            im:=co*FFTim[NumPap+NbPap]-si*FFTre[NumPap+NbPap];
                                            FFTre[NumPap+NbPap]:=FFTre[NumPap]-re;
                                            FFTim[NumPap+NbPap]:=FFTim[NumPap]-im;
                                            FFTre[NumPap]:=FFTre[NumPap]+re;
                                            FFTim[NumPap]:=FFTim[NumPap]+im;
                                       end;
                                  end;
                             end;                  {fin FFT}
                    for w:=1 to NF3+1 do
                      begin
              	        c:=2*w+z-1;
                        tabr[c]:=tabr[c]+FFTre[w]*cos(2*pi*u*(w-1)/maxsamples)+FFTim[w]*sin(2*pi*u*(w-1)/maxsamples);
	                      tabi[c]:=tabi[c]+FFTim[w]*cos(2*pi*u*(w-1)/maxsamples)-FFTre[w]*sin(2*pi*u*(w-1)/maxsamples);
                      end;
                end;
            end;

          for i:=1 to NF2 do
            begin
              spectre4[i+NF2]:=8*sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                {fin du calcul de la deuxième partie du spectre}
            end;

          spectre4[1]:=spectre4[1]/2;
          spectre4[2]:=spectre4[2]/2;

{if dB.Checked then
begin
     for i:=1 to 2*NF3-1 do
     begin
      if  spectre1[i]<>0 then
      spectre1[i]:=20*Log10(spectre1[i])
      else
      spectre1[i]:=-80;
      end;
end
else if volt.Checked then
begin
end
else if voltefficace.Checked then
begin
     for i:=2 to 2*NF3-1 do
     begin
      spectre1[i]:=(spectre1[i])*0.707;
     end;
end; }


end;


procedure TForm_FFT_mut_GTI2.Affichage_voie_CHX(Sender: TPaintBox ; voie:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    calibre : double;
 //   Longueur_Acquisition : dword;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin
TesterDepassementSignal1(self);
TesterDepassementSignal2(self);
TesterDepassementSignal3(self);
TesterDepassementSignal4(self);

  if CheckBoxY1Visible.Checked=true then
          begin
            calcul_spectre_CH1(Self);
          //  TesterDepassementSignal1(self);
          end;
  if CheckBoxY2Visible.Checked=true then
          begin
            calcul_spectre_CH2(Self);
            //TesterDepassementSignal2(self);
          end;
  if CheckBoxY3Visible.Checked=true then
          begin
            calcul_spectre_CH3(Self);
            //TesterDepassementSignal3(self);
          end;
  if CheckBoxY4Visible.Checked=true then
          begin
            calcul_spectre_CH4(Self);
            // TesterDepassementSignal4(self);
          end;

//Longueur_Acquisition :=getpostsamples();
Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
if congiguration.sensibilitee[voie]<3 then Calibre:=Calibre/2;
//if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;

// ligne de 0 en pointillés
    {Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    Sender.Canvas.MoveTo(i+1 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    i:=i+2;
    end;   }

//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
Sender.Canvas.MoveTo(0, Round(  -TspectreXDoubleArray[voie][ 0 ]*8 * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)+(Sender.Height/2) ));

      try
        {  for Curseur_Abscisse := 0 to 2*Sender.Width - 1 do
          begin
          ValeurrealOrdonnee:= -TspectreXDoubleArray[voie][ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) +(Sender.Height/2) ;
          Curseur_Ordonnee  := Round(  ValeurrealOrdonnee )-2;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), Curseur_Ordonnee)
          else
          begin
         //   Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), 0);
            Sender.Canvas.LineTo(round(Curseur_Abscisse/2), Curseur_Ordonnee);
          end;
          end;}
          for Curseur_Abscisse := 0 to Longueur_Acquisition - 1 do
          begin
          ValeurrealOrdonnee:= -TspectreXDoubleArray[voie][ Curseur_Abscisse]   * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) +(Sender.Height/2) ;
          Curseur_Ordonnee  := Round(  ValeurrealOrdonnee )-2;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(Curseur_Abscisse/Longueur_Acquisition * Sender.Width ), Curseur_Ordonnee)
          else
          begin
         //   Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), 0);
            Sender.Canvas.LineTo(round(Curseur_Abscisse/Longueur_Acquisition * Sender.Width), Curseur_Ordonnee);
          end;
          end;
      except
      end;

end;


procedure TForm_FFT_mut_GTI2.Affichage_voie_CH1(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre : Double;
   // Longueur_Acquisition : dword;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin
calcul_spectre_CH1(Self);
//Longueur_Acquisition := GetRecordLength();
  Longueur_Acquisition := 512;
//GetSensitivity( lCh1, @Calibre1);

Calibre:=TensionMaxEcran[congiguration.sensibilitee[1]];
//if congiguration.Invertion[1]=true then   INV:=-1 else  INV:=1;

// ligne de 0
 {  Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color := clBlue;
    Sender.Canvas.MoveTo(0, round(ScrollBar0CH1.Position*Sender.Height/100) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(ScrollBar0CH1.Position*Sender.Height/100));
    Sender.Canvas.MoveTo(i+1 , round(ScrollBar0CH1.Position*Sender.Height/100));
    i:=i+2;
    end;     }


Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[1]	;
Sender.Canvas.MoveTo(0, Round(  -Spectre1[ 0 ] * (Sender.Height/2) / Calibre + (ScrollBar0CH1.Position*Sender.Height/2) ));

      try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin
//          if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  >  Calibre1 then  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  := Calibre1 ;
          ValeurrealOrdonnee:=-Spectre1[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre {+ (Sender.Height/2)}+ (ScrollBar0CH1.Position*Sender.Height/100);
          Curseur_Ordonnee:= Round( ValeurrealOrdonnee)-1;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), Curseur_Ordonnee)
          else Sender.Canvas.LineTo(round(Curseur_Abscisse/2), Curseur_Ordonnee);

          end;
      except
      end;

{


if MenuDecalBDT.Checked=false then                      *(ScrollBarDecalBDT.Position/1000)
    begin
        MenuDecalBDT.Checked:=true;
        ScrollBarDecalBDT.Visible:=true;
    end
    else
    begin
        MenuDecalBDT.Checked:=false;
        ScrollBarDecalBDT.Visible:=false;
        ScrollBarDecalBDT.Position:=1000;
    end;

Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );


ValeurrealOrdonnee:= -(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (positionzeroCH1) ;
Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (positionzeroCH1) );
if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
}





end;

procedure TForm_FFT_mut_GTI2.Affichage_voie_CH2(Sender: TPaintBox);
{var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre: Double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
     INV:integer;
     ValeurrealOrdonnee:real;
      i:integer;
begin

Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh2, @Calibre);
Calibre:=TensionMaxEcran[congiguration.sensibilitee[2]];
if congiguration.Invertion[2]=true then   INV:=-1 else  INV:=1;

// ligne de 0
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color := clGreen;
    Sender.Canvas.MoveTo(0, round(ScrollBar0CH2.Position*Sender.Height/100) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(ScrollBar0CH2.Position*Sender.Height/100));
    Sender.Canvas.MoveTo(i+1 , round(ScrollBar0CH2.Position*Sender.Height/100));
    i:=i+2;
    end;

Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[2]		;
Sender.Canvas.MoveTo(0, Round(  -Ch2DoubleArray[ 0 ] * (Sender.Height/2) / Calibre + (ScrollBar0CH2.Position*Sender.Height/2) ));

      try
          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
//          if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  >  Calibre then  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  := Calibre ;
          ValeurrealOrdonnee:=  -(INV)*Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition*(ScrollBarDecalBDT.Position/1000) / Sender.Width ) ] * (Sender.Height/2) / Calibre + (ScrollBar0CH2.Position*Sender.Height/100);
 {         Curseur_Ordonnee := Round(  -(INV)*Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition*(ScrollBarDecalBDT.Position/1000) / Sender.Width ) ] * (Sender.Height/2) / Calibre + (ScrollBar0CH2.Position*Sender.Height/100) );
  {        if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
      except
      end;   }
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre : Double;
  //  Longueur_Acquisition : dword;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin
calcul_spectre_CH2(Self);
//Longueur_Acquisition := GetRecordLength();
//  Longueur_Acquisition := 512;
//GetSensitivity( lCh1, @Calibre1);

Calibre:=TensionMaxEcran[congiguration.sensibilitee[2]];
//if congiguration.Invertion[2]=true then   INV:=-1 else  INV:=1;

// ligne de 0
  {  Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color := clGreen;
    Sender.Canvas.MoveTo(0, round(ScrollBar0CH2.Position*Sender.Height/100) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(ScrollBar0CH2.Position*Sender.Height/100));
    Sender.Canvas.MoveTo(i+1 , round(ScrollBar0CH2.Position*Sender.Height/100));
    i:=i+2;
    end;      }



Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[2]	;
Sender.Canvas.MoveTo(0, Round(  -Spectre2[ 0 ] * (Sender.Height/2) / Calibre + (ScrollBar0CH2.Position*Sender.Height/2) ));

      try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin
//          if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  >  Calibre1 then  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  := Calibre1 ;
          ValeurrealOrdonnee:=-Spectre2[ round( Curseur_Abscisse * Longueur_Acquisition/ Sender.Width ) ] * (Sender.Height/2) / Calibre {+ (Sender.Height/2)}+ (ScrollBar0CH2.Position*Sender.Height/100);
          Curseur_Ordonnee:= Round( ValeurrealOrdonnee)-1;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), Curseur_Ordonnee)
          else Sender.Canvas.LineTo(round(Curseur_Abscisse/2), Curseur_Ordonnee);

          end;
      except
      end;
end;

procedure TForm_FFT_mut_GTI2.Affichage_voie_CH3(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre:Double;
  //  Longueur_Acquisition : dword;
     INV:integer;
     ValeurrealOrdonnee:real;
      i:integer;
begin

Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh3, @Calibre);
Calibre:=TensionMaxEcran[congiguration.sensibilitee[3]];
//if congiguration.Invertion[3]=true then   INV:=-1 else  INV:=1;

// ligne de 0
  {  Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color := clYellow;
    Sender.Canvas.MoveTo(0, round(ScrollBar0CH3.Position*Sender.Height/100) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(ScrollBar0CH3.Position*Sender.Height/100));
    Sender.Canvas.MoveTo(i+1 , round(ScrollBar0CH3.Position*Sender.Height/100));
    i:=i+2;
    end;     }

Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[3]		;
Sender.Canvas.MoveTo(0, Round(  -Spectre3[ 0 ] * (Sender.Height/2) / Calibre + (ScrollBar0CH3.Position*Sender.Height/2 )));

      try
          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
//          if Ch3DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  >  Calibre then  Ch3DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  := Calibre ;
          ValeurrealOrdonnee:=  -Spectre3[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + {(Sender.Height/2)}(ScrollBar0CH3.Position*Sender.Height/100);
          Curseur_Ordonnee := Round(ValeurrealOrdonnee )-1;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(round(Curseur_Abscisse/2), Curseur_Ordonnee);
          end;
      except
      end;

end;

procedure TForm_FFT_mut_GTI2.Affichage_voie_CH4(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre : Double;
  //  Longueur_Acquisition : dword;
     INV:integer;
     ValeurrealOrdonnee:real;
      i:integer;
begin

Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh4, @Calibre);
Calibre:=TensionMaxEcran[congiguration.sensibilitee[4]];
if congiguration.Invertion[4]=true then   INV:=-1 else  INV:=1;

// ligne de 0
  {  Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color := clRed;
    Sender.Canvas.MoveTo(0, round(ScrollBar0CH4.Position*Sender.Height/100) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(ScrollBar0CH4.Position*Sender.Height/100));
    Sender.Canvas.MoveTo(i+1 , round(ScrollBar0CH4.Position*Sender.Height/100));
    i:=i+2;
    end;  }

Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color :=congiguration.couleurs[4]		;
Sender.Canvas.MoveTo(0, Round(  -Spectre4[ 0 ] * (Sender.Height/2) / Calibre + (ScrollBar0CH4.Position*Sender.Height/2) ));

      try
          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
//          if Ch4DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  >  Calibre then  Ch4DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]  := Calibre ;
          ValeurrealOrdonnee:=  -Spectre4[ round( Curseur_Abscisse * Longueur_Acquisition/ Sender.Width ) ] * (Sender.Height/2) / Calibre + {(Sender.Height/2)}(ScrollBar0CH4.Position*Sender.Height/100);
          Curseur_Ordonnee := Round( ValeurrealOrdonnee )-1;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(round(Curseur_Abscisse/2), Curseur_Ordonnee);
          end;
      except
      end;

end;



procedure TForm_FFT_mut_GTI2.Affichage_voiesXY(Sender: TPaintBox ; voie:integer);
{var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 ,Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    x,y,t,i:integer;
    INV1,INV2,INV3,INV4:integer;
    ValeurrealOrdonnee:real;
     ValeurrealAbscisse:real;
begin
// calcul_spectre_CH1(Self);
Longueur_Acquisition := round(GetRecordLength()/2);
//GetSensitivity( lCh1, @Calibre1);
//GetSensitivity( lCh2, @Calibre2);
Calibre1:=TensionMaxEcran[congiguration.sensibilitee[1]];
Calibre2:=TensionMaxEcran[congiguration.sensibilitee[2]];
Calibre3:=TensionMaxEcran[congiguration.sensibilitee[3]];
Calibre4:=TensionMaxEcran[congiguration.sensibilitee[4]];
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

if congiguration.Invertion[1]=true then   INV1:=-1 else  INV1:=1;
if congiguration.Invertion[2]=true then   INV2:=-1 else  INV2:=1;
if congiguration.Invertion[3]=true then   INV3:=-1 else  INV3:=1;
if congiguration.Invertion[4]=true then   INV4:=-1 else  INV4:=1;

// Affichage Voie XY

if congiguration.VoieVisible[2]=true  then
begin
    Sender.Canvas.Pen.Color := clGreen;
    Sender.Canvas.MoveTo( round((INV1)*Spectre1[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV2)*Ch2DoubleArray[ 1 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Spectre1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Spectre1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;

if congiguration.VoieVisible[3]=true  then
begin

    Sender.Canvas.Pen.Color := clYellow;
    Sender.Canvas.MoveTo( round((INV1)*Spectre1[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV3)*Ch3DoubleArray[ 1 ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Spectre1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV3)*Ch3DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Spectre1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV3)*Ch3DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;

if congiguration.VoieVisible[4]=true  then
begin
    Sender.Canvas.Pen.Color := clRed;
    Sender.Canvas.MoveTo( round((1)*Spectre1[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(INV4)*Ch4DoubleArray[ 1 ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (INV1)*Spectre1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(INV4)*Ch4DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) );
          ValeurrealAbscisse:=   (INV1)*Spectre1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) ;
          ValeurrealOrdonnee:= -(INV4)*Ch4DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2);
          if (ValeurrealAbscisse)<0 then  Curseur_abscisse:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra

          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
end;



// affichage des enregistrements
 }
 var Curseur_Abscisse, Curseur_Ordonnee : Word;
   // Calibre1 , Calibre2 : Double;
    calibre : double;
//    Longueur_Acquisition : dword;
 //    x,y,t:integer;
  //   INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin
//calcul_spectre_CH1(Self);
//Longueur_Acquisition := {round(GetRecordLength()/2)}1000;
Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
//if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;
  Sender.Canvas.Pen.Color := congiguration.couleurs[5];
  Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
  Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
// ligne de 0 en pointillés
//Sender.Canvas.Pen.Width :=clWhite;
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
//    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)) );
 Sender.Canvas.MoveTo(0, round(Sender.Height+(Sender.Height/2)) );
    i:=1 ;
    while  i<= Sender.Width do
    begin
//  Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    Sender.Canvas.LineTo(i , round(Sender.Height+(Sender.Height/2)));
//  Sender.Canvas.MoveTo(i+1 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    Sender.Canvas.MoveTo(i+1 , round(Sender.Height+(Sender.Height/2)));
    i:=i+2;
    end;

//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
//Sender.Canvas.MoveTo(0, Round(  -TchXDoubleArray[voie][ 0 ]* (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)+(Sender.Height/2) ));
Sender.Canvas.MoveTo(0, Round(  -TchXDoubleArray[voie][ 0 ]* (Sender.Height/2) / Calibre +(Sender.Height/2) ));
      try
          for Curseur_Abscisse := 0 to round(Sender.Width/2.5) - 1 do
          begin
//          ValeurrealOrdonnee:=         -(INV)*TchXDoubleArray[voie][ round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) +(Sender.Height/2) ;
          ValeurrealOrdonnee:= -TchXDoubleArray[voie][ round( Curseur_Abscisse * {Longueur_Acquisition }512/ Sender.Width ) ] * (Sender.Height/2) / Calibre + (Sender.Height/2) ;
          Curseur_Ordonnee  := Round(  ValeurrealOrdonnee );
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(2.5*Curseur_Abscisse), Curseur_Ordonnee)
          else Sender.Canvas.LineTo(round(2.5*Curseur_Abscisse), Curseur_Ordonnee);
          end;
      except
      end;

GetSampleFreqEdit.Visible:=true;
end;




{
procedure TForm_FFT_mut_GTI2.Affichage_voies(Sender: TPaintBox);
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


procedure TForm_FFT_mut_GTI2.affichageEnregistrements(Sender: Tpaintbox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2, Calibre3 , Calibre4: Double;
   // Longueur_Acquisition : dword;
    x,y,t:integer ;
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
 {   Sender.Canvas.Pen.Color := clWhite;
   { Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
   ' Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
                                                  }
// Affichage Voie 1
    //if (courbes [num_de_courbe].mode=ch1) or (courbes [num_de_courbe].mode=chop) then
    if (courbes [num_de_courbe].Tmode[1]=true) then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur1;
    Sender.Canvas.MoveTo(0, Round(  {(invech1)*}courbes [num_de_courbe].voie1[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech1)*}courbes [num_de_courbe].voie1[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
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



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie2[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
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



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie3[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) );
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



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie4[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;


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

procedure TForm_FFT_mut_GTI2.DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double;var Amax3:double ;var Amax4:double ;var Amin3:double ;var Amin4:double );
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


procedure TForm_FFT_mut_GTI2.MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);
var
j,k,tx,imax:integer;
inf,sup,ok:byte;
i,Long,freq:Dword;
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


procedure TForm_FFT_mut_GTI2.MESURES(Sender: Tobject);
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
                          LabelTch1.caption:='T1 = '+floattostrf(Tch1,ffgeneral,4,3)+'s';       //var globale pour l'affichage a modifier
                          LabelFch1.caption:='F1 = '+floattostrf(Fch1,ffNumber,7,0)+'Hz';
                          end;
                        //  if  GroupBoxVch1Mesures.visible=true then
                        //  begin
                          labelVch1Max.caption:='U1max = ' +floattostrf(Amax1,ffFixed,4,3)+' V';
                          labelVch1Min.caption:='U1min = ' +floattostrf(Amin1,ffFixed,4,3)+' V';
                          labelVch1DC.caption:=  'U1 DC  = ' +floattostrf(vdc1,ffFixed,4,3)+' V';
                          labelVch1AC.caption:=  'U1 AC  = ' +floattostrf(vac1,ffFixed,4,3)+' V';
                          labelVch1ACDC.caption:='U1        = ' +floattostrf(vacdc1,ffFixed,4,3)+' V' + #9'AC+DC';
                        //  end;
                    end
                 else
                    begin
                          if LabelTch1.visible=true then
                          begin
                          LabelTch1.caption:='T1 = ';
                          LabelFch1.caption:='F1 = ';
                          end;
                      //    if  GroupBoxVch1Mesures.visible=true then
                      //    begin
                          labelVch1Max.caption:='U1max = ' +floattostrf(Amax1,ffFixed,4,3)+' V';
                          labelVch1Min.caption:='U1min = ' +floattostrf(Amin1,ffFixed,4,3)+' V';
                          labelVch1DC.caption:=  'U1 DC   ';
                          labelVch1AC.caption:=  'U1 AC   ' ;
                          labelVch1ACDC.caption:='U1        ';
                      //    end;
                    end;


                MultiMetre(2 , Amax2, Amin2,Aff,ti2[0],ti2[2],Fch2,Tch2,VDC2,VAC2,VACDC2 );
                if aff=true then
                    begin
                          if (LabelTch2.visible=true) then
                          begin
                          LabelTch2.caption:='T2 = '+floattostrf(Tch2,ffgeneral,4,3)+'s';
                          LabelFch2.caption:='F2 = '+floattostrf(Fch2,ffNumber,7,0)+'Hz';
                          end;
                     //     if  GroupBoxVch2Mesures.visible=true then
                     //     begin
                          labelVch2Max.caption:='U2max = ' +floattostrf(Amax2,ffFixed,4,3)+' V';
                          labelVch2Min.caption:='U2min = ' +floattostrf(Amin2,ffFixed,4,3)+' V';
                          labelVch2DC.caption:=  'U2 DC  = ' +floattostrf(vdc2,ffFixed,4,3)+' V';
                          labelVch2AC.caption:=  'U2 AC  = ' +floattostrf(vac2,ffFixed,4,3)+' V';
                          labelVch2ACDC.caption:='U2        = ' +floattostrf(vacdc2,ffFixed,4,3)+' V' + #9'AC+DC';
                     //     end;
                    end
                 else
                    begin
                          if (LabelTch2.visible=true) then
                          begin
                          LabelTch2.caption:='T2 = ';
                          LabelFch2.caption:='F2 = ';
                          end;
                      //    if  GroupBoxVch2Mesures.visible=true then
                      //    begin
                          labelVch2Max.caption:='U2max = ' +floattostrf(Amax2,ffFixed,4,3)+' V';
                          labelVch2Min.caption:='U2min = ' +floattostrf(Amin2,ffFixed,4,3)+' V';
                          labelVch2DC.caption:=  'U2 DC   ';
                          labelVch2AC.caption:=  'U2 AC   ' ;
                          labelVch2ACDC.caption:='U2        ';
                     //     end;
                    end;


                MultiMetre(3 , Amax3, Amin3,Aff,ti2[0],ti2[2],Fch3,Tch3,VDC3,VAC3,VACDC3 );
                if aff=true then
                    begin
                          if (LabelTch3.visible=true) then
                          begin
                          LabelTch3.caption:='T3 = '+floattostrf(Tch3,ffgeneral,4,3)+'s';
                          LabelFch3.caption:='F3 = '+floattostrf(Fch3,ffNumber,7,0)+'Hz';
                          end;
                     //     if  GroupBoxVch2Mesures.visible=true then
                     //     begin
                          labelVch3Max.caption:='U3max = ' +floattostrf(Amax3,ffFixed,4,3)+' V';
                          labelVch3Min.caption:='U3min = ' +floattostrf(Amin3,ffFixed,4,3)+' V';
                          labelVch3DC.caption:=  'U3 DC  = ' +floattostrf(vdc3,ffFixed,4,3)+' V';
                          labelVch3AC.caption:=  'U3 AC  = ' +floattostrf(vac3,ffFixed,4,3)+' V';
                          labelVch3ACDC.caption:='U3        = ' +floattostrf(vacdc3,ffFixed,4,3)+' V' + #9'AC+DC';
                     //     end;
                    end
                 else
                    begin
                          if (LabelTch3.visible=true) then
                          begin
                          LabelTch3.caption:='T3 = ';
                          LabelFch3.caption:='F3 = ';
                          end;
                      //    if  GroupBoxVch2Mesures.visible=true then
                      //    begin
                          labelVch3Max.caption:='U3max = ' +floattostrf(Amax3,ffFixed,4,3)+' V';
                          labelVch3Min.caption:='U3min = ' +floattostrf(Amin3,ffFixed,4,3)+' V';
                          labelVch3DC.caption:=  'U3 DC   ';
                          labelVch3AC.caption:=  'U3 AC   ' ;
                          labelVch3ACDC.caption:='U3        ';
                     //     end;
                    end;



                MultiMetre(4 , Amax4, Amin4,Aff,ti2[0],ti2[2],Fch4,Tch4,VDC4,VAC4,VACDC4 );
                if aff=true then
                    begin
                          if (LabelTch4.visible=true) then
                          begin
                          LabelTch4.caption:='T2 = '+floattostrf(Tch4,ffgeneral,4,3)+'s';
                          LabelFch4.caption:='F2 = '+floattostrf(Fch4,ffNumber,7,0)+'Hz';
                          end;
                     //     if  GroupBoxVch2Mesures.visible=true then
                     //     begin
                          labelVch4Max.caption:='U4max = ' +floattostrf(Amax4,ffFixed,4,3)+' V';
                          labelVch4Min.caption:='U4min = ' +floattostrf(Amin4,ffFixed,4,3)+' V';
                          labelVch4DC.caption:=  'U4 DC  = ' +floattostrf(vdc4,ffFixed,4,3)+' V';
                          labelVch4AC.caption:=  'U4 AC  = ' +floattostrf(vac4,ffFixed,4,3)+' V';
                          labelVch4ACDC.caption:='U4        = ' +floattostrf(vacdc4,ffFixed,4,3)+' V' + #9'AC+DC';
                     //     end;
                    end
                 else
                    begin
                          if (LabelTch4.visible=true) then
                          begin
                          LabelTch4.caption:='T4 = ';
                          LabelFch4.caption:='F4 = ';
                          end;
                      //    if  GroupBoxVch2Mesures.visible=true then
                      //    begin
                          labelVch4Max.caption:='U4max = ' +floattostrf(Amax3,ffFixed,4,3)+' V';
                          labelVch4Min.caption:='U4min = ' +floattostrf(Amin3,ffFixed,4,3)+' V';
                          labelVch4DC.caption:=  'U4 DC   ';
                          labelVch4AC.caption:=  'U4 AC   ' ;
                          labelVch4ACDC.caption:='U4        ';
                     //     end;
                    end;




end;    //de MESURES                  }


//////////////////////////////////////////////////////////////////
////  FIN des Calculs pour                                          ////////////////////////////////////////////////////////////////////////////////////////
////             MULITMETRES....                               ////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////                ////////////////////////////////////////////////////////////////////
//         gestion des ENREGISTREMENTS                  ///                ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                 ////////////////////////////////////////////////////////////////////


 {
procedure TForm_FFT_mut_GTI2.ENRGBRclick(Sender: TObject);
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

procedure TForm_FFT_mut_GTI2.ScrollBarEnregistrementsChange(Sender: TObject);

begin
     CheckBoxA.caption:='C'+inttostr(ScrollBarEnregistrements.position);
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

                        CheckBoxA.caption:=courbes [ScrollBarEnregistrements.position].nom;
                        CheckBoxA.checked:=courbes [ScrollBarEnregistrements.position].visible;
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

                        CheckBoxA.caption:=courbes [ScrollBarEnregistrements.position].nom;
                        CheckBoxA.checked:=courbes [ScrollBarEnregistrements.position].visible;
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
             CheckBoxA.checked:=false;
         end;
end;


procedure TForm_FFT_mut_GTI2.ButtonEnregClick(Sender: TObject);
var
   calibre1,calibre2,calibre3,calibre4:double;
   StringTemp:string;
begin

     if ( nb_courbes_stockees < 10 ) then

        begin


        nb_courbes_stockees := nb_courbes_stockees + 1 ;
        courbes[nb_courbes_stockees].Valide := true ;    //last modif!!!
        courbes[ nb_courbes_stockees ].visible:=true;
        //compteur_courbes_stockees :=  compteur_courbes_stockees + 1 ;



        {stockage de la courbe }
        if (sender=ButtonCH1Enreg) or  ((sender=ButtonDUALEnreg)and (congiguration.VoieVisible[1]=true) )then
         courbes [nb_courbes_stockees].voie1    := Spectre1;

        if (sender=ButtonCH2Enreg) or  ((sender=ButtonDUALEnreg) and (congiguration.VoieVisible[2]=true) )then
         courbes [nb_courbes_stockees].voie2    := Spectre2;

        if (sender=ButtonCH3Enreg) or  ((sender=ButtonDUALEnreg) and (congiguration.VoieVisible[3]=true) )then
         courbes [nb_courbes_stockees].voie3    := Spectre3;

        if (sender=ButtonCH4Enreg) or  ((sender=ButtonDUALEnreg) and (congiguration.VoieVisible[4]=true) )then
         courbes [nb_courbes_stockees].voie4    := Spectre4;


        courbes [nb_courbes_stockees].Tmode[0] := false;
        courbes [nb_courbes_stockees].Tmode[1] := false;
        courbes [nb_courbes_stockees].Tmode[2] := false;
        courbes [nb_courbes_stockees].Tmode[3] := false;
        courbes [nb_courbes_stockees].Tmode[4] := false;



         if Sender = ButtonCH1Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch1;

                 courbes [nb_courbes_stockees].Tmode[1] := true;

                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y1)' ;
            end;
         if Sender = ButtonCH2Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch2;
                 courbes [nb_courbes_stockees].Tmode[2] := true;
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y2)' ;
            end;

         if Sender = ButtonCH3Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch3;
                 courbes [nb_courbes_stockees].Tmode[3] := true;
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y3)' ;
            end;
         if Sender = ButtonCH4Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch4;
                 courbes [nb_courbes_stockees].Tmode[4] := true;
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voie Y4)' ;
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
                 if congiguration.VoieVisible[1] then StringTemp:=StringTemp+' Y1';
                 if congiguration.VoieVisible[2] then StringTemp:=StringTemp+' Y2';
                 if congiguration.VoieVisible[3] then StringTemp:=StringTemp+' Y3';
                 if congiguration.VoieVisible[4] then StringTemp:=StringTemp+' Y4';
                 StringTemp:=StringTemp+' )';
             //    courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + ' (Voies Y 1,2,3 et 4)' ;   //a revoir!!!!!!
                 courbes [nb_courbes_stockees].nom  := 'E' + inttostr( nb_courbes_stockees ) + StringTemp ;   //a revoir!!!!!!
            end
            else
            begin
                 courbes [nb_courbes_stockees].Tmode[0] := false;
            end;

         courbes [nb_courbes_stockees].couleur1 := clFuchsia;
         courbes [nb_courbes_stockees].couleur2 := cllime;
         courbes [nb_courbes_stockees].couleur3 := clYellow;
         courbes [nb_courbes_stockees].couleur4 := clRed;

         courbes [nb_courbes_stockees].freq_ech:= GetSampleFrequency();
         courbes [nb_courbes_stockees].long_ech:= GetRecordLength();
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
   showmessage('Vous ne pouvez pas stocker plus de 10 courbes');
   end;

end;


{
procedure TForm_FFT_mut_GTI2.CheckBoxAClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position].visible:=CheckBoxA.checked;
end;

procedure TOscilloCaba.CheckBoxBClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position+1].visible:=CheckBoxB.checked;
end;

procedure TForm_FFT_mut_GTI2.OptionsAClick(Sender: TObject);
begin
     if nb_courbes_stockees<>0 then
     begin
     courbe_options:=ScrollBarEnregistrements.position;
     oscillocaba.visible:=false;
     Options.visible:=true;
     end;

end;

procedure TForm_FFT_mut_GTI2.OptionsBClick(Sender: TObject);
begin
     courbe_options:=ScrollBarEnregistrements.position+1;
     oscillocaba.visible:=false;
     Options.visible:=true;

end;
}

procedure TForm_FFT_mut_GTI2.SuprimerEnregistrementClick(Sender: TObject);
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

       courbes[nb_courbes_stockees].valide:=false;
       nb_courbes_stockees := nb_courbes_stockees - 1 ;
       ScrollBarEnregistrementsChange(sender);
   end;
   if ScrollBarEnregistrements.position>nb_courbes_stockees then
      ScrollBarEnregistrements.position:=ScrollBarEnregistrements.position-1;
   {
   for i:=nb_courbes_stockees to 10 do
   begin
   courbes[nb_courbes_stockees].voie1:=Treset;
   end;
   }

end;

{
procedure TForm_FFT_mut_GTI2.SuprimerBClick(Sender: TObject);
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

procedure TForm_FFT_mut_GTI2.MONOCOUP_START_Click(Sender: TObject);
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
  //  ProgressBar1.Position:=0;

// lancement du monocoup /////////////////////////////////////////////////////////////////////////////////////////
//    CompteurTIMEOUT:=ScrollBarTimeOutMonoCoup.Position;
  //  ProgressBar.Max:=CompteurTIMEOUT;
  //  monoCoupRunning:=true;

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
           // ProgressBar1.Position:=compteurNOTRIG;
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
            end;

        end;{else if erreur = E_NO_ERRORS}
        TriggerBARREChange(sender);
    end;
    until  ((compteurNOTRIG>=CompteurTIMEOUT)or(reussiteMONOCOUP=true));
    monoCoupRunning:=false;
end;


procedure TForm_FFT_mut_GTI2.MONOCOUP_STOP_Click(Sender: TObject);
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

end;

//////////////////////////////////////////////////////////////////////////////////////
//            FIN
//         gestion MONO COUP
//////////////////////////////////////////////////////////////////////////////////////


procedure TForm_FFT_mut_GTI2.REGRESSIBR1Click(Sender: TObject);
var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    f,spec1,spec2,spec3,spec4               : double;
    fichier                : textfile;
    bloc1                  : textfile;
    bloc2                  : textfile;

    fichier2                : textfile;

    inc ,j                   : integer;
    calibre1,calibre2,calibre3,calibre4      : double;
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
GetSensitivity( 3, @calibre3);
GetSensitivity( 4, @calibre4);

GetWindowsDirectory(@chemin_windows,255);
chemin:=shortstring(chemin_windows)+'\temp\regtemp.rw3';

assignfile(fichier,chemin);
rewrite(fichier);




assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1SPEC.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2SPEC.txt');

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
            f:=5*inc*freqR/recordlength;
            spec1:=(10*Spectre1 [inc*10]*calibre1);
            spec2:=(10*Spectre2 [inc*10]*calibre2);
            spec3:=(10*Spectre3 [inc*10]*calibre3);
            spec4:=(10*Spectre4 [inc*10]*calibre4);

            writeln(fichier,f,' ',spec1,' ',spec2,' ',spec3,' ',spec4);
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


procedure TForm_FFT_mut_GTI2.Regressi2Click(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    f,v1,v2,v3,v4               : double;
    fichier                : textfile;
 //   bloc1                  : textfile;
//    bloc2                  : textfile;

    fichier2                : textfile;

    inc ,j                   : integer;
    calibre1,calibre2      : double;
    freqR                  : dword;
    Recordlength           : dword;
  //  chaine                 : shortstring;
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
writeln(fichier,'OscilloCaba MonoPage Y0123');

write(fichier,'f',#9);

write(fichier,'Y0',inttostr(j),#9);
write(fichier,'Y1',inttostr(j),#9);
write(fichier,'Y2',inttostr(j),#9);
write(fichier,'Y3',inttostr(j),#9);
writeln(fichier);
write(fichier,'Hz',#9);
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

for inc:=0 to round(Recordlength/2)-1 do
       begin
            f:={10*}inc*freqR/recordlength;
            v1:=(Spectre1 [inc{*10}]);
            v2:=(Spectre2 [inc{*10}]);
            v3:=(Spectre3 [inc{*10}]);
            v4:=(spectre4 [inc{*10}]);

            writeln(fichier,f,#9,v1,#9,v2,#9,v3,#9,v4);
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





procedure TForm_FFT_mut_GTI2.Button1Click(Sender: TObject);
begin
TriggerBARREChange (sender);
end;




procedure TForm_FFT_mut_GTI2.FormPaint(Sender: TObject);
var
    i,j,widthnull:integer;
begin
     widthnull:=326;

    {$IFDEF CABALABin}

    if unitcabalab.passif[2]= false then
      ButtonGBF.Visible:=true
    else
      ButtonGBF.Visible:=false;
    {$ENDIF}


    PaintBoxECRAN.Width :=Form_FFT_mut_GTI2.ClientWidth-widthnull  ;
    PaintBoxECRAN1.Width:=Form_FFT_mut_GTI2.ClientWidth-widthnull  ;
    PaintBoxECRAN2.Width:=Form_FFT_mut_GTI2.ClientWidth-widthnull  ;
    PaintBoxECRAN3.Width:=Form_FFT_mut_GTI2.ClientWidth-widthnull  ;
    PaintBoxECRAN4.Width:=Form_FFT_mut_GTI2.ClientWidth-widthnull  ;

    PaintBoxXY.Top:=round(Form_FFT_mut_GTI2.ClientHeight/2);
    PaintBoxXY.Width:=Form_FFT_mut_GTI2.ClientWidth-widthnull  ;
    PaintBoxXY.height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-16;

    if congiguration.affichage=3 then
    begin
        PaintBoxECRAN.height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-4-16;
    end
    else
    PaintBoxECRAN.height:=Form_FFT_mut_GTI2.ClientHeight-32;

    //ScrollBarLevelTrigger.Height:=Form_FFT_mut_GTI2.ClientHeight;



    ScrollBar0CH1.Left:=Form_FFT_mut_GTI2.ClientWidth-24;
    ScrollBar0CH2.Left:=Form_FFT_mut_GTI2.ClientWidth-24;
    ScrollBar0CH3.Left:=Form_FFT_mut_GTI2.ClientWidth-24;
    ScrollBar0CH4.Left:=Form_FFT_mut_GTI2.ClientWidth-24;

    PositionEcransTOP[1,1]:=16;
    PositionEcransTOP[2,1]:=16;
    PositionEcransTOP[2,2]:=round((Form_FFT_mut_GTI2.ClientHeight-16)/2)+16;
    PositionEcransTOP[3,1]:=16;
    PositionEcransTOP[3,2]:=round((Form_FFT_mut_GTI2.ClientHeight-16)/3)+16;
    PositionEcransTOP[3,3]:=2*round((Form_FFT_mut_GTI2.ClientHeight-16)/3)+16;
    PositionEcransTOP[4,1]:=16;
    PositionEcransTOP[4,2]:=round((Form_FFT_mut_GTI2.ClientHeight-16)/4)+16;
    PositionEcransTOP[4,3]:=2*round((Form_FFT_mut_GTI2.ClientHeight-16)/4)+16;
    PositionEcransTOP[4,4]:=3*round((Form_FFT_mut_GTI2.ClientHeight-16)/4)+16;

    PositionEcransHEIGHT[1]:=Form_FFT_mut_GTI2.ClientHeight-32-16;
    PositionEcransHEIGHT[2]:=round((Form_FFT_mut_GTI2.ClientHeight-16)/2)-4;
    PositionEcransHEIGHT[3]:=round((Form_FFT_mut_GTI2.ClientHeight-16)/3)-4;
    PositionEcransHEIGHT[4]:=round((Form_FFT_mut_GTI2.ClientHeight-16)/4)-4;

    if ((congiguration.affichage=1) or ((CheckBoxXY.Checked=true)and(congiguration.affichage=2))) then
    begin
    PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[1];
    PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
    end;
    if ((congiguration.affichage=2) and (CheckBoxXY.Checked=false)) then
    begin
    PaintBoxTRIGlevel.Height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible   ];
    PaintBoxTRIGlevel.top:=PositionEcransTOP[congiguration.NbVoiesVisible  ,congiguration.Trigger];
    end;
    if congiguration.affichage=3 then
    begin
    PaintBoxTRIGlevel.Height:=round(Form_FFT_mut_GTI2.ClientHeight/2)-4-16;
    PaintBoxTRIGlevel.top:=PositionEcransTOP[1,1];
    end;


    for i:=1 to 4 do
    begin
   // TpaintBoxColorYx[i].Canvas.Pen.Width :=1;
   // TpaintBoxColorYx[i].Canvas.pen.Color := congiguration.couleurs[i];
   // TpaintBoxColorYx[i].Canvas.Brush.Color := congiguration.couleurs[i];
    Tshapecalibre[i].Brush.Color:= congiguration.couleurs[i];
    TcheckBoxVoieVisible[i].Font.Color:= congiguration.couleurs[i];
    Tgroupboxvoie[i].Font.Color :=congiguration.couleurs[i];
    TRadioButtonYxSondeX1[i].Font.Color:= congiguration.couleurs[i];
    TRadioButtonYxSondeX10[i].Font.Color:= congiguration.couleurs[i];
    //TpaintBoxColorYx[i].Canvas.Rectangle(0, 0, TpaintBoxColorYx[i].Width - 1, TpaintBoxColorYx[i].Height - 1);
    end ;

//scrollbarres décalages des zéros
//reset des écrans
//affichage

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












//reset--------------------------------------
if congiguration.Acumul=false then
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

end; //if congiguration.Acumul=false











//affichage   -----------------------------------------
        TchXDoubleArray[1]:=Ch1DoubleArray;       //copie des tableaux pour utilisation des indices ds la procédure d'affichage
        TchXDoubleArray[2]:=Ch2DoubleArray;
        TchXDoubleArray[3]:=Ch3DoubleArray;
        TchXDoubleArray[4]:=Ch4DoubleArray;
        TspectreXDoubleArray[1]:=Spectre1;       //pas utilisé encore mais a faire....
        TspectreXDoubleArray[2]:=Spectre2;
        TspectreXDoubleArray[3]:=Spectre3;
        TspectreXDoubleArray[4]:=Spectre4;
        if CheckBoxXY.Checked=true then
        begin

//            Affichage_voiesXY(PaintBoxECRAN);

        end
        else    {if CheckBoxXY.Checked=true}
        begin

            if congiguration.affichage=1 then
            begin
                {
                if congiguration.VoieVisible[1]=true then Affichage_voie_CH1(PaintBoxECRAN);
                if congiguration.VoieVisible[2]=true then Affichage_voie_CH2(PaintBoxECRAN);
                if congiguration.VoieVisible[3]=true then Affichage_voie_CH3(PaintBoxECRAN);
                if congiguration.VoieVisible[4]=true then Affichage_voie_CH4(PaintBoxECRAN);
                }
                if changement=True then Longueur_Acquisition :=   rLengthOld
                else Longueur_Acquisition := strtoint(recordlengthbox.text);
                changement:=false;
              { for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then Affichage_voie_CHX(PaintBoxECRAN , i)
                end; }
                Affichage_voiS_BLEU_DYN(PaintBoxECRAN);
               // PaintBoxECRAN.Canvas.Pen.Color := clWhite;//contour BLANC uniquement en mode 1 ecran pour 4 voies, sinon contour de la couleur de la voie...
            end; {if congiguration.affichage=1}

            if congiguration.affichage=2 then
            begin
            {
                if congiguration.VoieVisible[1]=true then Affichage_voie_CH1(PaintBoxECRAN1);
                if congiguration.VoieVisible[2]=true then Affichage_voie_CH2(PaintBoxECRAN2);
                if congiguration.VoieVisible[3]=true then Affichage_voie_CH3(PaintBoxECRAN3);
                if congiguration.VoieVisible[4]=true then Affichage_voie_CH4(PaintBoxECRAN4);
                }
                if changement=True then Longueur_Acquisition :=   rLengthOld
                else Longueur_Acquisition := strtoint(recordlengthbox.text);
                changement:=false;
                for i:=1 to 4 do
                begin
                  // if congiguration.VoieVisible[i]=true then Affichage_voie_CHX(Tecrans[i] , i)
                   if congiguration.VoieVisible[i]=true then Affichage_voiS_par_vois_BLEU_DYN(Tecrans[i] , i)
                end;

            end;  {if congiguration.affichage=2}



            if congiguration.affichage=3 then
            begin
            {
                if congiguration.VoieVisible[1]=true then Affichage_voie_CH1(PaintBoxECRAN);
                if congiguration.VoieVisible[2]=true then Affichage_voie_CH2(PaintBoxECRAN);
                if congiguration.VoieVisible[3]=true then Affichage_voie_CH3(PaintBoxECRAN);
                if congiguration.VoieVisible[4]=true then Affichage_voie_CH4(PaintBoxECRAN);
                }
                if changement=True then Longueur_Acquisition :=   rLengthOld 
                else Longueur_Acquisition := strtoint(recordlengthbox.text);
                changement:=false;
               { for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then
                      begin
                        Affichage_voie_CHX(PaintBoxECRAN , i);
                        Affichage_voiesXY(PaintBoxXY,i);
                      end;
                end; }
                Affichage_voiS_BLEU_DYN(PaintBoxECRAN);
                Affichage_XY_BLEU_DYN(PaintBoxXY)
              //  PaintBoxECRAN.Canvas.Pen.Color := clWhite;//contour BLANC uniquement en mode 1 ecran pour 4 voies, sinon contour de la couleur de la voie...

               // Affichage_voiesXY(PaintBoxXY,i);
            end;  {if congiguration.affichage=3}

        end;  {else du if CheckBoxXY.Checked=true}





    {
    if congiguration.Enregistrement then
    affichageEnregistrements( paintboxA);
    }
    FormResize(sender);
end;

procedure TForm_FFT_mut_GTI2.ResetEcran_bitmap (sender: Tbitmap;ZEROTRAI:boolean);
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

    //if congiguration.DecalZeros=false then
    if    ZEROTRAI=true then
    begin
    Sender.Canvas.Pen.Color := coulGRILLE;                    /////pas dans le config !!!!!!!!!!
    Sender.Canvas.MoveTo(0, 4*round(Sender.Height/8)+1 );
    Sender.Canvas.LineTo(Sender.Width , 4*round(Sender.Height/8)+1);
    end;

// LIGNE PRE TRIG
  {  if congiguration.PreTrig=true then
    begin
    Sender.Canvas.Pen.Color := coulGRILLE;            /////pas dans le config !!!!!!!!!!
    Sender.Canvas.MoveTo(round(Sender.Width/10), 0 );
    Sender.Canvas.LineTo(round(Sender.Width/10) , Sender.Height);
    end;    }
end;


procedure TForm_FFT_mut_GTI2.Affichage_voie_CHX_bitmap(Sender: Tbitmap; voie:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    calibre : double;
 //   Longueur_Acquisition : dword;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin
sender.Canvas.Pen.Width :=1;
sender.Canvas.pen.Color :=clinfobk ;

sender.Canvas.Brush.Color := clinfobk;
sender.Canvas.Rectangle(0, 0, sender.Width - 1 , sender.Height - 1 );

TesterDepassementSignal1(self);
TesterDepassementSignal2(self);
TesterDepassementSignal3(self);
TesterDepassementSignal4(self);

  if CheckBoxY1Visible.Checked=true then
          begin
            calcul_spectre_CH1(Self);
          //  TesterDepassementSignal1(self);
          end;
  if CheckBoxY2Visible.Checked=true then
          begin
            calcul_spectre_CH2(Self);
            //TesterDepassementSignal2(self);
          end;
  if CheckBoxY3Visible.Checked=true then
          begin
            calcul_spectre_CH3(Self);
            //TesterDepassementSignal3(self);
          end;
  if CheckBoxY4Visible.Checked=true then
          begin
            calcul_spectre_CH4(Self);
            // TesterDepassementSignal4(self);
          end;

//Longueur_Acquisition :=getpostsamples();
Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
if congiguration.sensibilitee[voie]<3 then Calibre:=Calibre/2;
//if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;

// ligne de 0 en pointillés
    {Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)) );

    i:=1 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    Sender.Canvas.MoveTo(i+1 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    i:=i+2;
    end;   }

//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
Sender.Canvas.MoveTo(0, Round(  -TspectreXDoubleArray[voie][ 0 ]*8 * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)+(Sender.Height/2) ));

      try
        {  for Curseur_Abscisse := 0 to 2*Sender.Width - 1 do
          begin
          ValeurrealOrdonnee:= -TspectreXDoubleArray[voie][ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) +(Sender.Height/2) ;
          Curseur_Ordonnee  := Round(  ValeurrealOrdonnee )-2;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), Curseur_Ordonnee)
          else
          begin
         //   Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), 0);
            Sender.Canvas.LineTo(round(Curseur_Abscisse/2), Curseur_Ordonnee);
          end;
          end;}
          for Curseur_Abscisse := 0 to Longueur_Acquisition - 1 do
          begin
          ValeurrealOrdonnee:= -TspectreXDoubleArray[voie][ Curseur_Abscisse]   * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) +(Sender.Height/2) ;
          Curseur_Ordonnee  := Round(  ValeurrealOrdonnee )-2;
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(Curseur_Abscisse/Longueur_Acquisition * Sender.Width ), Curseur_Ordonnee)
          else
          begin
         //   Sender.Canvas.MoveTo(round(Curseur_Abscisse/2), 0);
            Sender.Canvas.LineTo(round(Curseur_Abscisse/Longueur_Acquisition * Sender.Width), Curseur_Ordonnee);
          end;
          end;
      except
      end;

end;




{
procedure TForm_FFT_mut_GTI2.Affichage_voie_CHX_bitmap(Sender: Tbitmap ; voie:integer);
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

 {
    if  (congiguration.PreTrig=true) {and (voie=congiguration.Trigger)} // then                  // si PRETRIG
 {       begin

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

            if {(voie=congiguration.Trigger) and} {(congiguration.PreTrig=true) and (DecalPreTrig + round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) <0) then
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

end;        }

procedure TForm_FFT_mut_GTI2.Affichage_voiesXY_bitmap(Sender: Tbitmap; voie:integer);

 var Curseur_Abscisse, Curseur_Ordonnee : Word;
   // Calibre1 , Calibre2 : Double;
    calibre : double;
//    Longueur_Acquisition : dword;
 //    x,y,t:integer;
  //   INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin
sender.Canvas.Pen.Width :=1;
sender.Canvas.pen.Color :=clinfobk ;

sender.Canvas.Brush.Color := clinfobk;
sender.Canvas.Rectangle(0, 0, sender.Width - 1 , sender.Height - 1 );

//calcul_spectre_CH1(Self);
//Longueur_Acquisition := {round(GetRecordLength()/2)}1000;
Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
//if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;
  Sender.Canvas.Pen.Color := congiguration.couleurs[5];
  Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
  Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
// ligne de 0 en pointillés
//Sender.Canvas.Pen.Width :=clWhite;
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
//    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)) );
 Sender.Canvas.MoveTo(0, round(Sender.Height+(Sender.Height/2)) );
    i:=1 ;
    while  i<= Sender.Width do
    begin
//  Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    Sender.Canvas.LineTo(i , round(Sender.Height+(Sender.Height/2)));
//  Sender.Canvas.MoveTo(i+1 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max+(Sender.Height/2)));
    Sender.Canvas.MoveTo(i+1 , round(Sender.Height+(Sender.Height/2)));
    i:=i+2;
    end;

//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
//Sender.Canvas.MoveTo(0, Round(  -TchXDoubleArray[voie][ 0 ]* (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)+(Sender.Height/2) ));
Sender.Canvas.MoveTo(0, Round(  -TchXDoubleArray[voie][ 0 ]* (Sender.Height/2) / Calibre +(Sender.Height/2) ));
      try
          for Curseur_Abscisse := 0 to round(Sender.Width/2.5) - 1 do
          begin
//          ValeurrealOrdonnee:=         -(INV)*TchXDoubleArray[voie][ round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) +(Sender.Height/2) ;
          ValeurrealOrdonnee:= -TchXDoubleArray[voie][ round( Curseur_Abscisse * {Longueur_Acquisition }512/ Sender.Width ) ] * (Sender.Height/2) / Calibre + (Sender.Height/2) ;
          Curseur_Ordonnee  := Round(  ValeurrealOrdonnee );
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(round(2.5*Curseur_Abscisse), Curseur_Ordonnee)
          else Sender.Canvas.LineTo(round(2.5*Curseur_Abscisse), Curseur_Ordonnee);
          end;
      except
      end;

GetSampleFreqEdit.Visible:=true;
end;


procedure TForm_FFT_mut_GTI2.Affichage_voiS_BLEU_DYN(Destination: Tpaintbox);
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

    ResetEcran_bitmap (T_bmp[0],false);

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

procedure TForm_FFT_mut_GTI2.Affichage_voiS_par_vois_BLEU_DYN(Destination: Tpaintbox;No_voie:integer);
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

    ResetEcran_bitmap (T_bmp[0],false);

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


procedure TForm_FFT_mut_GTI2.Affichage_XY_BLEU_DYN(Destination: Tpaintbox);
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

    ResetEcran_bitmap (T_bmp[0],true);

    for i:=1 to 4 do
    begin
        if congiguration.VoieVisible[i]=true then
        begin
       // Affichage_voie_CHX_bitmap(T_bmp[1] , i);
        Affichage_voiesXY_bitmap(T_bmp[1] , i);
        T_bmp[1].transparentColor := clinfobk;
        T_bmp[1].transparent := true;
        T_bmp[0].canvas.draw(0,0,T_bmp[1]);
        end;
    end;


    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);
    Destination.Canvas.CopyRect(rectangle,T_bmp[0].canvas,rectangle);

    for i:=0 to 1 do
    begin
    T_bmp[i].free;
    end;



end;

procedure TForm_FFT_mut_GTI2.RESET_Normal_BLEU_DYN(Destination: Tpaintbox);
var
T_bmp:Tbitmap;
rectangle : Trect;
i:integer;
begin
    T_bmp := Tbitmap.Create;
    T_bmp.PixelFormat := pf24bit;
    T_bmp.Width:=Destination.width;
    T_bmp.Height:=Destination.Height;

    ResetEcran_bitmap (T_bmp,false);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);

    Destination.Canvas.CopyRect(rectangle,T_bmp.canvas,rectangle);

    T_bmp.free;
end;

procedure TForm_FFT_mut_GTI2.RESET_XY_BLEU_DYN(Destination: Tpaintbox);
var
T_bmp:Tbitmap;
rectangle : Trect;
i:integer;
begin
    T_bmp := Tbitmap.Create;
    T_bmp.PixelFormat := pf24bit;
    T_bmp.Width:=Destination.width;
    T_bmp.Height:=Destination.Height;

    //ResetEcranXY_bitmap (T_bmp);

    rectangle:=classes.Rect(0,0,Destination.width,Destination.Height);

    Destination.Canvas.CopyRect(rectangle,T_bmp.canvas,rectangle);

    T_bmp.free;
end;







function TForm_FFT_mut_GTI2.TesterDepassementSignal1( Sender : TObject) : boolean;
var max,min,count:dword;I:integer;
testmax,testmin:boolean;
levelsync,dhelp :double;
begin
 // LabelWARNING1.Visible:=false;
  result := False;
  testmin :=False;
  testmax:=False;
  count:=GetPostSamples;
  max:=32767;
  min:=32767;
  for I := 0 to Count - 1 do
  begin
       if ch1WordArray[I]> max then max:=ch1WordArray[i];
       if ch1WordArray[I]< min then min:=ch1WordArray[i];
  end;

  if (max>65000) then testmax:=True;
  if (max<500) then testmax:=True;
  if (min>65000) then testmin:=True;
  if (min<500) then testmin:=True;
  if CheckBox1.Visible=True then
    if CheckBox1.Checked=True then
    begin
      GetSensitivity( lCh1, @dHelp);
      levelsync:=((max+min)/2-32767)/32767{* (Display.Height / 2)}*dhelp;
     { triglevelCh1box.Text := FloatToStr(levelsync);}
      settriggerlevel(1,levelsync);
    end;
  {test:=False;}
  if (testmax=True) then  result:=True;
  if (testmin=True) then  result:=True;
//  edit2.text:=inttostr(max)+'  '+inttostr(min);
  if result=True then
  begin
  TimerDepassementSignal1.Enabled:=true;
  LabelWARNING1.Visible:=true
  end
  else
  begin
  TimerDepassementSignal1.Enabled:=false;
    if LabelWARNING1.Visible=true then LabelWARNING1.Visible:=false ;
  end;
end; { function TForm1.TesterDepassementSignal}

function TForm_FFT_mut_GTI2.TesterDepassementSignal2( Sender : TObject) : boolean;
var max,min,count:dword;I:integer;
testmax,testmin:boolean;
levelsync,dhelp :double;
begin
 // LabelWARNING2.Visible:=false;
  result := False;
  testmin :=False;
  testmax:=False;
  count:=GetPostSamples;
  max:=32767;
  min:=32767;
  for I := 0 to Count - 1 do
  begin
       if ch2WordArray[I]> max then max:=ch2WordArray[i];
       if ch2WordArray[I]< min then min:=ch2WordArray[i];
  end;

  if (max>65000) then testmax:=True;
  if (max<500) then testmax:=True;
  if (min>65000) then testmin:=True;
  if (min<500) then testmin:=True;
    if CheckBox1.Visible=True then
    if CheckBox1.Checked=True then
    begin
      GetSensitivity( lCh2, @dHelp);
      levelsync:=((max+min)/2-32767)/32767{* (Display.Height / 2)}*dhelp;
     { triglevelCh2box.Text := FloatToStr(levelsync);}
      settriggerlevel(2,levelsync);
    end;
  {test:=False;}
  if (testmax=True) then  result:=True;
  if (testmin=True) then  result:=True;
//  edit2.text:=inttostr(max)+'  '+inttostr(min);
  if result=True then
  begin
  TimerDepassementSignal2.Enabled:=true;
  LabelWARNING2.Visible:=true
  end
  else
  begin
  TimerDepassementSignal2.Enabled:=false;
    if LabelWARNING2.Visible=true then LabelWARNING2.Visible:=false;
  end;
end; { function TForm1.TesterDepassementSignal2 }


function TForm_FFT_mut_GTI2.TesterDepassementSignal3( Sender : TObject) : boolean;
var max,min,count:dword;I:integer;
testmax,testmin:boolean;
levelsync,dhelp :double;
begin
 // LabelWARNING3.Visible:=false;
  result := False;
  testmin :=False;
  testmax:=False;
  count:=GetPostSamples;
  max:=32767;
  min:=32767;
  for I := 0 to Count - 1 do
  begin
       if ch3WordArray[I]> max then max:=ch3WordArray[i];
       if ch3WordArray[I]< min then min:=ch3WordArray[i];
  end;

  if (max>65000) then testmax:=True;
  if (max<500) then testmax:=True;
  if (min>65000) then testmin:=True;
  if (min<500) then testmin:=True;
    if CheckBox1.Visible=True then
    if CheckBox1.Checked=True then
    begin
      GetSensitivity( lCh3, @dHelp);
      levelsync:=((max+min)/2-32767)/32767{* (Display.Height / 2)}*dhelp;
     { triglevelCh2box.Text := FloatToStr(levelsync);}
      settriggerlevel(2,levelsync);
    end;
  {test:=False;}
  if (testmax=True) then  result:=True;
  if (testmin=True) then  result:=True;
//  edit2.text:=inttostr(max)+'  '+inttostr(min);
  if result=True then
  begin
  TimerDepassementSignal3.Enabled:=true;
  LabelWARNING3.Visible:=true
  end
  else
  begin
  TimerDepassementSignal3.Enabled:=false;
    if LabelWARNING3.Visible=true then LabelWARNING3.Visible:=false;
  end;
end; { function TForm1.TesterDepassementSignal3 }


function TForm_FFT_mut_GTI2.TesterDepassementSignal4( Sender : TObject) : boolean;
var max,min,count:dword;I:integer;
testmax,testmin:boolean;
levelsync,dhelp :double;
begin
 // LabelWARNING4.Visible:=false;
  result := False;
  testmin :=False;
  testmax:=False;
  count:=GetPostSamples;
  max:=32767;
  min:=32767;
  for I := 0 to Count - 1 do
  begin
       if ch4WordArray[I]> max then max:=ch4WordArray[i];
       if ch4WordArray[I]< min then min:=ch4WordArray[i];
  end;

  if (max>65000) then testmax:=True;
  if (max<500) then testmax:=True;
  if (min>65000) then testmin:=True;
  if (min<500) then testmin:=True;
    if CheckBox1.Visible=True then
    if CheckBox1.Checked=True then
    begin
      GetSensitivity( lCh4, @dHelp);
      levelsync:=((max+min)/2-32767)/32767{* (Display.Height / 2)}*dhelp;
     { triglevelCh2box.Text := FloatToStr(levelsync);}
      settriggerlevel(4,levelsync);
    end;
  {test:=False;}
  if (testmax=True) then  result:=True;
  if (testmin=True) then  result:=True;
//  edit2.text:=inttostr(max)+'  '+inttostr(min);
  if result=True then
  begin
  TimerDepassementSignal4.Enabled:=true;
  LabelWARNING4.Visible:=true
  end
  else
  begin
  TimerDepassementSignal4.Enabled:=false;
    if LabelWARNING4.Visible=true then LabelWARNING4.Visible:=false;
  end;
 // edit4.Text:=floattostr(max)+'  '+floattostr(min);
end; { function TForm1.TesterDepassementSignal4 }


procedure TForm_FFT_mut_GTI2.TimerDepassementSignal1Timer(Sender: TObject);
begin
if LabelWARNING1.Visible=true then LabelWARNING1.Visible:=false else LabelWARNING1.Visible:=true;
end;

procedure TForm_FFT_mut_GTI2.TimerDepassementSignal2Timer(Sender: TObject);
begin
if LabelWARNING2.Visible=true then LabelWARNING2.Visible:=false else LabelWARNING2.Visible:=true;
end;

procedure TForm_FFT_mut_GTI2.TimerDepassementSignal3Timer(Sender: TObject);
begin
if LabelWARNING3.Visible=true then LabelWARNING3.Visible:=false else LabelWARNING3.Visible:=true;
end;

procedure TForm_FFT_mut_GTI2.TimerDepassementSignal4Timer(Sender: TObject);
begin
if LabelWARNING4.Visible=true then LabelWARNING4.Visible:=false else LabelWARNING4.Visible:=true;
end;



procedure TForm_FFT_mut_GTI2.Aide1Click(Sender: TObject);
begin
FFT_utilisation.Visible := true ;
FFT_utilisation.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.Aide2Click(Sender: TObject);
begin
FFT_abscisse.Visible := true ;
FFT_abscisse.BringToFront;
end;


procedure TForm_FFT_mut_GTI2.Aide3Click(Sender: TObject);
begin
FFT_ordonnee.Visible := true ;
FFT_ordonnee.BringToFront;
end;


procedure TForm_FFT_mut_GTI2.Aide3bisClick(Sender: TObject);
begin
FFT_frequence.Visible := true ;
FFT_frequence.BringToFront;
end;


procedure TForm_FFT_mut_GTI2.Aide4Click(Sender: TObject);
begin
FFT_BdeT.Visible := true ;
FFT_BdeT.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.Aide5Click(Sender: TObject);
begin
//FFT_trigger.Visible := true ;
//FFT_trigger.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.Aide6Click(Sender: TObject);
begin
FFT_stop.Visible := true ;
FFT_stop.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.Aide7Click(Sender: TObject);
begin
FFT_logo.Visible := true ;
FFT_logo.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.Aide8Click(Sender: TObject);
begin
FFT_Accu.Visible := true ;
FFT_Accu.BringToFront;
end;

procedure TForm_FFT_mut_GTI2.Aide9Click(Sender: TObject);
begin
FFT_transfert.Visible := true ;
FFT_transfert.BringToFront;
end;



















end.
