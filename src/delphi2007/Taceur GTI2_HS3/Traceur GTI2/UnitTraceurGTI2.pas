unit UnitTraceurGTI2;

//  TRACEUR GTI2  V:20

{$DEFINE CABALABin}           //: fonctionne DANS CABALAB
//{$DEFINE Independant}           //: pour utiliser sans cabalab


interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls,dlldecl,Inifiles, Buttons,
  ImgList, ToolWin;

Type
   Totalarray=array[0..100000]of double;


{definition de l'objet configuration, de l'interface utilisateur, oscillo}
type config = record

   Start   : Boolean;       //true: timer en route, variable controlé par le button Run/Stop
   StartTraceur : Boolean;   //true:letraceur enregistre les donnée sinon que l'intantanée dynamique

   Trigger : integer;     //0 : sans, 1 : Y1, 2 : Y2, 3 : Y3, 4 : Y4.
   front   : integer;     //1 : montant, 0 decendant.
   Level   : double;        //?????

   VoieVisible : array [1..4] of boolean; //[a]:=true : Ya visible     [a]:=false : Ya INvisible et non acqui
   couleurs    : array [0..5] of Tcolor;  //0: fond d'écran ; 1,2,3,4 couleurs des traces des voies 1234  ; 5:GRILLE
   PenWidth    : integer;                 //épaisseur des traces à l'écran;

   NbVoiesVisible : integer; //0,1,2,3,4 pour le nb d'écrab en mode 1 écran/voie...

   OptionSondes : boolean;
   SondeVoie   : array [1..4] of boolean; //[a]:=true : Ya x10         [a]:=false : Ya x1
   Unipolaire  : array [1..4] of boolean; //[a]:=true : Ya UNIPOLAIRE  [a]:=false : Ya DIFFERENTIEL
   OptionDIFFfacade   : boolean;
   sensibilitee: array [1..4] of integer; //[a]: voie Ya, valeurs : cf numéros index combobox

   OptionINV   : boolean;
   Invertion   : array [1..4] of boolean; //[a]:=true : Ya INV  [a]:=false : Ya normal

   DecalZeros : boolean;                  //true = oui...
   ValeursDecalZERO   : array [1..4]  of integer;

   ToutesOptions : boolean;

   MULTI         : boolean;                  //true = oui...
   Enregistrement: boolean;                  //true = oui...
   MONOCOUP      : boolean;                  //true = oui...
   Acumul        : boolean;

   BaseDetemps   : integer;                 //Cf numéros de base de temps (valeurs scrollbarre)
   TimeOut       : integer;                 //no menu du time out "getusbdata" avec retour 0 pas de trig ou pas de data
   timeoutVALEURutilisateur : integer;                 // NB de  "getusbdata" avec retour 0 pas de trig ou pas de data  avant un reset écrans

   Vitesse  : integer;                    //1 : trés lent/ trés précis; 2 : lent/ précis; 3 :+rapide -précis  ; 4 :++rapide --précis
   affichage : integer;                   //1:normal;  2:normal+interval 3:1écran/voie 41 écran/voie + interval

   ConfigOscillo : integer;

   //DiviseurTraceur : integer;             //1sur n perso;
   //interval       :integer;               //durée en 1/100 de seconde entre deux points
   //duree           :integer;             //durée d'enregistrement en secondes
   //NbDePts         :integer;              //nb de point de l'enregistrement FINIT
   //DureeAff        :integer;             //durée du bout d'enregistrement affiché
end;

{definition de l'objet traceur, cofig de l'enregstrement en cours enregistrements}
type TTraceur = record

    GestionFlux : boolean;
    EnrgDuAff   : boolean;
    EnrgExplo   : boolean;

    FLUXTIME  :integer;   //[0..1000]  nb de pont nouveaux ds la ram depuis le dernier reset ramtime
    LastPtsTime  :integer;

    Enregistrement:array[1..40,0..100000]of double;

    Ttemps:array [0..100000]of integer;   //temps en ms de chaque enregistrements  depuis le start enregistrement

    StartTraceur    : Boolean;           //true:letraceur enregistre les donnée sinon que l'intantanée dynamique


    DiviseurTraceur : integer;           //1sur n perso;

    interval        :integer;            //durée en 1/1000 de seconde entre deux points
                                         //pour l'enregistrement de la cofig voir congiguration.BaseDetemps
                                         
    duree           :integer;            //durée d'enregistrement en secondes
    ItemDuree       :integer;            //pour l'enregistrement de la config No itemindex

    DureeAff        :integer;            //durée du bout d'enregistrement affiché en  secondes
    ItemDureeAff    :integer;            //pour l'enregistrement de la config No itemindex

    DureeAFF_MODE   :Integer;            // 0:enregistrement instantané
                                         // 1:durée de l'enregistrement
                                         // 2: a partir de la fin flotant
                                         // 3:exploration

    NbDePtsFin      :integer;            //nb de points de l'enregistrement FINIT
    NbDePtsInst     :integer;            //nb de points de l'enregistrement de l'instant...
    NbdePtsInterval :integer;
    NbDePtsAFF      :integer;            //nb de points a afficher
    PtsExploration  :integer;            //pts de fin de l'interval d'afficage en mode exploration

    //HORLOGE
    msec:integer;
    sec:integer;
    min:integer;
    heu:integer;
    jou:integer;
    //HORLOGE EXPLORATION
    explo_msec:integer;
    explo_sec:integer;
    explo_min:integer;
    explo_heu:integer;
    explo_jou:integer;
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
  TFormTraceurGTI2 = class(TForm)
    PaintBoxECRAN: TPaintBox;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    GroupBoxTrigger: TGroupBox;
    GroupBoxVOIES: TGroupBox;
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
    N4: TMenuItem;
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
    N5: TMenuItem;
    MenuDecalZeros: TMenuItem;
    Button0DECALCH1: TButton;
    Button0DECALCH2: TButton;
    Button0DECALCH3: TButton;
    Button0DECALCH4: TButton;
    Button0LEVEL: TButton;
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
    CheckBoxA: TCheckBox;
    VUlent: TMenuItem;
    ConfigOscilo800600: TMenuItem;
    ConfigOscilo1024768: TMenuItem;
    ConfigOscilo1280960: TMenuItem;
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
    MenuInterfaceTaille: TMenuItem;
    MenuEnregChargConfig: TMenuItem;
    MenuEnregConfig: TMenuItem;
    Charger1: TMenuItem;
    menuTIMEOUEUTILISATEURREGLAGE: TMenuItem;
    menuCouleurs: TMenuItem;
    RegressiDDE: TMenuItem;
    N8: TMenuItem;
    MenuRegUtilisateur: TMenuItem;
    PaintBoxColor1: TPaintBox;
    PaintBoxColor2: TPaintBox;
    PaintBoxColor3: TPaintBox;
    PaintBoxColor4: TPaintBox;
    MenuApropos: TMenuItem;
    Apropo: TMenuItem;
    N10: TMenuItem;
    Enregistrement1: TMenuItem;
    Chargement1: TMenuItem;
    menuRESETconfig: TMenuItem;
    ButtonRunStop: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PaintBoxTRACEUR: TPaintBox;
    EcranTraceur: TMenuItem;
    GroupBoxTRACEUR: TGroupBox;
    ButtonRESET: TButton;
    ButtonStartTraceur: TButton;
    GroupBoxLongEnrg: TGroupBox;
    ComboBoxExLongEnrg: TComboBoxEx;
    Label1: TLabel;
    ComboBoxExDurAff: TComboBoxEx;
    Label6: TLabel;
    Normalinterval: TMenuItem;
    ecranPVinterval: TMenuItem;
    RadioButtonData: TRadioButton;
    ScrollBarExporation: TScrollBar;
    ProgressBarUSBTrame: TProgressBar;
    Label4: TLabel;
    CheckBoxExplorationEnregistrement: TCheckBox;
    menuBDTfreqEch: TMenuItem;
    menuBDTF100: TMenuItem;
    menuBDTF1000: TMenuItem;
    menuBDTF500: TMenuItem;
    GroupBoxBaseDeTemps: TGroupBox;
    ScrollBarBDT: TScrollBar;
    RadioButtonBDT4: TRadioButton;
    RadioButtonBDT5: TRadioButton;
    RadioButtonBDT6: TRadioButton;
    RadioButtonBDT7: TRadioButton;
    RadioButtonBDT8: TRadioButton;
    RadioButtonBDT9: TRadioButton;
    RadioButtonBDT10: TRadioButton;
    RadioButtonBDT11: TRadioButton;
    RadioButtonBDT12: TRadioButton;
    RadioButtonBDT1: TRadioButton;
    RadioButtonBDT2: TRadioButton;
    RadioButtonBDT3: TRadioButton;
    ScrollBarDecalBDT: TScrollBar;
    RadioButtonBDT13: TRadioButton;
    RadioButtonBDT14: TRadioButton;
    RadioButtonBDT15: TRadioButton;
    GroupBoxTEMPS: TGroupBox;
    LabelHeur: TLabel;
    LabelMinute: TLabel;
    Labelsecondes: TLabel;
    Labelmillisec: TLabel;
    LabelJour: TLabel;
    PanelExploDebut: TPanel;
    LabelExploDebut_ms: TLabel;
    LabelExploDebut_s: TLabel;
    LabelExploDebut_m: TLabel;
    LabelExploDebut_h: TLabel;
    PanelExploFIN: TPanel;
    LabelExploFIN_ms: TLabel;
    LabelExploFIN_s: TLabel;
    LabelExploFIN_m: TLabel;
    LabelExploFIN_h: TLabel;
    MenuOptionGestion: TMenuItem;
    MenuOptionVoies: TMenuItem;
    MenuOptionEnregistrement: TMenuItem;
    MenuOptionVisualisationFLUX: TMenuItem;
    MenuOptionSondes: TMenuItem;
    MenuOptionInv: TMenuItem;
    MenuOptionDuAffEnrg: TMenuItem;
    MenuOptionExploration: TMenuItem;
    N7: TMenuItem;
    MenuOptionTOUTES: TMenuItem;
    LabelRupturedeflux: TLabel;
    menu_newfichier_REG: TMenuItem;
    menu_newpage_REG: TMenuItem;
    MenuUniDiffFacade_2: TMenuItem;
    CheckBoxUniDiff1: TCheckBox;
    CheckBoxUniDiff2: TCheckBox;
    CheckBoxUniDiff3: TCheckBox;
    CheckBoxUniDiff4: TCheckBox;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton25: TToolButton;
    ToolButton7: TToolButton;
    ToolButton24: TToolButton;
    ImageList2: TImageList;
    Cofigurationdesvoies1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    MenuUniDiffFacade_1: TMenuItem;


    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure BoxCabaLabClick(Sender: TObject); //GBF ou CABALAB
    procedure ApropoClick(Sender: TObject);

    procedure resetConfiguration (sender: Tobject);
    procedure ValidationConfiguration (sender: Tobject);
    procedure ValidConfigINTERFACE_GTI2 (sender: Tobject);

    procedure ButtonStartTraceurClick(Sender: TObject);
    procedure ButtonRESETClick(Sender: TObject);

    procedure YChange (sender: Tobject);
    procedure XChange (sender: Tobject);

    procedure TraceurCalculsParametres(Sender: TObject);
    procedure Horloge(Sender: TObject;lepas:integer;NbdePas:integer);
    procedure Horloge_Exploration(Sender: TObject;lepas:integer;NbdePas:integer);

    procedure Timer1Timer(Sender: TObject);

    procedure CheckBoxExplorationEnregistrementClick(Sender: TObject);

    procedure ResetEcran (sender: Tpaintbox);
    procedure ResetEcran3DIV (sender: Tpaintbox);
    procedure RESET_Normal_BLEU_DYN(Destination: Tpaintbox);
    procedure ResetEcran_bitmap (sender: Tbitmap);

    procedure zerochange(Sender: TObject);

    procedure Affichage_voie_CHX(Sender: TPaintBox ; voie:integer);
    procedure Affichage_voie_TOTAL_CHX(Sender: TPaintBox ; voie:integer);

    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);

    procedure RegressiDDEClick(Sender: TObject);          // new
    procedure Transfert_Regressi(ch1,ch2,ch3,ch4,NewFichier:boolean);     // new
    procedure MenuRegUtilisateurClick(Sender: TObject);  //ancienne

    procedure UniDiffChange (sender: Tobject);

    procedure MenuECRANClick(Sender: TObject);
    procedure MenuDECALAGEZEROClick(Sender: TObject);

    procedure MenuBDTfreqEchClick(Sender: TObject);

    procedure MenuOPTIONSClick(Sender: TObject);

    procedure MenuConfigCOULEURSClick(Sender: TObject);

    procedure MenuConfigOscilloClick(Sender: TObject);

    procedure MenuChargerConfigFichier(Sender: TObject);
    procedure MenuEnregistrerConfigFichier(Sender: TObject);
    procedure MenuChargerConfig(Sender: TObject);
    procedure MenuEnregistrerConfig(Sender: TObject{; var Action :TCloseAction});
    
    procedure MenuRESETconfigClick(Sender: TObject);


////////////////////////////////////////////////////////////////////////////////



    //procedure MenuTimeOutClick(Sender: TObject);

    procedure DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double;var Amax3:double ;var Amax4:double ;var Amin3:double ;var Amin4:double );
    procedure MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);
    procedure MESURES(Sender: Tobject);
    procedure affichageEnregistrements(Sender: Tpaintbox);
    procedure ScrollBarEnregistrementsChange(Sender: TObject);
    procedure ButtonEnregClick(Sender: TObject);
    procedure SuprimerEnregistrementClick(Sender: TObject);
    procedure AffichageBarreTrig(sender: Tpaintbox);
    procedure TriggerChange (sender: Tobject);
    procedure Quitter1Click(Sender: TObject);
   
    

//////////////////////////////////////////////////////////////////////////////////




  private
    { Déclarations privées }
  public
    { Déclarations publiques }
     CompteurTIMEOUT : integer;
  end;

var
  FormTraceurGTI2: TFormTraceurGTI2;

  TchXDoubleArray : array [1..4]of darray;  //tableau des tableaux de données

  congiguration  : config;
  TensionMaxEcran: array[0..9] of double;   //valeurs des tension max de l'écran fonction des réglage de sensib
  MCV: array [0..4,0..1] of Tmenuitem;      //tableau des Tmenuitem du menu : cofigurations des voies

  TRadioButTriggerMode : array [0..4] of   TradioButton; //voie du trigger  (0:sans)
  TRadioButtonFront    : array [0..1] of   TradioButton; //Front du trigger

  TGroupBoxVOIE:array[1..4]of TgroupBox;

  ComboSensiB :array[1..4] of TcomboBoxEx;  //sensib
  TcheckBoxVoieVisible : array[1..4] of TCheckBox; //croix des voies visibles ou non
  TRadioButtonYxSondeX1  : array[1..4] of  TradioButton;    //sondes X1
  TRadioButtonYxSondeX10  : array[1..4] of  TradioButton;   //sondes X10 (inutilisé car binaire avec les X1)
  TCheckBoxINVCH : array[1..4] of TCheckBox; //Invertion des voies
  TCheckBoxUNIDIFF : array[1..4] of TCheckBox; //UNi Diff Facade
  TpaintBoxColorYx : array[1..4] of TpaintBox; //affichage des couleurs de voies si changement utilisateur

  Tecrans:array[0..6] of Tpaintbox;         //0: principal; 1234 écrans séparés; 5 XY   :6traceur

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

  PositionEcransTOP : array [1..5,1..5] of integer; //[a,b] a: nb d'écrans ;b=1 TOP
  PositionEcransHEIGHT : array [1..5] of integer; //[a] a: nb d'écrans

  ACQUI: boolean;               // ture si rappatriment en cours des data gti2
  compteurNOTRIG:integer;       // compteur équivalent timeout
  Bool_reset_ecran : boolean;   // true si on doit fair un reset des écrans                 (pour le onpaint, gérer par le timer)
  Bool_reset_ecran_Traceur : boolean;   // true si on doit fair un reset des écrans                 (pour le onpaint, gérer par le timer)
  Bool_affichage   : boolean;   // true si on doit afficher les tableaux de données dispo.  (pour le onpaint, gérer par le timer)
  Bool_affichage_traceur   : boolean;   // true si on doit afficher les tableaux de données dispo.  (pour le onpaint, gérer par le timer)

  monoCoupRunning:boolean;      //gére par l'appui sur le bouton lancer du mono coup : si TRUE : la procédure d'attente_trig/rapatriment du mono coup est en train de tourner

  TempoAffichMesures  : integer; //compteur ds le timer1

  TOTALchxarray : array[0..100000] of double;
  //TOTALarray  : array[0..100000] of double;
  TOTALarrayCHX : array[1..4] of  TOTALarray ;
  origineDStotal:integer;
  o:integer;

  CompteurTramesAcqui:integer;

  TRACEUR:TTraceur;

  USBtype:longint;  //type de connexcion USB 1.1 ou 2.0
  USBMAX:integer;   //taille max de trame USB;
  USBMAX3Voies:integer;   //taille max de trame USB si trois voies
implementation



{$IFDEF CABALABin}
uses     UnitTracG2ConfCoulCou{UnitTraceurGTI2ConfigCouleursCourbes{, Demodde}, UnitCabalab, UnitGBF,UnitAPropos,UnitTransfertRegressi,clipbrd;
{$ENDIF}

{$IFDEF Independant}
uses     UnitTracG2ConfCoulCou{UnitTraceurGTI2ConfigCouleursCourbes, Demodde, UnitCabalab, UnitGBF,UnitAPropos},UnitTransfertRegressi,clipbrd;
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

procedure TFormTraceurGTI2.FormCreate(Sender: TObject);
begin
      {$IFDEF Independant}
      InitInstrument ($308);   //valeur du HS3!  ////////////////////////////////pas ici pour cabalab !!!!!!!!!!!!!!!!!!!!!!!!!!!!
      {$ENDIF}




 TempoAffichMesures:=0;
// if GTI2  then
// begin
 FormTraceurGTI2.Top:=0;
 FormTraceurGTI2.left:=0;
 FormTraceurGTI2.width:=800;
 FormTraceurGTI2.height:=600;

// Formtimeout.Top:=0;
// Formtimeout.left:=0;

// FormConfigCouleurs.Top:=0;
// FormConfigCouleurs.left:=0;

 PageControlMesures.Top:=424;
 PageControlMesures.left:=0;
 GroupBoxEnregistrement.Top:=424;
 GroupBoxEnregistrement.left:=0;


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


 USBtype:=_DefineUSB(GTIHandle);
 if  USBtype=1 then        // 1:usb1.1 ; 2:USB2.0    !!! vérifier avec les ingé !!!
 begin
    USBMAX:=32;  //????????????????
    USBMAX3Voies:=30;
    ProgressBarUSBTrame.Max:=32;
 end;
 if  USBtype=512 then
 begin
     USBMAX:=256;  //????????????????
     USBMAX3Voies:=255;
     ProgressBarUSBTrame.Max:=256;
 end;
 if  USBtype=64 then
 begin
     USBMAX:=32;  //????????????????
     USBMAX3Voies:=30;
     ProgressBarUSBTrame.Max:=32;
 end;


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

 TGroupBoxVOIE[1]:=GroupBoxVOIE1;
 TGroupBoxVOIE[2]:=GroupBoxVOIE2;
 TGroupBoxVOIE[3]:=GroupBoxVOIE3;
 TGroupBoxVOIE[4]:=GroupBoxVOIE4;

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
 //Tecrans[5]:=PaintBoxXY;
 Tecrans[5]:=PaintBoxTRACEUR;

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
 TensionMaxEcran[4]:=1.5;
 TensionMaxEcran[5]:=0.8;
 TensionMaxEcran[6]:=0.4;
 TensionMaxEcran[7]:=0.15;
 TensionMaxEcran[8]:=0.08;
 TensionMaxEcran[9]:=0.04;

 resetConfiguration (sender);
 ValidationConfiguration (sender);

  {$IFDEF Independant}
  erreur := StartMeasurement();    // Lance l'acquisition
  if erreur <> E_NO_ERRORS then
  ShowMessage('Appareil non Lance acquisition');
  {$ENDIF}


 ACQUI:=false;
 compteurNOTRIG:=0;
 congiguration.StartTraceur:=false;
 origineDStotal:=0;
 o:=0;
 CompteurTramesAcqui:=0;


 nb_courbes_stockees := 0;
 traceur.Ttemps[0]:=0;
// end;

end;

procedure TFormTraceurGTI2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   {$IFDEF Independant}
     Exitinstrument;
   {$ENDIF}

   {$IFDEF CABALABin}
    timer1.Enabled:=false;

    passif[4]:=true;
    Formcabalab.SpeedButtonGraph.down:=false;
    Formcabalab.GestionButtons(sender);
   {$ENDIF}
end;

procedure TFormTraceurGTI2.Quitter1Click(Sender: TObject);
begin
    {$IFDEF CABALABin}
    timer1.Enabled:=false;

    passif[4]:=true;
    Formcabalab.SpeedButtonGraph.down:=false;
    Formcabalab.GestionButtons(sender);
    FormTraceurGTI2.visible:=false;
   {$ENDIF}
end;

procedure TFormTraceurGTI2.FormShow(Sender: TObject);      // atester plus sèrieusement....
begin
ValidConfigINTERFACE_GTI2(sender);
Timer1.enabled    := true;

    {
     Bool_reset_ecran:=true;


      Bool_reset_ecran_traceur:=true;
      Bool_affichage:=true;
      Bool_affichage_traceur:=true;
      FormPaint(Sender);
      }
end;



procedure TFormTraceurGTI2.BoxCabaLabClick(Sender: TObject);
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


     if sender=ToolButton2 then
     begin
          {$IFDEF CABALABin}
           FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
           FormCabaLab.BringToFront;
          {$ENDIF}
     end;
     if sender=ToolButton3 then
     begin
          {$IFDEF CABALABin}
            formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
            formGBF.BringToFront;
          {$ENDIF}
     end;
end;

procedure TFormTraceurGTI2.ApropoClick(Sender: TObject);
begin
     {$IFDEF CABALABin}
      FormApropos.Visible := true ;
      FormApropos.BringToFront;
     {$ENDIF}
end;


procedure TFormTraceurGTI2.resetConfiguration (sender: Tobject);
var r,v,b:integer;
coul:tcolor;
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

   congiguration.OptionSondes :=false;     ///////
   congiguration.OptionINV    :=false;     /////////
   congiguration.OptionDIFFfacade:=false;
   congiguration.ToutesOptions:=false;     //////////

   traceur.GestionFlux :=false;          ////////////
   traceur.EnrgDuAff := false;          //////////
   traceur.EnrgExplo  :=false;           /////////////

   congiguration.DecalZeros     :=false;
   congiguration.MULTI          :=false;
   congiguration.Enregistrement :=false;
   //congiguration.MONOCOUP       :=false;
   //congiguration.Acumul         :=false;

   congiguration.ValeursDecalZERO[1]:=50;
   congiguration.ValeursDecalZERO[2]:=50;
   congiguration.ValeursDecalZERO[3]:=50;
   congiguration.ValeursDecalZERO[4]:=50;

   congiguration.sensibilitee[1]:=1;
   congiguration.sensibilitee[2]:=1;
   congiguration.sensibilitee[3]:=1;
   congiguration.sensibilitee[4]:=1;

   //ComboBoxExDurAff.ItemIndex:=1;

   congiguration.BaseDetemps:=7;   //100ms

   congiguration.Vitesse:=4;   //100Hz

   congiguration.TimeOut:=2;
  // congiguration.timeoutVALEURutilisateur:=

   congiguration.affichage:=1;   //normal

   congiguration.ConfigOscillo:=1;

   traceur.StartTraceur:=false;
   traceur.interval:=100;
   traceur.duree:=1;
   Traceur.DureeAff:=0;
   Traceur.DureeAFF_MODE:=1;
   //traceur.DureeAff:=1;
   traceur.NbDePtsInst:=0;
   //traceur.NbDePtsAFF:=;
   traceur.msec:=0;
   traceur.sec:=0;
   traceur.min:=0;
   traceur.heu:=0;
   traceur.jou:=0;
   Horloge(Sender,0,0);

   traceur.ItemDuree:=0;
   traceur.ItemDureeAff:=1;
   //ComboBoxExLongEnrg.ItemIndex:=0;
   //ComboBoxExDurAff.ItemIndex:=1;


end;

procedure TFormTraceurGTI2.ValidationConfiguration (sender: Tobject);
var
i : integer;
x : integer;
begin
         //menus
         if congiguration.OptionDIFFfacade=true then
            begin
            MenuUniDiffFacade_1.Checked:=true;
            MenuUniDiffFacade_2.Checked:=true;
            end
        else
            begin
            MenuUniDiffFacade_1.Checked:=false;
            MenuUniDiffFacade_2.Checked:=false;
            end;

         if congiguration.OptionSondes=true then
            begin
            MenuOptionSondes.Checked:=true;
            end
        else
            begin
            MenuOptionSondes.Checked:=false;
            end;

         if congiguration.OptionINV=true then
            begin
            MenuOptionInv.Checked:=true;
            end
        else
            begin
            MenuOptionInv.Checked:=false;
            end;


         //GESTION
         if traceur.GestionFlux=true then
         begin
              GroupBoxTRACEUR.Height:=85;
         end
         else
         begin
              GroupBoxTRACEUR.Height:=85;
         end;
         RadioButtonData.Visible:=traceur.GestionFlux;
         ButtonRESET.Visible:=traceur.GestionFlux;
         ProgressBarUSBTrame.Visible:=traceur.GestionFlux;
         Label4.Visible:=traceur.GestionFlux;

         //VOIES
         for i:=1 to 4 do
         begin
              ComboSensiB[i].Top:=32-16;
              TCheckBoxINVCH[i].Top:=56-16;
              TCheckBoxUNIDIFF[i].Top:=56-16;
              TButton0DECALCH[i].Top:=56-16;
              TGroupBoxVOIE[i].Height:=81-16-17;
              if i>=3 then TGroupBoxVOIE[i].top:=111-16-17;
              GroupBoxVOIES.Height:=200-32-34;

              if congiguration.OptionSondes=true then
              begin
                   ComboSensiB[i].Top:=ComboSensiB[i].Top+16;
                   TCheckBoxINVCH[i].Top  :=TCheckBoxINVCH[i].Top  +16;
                   TCheckBoxUNIDIFF[i].Top:=TCheckBoxUNIDIFF[i].Top+16;
                   TButton0DECALCH[i].Top:=TButton0DECALCH[i].Top+16;
                   TGroupBoxVOIE[i].Height:=TGroupBoxVOIE[i].Height+16;
                   if i>=3 then TGroupBoxVOIE[i].top:=TGroupBoxVOIE[i].top+16;
                   GroupBoxVOIES.Height:=GroupBoxVOIES.Height+32;
              end;

              if ((congiguration.OptionINV=true) or (congiguration.DecalZeros=true) or (congiguration.OptionDIFFfacade=true)) then
              begin
                   TGroupBoxVOIE[i].Height:=TGroupBoxVOIE[i].Height+17;
                   if i>=3 then TGroupBoxVOIE[i].top:=TGroupBoxVOIE[i].top+17;
                   GroupBoxVOIES.Height:=GroupBoxVOIES.Height+34;

              end;

              TRadioButtonYxSondeX1[i].Visible:=congiguration.OptionSondes;
              TRadioButtonYxSondeX10[i].Visible:=congiguration.OptionSondes;

              TCheckBoxINVCH[i].Visible:=congiguration.OptionINV;

              TCheckBoxUNIDIFF[i].Visible:=congiguration.OptionDIFFfacade;

         end;

         //ENREGISTREMENT
         if ((traceur.EnrgDuAff=true) and (traceur.EnrgExplo=true)) then
         begin
              GroupBoxLongEnrg.Height:=241;
              GroupBoxBaseDeTemps.Top:=96;
              GroupBoxTEMPS.Top:=192;
              CheckBoxExplorationEnregistrement.Top:=56;
              ScrollBarExporation.Top:=75;
         end;

         if ((traceur.EnrgDuAff=false) and (traceur.EnrgExplo=false)) then
         begin
              GroupBoxLongEnrg.Height:=241-56;
              GroupBoxBaseDeTemps.Top:=96-56;
              GroupBoxTEMPS.Top:=192-56;
              Traceur.DureeAFF_MODE:=1;
         end;

         if ((traceur.EnrgDuAff=true) and (traceur.EnrgExplo=false))  then
         begin
              GroupBoxLongEnrg.Height:=241-32;
              GroupBoxBaseDeTemps.Top:=96-32;
              GroupBoxTEMPS.Top:=192-32;
              CheckBoxExplorationEnregistrement.Top:=56-32;
              ScrollBarExporation.Top:=75-32;
         end;


         if ((traceur.EnrgDuAff=false) and (traceur.EnrgExplo=true))  then
         begin
              GroupBoxLongEnrg.Height:=241-16;
              GroupBoxBaseDeTemps.Top:=96-16;
              GroupBoxTEMPS.Top:=192-16;
               CheckBoxExplorationEnregistrement.Top:=56-16;
              ScrollBarExporation.Top:=75-16;
              Traceur.DureeAFF_MODE:=1;
         end;


         Label6.Visible:=traceur.EnrgDuAff;
         ComboBoxExDurAff.Visible:=traceur.EnrgDuAff;
         CheckBoxExplorationEnregistrement.Visible:=traceur.EnrgExplo;
         ScrollBarExporation.Visible:=traceur.EnrgExplo;


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




   //congiguration.Level  :=0;
   //LEVEL
   // congiguration.Level:=15-30*(ScrollBarLevelTrigger.position/2048);
    LabelLEVEL.Caption:=floattostrf(congiguration.Level,ffFixed,4,3	)+' V';
  //  ScrollBarLevelTrigger.position:=4095-round((congiguration.Level+15)*(4095/30));


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

   //ComboBoxExLongEnrg.ItemIndex:=0;
   //ComboBoxExDurAff.ItemIndex:=0;


   for i:=1 to 4 do
   begin
       if  congiguration.Unipolaire[i]=true then
                                            begin
                                                  MCV[i,0].checked:=true;
                                                  TCheckBoxUNIDIFF[i].Checked:=false;
                                                  TGroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
                                                  TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
                                                  TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
                                            end
                                            else
                                            begin
                                                  MCV[i,1].checked:=true ;
                                                  TCheckBoxUNIDIFF[i].Checked:=true;
                                                  TGroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
                                                  TcheckBoxVoieVisible[i].caption:='YD'+inttostr(i-1);
                                                  TRadioButTriggerMode[i].Caption:='YD'+inttostr(i-1);
                                            end;
   end;
   {
   for i:=1 to 4 do
   begin
       //if  congiguration.Unipolaire[i]=true then  MCV[i,0].checked:=true  else  MCV[i,1].checked:=true ;
       if  congiguration.Unipolaire[i]=true then
                                            begin
                                                  MCV[i,0].checked:=true;
                                                  TGroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
                                            end
                                            else
                                            begin
                                                  MCV[i,1].checked:=true ;
                                                  TGroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
                                            end;
   end;
   }
   if (congiguration.Unipolaire[1]=true) and
      (congiguration.Unipolaire[2]=true) and
      (congiguration.Unipolaire[3]=true) and
      (congiguration.Unipolaire[4]=true)     then   MCV[0,0].checked:=true ;

   if (congiguration.Unipolaire[1]=false) and
      (congiguration.Unipolaire[2]=false) and
      (congiguration.Unipolaire[3]=false) and
      (congiguration.Unipolaire[4]=false)     then   MCV[0,1].checked:=true ;



   if congiguration.Vitesse=4 then
    begin
         menuBDTF100.checked:=true;

         RadioButtonBDT13.Enabled:=false;
         RadioButtonBDT14.Enabled:=false;
         RadioButtonBDT15.Enabled:=false;
         if ScrollBarBDT.Position<4 then  ScrollBarBDT.Position:=4;
         ScrollBarBDT.Min:=4;
    end;
    if congiguration.Vitesse=6 then
    begin
         menuBDTF500.checked:=true;

         RadioButtonBDT13.Enabled:=false;
         if ScrollBarBDT.Position=1 then  ScrollBarBDT.Position:=2;
         ScrollBarBDT.Min:=2;
    end;



    if congiguration.Vitesse=5 then
    begin
        menuBDTF1000.checked:=true;

        RadioButtonBDT13.Enabled:=true;
        RadioButtonBDT14.Enabled:=true;
        RadioButtonBDT15.Enabled:=true;
        ScrollBarBDT.Min:=1;
    end;



   ScrollBarBDT.Position:=congiguration.BaseDetemps;
   if congiguration.BaseDetemps=1 then RadioButtonBDT13.Checked:=true;
   if congiguration.BaseDetemps=2 then RadioButtonBDT14.Checked:=true;
   if congiguration.BaseDetemps=3 then RadioButtonBDT15.Checked:=true;
   if congiguration.BaseDetemps=4 then RadioButtonBDT1.Checked:=true;
   if congiguration.BaseDetemps=5 then RadioButtonBDT2.Checked:=true;
   if congiguration.BaseDetemps=6 then RadioButtonBDT3.Checked:=true;
   if congiguration.BaseDetemps=7 then RadioButtonBDT4.Checked:=true;
   if congiguration.BaseDetemps=8 then RadioButtonBDT5.Checked:=true;
   if congiguration.BaseDetemps=9 then RadioButtonBDT6.Checked:=true;
   if congiguration.BaseDetemps=10 then RadioButtonBDT7.Checked:=true;
   if congiguration.BaseDetemps=11 then RadioButtonBDT8.Checked:=true;
   if congiguration.BaseDetemps=12 then RadioButtonBDT9.Checked:=true;
   if congiguration.BaseDetemps=13 then RadioButtonBDT10.Checked:=true;
   if congiguration.BaseDetemps=14 then RadioButtonBDT11.Checked:=true;
   if congiguration.BaseDetemps=15 then RadioButtonBDT12.Checked:=true;



   if congiguration.TimeOut=1 then begin CompteurTIMEOUT:=5;   menutimeout1.Checked:=true; end;
   if congiguration.TimeOut=2 then begin CompteurTIMEOUT:=10;  menutimeout2.Checked:=true; end;
   if congiguration.TimeOut=3 then begin CompteurTIMEOUT:=20;  menutimeout3.Checked:=true; end;
   if congiguration.TimeOut=4 then begin CompteurTIMEOUT:=congiguration.timeoutVALEURutilisateur;  menutimeout4.Checked:=true; end;
  // Formtimeout.TrackBarTIMEOUT.position:=CompteurTIMEOUT;



  // if congiguration.Vitesse=1 then VUlent.Checked:=true;
  // if congiguration.Vitesse=2 then Vlent.Checked:=true;
  // if congiguration.Vitesse=3 then Vrapide.Checked:=true;
  // if congiguration.Vitesse=4 then VUrapide.Checked:=true;

   if congiguration.affichage=1 then  Normal.checked:=true;
   if congiguration.affichage=2 then  Normalinterval.checked:=true;
   if congiguration.affichage=3 then  ecranPV.checked:=true;
   if congiguration.affichage=4 then  ecranPVinterval.checked:=true;

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
      //  ConfigOscilo1280960.Checked:=true;
        //FormOscilloGTI2.width:=1280;
        //FormOscilloGTI2.height:=960;
   end;
   /////////////////////////////////////////////////////////////////////////////
   // ajout particulier pour le chargement de fichier de config  tracer
   //traceur.ItemDuree           :=Ini.ReadInteger   ( 'Config', 'ItemDuree'         , 0 );
   //traceur.ItemDureeAff        :=Ini.ReadInteger   ( 'Config', 'ItemDureeAff'      , 1 );
   ComboBoxExLongEnrg.ItemIndex:=traceur.ItemDuree;
   ComboBoxExDurAff.ItemIndex:=traceur.ItemDureeAff;



end;


procedure TFormTraceurGTI2.ValidConfigINTERFACE_GTI2 (sender: Tobject);
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
   //  if congiguration.Trigger=1 then SetTriggerSource( ltsCh1 );
   //  if congiguration.Trigger=2 then SetTriggerSource( ltsCh2 );
   //  if congiguration.Trigger=3 then SetTriggerSource( ltsCh3 );
   //  if congiguration.Trigger=4 then SetTriggerSource( ltsCh4 );

   //  if congiguration.front=0   then SetTriggerMode ( ltkFalling );
  //   if congiguration.front=1   then SetTriggerMode ( ltkRising );

  //   if congiguration.Trigger<>0 then
  //   SetTriggerLevel( congiguration.Trigger,    congiguration.Level );


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
     {
     if congiguration.Vitesse=1 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;  LongEnregistrement:= 1000 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=10000000;  LongEnregistrement:= 2000 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:= 8000000;  LongEnregistrement:= 4000 ;  end;
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

     if congiguration.Vitesse=2 then
     begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=10000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:= 5000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:= 2000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:= 1000000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=   500000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=   250000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=   100000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=    50000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=    25000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=    10000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=     5000;  LongEnregistrement:=1000 ;  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=     2500;  LongEnregistrement:=1000;   end;
     end;
     if congiguration.Vitesse=3 then
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
    }
     if congiguration.Vitesse=4 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=     100;   traceur.interval:=10  end;  //bloqué
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=     100;   traceur.interval:=20  end;  //bloqué
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=     100;   traceur.interval:=55  end;  //bloqué

          if congiguration.BaseDetemps=4       then begin FrequenceEch:=     100;   traceur.interval:=10 end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=     100;   traceur.interval:=20  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=     100;   traceur.interval:=50  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=     100;   traceur.interval:=100  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=     100;   traceur.interval:=200  end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=     100;   traceur.interval:=500  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=     100;   traceur.interval:=1000  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=     100;   traceur.interval:=2000  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=     100;   traceur.interval:=5000  end;
          if congiguration.BaseDetemps=13     then begin FrequenceEch:=     100;   traceur.interval:=10000  end;
          if congiguration.BaseDetemps=14      then begin FrequenceEch:=     100;   traceur.interval:=20000  end;
          if congiguration.BaseDetemps=15      then begin FrequenceEch:=     100;   traceur.interval:=50000  end;
     end;

      if congiguration.Vitesse=6 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=     500;   traceur.interval:=2  end;   //bloqué

          if congiguration.BaseDetemps=2       then begin FrequenceEch:=     500;   traceur.interval:=2  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=     500;   traceur.interval:=5  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=     500;   traceur.interval:=10  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=     500;   traceur.interval:=20  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=     500;   traceur.interval:=50  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=     500;   traceur.interval:=100  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=     500;   traceur.interval:=200 end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=     500;   traceur.interval:=500  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=     500;   traceur.interval:=1000  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=     500;   traceur.interval:=2000  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=     500;   traceur.interval:=5000  end;
          if congiguration.BaseDetemps=13      then begin FrequenceEch:=     500;   traceur.interval:=10000  end;
          if congiguration.BaseDetemps=14      then begin FrequenceEch:=     500;   traceur.interval:=20000  end;
          if congiguration.BaseDetemps=15      then begin FrequenceEch:=     500;   traceur.interval:=50000  end;


     end;

     if congiguration.Vitesse=5 then
      begin
          if congiguration.BaseDetemps=1       then begin FrequenceEch:=     1000;   traceur.interval:=1  end;
          if congiguration.BaseDetemps=2       then begin FrequenceEch:=     1000;   traceur.interval:=2  end;
          if congiguration.BaseDetemps=3       then begin FrequenceEch:=     1000;   traceur.interval:=5  end;
          if congiguration.BaseDetemps=4       then begin FrequenceEch:=     1000;   traceur.interval:=10  end;
          if congiguration.BaseDetemps=5       then begin FrequenceEch:=     1000;   traceur.interval:=20  end;
          if congiguration.BaseDetemps=6       then begin FrequenceEch:=     1000;   traceur.interval:=50  end;
          if congiguration.BaseDetemps=7       then begin FrequenceEch:=     1000;   traceur.interval:=100  end;
          if congiguration.BaseDetemps=8       then begin FrequenceEch:=     1000;   traceur.interval:=200 end;
          if congiguration.BaseDetemps=9       then begin FrequenceEch:=     1000;   traceur.interval:=500  end;
          if congiguration.BaseDetemps=10      then begin FrequenceEch:=     1000;   traceur.interval:=1000  end;
          if congiguration.BaseDetemps=11      then begin FrequenceEch:=     1000;   traceur.interval:=2000  end;
          if congiguration.BaseDetemps=12      then begin FrequenceEch:=     1000;   traceur.interval:=5000  end;
          if congiguration.BaseDetemps=13      then begin FrequenceEch:=     1000;   traceur.interval:=10000  end;
          if congiguration.BaseDetemps=14      then begin FrequenceEch:=     1000;   traceur.interval:=20000  end;
          if congiguration.BaseDetemps=15      then begin FrequenceEch:=     1000;   traceur.interval:=50000  end;


     end;
     {
     if LongEnregistrement>1000 then
     begin
          Timer1.Interval:=100;
     end
     else
     begin
          Timer1.Interval:=1;
     end;
      }

    // SetRecordLength    (LongEnregistrement ) ;
     SetSampleFrequency (@FrequenceEch) ;



    {
     if  congiguration.Vitesse  =4 then
     begin
        if congiguration.BaseDetemps=1  then begin traceur.DiviseurTraceur:=100;  traceur.interval:=1 end;
        if congiguration.BaseDetemps=2  then begin traceur.DiviseurTraceur:=50;   traceur.interval:=2 end;
        if congiguration.BaseDetemps=3  then begin traceur.DiviseurTraceur:=20;   traceur.interval:=5 end;
        if congiguration.BaseDetemps=4  then begin traceur.DiviseurTraceur:=10;   traceur.interval:=10 end;
        if congiguration.BaseDetemps=5  then begin traceur.DiviseurTraceur:=5;    traceur.interval:=20 end;
        if congiguration.BaseDetemps=6  then begin traceur.DiviseurTraceur:=2;    traceur.interval:=50 end;
        if congiguration.BaseDetemps=7  then begin traceur.DiviseurTraceur:=1;    traceur.interval:=100 end;
        if congiguration.BaseDetemps=8  then begin traceur.DiviseurTraceur:=-2;   traceur.interval:=200 end;
        if congiguration.BaseDetemps=9  then begin traceur.DiviseurTraceur:=-5;   traceur.interval:=500 end;
        if congiguration.BaseDetemps=10 then begin traceur.DiviseurTraceur:=-10;  traceur.interval:=1000 end;
        if congiguration.BaseDetemps=11 then begin traceur.DiviseurTraceur:=-20;  traceur.interval:=2000 end;
        if congiguration.BaseDetemps=12 then begin traceur.DiviseurTraceur:=-50;  traceur.interval:=5000 end;
     end;

     if  congiguration.Vitesse  =5 then
     begin
        if congiguration.BaseDetemps=1  then begin traceur.DiviseurTraceur:=10;    traceur.interval:=10 end;
        if congiguration.BaseDetemps=2  then begin traceur.DiviseurTraceur:=5;   traceur.interval:=20 end;
        if congiguration.BaseDetemps=3  then begin traceur.DiviseurTraceur:=2;   traceur.interval:=50 end;
        if congiguration.BaseDetemps=4  then begin traceur.DiviseurTraceur:=1;  traceur.interval:=100 end;
        if congiguration.BaseDetemps=5  then begin traceur.DiviseurTraceur:=1;  traceur.interval:=200 end;
        if congiguration.BaseDetemps=6  then begin traceur.DiviseurTraceur:=1;  traceur.interval:=500 end;
        if congiguration.BaseDetemps=7  then begin traceur.DiviseurTraceur:=1;    traceur.interval:=1000 end;
        if congiguration.BaseDetemps=8  then begin traceur.DiviseurTraceur:=-2;   traceur.interval:=2000 end;
        if congiguration.BaseDetemps=9  then begin traceur.DiviseurTraceur:=-5;   traceur.interval:=5000 end;
        if congiguration.BaseDetemps=10 then begin traceur.DiviseurTraceur:=-10;  traceur.interval:=10000 end;
        if congiguration.BaseDetemps=11 then begin traceur.DiviseurTraceur:=-20;  traceur.interval:=20000 end;
        if congiguration.BaseDetemps=12 then begin traceur.DiviseurTraceur:=-50;  traceur.interval:=50000 end;
     end;
 }
     ///////////////////////////////////////////////////////////////////////
      {
      erreur := StartMeasurement();    // Lance l'acquisition
      if erreur <> E_NO_ERRORS then
      ShowMessage('Appareil non Lance acquisition');

      }

     //////////////////////////////////////////////////////////FAIS par Le TIMER   !!!???
{
Timer1.enabled    := true;
end;
}
end;

procedure TFormTraceurGTI2.ButtonStartTraceurClick(Sender: TObject);
begin
     if congiguration.StartTraceur=false then
     begin
        // cptTRACEUR:=0; //reset ddldecl

         congiguration.StartTraceur:=true;
         ButtonStartTraceur.Caption:='Arret';
         CompteurTramesAcqui:=0;

         GroupBoxBaseDeTemps.Enabled:=false;  //blocge des groupe box pendant l'enregistrement
         GroupBoxVOIES.Enabled:=false;        //blocge des groupe box pendant l'enregistrement

         //traceur.NbDePtsInst:=0;

         Traceur.FLUXTIME:=0;  //reset du rame time pour demarrer l'enregistrement
         traceur.NbDePtsInst:=0;
         traceur.LastPtsTime:=0;

         if  CheckBoxExplorationEnregistrement.checked=true then CheckBoxExplorationEnregistrement.checked:=false;

         traceur.msec:=0;
         traceur.sec:=0;
         traceur.min:=0;
         traceur.heu:=0;
         traceur.jou:=0;
         Horloge(Sender,0,0);

         erreur := ADC_ABORT();    // STOP l'acquisition (vide les fiflots)
         if erreur <> E_NO_ERRORS then
         begin
          ShowMessage('PB de stop acqui');
         end
         else ACQUI:=false;
         TraceurCalculsParametres(Sender);
         Bool_reset_ecran:=true;
         Bool_reset_ecran_traceur:=true;
         Bool_affichage:=true;
         Bool_affichage_traceur:=true;
         FormPaint(Sender);
     end
     else
     begin
         congiguration.StartTraceur:=false;
         ButtonStartTraceur.Caption:='Marche';

         GroupBoxBaseDeTemps.Enabled:=true;  //DEblocage des groupe box pendant l'enregistrement
         GroupBoxVOIES.Enabled:=true;        //DEblocage des groupe box pendant l'enregistrement
     end;
end;

procedure TFormTraceurGTI2.ButtonRESETClick(Sender: TObject);
begin
  erreur := ADC_ABORT();    // STOP l'acquisition
  if erreur <> E_NO_ERRORS then
  begin
  ShowMessage('PB de stop acqui');
  end
  else ACQUI:=false;

origineDStotal:=0;
o:=0;
CompteurTramesAcqui:=0;
  if congiguration.StartTraceur=true then
     begin
         congiguration.StartTraceur:=false;
         ButtonStartTraceur.Caption:='start';
         CompteurTramesAcqui:=0;
         traceur.NbDePtsInst:=0;
     end;
   traceur.NbDePtsInst:=0;
   traceur.msec:=0;
   traceur.sec:=0;
   traceur.min:=0;
   traceur.heu:=0;
   traceur.jou:=0;
   Horloge(Sender,0,0);
   //GroupBoxBaseDeTemps.Enabled:=true;  //fais par le bt start stop du traceur
end;

procedure TFormTraceurGTI2.XChange (sender: Tobject);
begin
    if sender=ScrollBarBDT then
    begin
        congiguration.BaseDetemps:=ScrollBarBDT.Position;

        if congiguration.BaseDetemps=1 then RadioButtonBDT13.Checked:=true;      //1ms
        if congiguration.BaseDetemps=2 then RadioButtonBDT14.Checked:=true;      //2ms
        if congiguration.BaseDetemps=3 then RadioButtonBDT15.Checked:=true;      //5ms


        if congiguration.BaseDetemps=4 then RadioButtonBDT1.Checked:=true;       //10ms
        if congiguration.BaseDetemps=5 then RadioButtonBDT2.Checked:=true;       //20ms
        if congiguration.BaseDetemps=6 then RadioButtonBDT3.Checked:=true;       //50ms
        if congiguration.BaseDetemps=7 then RadioButtonBDT4.Checked:=true;       //100ms
        if congiguration.BaseDetemps=8 then RadioButtonBDT5.Checked:=true;        //200ms
        if congiguration.BaseDetemps=9 then RadioButtonBDT6.Checked:=true;       //500ms
        if congiguration.BaseDetemps=10 then RadioButtonBDT7.Checked:=true;      //1s
        if congiguration.BaseDetemps=11 then RadioButtonBDT8.Checked:=true;      //2s
        if congiguration.BaseDetemps=12 then RadioButtonBDT9.Checked:=true;      //5s
        if congiguration.BaseDetemps=13 then RadioButtonBDT10.Checked:=true;     //10s
        if congiguration.BaseDetemps=14 then RadioButtonBDT11.Checked:=true;     //20s
        if congiguration.BaseDetemps=15 then RadioButtonBDT12.Checked:=true;     //50s
    end
    else
    begin

        if RadioButtonBDT13.Checked=true then congiguration.BaseDetemps:=1;
        if RadioButtonBDT14.Checked=true then congiguration.BaseDetemps:=2;
        if RadioButtonBDT15.Checked=true then congiguration.BaseDetemps:=3;


        if RadioButtonBDT1.Checked=true then congiguration.BaseDetemps:=4;
        if RadioButtonBDT2.Checked=true then congiguration.BaseDetemps:=5;
        if RadioButtonBDT3.Checked=true then congiguration.BaseDetemps:=6;
        if RadioButtonBDT4.Checked=true then congiguration.BaseDetemps:=7;
        if RadioButtonBDT5.Checked=true then congiguration.BaseDetemps:=8;
        if RadioButtonBDT6.Checked=true then congiguration.BaseDetemps:=9;
        if RadioButtonBDT7.Checked=true then congiguration.BaseDetemps:=10;
        if RadioButtonBDT8.Checked=true then congiguration.BaseDetemps:=11;
        if RadioButtonBDT9.Checked=true then congiguration.BaseDetemps:=12;
        if RadioButtonBDT10.Checked=true then congiguration.BaseDetemps:=13;
        if RadioButtonBDT11.Checked=true then congiguration.BaseDetemps:=14;
        if RadioButtonBDT12.Checked=true then congiguration.BaseDetemps:=15;

        ScrollBarBDT.Position:=congiguration.BaseDetemps;
    end;




    if sender=ComboBoxExLongEnrg then
    begin
         if ComboBoxExLongEnrg.ItemIndex=0 then Traceur.duree:=1;
         if ComboBoxExLongEnrg.ItemIndex=1 then Traceur.duree:=2;
         if ComboBoxExLongEnrg.ItemIndex=2 then Traceur.duree:=5;
         if ComboBoxExLongEnrg.ItemIndex=3 then Traceur.duree:=10;
         if ComboBoxExLongEnrg.ItemIndex=4 then Traceur.duree:=20;
         if ComboBoxExLongEnrg.ItemIndex=5 then Traceur.duree:=50;
         if ComboBoxExLongEnrg.ItemIndex=6 then Traceur.duree:=60;
         if ComboBoxExLongEnrg.ItemIndex=7 then Traceur.duree:=120;
         if ComboBoxExLongEnrg.ItemIndex=8 then Traceur.duree:=300;
         if ComboBoxExLongEnrg.ItemIndex=9 then Traceur.duree:=600;
         if ComboBoxExLongEnrg.ItemIndex=10 then Traceur.duree:=1200;
         if ComboBoxExLongEnrg.ItemIndex=11 then Traceur.duree:=3000;
         if ComboBoxExLongEnrg.ItemIndex=12 then Traceur.duree:=3600;
         if ComboBoxExLongEnrg.ItemIndex=13 then Traceur.duree:=7200;
         if ComboBoxExLongEnrg.ItemIndex=14 then Traceur.duree:=18000;
         if ComboBoxExLongEnrg.ItemIndex=15 then Traceur.duree:=43300;
         if ComboBoxExLongEnrg.ItemIndex=16 then Traceur.duree:=86600;
         if ComboBoxExLongEnrg.ItemIndex=17 then Traceur.duree:=173200;
         if ComboBoxExLongEnrg.ItemIndex=18 then Traceur.duree:=433000;

         Traceur.ItemDuree:=ComboBoxExLongEnrg.ItemIndex;    // pour l'enregistrement de la config
    end;

    if sender=ComboBoxExDurAff then
    begin
         if ComboBoxExDurAff.ItemIndex=0 then begin Traceur.DureeAff:=0;              Traceur.DureeAFF_MODE:=0; end;
         if ComboBoxExDurAff.ItemIndex=1 then begin Traceur.DureeAff:=Traceur.duree;  Traceur.DureeAFF_MODE:=1; end;

         if ((ComboBoxExDurAff.ItemIndex>=2)  and (Traceur.DureeAFF_MODE<=2)) then begin Traceur.DureeAFF_MODE:=2; end;

         if ComboBoxExDurAff.ItemIndex=2 then Traceur.DureeAff:=1;
         if ComboBoxExDurAff.ItemIndex=3 then Traceur.DureeAff:=2;
         if ComboBoxExDurAff.ItemIndex=4 then Traceur.DureeAff:=5;
         if ComboBoxExDurAff.ItemIndex=5 then Traceur.DureeAff:=10;
         if ComboBoxExDurAff.ItemIndex=6 then Traceur.DureeAff:=20;
         if ComboBoxExDurAff.ItemIndex=7 then Traceur.DureeAff:=50;
         if ComboBoxExDurAff.ItemIndex=8 then Traceur.DureeAff:=60;
         if ComboBoxExDurAff.ItemIndex=9 then Traceur.DureeAff:=120;
         if ComboBoxExDurAff.ItemIndex=10 then Traceur.DureeAff:=300;
         if ComboBoxExDurAff.ItemIndex=11 then Traceur.DureeAff:=600;
         if ComboBoxExDurAff.ItemIndex=12 then Traceur.DureeAff:=1200;
         if ComboBoxExDurAff.ItemIndex=13 then Traceur.DureeAff:=3000;
         if ComboBoxExDurAff.ItemIndex=14 then Traceur.DureeAff:=3600;
         if ComboBoxExDurAff.ItemIndex=15 then Traceur.DureeAff:=7200;
         if ComboBoxExDurAff.ItemIndex=16 then Traceur.DureeAff:=18000;
         if ComboBoxExDurAff.ItemIndex=17 then Traceur.DureeAff:=43300;
         if ComboBoxExDurAff.ItemIndex=18 then Traceur.DureeAff:=86600;
         if ComboBoxExDurAff.ItemIndex=19 then Traceur.DureeAff:=173200;
         if ComboBoxExDurAff.ItemIndex=20 then Traceur.DureeAff:=433000;

         Traceur.ItemDureeAff:=ComboBoxExDurAff.ItemIndex;    // pour l'enregistrement de la config

         if congiguration.StartTraceur=false then
         begin
         Bool_reset_ecran:=true;
         Bool_reset_ecran_traceur:=true;
         Bool_affichage:=true;
         Bool_affichage_traceur:=true;
         FormPaint(Sender);
         end;


    end;

    {
    if ComboBoxExDurAff.ItemIndex=1 then
    begin
    Traceur.DureeAff:=Traceur.duree;    //? pourquoi deux fois?
            Bool_reset_ecran:=true;
            Bool_reset_ecran_traceur:=true;
            Bool_affichage:=true;
            Bool_affichage_traceur:=true;
            FormPaint(Sender);
    end;
    }
    if sender=CheckBoxExplorationEnregistrement then
     begin
          if CheckBoxExplorationEnregistrement.Checked=true then
          begin
              ScrollBarExporation.Position:=ScrollBarExporation.MAX;
              PanelExploDebut.Visible:=true;
              PanelExploFIN.Visible:=true;
              Traceur.DureeAFF_MODE:=3;
              //traceur.PtsExploration:=round((traceur.NbDePtsInst-traceur.NbDePtsAFF)*(ScrollBarExporation.Position/1000))+traceur.NbDePtsAFF;
              traceur.PtsExploration:=round(traceur.NbDePtsInst*(ScrollBarExporation.Position/1000));
              if congiguration.StartTraceur=false then
              begin
                  Bool_reset_ecran:=true;
                  Bool_reset_ecran_traceur:=true;
                  Bool_affichage:=true;
                  Bool_affichage_traceur:=true;
                  FormPaint(Sender);
             end;
             Horloge_Exploration(Sender,traceur.interval,traceur.PtsExploration);
          end
          else
          begin
              ScrollBarExporation.Position:=ScrollBarExporation.MAX;
              PanelExploDebut.Visible:=false;
              PanelExploFIN.Visible:=false;
              Traceur.DureeAFF_MODE:=2;
          end;
    end;

     if sender=ScrollBarExporation then
        begin
            //traceur.PtsExploration:=round((traceur.NbDePtsInst-traceur.NbDePtsAFF)*(ScrollBarExporation.Position/1000))+traceur.NbDePtsAFF;
            traceur.PtsExploration:=round(traceur.NbDePtsInst*(ScrollBarExporation.Position/1000));
            if congiguration.StartTraceur=false then
            begin
                Bool_reset_ecran:=true;
                Bool_reset_ecran_traceur:=true;
                Bool_affichage:=true;
                Bool_affichage_traceur:=true;
                FormPaint(Sender);
            end;
            Horloge_Exploration(Sender,traceur.interval,traceur.PtsExploration);
        end;




    TraceurCalculsParametres(Sender);  //surement inutile...
    if sender=ScrollBarBDT then ValidConfigINTERFACE_GTI2(sender);
    TraceurCalculsParametres(Sender);

    if Traceur.duree/(traceur.interval/1000)>10000 then showmessage('Configuration Impossible : Enregistrement de 10000 Points au maximum');
    if Traceur.DureeAff>traceur.duree then showmessage('Configuration non optimisée : l''interval de temps à afficher dépasse le temps d''enregistrement');
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

procedure TFormTraceurGTI2.YChange (sender: Tobject);
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

     Bool_reset_ecran:=true;
     Bool_reset_ecran_traceur:=true;
     Bool_affichage:=true;
     Bool_affichage_traceur:=true;
     FormPaint(Sender);
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

procedure TFormTraceurGTI2.TraceurCalculsParametres(Sender: TObject);
begin

    if  Traceur.DureeAFF_MODE=1 then Traceur.DureeAff:=Traceur.duree;


    if congiguration.Vitesse=4 then
    begin
        traceur.NbdePtsInterval:=round(Traceur.interval/10);
        Traceur.NbDePtsAFF:= trunc(traceur.DureeAff/(Traceur.interval/1000));
        Traceur.NbDePtsFin:= trunc(traceur.duree/(Traceur.interval/1000));
    end;
     if congiguration.Vitesse=6 then
    begin
        traceur.NbdePtsInterval:=round(Traceur.interval/2);
        Traceur.NbDePtsAFF:= trunc(traceur.DureeAff/(Traceur.interval/1000));
        Traceur.NbDePtsFin:= trunc(traceur.duree/(Traceur.interval/1000));
    end;
    if congiguration.Vitesse=5 then
    begin
        traceur.NbdePtsInterval:=round(Traceur.interval/1);
        Traceur.NbDePtsAFF:= trunc(traceur.DureeAff/(Traceur.interval/1000));
        Traceur.NbDePtsFin:= trunc(traceur.duree/(Traceur.interval/1000));
    end;                          //   traceur.duree : en secondes
                              //   Traceur.interval  : en 1/100 de secondes
end;

procedure TFormTraceurGTI2.Horloge(Sender: TObject;lepas:integer;NbdePas:integer);
begin

      TRACEUR.msec:= TRACEUR.msec+lepas*Nbdepas;
      if traceur.msec>=1000 then
      begin
           traceur.msec:=traceur.msec-1000;
           traceur.sec:=traceur.sec+1;
      end;

      if traceur.sec>=60 then
      begin
           traceur.sec:=traceur.sec-60;
           traceur.min:=traceur.min+1;
      end;
      if traceur.min>=60 then
      begin
           traceur.min:=traceur.min-60;
           traceur.heu:=traceur.min+1;
      end;
      if traceur.heu>=24 then
      begin
           traceur.heu:=traceur.heu-24;
           traceur.jou:=traceur.jou+1;
      end;





      Labelmillisec.Caption:=inttostr(traceur.msec)+' ms';
      Labelsecondes.Caption:=inttostr(traceur.sec)+' s';
      LabelMinute.Caption:=inttostr(traceur.min)+' m';
      LabelHeur.Caption:=inttostr(traceur.heu)+' h';
      LabelJour.Caption:=inttostr(traceur.jou)+' j';
end;


procedure TFormTraceurGTI2.Horloge_Exploration(Sender: TObject;lepas:integer;NbdePas:integer);
begin
       //Traceur.NbDePtsAFF
      TRACEUR.explo_msec:=lepas*Nbdepas;
      traceur.explo_jou:=trunc(TRACEUR.explo_msec/86400000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_jou*86400000;
      traceur.explo_heu:=trunc(TRACEUR.explo_msec/3600000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_heu*3600000;
      traceur.explo_min:=trunc(TRACEUR.explo_msec/60000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_min*60000;
      traceur.explo_sec:=trunc(TRACEUR.explo_msec/1000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_sec*1000;

      LabelExploFIN_ms.Caption:=inttostr(traceur.explo_msec)+' ms';
      LabelExploFIN_s.Caption:=inttostr(traceur.explo_sec)+' s';
      LabelExploFIN_m.Caption:=inttostr(traceur.explo_min)+' m';
      LabelExploFIN_h.Caption:=inttostr(traceur.explo_heu)+' h';

      TRACEUR.explo_msec:=lepas*Nbdepas-lepas*Traceur.NbDePtsAFF;
      traceur.explo_jou:=trunc(TRACEUR.explo_msec/86400000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_jou*86400000;
      traceur.explo_heu:=trunc(TRACEUR.explo_msec/3600000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_heu*3600000;
      traceur.explo_min:=trunc(TRACEUR.explo_msec/60000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_min*60000;
      traceur.explo_sec:=trunc(TRACEUR.explo_msec/1000);
      TRACEUR.explo_msec:=TRACEUR.explo_msec-traceur.explo_sec*1000;

      LabelExploDebut_ms.Caption:=inttostr(traceur.explo_msec)+' ms';
      LabelExploDebut_s.Caption:=inttostr(traceur.explo_sec)+' s';
      LabelExploDebut_m.Caption:=inttostr(traceur.explo_min)+' m';
      LabelExploDebut_h.Caption:=inttostr(traceur.explo_heu)+' h';
     // LabelJour.Caption:=inttostr(traceur.jou)+' j';
end;


procedure TFormTraceurGTI2.Timer1Timer(Sender: TObject);
var
i,j:integer;
PAS:integer;
oMAX:integer;
//erreur: word ;
begin

     if (timer1.enabled) and (@timer1.OnTimer <> nil) then
     begin
          Timer1.enabled    := False;
          TempoAffichMesures:=TempoAffichMesures+1;
////////////////////////////////////////////////////////////////////////////////
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

          erreur := GetMeasurementFrancoisTraceur_RAM( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.

          Traceur.FLUXTIME:=Traceur.FLUXTIME +  DataUsbTRACEUR;

////////////////////////////////////////////////////////////////////////////////
          if congiguration.NbVoiesVisible<>3 then
          begin
              ProgressBarUSBTrame.Max:=USBMAX;
              Label4.Caption:=floattostrf((congiguration.NbVoiesVisible * DataUsbTRACEUR*(100/USBMAX )),ffFixed,3,0)+' %';
          end;

          if congiguration.NbVoiesVisible=3 then
          begin
              ProgressBarUSBTrame.Max:=USBMAX3voies;
              Label4.Caption:=floattostrf((congiguration.NbVoiesVisible * DataUsbTRACEUR*(100/USBMAX3voies)),ffFixed,3,0)+' %';
          end;


          while ProgressBarUSBTrame.Position<>congiguration.NbVoiesVisible * DataUsbTRACEUR do
          begin
              if ProgressBarUSBTrame.Position<congiguration.NbVoiesVisible * DataUsbTRACEUR then
                ProgressBarUSBTrame.Position:=ProgressBarUSBTrame.Position+1;
              if ProgressBarUSBTrame.Position>congiguration.NbVoiesVisible * DataUsbTRACEUR then
                ProgressBarUSBTrame.Position:=ProgressBarUSBTrame.Position-1;
          end;
////////////////////////////////////////////////////////////////////////////////
          if erreur =E_NO_DATA then
          begin
              RadioButtonData.Checked:=false;      //non pas de data : RUPTURE DE FLUX
              LabelRupturedeflux.Visible:=true;
          end
          else   //if erreur =E_NO_DATA
          begin
              RadioButtonData.Checked:=true;       //oui  des data   : FLUX OK
              LabelRupturedeflux.Visible:=false;
              if congiguration.StartTraceur=true then CompteurTramesAcqui:=CompteurTramesAcqui+1;
          end;   //else if erreur =E_NO_DATA

///////////////////////////////////////////////////////////////////////////////
          if (erreur = E_NO_ERRORS)  then
          begin
              if congiguration.MULTI=true then
              begin
                  TempoAffichMesures:=TempoAffichMesures+1;
                  if TempoAffichMesures>10 then
                  begin
                      MESURES(Sender);
                      TempoAffichMesures:=0;
                  end;
              end;  //if congiguration.MULTI=true

              if congiguration.StartTraceur=true then
              begin
                  if  traceur.NbDePtsInst<traceur.NbDePtsFin then
                  begin
                      if traceur.FLUXTIME > (traceur.LastPtsTime+traceur.NbdePtsInterval)  then
                      begin
                          while  (traceur.LastPtsTime + traceur.NbdePtsInterval)<traceur.FLUXTIME do
                          begin
                              j:=100-1-(traceur.FLUXTIME - (traceur.LastPtsTime + traceur.NbdePtsInterval));

                              if congiguration.VoieVisible[1]=true then
                                TOTALarrayCHX[1][traceur.NbDePtsInst]:=Ch1DoubleArray[j];
                              if congiguration.VoieVisible[2]=true then
                                TOTALarrayCHX[2][traceur.NbDePtsInst]:=Ch2DoubleArray[j];
                              if congiguration.VoieVisible[3]=true then
                                TOTALarrayCHX[3][traceur.NbDePtsInst]:=Ch3DoubleArray[j];
                              if congiguration.VoieVisible[4]=true then
                                TOTALarrayCHX[4][traceur.NbDePtsInst]:=Ch4DoubleArray[j];

                              traceur.NbDePtsInst:=traceur.NbDePtsInst+1;
                              traceur.LastPtsTime:=traceur.LastPtsTime+traceur.NbdePtsInterval;

                              traceur.Ttemps[traceur.NbDePtsInst]:=traceur.Ttemps[traceur.NbDePtsInst-1]+ traceur.interval;

                              Horloge(Sender,traceur.interval,1);
                          end;
                      end;   //if  traceur.NbDePtsInst<traceur.NbDePtsFin
                  end
                  else   //if  traceur.NbDePtsInst<traceur.NbDePtsFin
                  begin
                      ButtonStartTraceurClick(sender);
                  end;   //else if  traceur.NbDePtsInst<traceur.NbDePtsFin
              end;   //if congiguration.StartTraceur=true



              if congiguration.StartTraceur=true then
              begin
                  Bool_reset_ecran:=true;
                  if traceur.DureeAFF_MODE=1 then Bool_reset_ecran_traceur:=false  else  Bool_reset_ecran_traceur:=true;   // pas de reset si écran = longueur d'enregistrement...
                  Bool_affichage:=true;
                  Bool_affichage_traceur:=true;
                  FormPaint(Sender);
              end
              else
              begin
                  if (congiguration.affichage=2) or (congiguration.affichage=4)then
                  begin
                      Bool_reset_ecran:=true;     //si FLUX visible
                      Bool_affichage:=true;
                  end
                  else
                  begin
                      Bool_reset_ecran:=false;   //si FLUX INvisible
                      Bool_affichage:=false;
                  end;
                  Bool_reset_ecran_traceur:=false;    //pas d'enregistrement en cours
                  Bool_affichage_traceur:=false;
                  FormPaint(Sender);
              end;
          end
          else   {if erreur = E_NO_ERRORS}
          begin
              Bool_reset_ecran:=true;
              Bool_affichage:=true;
              FormPaint(Sender);
          end;    {else if erreur = E_NO_ERRORS}
////////////////////////////////////////////////////////////////////////////////

    end; {if (timer1.enabled)...}
    Timer1.enabled    := true;

end;  //timer1


procedure TFormTraceurGTI2.CheckBoxExplorationEnregistrementClick(Sender: TObject);
begin
     if CheckBoxExplorationEnregistrement.Checked=true then
     begin
         //ScrollBarExporation.Visible:=true;
         PanelExploDebut.Visible:=true;
         PanelExploFIN.Visible:=true;
         Traceur.DureeAFF_MODE:=3;
         traceur.PtsExploration:=round((traceur.NbDePtsInst-traceur.NbDePtsAFF)*(ScrollBarExporation.Position/1000))+traceur.NbDePtsAFF;
         if congiguration.StartTraceur=false then
         begin
            Bool_reset_ecran:=true;
            Bool_reset_ecran_traceur:=true;
            Bool_affichage:=true;
            Bool_affichage_traceur:=true;
            FormPaint(Sender);
        end;



     end
     else
     begin
     //ScrollBarExporation.Visible:=false;
     PanelExploDebut.Visible:=false;
     PanelExploFIN.Visible:=false;
     end;
end;
procedure  TFormTraceurGTI2.ResetEcran (sender: Tpaintbox);
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
end;


procedure  TFormTraceurGTI2.ResetEcran_bitmap (sender: Tbitmap);
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
end;




{
procedure TFormTraceurGTI2.ResetEcran (sender: Tpaintbox);
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
end;
 }
procedure TFormTraceurGTI2.ResetEcran3DIV (sender: Tpaintbox);
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




procedure TFormTraceurGTI2.RESET_Normal_BLEU_DYN(Destination: Tpaintbox);
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






procedure TFormTraceurGTI2.zerochange(Sender: TObject);
begin
    Bool_reset_ecran:=true;
            Bool_reset_ecran_traceur:=true;
            Bool_affichage:=true;
            Bool_affichage_traceur:=true;
            FormPaint(Sender);
end;

procedure TFormTraceurGTI2.Affichage_voie_CHX(Sender: TPaintBox ; voie:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    calibre : double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin

//Longueur_Acquisition :=   GetRecordLength();
Longueur_Acquisition :=100-1;       //taille de la ram... -1 sinon dernier pixel a 0......

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

      try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin
          ValeurrealOrdonnee:=         -(INV)*TchXDoubleArray[voie][ round( Curseur_Abscisse * Longueur_Acquisition  / Sender.Width )] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
          Curseur_Ordonnee  := Round(  -(INV)*TchXDoubleArray[voie][ round( Curseur_Abscisse * Longueur_Acquisition  / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
          else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
      except
      end;

end;


procedure TFormTraceurGTI2.Affichage_voie_TOTAL_CHX(Sender: TPaintBox ; voie:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    calibre : double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
     INV:integer;
     ValeurrealOrdonnee:real;
     i:integer;
begin

//Longueur_Acquisition := origineDStotal+1000;
//if Traceur.DureeAff=0 then Longueur_Acquisition :=traceur.NbDePtsInst;
//if Traceur.DureeAff=1 then Longueur_Acquisition :=traceur.NbDePtsFin;
//if Traceur.DureeAff>=2 then Longueur_Acquisition :=Traceur.NbDePtsAFF;

if Traceur.DureeAFF_MODE =0 then
begin
    if traceur.NbDePtsInst=0 then
    Longueur_Acquisition :=traceur.NbDePtsInst
    else
    Longueur_Acquisition :=traceur.NbDePtsInst-1;
end;
if Traceur.DureeAFF_MODE =1 then Longueur_Acquisition :=traceur.NbDePtsFin-1;
if Traceur.DureeAFF_MODE =2 then Longueur_Acquisition :=Traceur.NbDePtsAFF-1;
if Traceur.DureeAFF_MODE =3 then Longueur_Acquisition :=Traceur.NbDePtsAFF-1;  //pas fais pour l'instant


Calibre:=TensionMaxEcran[congiguration.sensibilitee[voie]];
if congiguration.Invertion[voie]=true then   INV:=-1 else  INV:=1;

// ligne de 0 en pointillés
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.Pen.Color :=congiguration.couleurs[voie] ;
    Sender.Canvas.MoveTo(0, round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );

    i:=0 ;
    while  i<= Sender.Width do
    begin
    Sender.Canvas.LineTo(i , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max));
    Sender.Canvas.MoveTo(i+5 , round(TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max));
    i:=i+7;
    end;

//tracé du signal
Sender.Canvas.Pen.Width := congiguration.PenWidth	;
Sender.Canvas.Pen.Color := congiguration.couleurs[voie]	;
Sender.Canvas.MoveTo(0, Round(  -TOTALarrayCHX[voie][ 0 ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) ));
//cette dernière ligne est inutile normalement (a vérifier)

     if Traceur.DureeAFF_MODE =0 then
     begin
      try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin

          ValeurrealOrdonnee:=         -(INV)*TOTALarrayCHX[voie][ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
          Curseur_Ordonnee  := Round(  -(INV)*TOTALarrayCHX[voie][ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
          else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
      except
      end;

     end;


     if Traceur.DureeAFF_MODE =1 then
     begin
       try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin
              if round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width )<traceur.NbDePtsInst then
              //if traceur.Ttemps[ round( Curseur_Abscisse * Longueur_Acquisition *(ScrollBarDecalBDT.Position/1000)/ Sender.Width )]<Traceur.DureeAff*1000 then
              begin
                  ValeurrealOrdonnee:=         -(INV)*TOTALarrayCHX[voie][ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
                  Curseur_Ordonnee  := Round(  -(INV)*TOTALarrayCHX[voie][ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );
                  if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
                  if  Curseur_Abscisse=0 then
                      Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
                  else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
              end;
          end;
       except
       end;
     end;

     if Traceur.DureeAFF_MODE =2 then
     begin
        try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin

          ValeurrealOrdonnee:=         -(INV)*TOTALarrayCHX[voie][ (traceur.NbDePtsInst - Traceur.NbDePtsAFF )+ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
          Curseur_Ordonnee  := Round(  -(INV)*TOTALarrayCHX[voie][ (traceur.NbDePtsInst - Traceur.NbDePtsAFF )+ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
          else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
        except
        end;
     end;

     if Traceur.DureeAFF_MODE =3 then
     begin
        try
          for Curseur_Abscisse := 0 to Sender.Width - 1 do
          begin

          ValeurrealOrdonnee:=         -(INV)*TOTALarrayCHX[voie][ (traceur.PtsExploration - Traceur.NbDePtsAFF )+ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max)  ;
          Curseur_Ordonnee  := Round(  -(INV)*TOTALarrayCHX[voie][ (traceur.PtsExploration - Traceur.NbDePtsAFF )+ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre + (TscrollBarCH[voie].Position*Sender.Height/TscrollBarCH[voie].max) );
          if (ValeurrealOrdonnee)<0 then  Curseur_Ordonnee:=0;// pb des ligne qui redescende en bas si depassement du haut de l'écra
          if  Curseur_Abscisse=0 then
               Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee)
          else Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
        except
        end;
     end;
end;

procedure TFormTraceurGTI2.FormResize(Sender: TObject);
begin
      Bool_reset_ecran:=true;
      Bool_reset_ecran_traceur:=true;
      Bool_affichage:=true;
      Bool_affichage_traceur:=true;
end;


procedure TFormTraceurGTI2.FormPaint(Sender: TObject);
var
    i,j:integer;
begin

    {$IFDEF CABALABin}

    if unitcabalab.passif[2]= false then            //boutton GBF
      ToolButton3.Visible:=true
    else
      ToolButton3.Visible:=false;
    {$ENDIF}


    if sender<>timer1 then

    begin
         Bool_reset_ecran:=true;
     // if traceur.DureeAFF_MODE<=1 then Bool_reset_ecran_traceur:=false  else  Bool_reset_ecran_traceur:=true;
      Bool_reset_ecran_traceur:=true;
      Bool_affichage:=true;
      Bool_affichage_traceur:=true;

    end;
////////////////////////////////////
//           RESIZE

/////////////////////////////////////

    PanelExploDebut.Top:=FormTraceurGTI2.ClientHeight-18;
    PanelExploFIN.Top:=FormTraceurGTI2.ClientHeight-18;
    PanelExploFIN.Left:=FormTraceurGTI2.ClientWidth-(792-640);

    LabelRupturedeflux.Top:=FormTraceurGTI2.ClientHeight-18;

    PaintBoxECRAN.Width :=FormTraceurGTI2.ClientWidth-255  ;

    PaintBoxTRACEUR.Width :=FormTraceurGTI2.ClientWidth-255  ;

    PaintBoxECRAN1.Width:=FormTraceurGTI2.ClientWidth-255  ;
    PaintBoxECRAN2.Width:=FormTraceurGTI2.ClientWidth-255  ;
    PaintBoxECRAN3.Width:=FormTraceurGTI2.ClientWidth-255  ;
    PaintBoxECRAN4.Width:=FormTraceurGTI2.ClientWidth-255  ;

    ScrollBar0CH1.Left:=FormTraceurGTI2.ClientWidth-24;
    ScrollBar0CH2.Left:=FormTraceurGTI2.ClientWidth-24;
    ScrollBar0CH3.Left:=FormTraceurGTI2.ClientWidth-24;
    ScrollBar0CH4.Left:=FormTraceurGTI2.ClientWidth-24;

    PositionEcransTOP[1,1]:=6;
    PositionEcransTOP[2,1]:=6;
    PositionEcransTOP[2,2]:=round((FormTraceurGTI2.ClientHeight-27)/2)+7;
    PositionEcransTOP[3,1]:=6;
    PositionEcransTOP[3,2]:=round((FormTraceurGTI2.ClientHeight-27)/3)+7;
    PositionEcransTOP[3,3]:=2*round((FormTraceurGTI2.ClientHeight-27)/3)+7;
    PositionEcransTOP[4,1]:=6;
    PositionEcransTOP[4,2]:=round((FormTraceurGTI2.ClientHeight-27)/4)+7;
    PositionEcransTOP[4,3]:=2*round((FormTraceurGTI2.ClientHeight-27)/4)+7;
    PositionEcransTOP[4,4]:=3*round((FormTraceurGTI2.ClientHeight-27)/4)+7;
    PositionEcransTOP[5,1]:=6;
    PositionEcransTOP[5,2]:=round((FormTraceurGTI2.ClientHeight-27)/5)+7;
    PositionEcransTOP[5,3]:=2*round((FormTraceurGTI2.ClientHeight-27)/5)+7;
    PositionEcransTOP[5,4]:=3*round((FormTraceurGTI2.ClientHeight-27)/5)+7;
    PositionEcransTOP[5,5]:=4*round((FormTraceurGTI2.ClientHeight-27)/5)+7;

    PositionEcransHEIGHT[1]:=FormTraceurGTI2.ClientHeight-27;
    PositionEcransHEIGHT[2]:=round((FormTraceurGTI2.ClientHeight-27)/2);
    PositionEcransHEIGHT[3]:=round((FormTraceurGTI2.ClientHeight-27)/3);
    PositionEcransHEIGHT[4]:=round((FormTraceurGTI2.ClientHeight-27)/4);
    PositionEcransHEIGHT[5]:=round((FormTraceurGTI2.ClientHeight-27)/5);
//////////////////////////////////////////
//      COULEURS
///////////////////////////////////////////
    for i:=1 to 4 do
    begin
    TpaintBoxColorYx[i].Canvas.Pen.Width :=1;
    TpaintBoxColorYx[i].Canvas.pen.Color := congiguration.couleurs[i];
    TpaintBoxColorYx[i].Canvas.Brush.Color := congiguration.couleurs[i];
    TpaintBoxColorYx[i].Canvas.Rectangle(0, 0, TpaintBoxColorYx[i].Width - 1, TpaintBoxColorYx[i].Height - 1);
    end ;

 ////////////////////////////////////////////////
//scrollbarres décalages des zéros
/////////////////////////////////////////////////////

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


/////////////////////////////////////////////////
//       RESET ECRANS

/////////////////////////////////////////////////


    if  ((Bool_reset_ecran = true) and (congiguration.Acumul=false))then
    begin

       if congiguration.affichage=1 then
       begin
            Tecrans[0].Visible:=false;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=true;

            Tecrans[5].TOP:=PositionEcransTOP[1,1];
            Tecrans[5].height:=PositionEcransHEIGHT[1];

            //if Bool_reset_ecran_traceur=true then ResetEcran (PaintBoxTRACEUR);    //Tecrans[5]
            if Bool_reset_ecran_traceur=true then RESET_Normal_BLEU_DYN (PaintBoxTRACEUR);    //Tecrans[5]
       end;  {if congiguration.affichage=1}

       if congiguration.affichage=2 then
       begin
            Tecrans[0].Visible:=true;
            Tecrans[1].Visible:=false;
            Tecrans[2].Visible:=false;
            Tecrans[3].Visible:=false;
            Tecrans[4].Visible:=false;
            Tecrans[5].Visible:=true;

            Tecrans[0].TOP:=PositionEcransTOP[2,1];
            Tecrans[0].height:=PositionEcransHEIGHT[2];

            Tecrans[5].TOP:=PositionEcransTOP[2,2];
            Tecrans[5].height:=PositionEcransHEIGHT[2];

            //ResetEcran (PaintBoxECRAN);       //Tecrans[0]
            RESET_Normal_BLEU_DYN (PaintBoxECRAN);
            //if Bool_reset_ecran_traceur=true then ResetEcran (PaintBoxTRACEUR);    //Tecrans[5]
            if Bool_reset_ecran_traceur=true then RESET_Normal_BLEU_DYN (PaintBoxTRACEUR);    //Tecrans[5]
       end;  {if congiguration.affichage=2}

       if (congiguration.affichage=3) and  (Bool_reset_ecran_traceur=true )then
       begin
            Tecrans[0].Visible:=false;
            Tecrans[5].Visible:=false;

            j:=0;

            for i:=1 to 4 do
            begin
                if  (congiguration.VoieVisible[i]=true) then
                begin
                    j:=j+1;

                    Tecrans[i].Visible:=true;
                    Tecrans[i].TOP:=PositionEcransTOP[congiguration.NbVoiesVisible,j];
                    Tecrans[i].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible];

                    if congiguration.sensibilitee[i]=0  then
                      ResetEcran3DIV(Tecrans[i])
                    else
                    begin
                      //ResetEcran (Tecrans[i]);
                      RESET_Normal_BLEU_DYN (Tecrans[i]);
                      end;
                end
                else
                begin
                    Tecrans[i].Visible:=false;
                    TscrollBarCH[i].Visible:=false;
                end;
            end;
       end; {if congiguration.affichage=3 }


       if congiguration.affichage=4 then
       begin
            Tecrans[0].Visible:=true;
            Tecrans[5].Visible:=false;

           // j:=0;
            
            Tecrans[0].TOP:=PositionEcransTOP[congiguration.NbVoiesVisible+1,1];
            Tecrans[0].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible+1];
            //ResetEcran (Tecrans[0]);
            RESET_Normal_BLEU_DYN (Tecrans[0]);
            j:=1;

            if Bool_reset_ecran_traceur=true then
            begin
            for i:=1 to 4 do
            begin
                if  (congiguration.VoieVisible[i]=true) then
                begin
                    j:=j+1;

                    Tecrans[i].Visible:=true;
                    Tecrans[i].TOP:=PositionEcransTOP[congiguration.NbVoiesVisible+1,j];
                    Tecrans[i].height:=PositionEcransHEIGHT[congiguration.NbVoiesVisible+1];

                    if congiguration.sensibilitee[i]=0  then
                      ResetEcran3DIV(Tecrans[i])
                    else
                    begin
                      //ResetEcran (Tecrans[i]);
                      RESET_Normal_BLEU_DYN (Tecrans[i]);
                      end;
                end
                else
                begin
                    Tecrans[i].Visible:=false;
                    TscrollBarCH[i].Visible:=false;
                end;
            end; //for i:=1 to 4
            end; //if Bool_reset_ecran_traceur=true
       end; {if congiguration.affichage=4 }

    end;  {if  Bool_reset_ecrab = true}

/////////////////////////////////////////////////
//       AFFICHAGE

/////////////////////////////////////////////////

    if  Bool_affichage = true   then
    begin
        TchXDoubleArray[1]:=Ch1DoubleArray;       //copie des tableaux pour utilisation des indices ds la procédure d'affichage
        TchXDoubleArray[2]:=Ch2DoubleArray;
        TchXDoubleArray[3]:=Ch3DoubleArray;
        TchXDoubleArray[4]:=Ch4DoubleArray;


            if congiguration.affichage=1 then     //1 écran pour les ebregistrements
            begin
                for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then
                    begin
                        //Affichage_voie_CHX      (PaintBoxECRAN , i);
                        //if congiguration.StartTraceur=true then
                        if Bool_affichage_traceur=true then Affichage_voie_TOTAL_CHX(PaintBoxTRACEUR , i);
                    end;
                end;
            end; {if congiguration.affichage=1}

            if congiguration.affichage=2 then     //1 écran pour les ebregistrements + last seconde en détailles
            begin
                for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then
                    begin
                        Affichage_voie_CHX      (PaintBoxECRAN , i);
                        //if congiguration.StartTraceur=true then
                        if Bool_affichage_traceur=true then Affichage_voie_TOTAL_CHX(PaintBoxTRACEUR , i);
                    end;
                end;
            end;  {if congiguration.affichage=2}



            if congiguration.affichage=3 then    //1 écran par voie d'enregistrements 
            begin
                for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true and (Bool_affichage_traceur=true )then Affichage_voie_TOTAL_CHX(Tecrans[i] , i);
                end;
            end;  {if congiguration.affichage=3}


            if congiguration.affichage=4 then       //1 écran par voie d'enregistrements + last seconde en détailles
            begin
                for i:=1 to 4 do
                begin
                    if congiguration.VoieVisible[i]=true then
                    begin
                        Affichage_voie_CHX      (PaintBoxECRAN , i);
                        if Bool_affichage_traceur=true then Affichage_voie_TOTAL_CHX(Tecrans[i] , i);
                    end;
                end;
            end; {if congiguration.affichage=4}


    end; {if  Bool_affichage = true}

    {
    if congiguration.Enregistrement then
    affichageEnregistrements( paintboxA);
    }
end;




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///                            MENUS                                                                                            ///
///                                                                                                                             ///
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFormTraceurGTI2.RegressiDDEClick(Sender: TObject);      //pas utilisé pour l'instant
begin
   if ((sender=menu_newfichier_REG) or (sender=ToolButton5)) then
     begin
          Transfert_Regressi( congiguration.VoieVisible[1],
                              congiguration.VoieVisible[2],
                              congiguration.VoieVisible[3],
                              congiguration.VoieVisible[4],true);
     end;
     if ((sender=menu_newpage_REG) or (sender=ToolButton6)) then
     begin
          Transfert_Regressi( congiguration.VoieVisible[1],
                              congiguration.VoieVisible[2],
                              congiguration.VoieVisible[3],
                              congiguration.VoieVisible[4],false);
     end;
end;

procedure TFormTraceurGTI2.Transfert_Regressi(ch1,ch2,ch3,ch4,NewFichier:boolean);  //nouvelle procedure fichier/page
var i : integer;
    ligne : string;
    //ch1,ch2,ch3,ch4:boolean;

const
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';

begin


{
     if traceur.StartTraceur=false then
     begin
     formdde.EnvoieDonneesGTI_TRACEUR( true,true,true,true  );
     //formRegressiTransfert.visible:=true;
     //formRegressiTransfert.BringToFront;
     end;
}     //FormTransfertRegressi.

      FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin


          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Traceur'); // 3ème = Titre de pagebegin
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          //ch1:=true;
          //ch2:=true;
          //ch3:=true;
          //ch4:=true;

          ligne := 't';
          //if ch1 then ligne :=ligne +crTab+'Y0';
          //if ch2 then ligne :=ligne +crTab+'Y1';
          //if ch3 then ligne :=ligne +crTab+'Y2';
          //if ch4 then ligne :=ligne +crTab+'Y3';
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

          for i:=0 to (traceur.NbDePtsFin-1) do
          begin
            ligne := floattostr(traceur.Ttemps[i]/1000) ;
                    if ch1 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[1][i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[2][i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[3][i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[4][i]);
            Add(ligne);
          end;
          //////////////////////////////////////////////////////////////////////////////////////////////////
          ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          if NewFichier=true then   FormTransfertRegressi.Execute('ClIP|LOAD');
          if NewFichier=false then   FormTransfertRegressi.Execute('ClIP|ADD');
          //FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;
end;






procedure TFormTraceurGTI2.MenuRegUtilisateurClick(Sender: TObject);  //anciene procedure DIRECTE
var i : integer;
    ligne : string;
    ch1,ch2,ch3,ch4:boolean;

const
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';

begin


{
     if traceur.StartTraceur=false then
     begin
     formdde.EnvoieDonneesGTI_TRACEUR( true,true,true,true  );
     //formRegressiTransfert.visible:=true;
     //formRegressiTransfert.BringToFront;
     end;
}

      FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin


          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Traceur'); // 3ème = Titre de pagebegin
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          ch1:=true;
          ch2:=true;
          ch3:=true;
          ch4:=true;

          ligne := 't';
          //if ch1 then ligne :=ligne +crTab+'Y0';
          //if ch2 then ligne :=ligne +crTab+'Y1';
          //if ch3 then ligne :=ligne +crTab+'Y2';
          //if ch4 then ligne :=ligne +crTab+'Y3';
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

          for i:=0 to (traceur.NbDePtsFin-1) do
          begin
            ligne := floattostr(traceur.Ttemps[i]/1000) ;
                    if ch1 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[1][i]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[2][i]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[3][i]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(TOTALarrayCHX[4][i]);
            Add(ligne);
          end;
          //////////////////////////////////////////////////////////////////////////////////////////////////
          ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;

end;

procedure TFormTraceurGTI2.UniDiffChange (sender: Tobject);
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
        {
        congiguration.Unipolaire[1]:=true;
        congiguration.Unipolaire[2]:=true;
        congiguration.Unipolaire[3]:=true;
        congiguration.Unipolaire[4]:=true;
        TGroupBoxVOIE[1].caption:='Y0';
        TGroupBoxVOIE[2].caption:='Y1';
        TGroupBoxVOIE[3].caption:='Y2';
        TGroupBoxVOIE[4].caption:='Y3';
        }
        for i:=1 to 4 do
          begin
              TCheckBoxUNIDIFF[i].Checked:=false;
              congiguration.Unipolaire[i]:=true;
              TGroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
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
        TGroupBoxVOIE[1].caption:='YD0';
        TGroupBoxVOIE[2].caption:='YD1';
        TGroupBoxVOIE[3].caption:='YD2';
        TGroupBoxVOIE[4].caption:='YD3';
        }
        for i:=1 to 4 do
          begin
              congiguration.Unipolaire[i]:=false;
              TCheckBoxUNIDIFF[i].Checked:=true;
              TGroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
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
            TGroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
            TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
            TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
        end;
        if sender=MCV[i,1] then
        begin
            MCV[i,1].Checked:=true;
            TCheckBoxUNIDIFF[i].Checked:=true;
            congiguration.Unipolaire[i]:=false;
            TGroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
            TcheckBoxVoieVisible[i].caption:='YD'+inttostr(i-1);
            TRadioButTriggerMode[i].Caption:='YD'+inttostr(i-1);
        end;
    end;

    for i:=1 to 4 do                //Yi UNI ou Diff FACADE
    begin
    if sender=TCheckBoxUNIDIFF[i] then
      begin
           if TCheckBoxUNIDIFF[i].Checked=false then
           begin
           congiguration.Unipolaire[i]:=true ;
           MCV[i,0].Checked:=true;
           congiguration.Unipolaire[i]:=true;
           TGroupBoxVOIE[i].caption:='Y'+inttostr(i-1);
           TcheckBoxVoieVisible[i].caption:='Y'+inttostr(i-1);
           TRadioButTriggerMode[i].Caption:='Y'+inttostr(i-1);
           end
           else
           begin
           congiguration.Unipolaire[i]:=false ;
           MCV[i,1].Checked:=true;
           congiguration.Unipolaire[i]:=false;
           TGroupBoxVOIE[i].caption:='YD'+inttostr(i-1);
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

   ValidConfigINTERFACE_GTI2(sender);      //fais par le timer
end;

procedure TFormTraceurGTI2.MenuECRANClick(Sender: TObject);
var i:integer;
begin

    if sender=ToolButton7 then
    begin
         case congiguration.affichage of
                                          1: begin congiguration.affichage:=3; ecranPV.Checked:=true;end;
                                          3: begin congiguration.affichage:=1; Normal.Checked:=true;end;
                                          2: begin congiguration.affichage:=4; ecranPVinterval.Checked:=true;end;
                                          4: begin congiguration.affichage:=2; Normalinterval.Checked:=true;end;
         end;
    end;
    if sender=ToolButton24 then
    begin
         case congiguration.affichage of
                                          1: begin congiguration.affichage:=2; Normalinterval.Checked:=true;end;
                                          2: begin congiguration.affichage:=1; Normal.Checked:=true;end;
                                          3: begin congiguration.affichage:=4; ecranPVinterval.Checked:=true;end;
                                          4: begin congiguration.affichage:=3; ecranPV.Checked:=true;end;
         end;


    end;

    if sender=Normal then
    begin
        Normal.Checked:=true;
        congiguration.affichage:=1;

    end;

    if sender=ecranPV then
    begin
        ecranPV.Checked:=true;
        congiguration.affichage:=3;

    end;

    if sender=Normalinterval then
    begin
        Normalinterval.Checked:=true;
        congiguration.affichage:=2;

    end;

    if sender=ecranPVinterval then
    begin
        ecranPVinterval.Checked:=true;
        congiguration.affichage:=4;

    end;


    if (congiguration.affichage=1) or (congiguration.affichage=3) then
    begin
               traceur.GestionFlux:=false;
               MenuOptionVisualisationFLUX.Checked:=false;
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;

               ValidationConfiguration (sender);
    end;

    if (congiguration.affichage=2) or (congiguration.affichage=4) then
    begin
               traceur.GestionFlux:=true;
               MenuOptionVisualisationFLUX.Checked:=true;

               ValidationConfiguration (sender);
    end;






      Bool_reset_ecran:=true;
      Bool_reset_ecran_traceur:=true;
      Bool_affichage:=true;
      Bool_affichage_traceur:=true;
      FormPaint(Sender);



    for i:=1 to 4 do          //retour de 1 écran par voies avec la sensib a 5V/div PE vers un autre mode
    begin
        if congiguration.affichage<2 then
        begin
            if ComboSensiB[i].ItemIndex=0 then ComboSensiB[i].ItemIndex:=1;
            congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
        end
        else congiguration.sensibilitee[i]:=ComboSensiB[i].ItemIndex;
    end;

    FormResize(Sender);

end;

procedure TFormTraceurGTI2.MenuDECALAGEZEROClick(Sender: TObject);
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
    ValidationConfiguration (sender);
end;

procedure TFormTraceurGTI2.menuBDTfreqEchClick(Sender: TObject);
begin
    if sender=menuBDTF100 then
    begin
         menuBDTF100.checked:=true;
         congiguration.Vitesse:=4;
         RadioButtonBDT13.Enabled:=false;
         RadioButtonBDT14.Enabled:=false;
         RadioButtonBDT15.Enabled:=false;
         if ScrollBarBDT.Position<4 then  ScrollBarBDT.Position:=4;
         ScrollBarBDT.Min:=4;
    end;
    if sender=menuBDTF500 then
    begin
         menuBDTF500.checked:=true;
         congiguration.Vitesse:=6;
         RadioButtonBDT13.Enabled:=false;
         RadioButtonBDT14.Enabled:=true;
         RadioButtonBDT15.Enabled:=true;
         if ScrollBarBDT.Position=1 then  ScrollBarBDT.Position:=2;
         ScrollBarBDT.Min:=2;
    end;



    if sender=menuBDTF1000 then
    begin
        menuBDTF1000.checked:=true;
        congiguration.Vitesse:=5;
        RadioButtonBDT13.Enabled:=true;
        RadioButtonBDT14.Enabled:=true;
        RadioButtonBDT15.Enabled:=true;
        ScrollBarBDT.Min:=1;
    end;
    ValidConfigINTERFACE_GTI2 (sender);
end;




procedure TFormTraceurGTI2.MenuOPTIONSClick(Sender: TObject);
begin

     if sender=MenuOptionTOUTES then
     begin
          if  congiguration.ToutesOptions =false then
          begin
               congiguration.ToutesOptions:=true;
               MenuOptionTOUTES.Checked:=true;

               traceur.GestionFlux:=true;
               MenuOptionVisualisationFLUX.Checked:=true;
               congiguration.OptionSondes:=true;
               MenuOptionSondes.Checked:=true;

               congiguration.OptionINV:=false;
               MenuOptionInv.Checked:=false;

               congiguration.OptionDIFFfacade:=true;
               MenuUniDiffFacade_1.Checked:=true;
               MenuUniDiffFacade_2.Checked:=true;

               traceur.EnrgDuAff:=true;
               MenuOptionDuAffEnrg.Checked:=true;
               traceur.EnrgExplo:=true;
               MenuOptionExploration.Checked:=true;
          end
          else
          begin
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;

               traceur.GestionFlux:=false;
               MenuOptionVisualisationFLUX.Checked:=false;
               congiguration.OptionSondes:=false;
               MenuOptionSondes.Checked:=false;
               congiguration.OptionINV:=false;
               MenuOptionInv.Checked:=false;

               congiguration.OptionDIFFfacade:=false;
               MenuUniDiffFacade_1.Checked:=false;
               MenuUniDiffFacade_2.Checked:=false;

               traceur.EnrgDuAff:=false;
               MenuOptionDuAffEnrg.Checked:=false;
               traceur.EnrgExplo:=false;
               MenuOptionExploration.Checked:=false;
          end;
     end;

     if sender=MenuOptionVisualisationFLUX  then
     begin
          if  traceur.GestionFlux=false then
          begin
               traceur.GestionFlux:=true;
               MenuOptionVisualisationFLUX.Checked:=true;
          end
          else
          begin
               traceur.GestionFlux:=false;
               MenuOptionVisualisationFLUX.Checked:=false;
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;
          end;
     end;

     if sender=MenuOptionSondes then
     begin
          if  congiguration.OptionSondes =false then
          begin
               congiguration.OptionSondes:=true;
               MenuOptionSondes.Checked:=true;
          end
          else
          begin
               congiguration.OptionSondes:=false;
               MenuOptionSondes.Checked:=false;
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;
          end;
     end;

     if sender=MenuOptionInv then
     begin
          if  congiguration.OptionINV =false then
          begin
               congiguration.OptionINV:=true;
               MenuOptionInv.Checked:=true;
          end
          else
          begin
               congiguration.OptionINV:=false;
               MenuOptionInv.Checked:=false;
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;
          end;
     end;

     if (sender=MenuUniDiffFacade_1) or (sender=MenuUniDiffFacade_2) then
     begin
          if  congiguration.OptionDIFFfacade =false then
          begin
               congiguration.OptionDIFFfacade:=true;
               MenuUniDiffFacade_1.Checked:=true;
               MenuUniDiffFacade_2.Checked:=true;

               congiguration.OptionINV:=false;          //les deux mode en mm temps impossible pour l'instant : pas la place
               MenuOptionInv.Checked:=false;
          end
          else
          begin
               congiguration.OptionDIFFfacade:=false;
               MenuUniDiffFacade_1.Checked:=false;
               MenuUniDiffFacade_2.Checked:=false;

               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;
          end;
     end;






     if sender=MenuOptionDuAffEnrg then
     begin
         if  traceur.EnrgDuAff=false then
          begin
               traceur.EnrgDuAff:=true;
               MenuOptionDuAffEnrg.Checked:=true;
              // ComboBoxExDurAff.ItemsEx:=1;
          end
          else
          begin
               traceur.EnrgDuAff:=false;
               MenuOptionDuAffEnrg.Checked:=false;
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;
          end;
     end;

     if sender=MenuOptionExploration then
     begin
          if  traceur.EnrgExplo=false then
          begin
               traceur.EnrgExplo:=true;
               MenuOptionExploration.Checked:=true;
               if  traceur.EnrgDuAff=false then
               begin
                    traceur.EnrgDuAff:=true;
                    MenuOptionDuAffEnrg.Checked:=true;
               end;
          end
          else
          begin
               traceur.EnrgExplo:=false;
               MenuOptionExploration.Checked:=false;
               congiguration.ToutesOptions:=false;
               MenuOptionTOUTES.Checked:=false;
          end;
     end;

     ValidationConfiguration (sender);

end;





procedure TFormTraceurGTI2.MenuConfigCOULEURSClick(Sender: TObject);
begin

FormConfigCouleurs.visible:=true;
FormConfigCouleurs.BringToFront;

end;


procedure TFormTraceurGTI2.MenuConfigOscilloClick(Sender: TObject);
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
        FormTraceurGTI2.width:=800;
        FormTraceurGTI2.height:=600;
        GroupBoxEnregistrement.Top:=424;
   end;

   if congiguration.ConfigOscillo=2 then
   begin
        ConfigOscilo1024768.Checked:=true;
        FormTraceurGTI2.width:=1024;
        FormTraceurGTI2.height:=768;
        GroupBoxEnregistrement.Top:=536;
   end;

   if congiguration.ConfigOscillo=3 then
   begin
        ConfigOscilo1280960.Checked:=true;
        FormTraceurGTI2.width:=1280;
        FormTraceurGTI2.height:=960;
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


procedure TFormTraceurGTI2.MenuChargerConfigFichier(Sender: TObject);
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
    FormTraceurGTI2.Top     := Ini.ReadInteger( 'Form', 'Top', 0 );
    FormTraceurGTI2.Left    := Ini.ReadInteger( 'Form', 'Left', 0 );
    FormTraceurGTI2.Height  := Ini.ReadInteger( 'Form', 'Height', 800 );
    FormTraceurGTI2.Width   := Ini.ReadInteger( 'Form', 'Width', 600 );



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

    congiguration.DecalZeros    :=Ini.ReadBool   ( 'Config', 'DecalZeros'    , false);

    congiguration.ValeursDecalZERO[1]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO1', 50);
    congiguration.ValeursDecalZERO[2]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO2', 50);
    congiguration.ValeursDecalZERO[3]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO3', 50);
    congiguration.ValeursDecalZERO[4]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO4', 50);

    congiguration.MULTI         :=Ini.ReadBool   ( 'Config', 'MULTI '         , false );
    congiguration.Enregistrement:=Ini.ReadBool   ( 'Config', 'Enregistrement ', false);
    congiguration.MONOCOUP      :=Ini.ReadBool   ( 'Config', 'MONOCOUP '      , false );

    congiguration.OptionSondes  :=Ini.ReadBool   ( 'Config', 'OptionSondes '         , false );
    congiguration.OptionINV     :=Ini.ReadBool   ( 'Config', 'OptionINV  '         , false );
     congiguration.OptionDIFFfacade:= Ini.ReadBool   ( 'Config', 'UniDiffFac'    , false );
    congiguration.ToutesOptions :=Ini.ReadBool   ( 'Config', 'ToutesOptions  '         , false );

    traceur.GestionFlux         :=Ini.ReadBool   ( 'Config', 'GestionFlux '         , false );
    traceur.EnrgDuAff           :=Ini.ReadBool   ( 'Config', 'EnrgDuAff '         , false );
    traceur.EnrgExplo           :=Ini.ReadBool   ( 'Config', 'EnrgExplo '         , false );

    traceur.duree               :=Ini.ReadInteger   ( 'Config', 'TraceurDuree'         , 0 );
    Traceur.DureeAff            :=Ini.ReadInteger   ( 'Config', 'TraceurDureeaff'         , 0 );
    traceur.ItemDuree           :=Ini.ReadInteger   ( 'Config', 'ItemDuree'         , 0 );
    traceur.ItemDureeAff        :=Ini.ReadInteger   ( 'Config', 'ItemDureeAff'      , 1 );

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



procedure TFormTraceurGTI2.MenuEnregistrerConfigFichier(Sender: TObject);
var
    ini:TInifile;
begin

     SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
     SaveDialog1.FileName:='*.CL3';
     if SaveDialog1.Execute then Ini := TIniFile.Create(  SaveDialog1.FileName  );

try
    Ini.WriteInteger( 'Form', 'Top'   , FormTraceurGTI2.Top);
    Ini.WriteInteger( 'Form', 'Left'  , FormTraceurGTI2.Left);
    Ini.WriteInteger( 'Form', 'Height', FormTraceurGTI2.Height);
    Ini.WriteInteger( 'Form', 'Width' , FormTraceurGTI2.Width);

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

    Ini.WriteBool   ( 'Config', 'DecalZeros'    , congiguration.DecalZeros);

    Ini.WriteInteger( 'Config', 'ValeursDecalZERO1', congiguration.ValeursDecalZERO[1]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO2', congiguration.ValeursDecalZERO[2]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO3', congiguration.ValeursDecalZERO[3]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO4', congiguration.ValeursDecalZERO[4]);

    Ini.WriteBool   ( 'Config', 'MULTI '         , congiguration.MULTI );
    Ini.WriteBool   ( 'Config', 'Enregistrement ', congiguration.Enregistrement );
    Ini.WriteBool   ( 'Config', 'MONOCOUP '      , congiguration.MONOCOUP );

    Ini.WriteBool   ( 'Config', 'OptionSondes '  , congiguration.OptionSondes );
    Ini.WriteBool   ( 'Config', 'OptionINV  '    , congiguration.OptionINV  );
    Ini.WriteBool   ( 'Config', 'UniDiffFac'    , congiguration.OptionDIFFfacade);
    Ini.WriteBool   ( 'Config', 'ToutesOptions  ', congiguration.ToutesOptions );

    Ini.WriteBool   ( 'Config', 'GestionFlux '   , traceur.GestionFlux );
    Ini.WriteBool   ( 'Config', 'EnrgDuAff '     , traceur.EnrgDuAff  );
    Ini.WriteBool   ( 'Config', 'EnrgExplo '     , traceur.EnrgExplo  );

    Ini.WriteInteger( 'Config', 'TraceurDuree '  , traceur.duree  );
    Ini.WriteInteger( 'Config', 'TraceurDureeaff', Traceur.DureeAff );
    Ini.WriteInteger( 'Config', 'ItemDuree '     , traceur.ItemDuree  );
    Ini.WriteInteger( 'Config', 'ItemDureeAff '  , traceur.ItemDureeAff  );

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






procedure TFormTraceurGTI2.MenuChargerConfig(Sender: TObject);
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
  Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+'TraceurGTI2.INI'  );
  try
    FormTraceurGTI2.Top     := Ini.ReadInteger( 'Form', 'Top', 0 );
    FormTraceurGTI2.Left    := Ini.ReadInteger( 'Form', 'Left', 0 );
    FormTraceurGTI2.Height  := Ini.ReadInteger( 'Form', 'Height', 800 );
    FormTraceurGTI2.Width   := Ini.ReadInteger( 'Form', 'Width', 600 );



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

    congiguration.DecalZeros    :=Ini.ReadBool   ( 'Config', 'DecalZeros'    , false);

    congiguration.ValeursDecalZERO[1]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO1', 50);
    congiguration.ValeursDecalZERO[2]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO2', 50);
    congiguration.ValeursDecalZERO[3]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO3', 50);
    congiguration.ValeursDecalZERO[4]:=Ini.ReadInteger( 'Config', 'ValeursDecalZERO4', 50);

    congiguration.MULTI         :=Ini.ReadBool   ( 'Config', 'MULTI'         , false );
    congiguration.Enregistrement:=Ini.ReadBool   ( 'Config', 'Enregistrement', false);
    congiguration.MONOCOUP      :=Ini.ReadBool   ( 'Config', 'MONOCOUP'      , false );

    congiguration.OptionSondes  :=Ini.ReadBool   ( 'Config', 'OptionSondes'         , false );
    congiguration.OptionINV     :=Ini.ReadBool   ( 'Config', 'OptionINV'         , false );
    congiguration.OptionDIFFfacade:= Ini.ReadBool   ( 'Config', 'UniDiffFac'    , false );
    congiguration.ToutesOptions :=Ini.ReadBool   ( 'Config', 'ToutesOptions'         , false );

    traceur.GestionFlux         :=Ini.ReadBool   ( 'Config', 'GestionFlux'         , false );
    traceur.EnrgDuAff           :=Ini.ReadBool   ( 'Config', 'EnrgDuAff'         , false );
    traceur.EnrgExplo           :=Ini.ReadBool   ( 'Config', 'EnrgExplo'         , false );

    traceur.duree               :=Ini.ReadInteger   ( 'Config', 'TraceurDuree'         , 0 );
    Traceur.DureeAff            :=Ini.ReadInteger   ( 'Config', 'TraceurDureeaff'         , 0 );
    traceur.ItemDuree           :=Ini.ReadInteger   ( 'Config', 'ItemDuree'         , 0 );
    traceur.ItemDureeAff        :=Ini.ReadInteger   ( 'Config', 'ItemDureeAff'      , 1 );

    congiguration.BaseDetemps   :=Ini.ReadInteger( 'Config', 'BaseDetemps'    , 1);
    congiguration.TimeOut       :=Ini.ReadInteger( 'Config', 'TimeOut'        , 2);
    congiguration.timeoutVALEURutilisateur:=Ini.ReadInteger( 'Config', 'timeoutVALEURutilisateur'  , 10);
    congiguration.Vitesse       :=Ini.ReadInteger( 'Config', 'Vitesse'        , 2);
    congiguration.affichage     :=Ini.ReadInteger( 'Config', 'affichage'      , 1);
    congiguration.ConfigOscillo :=Ini.ReadInteger( 'Config', 'ConfigOscillo'  , 1);

    ValidationConfiguration (sender);
    //ValidConfigINTERFACE_GTI2(sender);
    //TraceurCalculsParametres(Sender);



  finally
    Ini.free;
  end;

end;
    Timer1.enabled    := true;

end;

procedure TFormTraceurGTI2.MenuEnregistrerConfig(Sender: TObject{; var Action :TCloseAction});
var
  Ini: TIniFile;
begin
 // Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+ 'TraceurGTI2.INI'  );
  try
    Ini.WriteInteger( 'Form', 'Top'   , FormTraceurGTI2.Top);
    Ini.WriteInteger( 'Form', 'Left'  , FormTraceurGTI2.Left);
    Ini.WriteInteger( 'Form', 'Height', FormTraceurGTI2.Height);
    Ini.WriteInteger( 'Form', 'Width' , FormTraceurGTI2.Width);

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



    Ini.WriteBool   ( 'Config', 'DecalZeros'    , congiguration.DecalZeros);

    Ini.WriteInteger( 'Config', 'ValeursDecalZERO1', congiguration.ValeursDecalZERO[1]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO2', congiguration.ValeursDecalZERO[2]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO3', congiguration.ValeursDecalZERO[3]);
    Ini.WriteInteger( 'Config', 'ValeursDecalZERO4', congiguration.ValeursDecalZERO[4]);

    Ini.WriteBool   ( 'Config', 'MULTI '         , congiguration.MULTI );
    Ini.WriteBool   ( 'Config', 'Enregistrement ', congiguration.Enregistrement );
    Ini.WriteBool   ( 'Config', 'MONOCOUP '      , congiguration.MONOCOUP );

    Ini.WriteBool   ( 'Config', 'OptionSondes '  , congiguration.OptionSondes );
    Ini.WriteBool   ( 'Config', 'OptionINV  '    , congiguration.OptionINV  );
    Ini.WriteBool   ( 'Config', 'UniDiffFac'    , congiguration.OptionDIFFfacade);
    Ini.WriteBool   ( 'Config', 'ToutesOptions  ', congiguration.ToutesOptions );

    //Ini.WriteBool   ( 'Config', 'GestionFlux '   ,traceur.GestionFlux );
    //Ini.WriteBool   ( 'Config', 'EnrgDuAff '     , traceur.EnrgDuAff  );
    //Ini.WriteBool   ( 'Config', 'EnrgExplo '     ,  traceur.EnrgExplo  );

    Ini.WriteBool   ( 'Config', 'GestionFlux '   , traceur.GestionFlux );
    Ini.WriteBool   ( 'Config', 'EnrgDuAff '     , traceur.EnrgDuAff  );
    Ini.WriteBool   ( 'Config', 'EnrgExplo '     , traceur.EnrgExplo  );

    Ini.WriteInteger( 'Config', 'TraceurDuree '  , traceur.duree  );
    Ini.WriteInteger( 'Config', 'TraceurDureeaff', Traceur.DureeAff );
    Ini.WriteInteger( 'Config', 'ItemDuree '     , traceur.ItemDuree  );
    Ini.WriteInteger( 'Config', 'ItemDureeAff '  , traceur.ItemDureeAff  );

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





procedure TFormTraceurGTI2.MenuRESETconfigClick(Sender: TObject);
begin
     resetConfiguration (sender);
     ValidationConfiguration (sender);
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



{
procedure TFormTraceurGTI2.MenuTimeOutClick(Sender: TObject);
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
}
procedure TFormTraceurGTI2.TriggerChange (sender: Tobject);
var x: integer;
ValeurrealOrdonnee:double;
Curseur_Ordonnee:integer;
i:integer;
begin
     for i:=0 to 4 do
     begin
        if sender=TRadioButTriggerMode[i]then
        begin
             if TRadioButTriggerMode[i].checked=true   then congiguration.Trigger:=i;
        end;
     end;

     if TRadioButtonFront[1].checked=true    then congiguration.front:=1;
     if TRadioButtonFront[0].checked=true    then congiguration.front:=0;




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




procedure TFormTraceurGTI2.AffichageBarreTrig(sender: Tpaintbox);
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




procedure TFormTraceurGTI2.affichageEnregistrements(Sender: Tpaintbox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2, Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
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
    Sender.Canvas.Pen.Color := clWhite;
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));

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





//////////////////////////////////////////////////////////////////
////  Calculs pour +                                           ////////////////////////////////////////////////////////////////////////////////////////
////             MULITMETRES....                               ////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

procedure TFormTraceurGTI2.DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double;var Amax3:double ;var Amax4:double ;var Amin3:double ;var Amin4:double );
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


procedure TFormTraceurGTI2.MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);
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


procedure TFormTraceurGTI2.MESURES(Sender: Tobject);
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




end;    //de MESURES


//////////////////////////////////////////////////////////////////
////  FIN des Calculs pour                                          ////////////////////////////////////////////////////////////////////////////////////////
////             MULITMETRES....                               ////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////                ////////////////////////////////////////////////////////////////////
//         gestion des ENREGISTREMENTS                  ///                ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                 ////////////////////////////////////////////////////////////////////


 {
procedure TFormTraceurGTI2.ENRGBRclick(Sender: TObject);
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

procedure TFormTraceurGTI2.ScrollBarEnregistrementsChange(Sender: TObject);

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

procedure TFormTraceurGTI2.ButtonEnregClick(Sender: TObject);
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

















         courbes [nb_courbes_stockees].couleur1 := clBlue;
         courbes [nb_courbes_stockees].couleur2 := clGreen;
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
   showmessage('Vous ne pouvez stocker plus de 10 courbes');
   end;





end;

{
procedure TFormTraceurGTI2.CheckBoxAClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position].visible:=CheckBoxA.checked;
end;

procedure TOscilloCaba.CheckBoxBClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position+1].visible:=CheckBoxB.checked;
end;

procedure TFormTraceurGTI2.OptionsAClick(Sender: TObject);
begin
     if nb_courbes_stockees<>0 then
     begin
     courbe_options:=ScrollBarEnregistrements.position;
     oscillocaba.visible:=false;
     Options.visible:=true;
     end;

end;

procedure TFormTraceurGTI2.OptionsBClick(Sender: TObject);
begin
     courbe_options:=ScrollBarEnregistrements.position+1;
     oscillocaba.visible:=false;
     Options.visible:=true;

end;
}

procedure TFormTraceurGTI2.SuprimerEnregistrementClick(Sender: TObject);
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
procedure TFormTraceurGTI2.SuprimerBClick(Sender: TObject);
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





end.


