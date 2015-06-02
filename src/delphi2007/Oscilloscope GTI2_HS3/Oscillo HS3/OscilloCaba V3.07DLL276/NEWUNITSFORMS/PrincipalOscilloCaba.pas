unit PrincipalOscilloCaba;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dlldecl,  StdCtrls,
  ExtCtrls, ComCtrls, Spin, Menus,math, jpeg, Buttons;


{definition de l'objet courbe}
type courbe = record
   Valide : boolean;
   voie1        : dArray; //Array [0..recordlength] of double;   pointeur de tabvleau
   voie2        : dArray; //Array [0..recordlength] of double;
   freq_ech     : dword;
   long_ech     : dword;
   BDT          : integer;
   calibCh1_ech : double;
   calibCh2_ech : double;
   CouplageCH1DC  : boolean;
   CouplageCH2DC  : boolean;
   INVCH1       : boolean;
   INVCH2       : boolean;
   ADD          : boolean;
   mode         : ( ch1 , ch2 , chop );
   XY          : boolean;
   couleur1     : Tcolor;
   couleur2     : Tcolor;
   nom          : string[255];
   visible      : boolean;
end;

type REG = record
   CalibreCH1 : double;
   calibreCH2 : double;
   FrequenceHS3 : dword;
   LongEnrgHS3  :dword;
   TimeOUTHS3   :dword;
end;

type TableauDyn=darray;


type

  TOscilloCaba = class(TForm)
    ecran: TPaintBox;
    INIT: TButton;
    Timer1: TTimer;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    TRIGCH1: TRadioButton;
    TRIGCH2: TRadioButton;
    GroupBox1: TGroupBox;
    TRIGMONT: TRadioButton;
    TRIGDESC: TRadioButton;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    COUPLAGECH1AC: TRadioButton;
    COUPLAGECH1DC: TRadioButton;
    GroupBox6: TGroupBox;
    CALIBCH1_20V: TRadioButton;
    CALIBCH1_8V: TRadioButton;
    CALIBCH1_4V: TRadioButton;
    CALIBCH1_08V: TRadioButton;
    CALIBCH1_2V: TRadioButton;
    CALIBCH1_04V: TRadioButton;
    CALIBCH1_02V: TRadioButton;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    COUPLAGECH2AC: TRadioButton;
    COUPLAGECH2DC: TRadioButton;
    GroupBox9: TGroupBox;
    CalibreCH2_20V: TRadioButton;
    CalibreCH2_4V: TRadioButton;
    CalibreCH2_2V: TRadioButton;
    CalibreCH2_08V: TRadioButton;
    CalibreCH2_04V: TRadioButton;
    CalibreCH2_02V: TRadioButton;
    CalibreCH2_8V: TRadioButton;
    GroupBox10: TGroupBox;
    TrigLevelBox: TEdit;
    SpinButton1: TSpinButton;
    calibre01ms: TRadioButton;
    calibre02ms: TRadioButton;
    calibre05ms: TRadioButton;
    calibre2ms: TRadioButton;
    calibre5ms: TRadioButton;
    calibre20ms: TRadioButton;
    calibre50ms: TRadioButton;
    calibre10ms: TRadioButton;
    calibre50mics: TRadioButton;
    calibre20mics: TRadioButton;
    calibre10mics: TRadioButton;
    calibre1mics: TRadioButton;
    calibre2mics: TRadioButton;
    calibre5mics: TRadioButton;
    ScrollBar5: TScrollBar;
    GroupBox11: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MainMenu1: TMainMenu;
    Visualisation1: TMenuItem;
    Zoom1: TMenuItem;
    BiEcran1: TMenuItem;
    simple: TMenuItem;
    Fichier1: TMenuItem;
    Regressi1: TMenuItem;
    EcranCH2: TPaintBox;
    EcranCH1: TPaintBox;
    calibre1ms: TRadioButton;
    INVch1: TCheckBox;
    INVch2: TCheckBox;
    Options1: TMenuItem;
    TRIGGERHYSTERESIS1: TMenuItem;
    BASEDETEMPSPERSO1: TMenuItem;
    OPTIONBDT: TGroupBox;
    BoxFreqEch: TComboBox;
    BoxLongAcq: TComboBox;
    FreqR: TEdit;
    LongER: TEdit;
    OFFBDTPERSO: TButton;
    XYbutton: TRadioButton;
    Calibrech2ScrollBar: TScrollBar;
    Calibrech1scrollbar: TScrollBar;
    TRIGGERTV1: TMenuItem;
    NOTrigButton: TRadioButton;
    HystLevelBox: TEdit;
    SpinButton2: TSpinButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBoxVch1Mesures: TGroupBox;
    LabelVch1DC: TLabel;
    LabelVch1AC: TLabel;
    LabelVch1ACDC: TLabel;
    LabelVch1Max: TLabel;
    LabelVch1Min: TLabel;
    GroupBoxVch2Mesures: TGroupBox;
    LabelVch2DC: TLabel;
    LabelVch2AC: TLabel;
    LabelVch2ACDC: TLabel;
    LabelVch2Max: TLabel;
    LabelVch2Min: TLabel;
    Mesures1: TMenuItem;
    Mutimetre1: TMenuItem;
    frquencemtre1: TMenuItem;
    GroupBoxFreqmetre: TGroupBox;
    LabelTch1: TLabel;
    LabelFch1: TLabel;
    LabelTch2: TLabel;
    LabelFch2: TLabel;
    GroupBoxEnregistrements: TGroupBox;
    ScrollBarEnregistrements: TScrollBar;
    Enregistrements: TMenuItem;
    Boitedenregistrements1: TMenuItem;
    PaintBoxA: TPaintBox;
    PaintBoxB: TPaintBox;
    CheckBoxA: TCheckBox;
    CheckBoxB: TCheckBox;
    OptionsA: TButton;
    OptionsB: TButton;
    ButtonCH1Enreg: TButton;
    ButtonCH2Enreg: TButton;
    ButtonDUALEnreg: TButton;
    LabelCalCh1A: TLabel;
    LabelCalCh2A: TLabel;
    Label1BDTA: TLabel;
    LabelCalCh1B: TLabel;
    LabelCalCh2B: TLabel;
    LabelBDTB: TLabel;
    ScrollBar6: TScrollBar;
    ADDButton: TRadioButton;
    regressi2: TMenuItem;
    Curseurs1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    signal: TMenuItem;
    GBF1: TMenuItem;
    TPbac: TMenuItem;
    Button2: TButton;
    ONESHOT1: TMenuItem;
    GroupShot: TGroupBox;
    StopShot: TButton;
    ButtonShot: TButton;
    ScrollBar7: TScrollBar;
    Label8: TLabel;
    REGRESSIHD1: TMenuItem;
    REGRESSIBR1: TMenuItem;
    Label7: TLabel;
    Button3: TButton;
    Label9: TLabel;
    XYetTemporel1: TMenuItem;
    FonctionsMathmathiques1: TMenuItem;
    GroupBoxFoncMath: TGroupBox;
    GroupBox12: TGroupBox;
    RadioButtonVarCh1: TRadioButton;
    RadioButtonVarCh2: TRadioButton;
    RadioButtonvar1et2: TRadioButton;
    GroupBox13: TGroupBox;
    ScrollBarLissage: TScrollBar;
    RadioButInteg: TRadioButton;
    RadioButDerive: TRadioButton;
    CheckBoxACintegrale: TCheckBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox16: TGroupBox;
    CALIBfctCH1_1: TRadioButton;
    CALIBfctCH1_2: TRadioButton;
    CALIBfctCH1_3: TRadioButton;
    CALIBfctCH1_4: TRadioButton;
    CALIBfctCH1_5: TRadioButton;
    CALIBfctCH1_6: TRadioButton;
    CALIBfctCH1_7: TRadioButton;
    CalibreFCTch1scrollbar: TScrollBar;
    CheckBox1: TCheckBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    GroupBox19: TGroupBox;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    ScrollBar9: TScrollBar;
    CheckBox2: TCheckBox;
    LissAutoDerivBOX: TCheckBox;
    Label10: TLabel;
    SpeedButtonVisualisationPeriodeCH1: TSpeedButton;
    SpeedButtonVisualisationPeriodeCH2: TSpeedButton;
    ScrollBarDcalibBDT: TScrollBar;
    DcalibBDT: TMenuItem;
    CALIBCH1_0210V: TRadioButton;
    CalibreCH2_0210V: TRadioButton;
    CALIBCH1_0225V: TRadioButton;
    CALIBCH1_0215V: TRadioButton;
    CalibreCH2_0225V: TRadioButton;
    CalibreCH2_0215V: TRadioButton;
    REGRESSIUtili: TMenuItem;
    GroupBoxZOOM: TGroupBox;
    EcranControle: TPaintBox;
    ScrollBar3: TScrollBar;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar4: TScrollBar;
    ResetZoom: TButton;
    ZoomOff: TButton;
    GroupBoxXY: TGroupBox;
    EcranXY: TPaintBox;
    Button4: TButton;
    SuprimerA: TButton;
    SuprimerB: TButton;
    EnrgbBR: TMenuItem;
    Label11: TLabel;
    Label12: TLabel;
    LabelWARNING: TLabel;
    InterfaceCompacte: TMenuItem;
    InterfaceNormal: TMenuItem;
    CALIBCH1_40V: TRadioButton;
    CalibreCH2_40V: TRadioButton;
    Accumulation1: TMenuItem;
    TimerDecalibrageBDT: TTimer;
    SpeedButtonFrontCabalab: TSpeedButton;
    CALIBCH1_80V: TRadioButton;
    CalibreCH2_80V: TRadioButton;
    ButtonCabaLabAutreAPLI: TButton;
    Apropos1: TMenuItem;
    Apropos2: TMenuItem;
   

    procedure Affichage_voies(Sender: TPaintBox);
    procedure Affichage_Zoom(Sender: TPaintBox);
    procedure INITClick(Sender: TObject);


    procedure Timer1Timer(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure TRIGCH1Click(Sender: TObject);
    procedure TRIGCH2Click(Sender: TObject);
    procedure TRIGMONTClick(Sender: TObject);
    procedure TRIGDESCClick(Sender: TObject);
    procedure COUPLAGECH1ACClick(Sender: TObject);
    procedure COUPLAGECH1DCClick(Sender: TObject);

   
    procedure COUPLAGECH2ACClick(Sender: TObject);
    procedure COUPLAGECH2DCClick(Sender: TObject);
   
    
    procedure TrigLevelBoxChange(Sender: TObject);
    procedure SpinTriglevelDownClick(Sender: TObject);
    procedure SpinTriglevelUpClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);

    procedure Zoom1Click(Sender: TObject);
    procedure simpleClick(Sender: TObject);
    procedure BiEcran1Click(Sender: TObject);
    procedure Affichage_voie_CH1(Sender: TPaintBox);
    procedure Affichage_voie_CH2(Sender: TPaintBox);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Regressi1Click(Sender: TObject);
    procedure BoxFreqEch1Change(Sender: TObject);
    procedure BoxLongAcq1Change(Sender: TObject);

    procedure ResetZoomClick(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure INVch1Click(Sender: TObject);
    procedure INVch2Click(Sender: TObject);
    procedure BASEDETEMPSPERSO1Click(Sender: TObject);
    procedure OFFBDTPERSOClick(Sender: TObject);
    procedure XYbuttonClick(Sender: TObject);
    procedure Affichage_voiesXY(Sender: TPaintBox);
    procedure NOTrigButtonClick(Sender: TObject);
    procedure Calibrech1scrollbarChange(Sender: TObject);
    procedure Calibrech2ScrollBarChange(Sender: TObject);
    procedure SpinHystlevelDownClick(Sender: TObject);
    procedure SpinHystlevelUpClick(Sender: TObject);
    procedure HystLevelBoxChange(Sender: TObject);
    procedure TRIGGERHYSTERESIS1Click(Sender: TObject);
   
    procedure Mutimetre1Click(Sender: TObject);
    procedure frquencemtre1Click(Sender: TObject);
   

    procedure recherche1Click(Sender: TObject);
    procedure Boitedenregistrements1Click(Sender: TObject);
    procedure ScrollBarEnregistrementsChange(Sender: TObject);
    procedure ButtonEnregClick(Sender: TObject);
    procedure CheckBoxAClick(Sender: TObject);
    procedure CheckBoxBClick(Sender: TObject);
    procedure OptionsAClick(Sender: TObject);
    procedure OptionsBClick(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure gbf2Click(Sender: TObject);
    procedure Regressi2Click(Sender: TObject);
    procedure regressiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GBF1Click(Sender: TObject);
    procedure TPbacClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ONESHOT1Click(Sender: TObject);
    procedure StopShotClick(Sender: TObject);
    procedure ButtonShotClick(Sender: TObject);
    procedure ScrollBar7Change(Sender: TObject);
    procedure REGRESSIBR1Click(Sender: TObject);
    procedure REGRESSIHD1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure XYetTemporel1Click(Sender: TObject);
    procedure FonctionsMathmathiques1Click(Sender: TObject);
    procedure CALCULS(Sender: TObject);
    procedure CalibreFCTch1scrollbarChange(Sender: TObject);
    procedure RadioButton_FctCH1_Click(Sender: TObject);

    procedure DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double );
    procedure MultiMetre(voie:double ; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);

    procedure CALIBREClick(Sender: TObject);
    procedure BDTClick(Sender: TObject);
    procedure DcalibBDTClick(Sender: TObject);
    procedure ScrollBarDcalibBDTChange(Sender: TObject);
    procedure REGRESSIUtiliClick(Sender: TObject);
    procedure SuprimerBClick(Sender: TObject);
    procedure SuprimerAClick(Sender: TObject);
    procedure ENRGBRclick(Sender: TObject);
    procedure ADDButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure InterfaceNormalClick(Sender: TObject);
    procedure InterfaceCompacteClick(Sender: TObject);

    procedure Initialisation(Sender: TObject);
    procedure Accumulation1Click(Sender: TObject);
    procedure TimerDecalibrageBDTTimer(Sender: TObject);
    procedure SpeedButtonFrontCabalabClick(Sender: TObject);
 
    procedure FormPaint(Sender: TObject);
    procedure ButtonCabaLabAutreAPLIClick(Sender: TObject);
    procedure ecranPaint(Sender: TObject);
    procedure Apropos2Click(Sender: TObject);
  private
    { Déclarations privées}
   // bInTimerProcedure : Boolean;
   // bAllowMeasuring : Boolean;
  public
    { Déclarations publiques}
   // courbes  : array [1..10] of courbe;
   // cochages : array [1..10] of TCheckBox;
   // boutons  : array [1..10] of Tbutton;
   // nb_courbes_stockees : integer;
    //compteur_courbes_stockees : integer;
    //courbe_courante : integer ;


  end;

 //const chemin_de_regressi  = 'D:\regressi2\Regressi.exe';
 //const chemin_de_regressi  = 'C:\progra~1\regressi  et portable\Regressi.exe';


 var
  //bInTimerProcedure : Boolean;
  bAllowMeasuring : Boolean;

  OscilloCaba: TOscilloCaba;
  Frequence : double;    //gbf
  Calibre   :  double;
  BDT: double;
  FreqEch:dword;
  NBEch : integer;

  T1:double;       //variables globales pour les coordonées du zoom
  T2:double;
  V11:double;
  V21:double;
  V12:double;
  V22:double;

  X1,Y1,X2,Y2:integer;
  positionboutton : byte;
  StartX : integer;
  StartY : integer;
  instantX : integer;
  instantY : integer;
  zoom:byte;
  BiEcran:byte;
  EcranNormal:byte;
  modech1,modech2:byte;
  INVech1,INVech2:single;
  modeXY:byte;
  multi:byte;
  //ii,iii:integer;
  Ti1:array [0..2] of integer;
  Ti2:array [0..2] of integer;
  DigitInfPeriodeCH1 :byte;
  DigitInfPeriodeCH2 :byte;
  freqmetre:byte;
  portable:byte;
  Tch1,Tch2,Fch1,Fch2:double;
   courbes  : array [1..10] of courbe;
   nb_courbes_stockees : integer;
   courbe_options: integer;
   num_de_courbe:integer;
   levelintereval:integer;
   levelmax,levelmin:double;
  CalculsCh1Array:array[0..10000] of double; 

  calibreFCTch1:double;
   DBDT:integer;

  REGOSC:REG;

    AeteCLOSED :boolean;

implementation

uses {Unit1, Unit2, Unit3, Unit4, Unit5, Unit6,}unitcabalab,
     Unit2optionsEnrg,Unit5NbEchPerso,Unit6TransfertRegressi,
     regressispecdecl, UnitGBF, UnitApropos;
{$R *.DFM}
procedure TOscilloCaba.Initialisation(Sender: TObject);
var
    DLLSource      : array[0..255] of char;
    erreur         : longint;

begin
////////////////////////////cabalab_1_17_RESET positions des boutons/////////////////////////////////
{INVch2.checked:=false;
INVch1.checked:=false;
COUPLAGECH1DCClick(sender) ;
COUPLAGECH1DC.Checked:=true;
COUPLAGECH2DCClick (sender);
COUPLAGECH2DC.Checked:=true;
Calibrech1scrollbar.position:=1;
Calibrech2ScrollBar.position:=1;               /////fais ds le form closed + efficace!!!!!!!
ScrollBar5.position:=9;
NOTrigButtonClick(sender);
NOTrigButton.Checked:=true;
TRIGMONTClick(sender);
TRIGMONT.Checked:=true;
RadioButton3Click(sender);/////mode DUAL
RadioButton3.Checked:=true;
simpleClick(sender); }
 ////////////////////////////////////////////////////////////////////////////////////////////////////

//timer1.enabled:=true;



// Chargement de la DLL
//StrPCopy( DLLSource, ExtractFilePath( Application.ExeName) + 'HS3.dll'    ) ;
//DLLHandle := Loadlibrary(DLLSource);
//   if DLLHandle = 0 then  showmessage('problème d''allocation mémoire lors du chargement de la DLL');
//RetrieveAllProcAddresses;

// Initialisation du module TiePie HS3
//erreur:=InitInstrument($308);



//   if erreur <> E_NO_ERRORS then
//   begin
 //  showmessage('Appareil non trouvé');
   // Ecrire ici les actions en cas d'absence du module
   // par exemple pour fermer le programme :
//   NilAllProcAddresses;
//   Application.terminate;
//   SetTriggerSource ( ltsCh1 ) ;    // trigger sur la voie 1
//   SetTriggerMode (  ltkrising ) ;  // trigger sur front montant
 //  SetTriggerLevel ( lCh1 , 0 ) ;
   //SetTriggertimeout(5000);
//   end;

   // réglages voies défaut
   calibre := 20 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 2 : 20V . Attention passage par adresse.
   SetCoupling ( lCh1 , lctDC ) ;      // Couplage voie 1 en DC
   SetCoupling ( lCh2 , lctDC ) ;      // Couplage voie 2 en DC
   INVech1:=1;
   INVech2:=1;
   // trigger defaut

   //SetTriggerSource ( ltsCh1 ) ;    // trigger sur la voie 1
   //SetTriggerMode (  ltkrising ) ;  // trigger sur front montant
   //SetTriggerLevel ( lCh1 , 0 ) ;
   SetTriggerSource ( 5 ) ; //trigger defaut no trig
   SetTriggerHys(lch1,0.1);
   SetTriggerHys(lch2,0.1);
   setTriggerTimeOUT(10);
   //echantillonage par défaut
   NBEch:=10000;
   SetMeasureMode ( 3 ) ; //Mesure sur les 2 voies
   SetRecordLength ( NBEch ) ;  // enregistrer sur 1024 échantillons
   SetPostSamples ( NBEch ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
   freqech := 2000000;
   SetSampleFrequency (@freqEch);

   //pas de zoom ni de biecran par défaut
    zoom:=0;
    BiEcran:=0;
    EcranNormal:=1;
    modech1:=1;
    modech2:=1;

    //start
    bAllowMeasuring := true;
    multi:=0;
    freqmetre:=0;
    nb_courbes_stockees :=0;
   // compteur_courbes_stockees :=0;

     calibreFCTch1:=1/100000 ;  //initialisation des calibre fonction math intégrale et dérivée

    DBDT:=1000;//initialisation du décalibrage de la base de temps100/100

    

end;

{ exemple de réglage du générateur :     }


procedure reglage_generateur;


  begin
   frequence := 500;
   SetFuncGenFrequency ( @frequence );  // frequence 100 kHz : attention passage par adresse.
   SetFuncGenSignalType ( 0 ) ; // mode sinus
   SetFuncGenAmplitude (  5);   // amplitude 4 V
   SetFuncGenDCOffset ( 2 );  //Offset 0 V
   SetFuncGenSymmetry ( 50 ); // signal symétrique ( 50 %)
   SetFuncGenOutputOn ( 1 ) ; // allumer le gené
 end;



{ exemple d'acquisition des voies 1 et 2
dans les tableaux Ch1DoubleArray et Ch2DoubleArray déjà déclarés dans la DLL
ne pas oublier de lancer la procédure initialisation avant l'acquisition.
}


procedure acquisition;

var Erreur    :  word;

  //  Frequence :  dword;
  //  NBEch : integer;


begin

// réglages temps
 //  SetMeasureMode ( lChop ) ; //Mesure sur les 2 voies
  // SetRecordLength ( NBEch ) ;  // enregistrer sur 1024 échantillons
 //  SetPostSamples ( NBEch ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
  // frequence := 50000000;
 //  SetSampleFrequency (@freqEch) ; // frequence d'échantillonage 50 MHz. Attention passage par adresse.
  { BDT:=0.0005;
   NBEch:=round(BDT*10*frequence);
   SetRecordLength ( NBEch ) ;
   SetPostSamples ( NBEch ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
   }




// réglages voies
//   calibre := 10 ;
//   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 10V . Attention passage par adresse.
//   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 2 : 10V . Attention passage par adresse.
//   SetCoupling ( lCh1 , lctDC ) ;      // Couplage voie 1 en DC
//   SetCoupling ( lCh2 , lctDC ) ;      // Couplage voie 2 en DC

// réglages Trigger
//   SetTriggerSource ( ltsCh1 ) ;    // trigger sur la voie 1
//   SetTriggerMode (  ltkrising ) ;  // trigger sur front montant
//  SetTriggerLevel ( lCh1 , 0 ) ;   // trigger de la voie 1 au niveau 0V

// et enfin l'acquisition
   erreur := StartMeasurement();    // Lance l'acquisition
   if erreur <> E_NO_ERRORS then
   ShowMessage('Appareil non initialisé');
   erreur := GetMeasurement( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.
   if erreur <> E_NO_ERRORS then
   ShowMessage('Problème De Getmeasurement');

end;









////////////////////////////////////////////////////////////////
///              GESTION                                          ////////////////////////////////////////////////////////////////////////
///                     INTERFACE                                   /////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

procedure TOscilloCaba.FormCreate(Sender: TObject);
begin
     AeteCLOSED:=true;
     oscillocaba.top:=0;
     oscillocaba.left:=0;
     oscillocaba.Width:=1024;
     oscillocaba.Height:=768;
  
    

end;




procedure TOscilloCaba.FormResize(Sender: TObject);
begin
     ecran.width:=oscillocaba.width-(392+15);
     ecran.height:=oscillocaba.height-100;
   //  ScrollBar6.height:=ecran.height+32;
     ecranch1.height:=round(ecran.height/2)-15;
     ecranch2.top:=ecranch1.height+30;
     ecranch2.height:=round(ecran.height/2)-15;
     ecranch1.width:=oscillocaba.width-(392+15);
     ecranch2.width:=oscillocaba.width-(392+15);
end;

procedure TOscilloCaba.INITClick(Sender: TObject);     //INterface COMPACTE
begin
timer1.enabled:=true;
OscilloCaba.initialisation(sender);

portable:=1;    ///seule variable d état a garder!!!!!

oscillocaba.Width:=1024;
oscillocaba.Height:=768;

//reglage_generateur;
//acquisition;
//affichage_voies(ecran);
init.visible:=false;             //Boutons
button3.Visible:=false;

label3.visible:=false;            //Présentation OscilloCaba
label4.visible:=false;
//label5.visible:=false;
//label6.visible:=false;
label7.Visible:=false;
//image1.visible:=false;
Label9.Visible:=false;
//Label13.Visible:=false;

 Fichier1.Enabled:=true;              //Déverouillage des menus
 Visualisation1.Enabled:=true;
 Options1.Enabled:=true;
 Mesures1.Enabled:=true;
 Enregistrements.Enabled:=true;
 signal.Enabled:=true;
 GroupBox4.Enabled:=true;             //dévérouillage des interfaces
 GroupBox7.Enabled:=true;
 GroupBox2.Enabled:=true;
 GroupBox10.Enabled:=true;
 GroupBox11.Enabled:=true;




 Button2.Top:=672;                       //position bouton rapel GBF

 GroupBoxEnregistrements.Top:=384;
 GroupBoxEnregistrements.left:=8;
 GroupBoxEnregistrements.Height:=145;
 ScrollBarEnregistrements.Height:=121;

 GroupShot.Top:=640;
 GroupShot.Left:=8;

 GroupBoxFoncMath.Top:=376;
 GroupBoxFoncMath.left:=8;

 OPTIONBDT.Top:=288;
 OPTIONBDT.left:=8;

 GroupBoxVch1Mesures.Top:=576;

 GroupBoxFreqmetre.Top:=576;
 GroupBoxVch2Mesures.Top:=576;


 GroupShot.Top:=536;
 GroupShot.Left:=8;

// EcranXY.Top:=392;
// EcranXY.left:=8;
 GroupBoxXY.Top:=376;
 GroupBoxXY.left:=8;

 CheckBoxB.Visible:=false;                 //gestion interface compacte(un seul écran de visualisation des enregistrements)
 OptionsB.Visible:=false;
 LabelCalCh1B.Visible:=false;
 LabelCalCh2B.Visible:=false;
 LabelBDTB.Visible:=false;
 PaintBoxB.Visible:=false;



end;

procedure TOscilloCaba.Button3Click(Sender: TObject);        //Interface "NORMAL"
begin
timer1.enabled:=true;
initialisation(sender);

portable:=0;//seul variable d état a garder!!!!

oscillocaba.Width:=1200;
oscillocaba.Height:=900;
//reglage_generateur;
//acquisition;
//affichage_voies(ecran);
init.visible:=false;
button3.Visible:=false;

label3.visible:=false;
label4.visible:=false;
//label5.visible:=false;
//label6.visible:=false;
label7.Visible:=false;
//image1.visible:=false;
Label9.Visible:=false;
//Label13.Visible:=false;

 Fichier1.Enabled:=true;
 Visualisation1.Enabled:=true;
 Options1.Enabled:=true;
 Mesures1.Enabled:=true;
 Enregistrements.Enabled:=true;
 signal.Enabled:=true;
 GroupBox4.Enabled:=true;
 GroupBox7.Enabled:=true;
 GroupBox2.Enabled:=true;
 GroupBox10.Enabled:=true;
 GroupBox11.Enabled:=true;

 OPTIONBDT.Top:=288;
 OPTIONBDT.left:=8;


 Button2.Top:=768;

 GroupBoxEnregistrements.Top:=376;
 GroupBoxEnregistrements.left:=8;

 GroupShot.Top:=648;
 GroupShot.Left:=8;

 GroupBoxFoncMath.Top:=376;
 GroupBoxFoncMath.left:=8;

 GroupBoxVch1Mesures.Top:=672;
 GroupBoxVch2Mesures.Top:=672;
 GroupBoxFreqmetre.Top:=672;

// EcranXY.Top:=392;
// EcranXY.left:=8;
  GroupBoxXY.Top:=376;
 GroupBoxXY.left:=8;
end;

procedure TOscilloCaba.simpleClick(Sender: TObject);            //MODE VISUALISATION SIMPLE : INTERFACE NORMALE
begin
    simple.checked:=true;

    GroupBoxXY.Visible:=false;
    XYbutton.Enabled:=true;

    GroupBoxZOOM.Visible:=false;

    ScrollBar1.position:=0;                    //initialisation du zoom
    ScrollBar2.position:=1000;
    ScrollBar3.position:=0;
    ScrollBar4.position:=1000;

    EcranCH1.visible:=false;                  //initialisation ecrans
    EcranCH2.visible:=false;
    ecran.visible:=true;

end;

procedure TOscilloCaba.Biecran1Click(Sender: TObject);            //MODE VISUALISATION BI ECRAN
begin
    RadioButton3.Checked:=true;    //1_21FM   XY vers bug BI ecran  : bug irréversible de l'affichage
    RadioButton3Click(Sender);     //1_21FM   XY vers bug BI ecran  : bug irréversible de l'affichage

    simpleClick(sender);
    biecran1.checked:=true;
    ecran.visible:=false;
    EcranCH1.visible:=true;
    EcranCH2.visible:=true;
end;

procedure TOscilloCaba.Zoom1Click(Sender: TObject);              //MODE VISUALISATION ZOOM
begin
simpleClick(sender);
if   Boitedenregistrements1.checked=true          then  Boitedenregistrements1Click(sender);
if  (portable=1) and (Mutimetre1.Checked=true)    then  Mutimetre1Click(sender);
if  (portable=1) and (frquencemtre1.Checked=true) then  frquencemtre1Click(sender);

zoom1.checked:=true;
GroupBoxZOOM.Visible:=true;

end;




procedure TOscilloCaba.XYetTemporel1Click(Sender: TObject);        //OPTION VISUALISATION XY et TEMPOREL
begin

simpleClick(sender);
if Boitedenregistrements1.checked=true then Boitedenregistrements1Click(sender);
if  (portable=1) and (Mutimetre1.Checked=true) then  Mutimetre1Click(sender);
if  (portable=1) and (frquencemtre1.Checked=true) then  frquencemtre1Click(sender);
if  (portable=1) and (DcalibBDT.Checked=true) then  DcalibBDTClick(sender);

RadioButton3.checked:=true;    //mode dual forcé
XYbutton.Enabled:=false;       //imposible d'acceder au mode XY normal

XYetTemporel1.Checked:=true;
GroupBoxXY.Visible:=true;

end;




procedure TOscilloCaba.gbf2Click(Sender: TObject);              ///?????????????
begin
    {if gbf2.checked=false then
        begin
             form3.visible:=true;
             gbf2.checked:=true;
        end
     else
        begin

             form3.visible:=false;
             gbf2.checked:=false;
        end;  }
    button1.visible:=true;
end;

procedure TOscilloCaba.Button1Click(Sender: TObject);         ////tp bac 2004 gestion de sbug d'affichage?
begin
   {  if form4.visible=false then
        begin
             form4.visible:=true;
             //gbf2.checked:=true;
        end
     else
        begin

            // form4.visible:=false;
             //gbf2.checked:=false;
        end;
     form4.visible:=false;
     form4.visible:=true; }
end;

procedure TOscilloCaba.GBF1Click(Sender: TObject);            /////apparition gbg et boutton gbf  par le main menu
begin
     //button1.visible:=true;

     //Unit3.Demarage:=0;
     //form4.visible:=false;
     //form3.visible:=true;
     //button1.visible:=false;
    // button2.visible:=true;
     
end;

procedure TOscilloCaba.TPbacClick(Sender: TObject);         ////interface tp bac 2004
begin
  //  form3.visible:=false;
  //  form4.visible:=true;
  //  button2.visible:=false;
  //  button1.visible:=true;


end;

procedure TOscilloCaba.Button2Click(Sender: TObject);          ////re apparition du gbf en dessous de l'interface principale   + bugs?
begin
  {  if form3.visible=false then
        begin
             form3.visible:=true;
             //gbf2.checked:=true;
        end
     else
        begin

            // form4.visible:=false;
             //gbf2.checked:=false;
        end;
     form3.visible:=false;
     form3.visible:=true;  }
end;


 



procedure TOscilloCaba.BASEDETEMPSPERSO1Click(Sender: TObject);           //Aparition interface BDT PERSO
begin
    OPTIONBDT.visible:=true;
    GroupBox10.visible:=false;
                                                               
end;

procedure TOscilloCaba.OFFBDTPERSOClick(Sender: TObject);                   //disparition interface BDT PERSO
begin
     OPTIONBDT.visible:=false;
     GroupBox10.visible:=true;

     //a reprendre aprés les modif V3.0 pour compacter le code!!!!!!

  {   if ScrollBar5.position=1 then calibre1micsClick(Sender);
    if ScrollBar5.position=2 then calibre2micsClick(Sender);
    if ScrollBar5.position=3 then calibre5micsClick(Sender);
    if ScrollBar5.position=4 then calibre10micsClick(Sender);
    if ScrollBar5.position=5 then calibre20micsClick(Sender);
    if ScrollBar5.position=6 then calibre50micsClick(Sender);
    if ScrollBar5.position=7 then calibre01msClick(Sender);
    if ScrollBar5.position=8 then calibre02msClick(Sender);
    if ScrollBar5.position=9 then calibre05msClick(Sender);
    if ScrollBar5.position=10 then calibre1msClick(Sender);
    if ScrollBar5.position=11 then calibre2msClick(Sender);
    if ScrollBar5.position=12 then calibre5msClick(Sender);
    if ScrollBar5.position=13 then calibre10msClick(Sender);
    if ScrollBar5.position=14 then calibre20msClick(Sender);
    if ScrollBar5.position=15 then calibre50msClick(Sender);
   }

end; 









procedure TOscilloCaba.TRIGGERHYSTERESIS1Click(Sender: TObject);               /// Hytérésis trigger
begin
    Label2.visible:=true;
    HystLevelBox.visible:=true;
    SpinButton2.visible:=true;
end;





procedure TOscilloCaba.Mutimetre1Click(Sender: TObject);                         ///MULTIMETRE
begin
     If  Mutimetre1.checked=false then
         begin
              multi:=1;
              Mutimetre1.checked:=true;
              GroupBoxVch1Mesures.visible:=true;
              GroupBoxVch2Mesures.visible:=true;
         end
     else
         begin
              multi:=0;
              Mutimetre1.checked:=false;
              GroupBoxVch1Mesures.visible:=false;
              GroupBoxVch2Mesures.visible:=false;

         end;
end;

procedure TOscilloCaba.frquencemtre1Click(Sender: TObject);                       //FREQUENCE
begin
     if frquencemtre1.checked=false then
        begin
             //freqmetre:=1;
             frquencemtre1.checked:=true;
             GroupBoxFreqmetre.visible:=true;
        end
     else
         begin
             //freqmetre:=0;
             frquencemtre1.checked:=false;
             GroupBoxFreqmetre.visible:=false;
         end;
end;


procedure TOscilloCaba.recherche1Click(Sender: TObject);                         ///Interface de recherche du chemin de regressi
begin
    //form1.visible:=true;
end;

procedure TOscilloCaba.Boitedenregistrements1Click(Sender: TObject);             ///Gestion interface BOITE d'ENREGISTREMENTS
begin
     if DcalibBDT.checked=true then DcalibBDTClick(Sender);
   //  if XYetTemporel1.checked=true then  XYetTemporel1Click(sender);
     simpleClick(sender);


     if  GroupBoxEnregistrements.visible=true then
     begin
     GroupBoxEnregistrements.visible:=false;
     Boitedenregistrements1.checked:=false;
     end
     else
     begin

    

     GroupBoxEnregistrements.visible:=true;
     Boitedenregistrements1.checked:=true;
     CheckBoxA.caption:='C1';
     CheckBoxB.caption:='C2';

     OptionsA.visible:=false;
     OptionsB.visible:=false;

     PaintBoxA.Canvas.Brush.Color := clBlack;
     PaintBoxA.Canvas.Rectangle(0, 0, PaintBoxA.Width - 1, PaintBoxA.Height - 1);
     PaintBoxB.Canvas.Brush.Color := clBlack;
     PaintBoxB.Canvas.Rectangle(0, 0, PaintBoxB.Width - 1, PaintBoxB.Height - 1);
     {mettre un appel a scrollbar change?}


     end;
end;



procedure TOscilloCaba.FonctionsMathmathiques1Click(Sender: TObject);             ///GESTION Fonctions math INtrégrale et derivée
begin
    //GroupBoxFoncMath.Top:=111;
    //GroupBoxFoncMath.left:=8;
    //GroupBoxFoncMath.Visible:=true;

if  FonctionsMathmathiques1.Checked=false then
    begin
    GroupBoxFoncMath.Visible:=true;
    FonctionsMathmathiques1.Checked:=true;
    CalibreFCTch1scrollbar.position:=1;
    RadioButton_FctCH1_Click(Sender);
    if  (Mutimetre1.Checked=true) then  Mutimetre1Click(sender);
    if  (frquencemtre1.Checked=true) then  frquencemtre1Click(sender);
    end
else
    begin
    GroupBoxFoncMath.Visible:=false;
    FonctionsMathmathiques1.Checked:=false;
    end
end;

///////////////////////////////////////////////////////////////////////////////
///// FIN GESTION INTERFACE////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
////  Calculs pour INTEGRALE ET DERIVEE                     /////// ////////////////////////////////////////////////////////////////////
////            ET MULITMETRES....                                            /////// ///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

procedure TOscilloCaba.DetectionCrete(PFLevel:boolean ; MultiM:boolean ; FreqM:boolean;var Amax1:double ;var Amax2:double ;var Amin1:double ;var Amin2:double );
var
j,k:integer;
Long:Dword;
moy:double;
Ch1meanarray:array[0..10000] of double;
Ch2meanarray:array[0..10000] of double;
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
      end;  {for}

      Amin1:=Ch1Doublearray[10];
      Amax1:=Ch1Doublearray[10];
      Amin2:=Ch2Doublearray[10];
      Amax2:=Ch2Doublearray[10];

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
      end;  {for}

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
end;
end;


procedure TOscilloCaba.MultiMetre(voie:double; Amax:double ; Amin:double ; var MesuresPossible:boolean ;var Tia:integer; var Tib:integer;var F:double;var T:double;var VDC:double;var VAC:double;var VACDC:double);
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

procedure TOscilloCaba.CALCULS;
var
   Long_Acqu : dword;
   Freq_ech : dword;
   ValMoy: double;
   Ch1meanarray:array[0..10000] of double;
   i,j,k,OL:integer;
   Calibre1,moy,vi,vdc,vdcl,VCH1:double;
begin
try

    Long_Acqu := GetRecordLength();
    Freq_ech    := GetSampleFrequency();//fréquence en Hz d'aprés la doc
    GetSensitivity( lCh1, @Calibre1);
    VCH1:=Calibre1 ;

   // VCH1*Long_Acqu/Freq_ech             //calcule de Vintmax

if RadioButDerive.Checked=true then
begin
    if LissAutoDerivBOX.checked=false then
    begin
        OL:=round(ScrollBarLissage.position*Long_Acqu/5000);
        for j:=OL to (Long_Acqu-(OL+1)) do
        begin
          ValMoy:=0;
          for k:=-OL to OL do  ValMoy:=ValMoy+Ch1Doublearray[j+k];
          Ch1meanarray[j]:= ValMoy/(2*OL+1);
        end;
    end




  //end
else
begin


        For i:=1 to (Long_Acqu-2) do  CalculsCh1Array[i]:= (Ch1Doublearray[i+1]-Ch1Doublearray[i-1])*Freq_ech/10000;   //dérivée SANS lissage

        vdc:=0;
        vi:=0;
        for i:=1 to Long_Acqu do vi:=vi+abs(CalculsCh1Array[i]);         //valeur moyenne de la valeur absolue de la dérivée SANS lissage
        vdc:=vi/Long_Acqu;

        OL:=1;
        vdcl:=0;
        for j:=OL to (Long_Acqu-(OL+1)) do
        begin                                                           //signal lissé
          ValMoy:=0;
          for k:=-OL to OL do  ValMoy:=ValMoy+Ch1Doublearray[j+k];
          Ch1meanarray[j]:= ValMoy/(2*OL+1);

        end;

        For i:=1 to (Long_Acqu-2) do  CalculsCh1Array[i]:= (Ch1meanarray[i+1]-Ch1meanarray[i-1])*Freq_ech/10000;   //dérivée AVEC lissage

        vdcl:=0;
        vi:=0;
        for i:=1 to Long_Acqu do vi:=vi+abs(CalculsCh1Array[i]);        //valeur moyenne de la valeur absolue de la dérivée AVEC lissage
        vdcl:=vi/Long_Acqu;


        OL:=round(OL*(vdc-vdcl)*100);        //asservissement d'ordre de lissage



        for j:=0 to OL do
        begin                                                              //Re calcul du lissage aprés asservissement
          ValMoy:=0;

          for k:=-j to j do
          begin
           ValMoy:=ValMoy+Ch1Doublearray[j+k];

           end;
          Ch1meanarray[j]:= ValMoy/(2*j+1);
        end;
        for j:=OL to (Long_Acqu-(OL+1)) do
        begin                                                              //Re calcul aprés asservissement
          ValMoy:=0;
          for k:=-OL to OL do  ValMoy:=ValMoy+Ch1Doublearray[j+k];
          Ch1meanarray[j]:= ValMoy/(2*OL+1);
        end;

        for j:=(Long_Acqu-(OL+1)) to (Long_Acqu-1) do
        begin                                                              //Re calcul aprés asservissement
          ValMoy:=0;
          for k:=j-OL to (Long_Acqu-1) do  ValMoy:=ValMoy+Ch1Doublearray[k];
          Ch1meanarray[j]:= ValMoy/(Long_Acqu-1-j+OL);
        end;
end;
    Label10.Caption:=floattostr(OL);

    For i:=1 to (Long_Acqu-2) do  //-11 pour la dérivée
    begin
   // CalculsCh1Array[i]:=Ch1DoubleArray[i]*Ch1DoubleArray[i]/(Calibre1); //essai x^2 : multiplier par calibre/f(calibre) pour avoir le f(max) qui loge dans l'écran
    CalculsCh1Array[i]:= (Ch1meanarray[i+1]-Ch1meanarray[i-1])*Freq_ech/10000;
    end;
end;


if RadioButInteg.Checked=true then            //essailler de diviser par le calibre max ^2 ????
begin
     vdc:=0;
     if CheckBoxACintegrale.checked=true then
     begin
          vi:=0;
          for i:=1 to Long_Acqu do vi:=vi+Ch1DoubleArray[i];
          vdc:=vi/Long_Acqu;
     end;

    CalculsCh1Array[0]:=0;
    For i:=1 to (Long_Acqu-1) do
    begin
    CalculsCh1Array[i]:= CalculsCh1Array[i-1]+ (Ch1Doublearray[i]-vdc)/(Freq_ech);
    end;

end;


except end;
end;


//////////////////////////
//fin fct math////////////// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////


/////////////////////////////////////////////////////////////////////////////////
/////////              PROCEDURES D'AFFICHAGE                           ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

{ Affichage des deux voies dans une fenetre.

Pour l'utiliser :
créer sur la fiche un objet TPaintBox de la taille voulue ( menu VOIR puis LISTE DE COMPOSANTS )
lui donner un nom dans l'inspecteur d'objet par exemple 'ecran'
pour afficher les 2 voies après une acquisition, il suffit d'écrire :
Affichage_voies(ecran);
}



procedure TOscilloCaba.Affichage_voies(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    x,y,t,i:integer ;
    Freq_ech_actuelle : dword;
begin

Longueur_Acquisition := GetRecordLength();
GetSensitivity( lCh1, @Calibre1);
GetSensitivity( lCh2, @Calibre2);

//corectif calibre dans le cas 20 ;10; 5 mv "artificiel"
 if CALIBCH1_0225V.Checked=true then calibre1:=0.08;
 if CALIBCH1_0215V.Checked=true then calibre1:=0.04;
 if CALIBCH1_0210V.Checked=true then calibre1:=0.02;

 if CalibreCH2_0225V.Checked=true then calibre2:=0.08;
 if CalibreCH2_0215V.Checked=true then calibre2:=0.04;
 if CalibreCH2_0210V.Checked=true then calibre2:=0.02;
//fin corecti


//essai diagrame de l'oeil accumulation:
if Accumulation1.Checked=false then
begin

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


end; //de l'essai diagrame de l'oeil accumulation:


//lignes de période
         if (Freqmetre=1) {and ( DigitInfPeriodeCH1 = 0)} and (modech1=1 ) and (SpeedButtonVisualisationPeriodeCH1.down=true) then
            begin

                 Sender.Canvas.Pen.Color := clred;
                 Sender.Canvas.MoveTo(round((Ti1[0]*sender.width)/Longueur_Acquisition), 0 );
                 Sender.Canvas.LineTo(round((Ti1[0]*sender.width)/Longueur_Acquisition), round(-(invech1)*Ch1DoubleArray[Ti1[0]]* (Sender.Height/2) / Calibre1 + (Sender.Height/2)));
                 Sender.Canvas.MoveTo(round((Ti1[2]*sender.width)/Longueur_Acquisition), 0  );
                 Sender.Canvas.LineTo(round((Ti1[2]*sender.width)/Longueur_Acquisition), round(-(invech1)*Ch1DoubleArray[Ti1[0]]* (Sender.Height/2) / Calibre1 + (Sender.Height/2)) );
             end;
          if (freqmetre=1) {and ( DigitInfPeriodeCH2 = 0)} and (modech2=1) and (SpeedButtonVisualisationPeriodeCH2.down=true) then
            begin
                 Sender.Canvas.Pen.Color := clYellow;
                 Sender.Canvas.MoveTo(round((Ti2[0]*sender.width)/Longueur_Acquisition), round(-(invech2)*Ch2DoubleArray[Ti2[0]]* (Sender.Height/2) / Calibre2 + (Sender.Height/2))  );
                 Sender.Canvas.LineTo(round((Ti2[0]*sender.width)/Longueur_Acquisition), sender.height);
                 Sender.Canvas.MoveTo(round((Ti2[2]*sender.width)/Longueur_Acquisition), round(-(invech2)*Ch2DoubleArray[Ti2[0]]* (Sender.Height/2) / Calibre2 + (Sender.Height/2))   );
                 Sender.Canvas.LineTo(round((Ti2[2]*sender.width)/Longueur_Acquisition), sender.height);

            end;



// Affichage Voie 1
    if modeCH1=1 then
    begin
    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(0, Round(  (invech1)*Ch1DoubleArray[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          if  (freqmetre=1)and (SpeedButtonVisualisationPeriodeCH1.down=true) and(Curseur_Abscisse>=round((Ti1[0]*sender.width)/Longueur_Acquisition)) and  (Curseur_Abscisse<=round((Ti1[2]*sender.width)/Longueur_Acquisition)) then
          Sender.Canvas.Pen.Color := clRed
          else
          Sender.Canvas.Pen.Color := clLime;

          ///corectif pour le calibre 20mv
          if CALIBCH1_0225V.Checked=true then
          begin
               if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   > 0.08 then
                  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=0.08;
               if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   < -0.08 then
                  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=-0.08;
          end;
          //fin corectif

          ///corectif pour le calibre 10mv
          if CALIBCH1_0215V.Checked=true then
          begin
               if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   > 0.04 then
                  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=0.04;
               if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   < -0.04 then
                  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=-0.04;
          end;
          //fin corectif

          ///corectif pour le calibre 5mv
          if CALIBCH1_0210V.Checked=true then
          begin
               if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   > 0.02 then
                  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=0.02;
               if Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   < -0.02 then
                  Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=-0.02;
          end;
          //fin corectif

          Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;


    end;

// Affichage Voie 2
     if modeCH2=1 then
    begin
    Sender.Canvas.Pen.Color := clAqua;
    Sender.Canvas.MoveTo(0, Round(  -(invech2)*Ch2DoubleArray[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          if  (freqmetre=1)and (SpeedButtonVisualisationPeriodeCH2.down=true) and(Curseur_Abscisse>=round((Ti2[0]*sender.width)/Longueur_Acquisition)) and  (Curseur_Abscisse<=round((Ti2[2]*sender.width)/Longueur_Acquisition)) then
          Sender.Canvas.Pen.Color := clYellow
          else
          Sender.Canvas.Pen.Color := clAqua;


          ///corectif pour le calibre 20mv
          if CalibreCH2_0225V.Checked=true then
          begin
               if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   > 0.08 then
                  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=0.08;
               if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   < -0.08 then
                  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=-0.08;
          end;
          //fin corectif

          ///corectif pour le calibre 10mv
          if CalibreCH2_0215V.Checked=true then
          begin
               if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   > 0.04 then
                  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=0.04;
               if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   < -0.04 then
                  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=-0.04;
          end;
          //fin corectif

          ///corectif pour le calibre 5mv
          if CalibreCH2_0210V.Checked=true then
          begin
               if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   > 0.02 then
                  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=0.02;
               if Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]   < -0.02 then
                  Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ]:=-0.02;
          end;
          //fin corectif



          Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition * (DBDT/1000)/ Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;

    end;

//affichage fonction ADD
            if addbutton.checked=true then
            begin
            modeCH1:=0;
            modeCH2:=0;
            Sender.Canvas.Pen.Color := clyellow;
            Sender.Canvas.MoveTo(0, Round(  (-(invech2)*Ch2DoubleArray[ 0 ]-(invech1)*Ch1DoubleArray[ 0 ]) * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));


            for Curseur_Abscisse := 1 to Sender.Width - 1 do
                begin

                          Sender.Canvas.Pen.Color := clyellow;

                          Curseur_Ordonnee := Round(  (-(invech2)*Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition* (DBDT/1000) / Sender.Width ) ]-(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ]) * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
                          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
                end;

            end;

//affichage CALCULS(en dév...)
            if  FonctionsMathmathiques1.checked=true then
            begin
            Sender.Canvas.Pen.Color := clyellow;
            Sender.Canvas.MoveTo(0, Round(  (invech1)*CalculsCh1Array[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));

               if RadioButInteg.Checked=true then
               begin
                 for Curseur_Abscisse := 1 to Sender.Width - 1 do
                 begin
                 Sender.Canvas.Pen.Color := clyellow;
                 Curseur_Ordonnee := Round(  -(invech1)*CalculsCh1Array[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / calibreFCTch1 + (Sender.Height/2) );
                 Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
                 end;
               end;

               if RadioButDerive.checked=true then
               begin
                 for Curseur_Abscisse := 1 to Sender.Width - 1 do
                 begin
                 Sender.Canvas.Pen.Color := clyellow;
                 Curseur_Ordonnee := Round(  -(invech1)*CalculsCh1Array[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / calibre1 + (Sender.Height/2) );
                 Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
                 end;
               end;


             end;







//affichage de la fenètre de Zoom

if zoom=1 then
begin
Sender.Canvas.Pen.Color := clYellow;
Sender.Canvas.MoveTo(round(T1*(Sender.Width/Longueur_acquisition)), round(Abs(Sender.Height-((V11*(Sender.Height/2))/(calibre1)+Sender.Height/2))));
Sender.Canvas.LineTo(round(T2*(Sender.Width/Longueur_acquisition)), round(Abs(Sender.Height-((V11*(Sender.Height/2))/(calibre1)+Sender.Height/2))));
Sender.Canvas.LineTo(round(T2*(Sender.Width/Longueur_acquisition)), round(Abs(Sender.Height-((V21*(Sender.Height/2))/(calibre1)+Sender.Height/2))));
Sender.Canvas.LineTo(round(T1*(Sender.Width/Longueur_acquisition)), round(Abs(Sender.Height-((V21*(Sender.Height/2))/(calibre1)+Sender.Height/2))));
Sender.Canvas.LineTo(round(T1*(Sender.Width/Longueur_acquisition)), round(Abs(Sender.Height-((V11*(Sender.Height/2))/(calibre1)+Sender.Height/2))));
end;
//Sender.Canvas.Rectangle(round(T1*(Sender.Width/Longueur_acquisition)), round(Abs(Sender.Height-((V1*(Sender.Height/2))/(calibre1)+Sender.Height/2))),round(T2*(Sender.Width/longueur_acquisition)),round(Abs(Sender.Height-((V2*(Sender.Height/2))/(Calibre2)+ Sender.Height/2))));





if nb_courbes_stockees <> 0 then

   Freq_ech_actuelle:=GetSampleFrequency();

      for i :=1 to nb_courbes_stockees do
      begin
     //  cochages[i].Color:=courbes[i].couleur;
     //  Sender.Canvas.Pen.Color :=courbes[i].couleur;
       if (courbes[i].visible=true) then
       begin
          if (courbes[i].mode = ch1 ) or  (courbes[i].mode = chop ) then
         begin
         Sender.Canvas.Pen.Color :=courbes[i].couleur1;
         Sender.Canvas.MoveTo(0, Round(  courbes[i].voie1[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ) );

             for Curseur_Abscisse := 1 to min(Sender.Width - 1,round((Sender.Width-1)*Freq_ech_actuelle/courbes[i].freq_ech)) do
             begin
             Curseur_Ordonnee := Round(  - courbes[i].voie1[ round( (Curseur_Abscisse * Longueur_Acquisition / Sender.Width)*courbes[i].freq_ech/Freq_ech_actuelle ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
             Sender.Canvas.LineTo(round(Curseur_Abscisse), Curseur_Ordonnee );
             end;
         end;

         if (courbes[i].mode = ch2 ) or  (courbes[i].mode = chop ) then
         begin

          Sender.Canvas.Pen.Color :=courbes[i].couleur2;
          Sender.Canvas.MoveTo(0, Round(  courbes[i].voie2[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) )   );

             for Curseur_Abscisse := 1 to min(Sender.Width - 1,round((Sender.Width-1)*Freq_ech_actuelle/courbes[i].freq_ech)) do
             begin
             Curseur_Ordonnee := Round(  - courbes[i].voie2[ round( (Curseur_Abscisse * Longueur_Acquisition / Sender.Width)*courbes[i].freq_ech/Freq_ech_actuelle ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
             Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee  );
             end;
         end;
       end;

      end;
end;


procedure TOscilloCaba.Affichage_voiesXY(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    x,y,t,i:integer;
begin

Longueur_Acquisition := GetRecordLength();
GetSensitivity( lCh1, @Calibre1);
GetSensitivity( lCh2, @Calibre2);

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

// Affichage Voie XY

    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo( round((invech1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(invech2)*Ch2DoubleArray[ 1 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2)) );


          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin

          Curseur_abscisse := Round(  (invech1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );

          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
// affichage des enregistrements

if nb_courbes_stockees <> 0 then
   begin
        
        for i :=1 to nb_courbes_stockees do
            begin
                 if (courbes[i].visible=true) then
                 begin
                 Sender.Canvas.Pen.Color := courbes[i].couleur1;
                 Sender.Canvas.MoveTo( round({(invech1)*}courbes[i].voie1[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-{(invech2)*}courbes[i].voie2[ 1 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2)) );


                 for positiontableau := 0 to Longueur_Acquisition-1 do
                 begin

                      Curseur_abscisse := Round(  {(invech1)*}courbes[i].voie1[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
                      Curseur_Ordonnee := Round(  -{(invech2)*}courbes[i].voie2[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );

                      Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
                 end;
                 end;

            end;

   end;
end;


procedure affichageEnregistrements(Sender: Tpaintbox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    x,y,t:integer ;
begin

Longueur_Acquisition := courbes [num_de_courbe].long_ech;
Calibre1             := courbes [num_de_courbe].calibCh1_ech;
Calibre2             := courbes [num_de_courbe].calibCh2_ech;

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
    if (courbes [num_de_courbe].mode=ch1) or (courbes [num_de_courbe].mode=chop) then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur1;
    Sender.Canvas.MoveTo(0, Round(  {(invech1)*}courbes [num_de_courbe].voie1[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech1)*}courbes [num_de_courbe].voie1[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;


    end;

// Affichage Voie 2
     if (courbes [num_de_courbe].mode=ch2) or (courbes [num_de_courbe].mode=chop)then
    begin
    Sender.Canvas.Pen.Color := courbes [num_de_courbe].couleur2;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [num_de_courbe].voie2[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin



          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [num_de_courbe].voie2[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;

    end;
end;



procedure TOscilloCaba.Affichage_voie_CH1(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
begin

Longueur_Acquisition := GetRecordLength();
GetSensitivity( lCh1, @Calibre1);
GetSensitivity( lCh2, @Calibre2);

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

    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(0, Round(  -(invech1)*Ch1DoubleArray[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));

      try
          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
      except
      end;

end;


 procedure TOscilloCaba.Affichage_voie_CH2(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
     x,y,t:integer;
begin

Longueur_Acquisition := GetRecordLength();
GetSensitivity( lCh1, @Calibre1);
GetSensitivity( lCh2, @Calibre2);

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


// Affichage Voie 2

    Sender.Canvas.Pen.Color := clAqua;
    Sender.Canvas.MoveTo(0, Round(  -(invech2)*Ch2DoubleArray[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));

      try
          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
      except
      end;
end;



procedure TOscilloCaba.Affichage_Zoom(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    x,y,t,tt:integer;
   // Vmin,Vmax:double;
    //Longueur_Acquisition : dword;
    ColoArray : array[1..9] of integer;
    LignesArray : array[1..7] of integer;
begin

//Longueur_Acquisition := GetRecordLength();
GetSensitivity( lCh1, @Calibre1);
GetSensitivity( lCh2, @Calibre2);

// effaçage
    Sender.Canvas.Brush.Color := clBlack;
    Sender.Canvas.Rectangle(0, 0, Sender.Width -1, Sender.Height -1);

// traçé grille
    Sender.Canvas.Pen.Color := clSilver;

if modech1=1 then
begin


// ligne de 0 (ch1 :  sur la base des valeur de ch1)
if 0>V11 then
   begin
   if 0<V21 then
         begin
         Sender.Canvas.Pen.Color := clWhite;
         Curseur_Ordonnee :=  round((Sender.Height / (V21-V11))*(V21))  ;
         Sender.Canvas.MoveTo(0,Curseur_Ordonnee  );
         for t:=0 to 9 do
             begin
                  for tt:=1 to 4 do
                      begin
                           Sender.Canvas.LineTo( t*round(Sender.Width/9)+tt*round(Sender.Width/45) , Curseur_Ordonnee);
                           Sender.Canvas.MoveTo(t*round(Sender.Width/9)+tt*round(Sender.Width/45),Curseur_Ordonnee +2  );
                           Sender.Canvas.LineTo( t*round(Sender.Width/9)+tt*round(Sender.Width/45) , Curseur_Ordonnee -2);
                           Sender.Canvas.MoveTo(t*round(Sender.Width/9)+tt*round(Sender.Width/45),Curseur_Ordonnee  );
                           Sender.Canvas.LineTo( t*round(Sender.Width/9)+tt*round(Sender.Width/45) , Curseur_Ordonnee);
                      end;
                  Sender.Canvas.MoveTo(t*round(Sender.Width/9),Curseur_Ordonnee +4  );
                  Sender.Canvas.LineTo( t*round(Sender.Width/9) , Curseur_Ordonnee -4);
                  Sender.Canvas.MoveTo(t*round(Sender.Width/9),Curseur_Ordonnee  );
             end;
         end;
   end;

//essais cabalab 1_26 de "sous" grille de l'écren principale en zoom.... sur la base de ch1






// traçé grille
{
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
}










// Affichage Voie 1

          for Curseur_Abscisse := 1 to Sender.Width - 1 do

          begin
               if (invech1)*Ch1DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] <= V11  then
                 begin
                      Curseur_ordonnee := sender.height ;
                      Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);
                 end
                 else
                     begin
                          if (invech1)*Ch1DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] >= V21  then
                            begin
                                 Curseur_ordonnee := 0 ;
                                 Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);
                            end
                          else
                            begin
                                 if Curseur_Abscisse = 1 then
                                    begin
                                         Sender.Canvas.Pen.Color := clLime;
                                         Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] * (Sender.Height / (V21-V11))) +  round((Sender.Height / (V21-V11))*(V21))  ;
                                         Sender.Canvas.MoveTo(0,Curseur_Ordonnee );
                                    end;
                                 Sender.Canvas.Pen.Color := clLime;
                                 Curseur_Ordonnee := Round(  -(invech1)*Ch1DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] * (Sender.Height / (V21-V11))) +  round((Sender.Height / (V21-V11))*(V21))  ;
                                 Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);

                                 if Curseur_Abscisse = Sender.Width - 1 then  Sender.Canvas.moveTo(0,0);

                            end;
                     end;
          end;

end;

if modech2=1 then
begin
// ligne de 0 (ch2)
if 0>V12 then
   begin
   if 0<V22 then
         begin
         Sender.Canvas.Pen.Color := clWhite;
         Curseur_Ordonnee :=  round((Sender.Height / (V21-V11))*(V21))  ;
         Sender.Canvas.MoveTo(0,Curseur_Ordonnee  );
         Sender.Canvas.LineTo(Sender.Width , Curseur_Ordonnee);

         end;
   end;



// Affichage Voie 2



          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
               

               if (invech2)*Ch2DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] <= V12  then
                 begin
                      Curseur_ordonnee := sender.height ;
                      Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);
                 end
                 else
                     begin
                          if (invech2)*Ch2DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] >= V22  then
                            begin
                                 Curseur_ordonnee := 0 ;
                                 Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);
                            end
                          else
                            begin
                                 if Curseur_Abscisse = 1 then
                                    begin
                                         Sender.Canvas.Pen.Color := clLime;
                                         Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] * (Sender.Height / (V22-V12))) +  round((Sender.Height / (V22-V12))*(V22))  ;
                                         Sender.Canvas.MoveTo(0,Curseur_Ordonnee );
                                    end;
                                 Sender.Canvas.Pen.Color := clAqua;
                                 Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[ trunc(T1) + round( Curseur_Abscisse * Abs(T2-T1) / Sender.Width ) ] * (Sender.Height / (V22-V12))) +  round((Sender.Height / (V22-V12))*(V22))  ;
                                 Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
                                 if Curseur_Abscisse = Sender.Width - 1 then  Sender.Canvas.moveTo(0,0);
                            end;
                     end;
          end;

end;

end;

/////////////////////////////////////////////////////////////////////////////////
/////////               FIN DES                                         ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////              PROCEDURES D'AFFICHAGE                           ///////// ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////




 procedure TOscilloCaba.RadioButton3Click(Sender: TObject);
begin
    modech1:=1;
    modech2:=1;
    modeXY:=0;
    if RadioButton3.Checked=true then
     begin
     ButtonCH1Enreg.Visible:=true;
     ButtonCH2Enreg.Visible:=true;
     ButtonDUALEnreg.Visible:=true;
     end;
end;

procedure TOscilloCaba.RadioButton1Click(Sender: TObject);
begin
    modech1:=1;
    modech2:=0;
    modeXY:=0;
    if RadioButton1.Checked=true then
     begin
     ButtonCH1Enreg.Visible:=true;
     ButtonCH2Enreg.Visible:=false;
     ButtonDUALEnreg.Visible:=false;
     end;
end;

procedure TOscilloCaba.RadioButton2Click(Sender: TObject);
begin
    modech1:=0;
    modech2:=1;
    modeXY:=0;
     if RadioButton2.Checked=true then
     begin
     ButtonCH1Enreg.Visible:=false;
     ButtonCH2Enreg.Visible:=true;
     ButtonDUALEnreg.Visible:=false;
     end;
end;

procedure TOscilloCaba.XYbuttonClick(Sender: TObject);
begin
     simpleClick(sender);       //1_21FM  correctif   bug BI ecran vers XY : bug irréversible de l'affichage

     modeXY:=1;
     if XYbutton.Checked=true then
     begin
     ButtonCH1Enreg.Visible:=false;
     ButtonCH2Enreg.Visible:=false;
     ButtonDUALEnreg.Visible:=true;
     end;
end;
procedure TOscilloCaba.ADDButtonClick(Sender: TObject);
begin
     if ADDButton.Checked=true then
     begin
     ButtonCH1Enreg.Visible:=false;
     ButtonCH2Enreg.Visible:=false;
     ButtonDUALEnreg.Visible:=true;
     end;
end;







/////////////////////////////////////////////////////////////////////////////////
/////////               TIMER                                           ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////                                                              /////////  ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////


procedure TOscilloCaba.Timer1Timer(Sender: TObject);
var calibre1,calibre2 : double;
    freq,Long:dword;
    i,t{,ii,iii}:integer;
    vi,vii,vdc,vacdc,vac:double;
    vdc1,vacdc1,vac1:double;
    vdc2,vacdc2,vac2:double;
    //Ti1:array [0..2] of integer;
    //Ti2:array [0..2] of integer;
    Ch1meanarray:array[0..10000] of double;
    Ch2meanarray:array[0..10000] of double;
    j,k:integer;
    moy:double;
    inf,sup,ok:byte;
    infc,supc:integer;
    imax:integer;
    //DigitInfPeriodeCH1 :byte;
    //DigitInfPeriodeCH2 :byte;
    Amin1,Amin2,Amax1,Amax2:double;
    temp1,temp2:byte;
     sign1,sign2 : shortint;
     timeout:dword;
     Aff:boolean;
     rien:boolean;
begin



if (timer1.enabled) and (@timer1.OnTimer <> nil) then
  begin
    if bAllowMeasuring then
    begin
      Timer1.enabled    := False;
      //bInTimerProcedure := TRUE;
      if StartMeasurement = E_NO_ERRORS then
      begin
        //ecran de taille variable selon la taille de la fenetre principale
        ecran.clientWidth:=OscilloCaba.Width-410 ;      //zone client cad fenetre moins les bords!!!!!
        ecran.clientHeight:=OscilloCaba.Height-87 ;     //cad que c a revoir!!!!
        {EcranCH1.width:=OscilloCaba.Width-400 ;
        EcranCH1.height:=round(OscilloCaba.height/2-50) ;
        EcranCH2.width:=OscilloCaba.Width-500 ;
        EcranCH2.top:=round(EcranCH1.height+EcranCH1.top+20) ;
        EcranCH2.height:=round(OscilloCaba.height/2-50);  }






        Acquisition;     //lance une auquisition cf procédure corespondante

        //timeout:=Gettriggertimeout();
          {pour affichage developement de la base de temps}
        //label9.Caption:=floattostr(timeout);

        //affichage dans la base de temps libre des valeurs reélles utilisée en ce moment
        freq:=getSampleFrequency();
        Long:=getrecordlength();
        freqR.text:= floattostrF(freq,ffnumber,18,0);
        longER.text:= floattostrF(long,ffnumber,18,0);

 try
        if FonctionsMathmathiques1.checked=true then
           begin
                CALCULS(sender);
           end;

        DetectionCrete( true,false,false,Amax1,Amax2,Amin1,Amin2 );


        if (Mutimetre1.checked=true) or (frquencemtre1.checked=true) {or (levelintereval=1)}then
           begin

                MultiMetre(1, Amax1, Amin1,aff,ti1[0],ti1[2],Fch1,Tch1,VDC1,VAC1,VACDC1 );
                
                 ///gestion interface selon les modes ch1 ch2 dual
                if  (RadioButton2.Checked=true)and(frquencemtre1.checked=true)then
                  begin
                   // GroupBoxVch1Mesures.visible:=false;
                    LabelTch1.visible:=false;
                    LabelFch1.visible:=false;
                  end;

                if ((RadioButton1.Checked=true)or(RadioButton3.Checked=true)) and(frquencemtre1.checked=true) then
                begin
               // GroupBoxVch1Mesures.visible:=true;
                LabelTch1.visible:=true;
                LabelFch1.visible:=true;
                end;

                if  (RadioButton2.Checked=true)and(Mutimetre1.checked=true)then
                  begin
                    GroupBoxVch1Mesures.visible:=false;

                  end;

                if ((RadioButton1.Checked=true)or(RadioButton3.Checked=true)) and(Mutimetre1.checked=true) then
                begin
                GroupBoxVch1Mesures.visible:=true;

                end;

                if Aff=true then
                    begin
                          if LabelTch1.visible=true then
                          begin
                          LabelTch1.caption:='T1 = '+floattostrf(Tch1,ffgeneral,4,3)+'s';       //var globale pour l'affichage a modifier
                          LabelFch1.caption:='F1 = '+floattostrf(Fch1,ffNumber,7,0)+'Hz';
                          end;
                          if  GroupBoxVch1Mesures.visible=true then
                          begin
                          labelVch1Max.caption:='U1max = ' +floattostrf(Amax1,ffFixed,4,3)+' V';
                          labelVch1Min.caption:='U1min = ' +floattostrf(Amin1,ffFixed,4,3)+' V';
                          labelVch1DC.caption:=  'U1 DC  = ' +floattostrf(vdc1,ffFixed,4,3)+' V';
                          labelVch1AC.caption:=  'U1 AC  = ' +floattostrf(vac1,ffFixed,4,3)+' V';
                          labelVch1ACDC.caption:='U1        = ' +floattostrf(vacdc1,ffFixed,4,3)+' V' + #9'AC+DC';
                          end;
                    end
                 else
                    begin
                          if LabelTch1.visible=true then
                          begin
                          LabelTch1.caption:='T1 = ';
                          LabelFch1.caption:='F1 = ';
                          end;
                          if  GroupBoxVch1Mesures.visible=true then
                          begin
                          labelVch1Max.caption:='U1max = ' +floattostrf(Amax1,ffFixed,4,3)+' V';
                          labelVch1Min.caption:='U1min = ' +floattostrf(Amin1,ffFixed,4,3)+' V';
                          labelVch1DC.caption:=  'U1 DC   ';
                          labelVch1AC.caption:=  'U1 AC   ' ;
                          labelVch1ACDC.caption:='U1        ';
                          end;
                    end;

                MultiMetre(2 , Amax2, Amin2,Aff,ti2[0],ti2[2],Fch2,Tch2,VDC2,VAC2,VACDC2 );

                if  (RadioButton1.Checked=true)and(frquencemtre1.checked=true) then
                  begin
                  //  GroupBoxVch2Mesures.visible:=false;
                    LabelTch2.visible:=false;
                    LabelFch2.visible:=false;
                  end;


                    if ((RadioButton2.Checked=true)or(RadioButton3.Checked=true))and(frquencemtre1.checked=true) then
                      begin
                  //    GroupBoxVch2Mesures.visible:=true;
                      LabelTch2.visible:=true;
                      LabelFch2.visible:=true;
                      end;

                if  (RadioButton1.Checked=true)and(Mutimetre1.checked=true) then
                  begin
                    GroupBoxVch2Mesures.visible:=false;

                  end;


                    if ((RadioButton2.Checked=true)or(RadioButton3.Checked=true))and(Mutimetre1.checked=true) then
                      begin
                      GroupBoxVch2Mesures.visible:=true;

                      end;

                if aff=true then
                    begin
                          if (LabelTch2.visible=true) then
                          begin
                          LabelTch2.caption:='T2 = '+floattostrf(Tch2,ffgeneral,4,3)+'s';
                          LabelFch2.caption:='F2 = '+floattostrf(Fch2,ffNumber,7,0)+'Hz';
                          end;
                          if  GroupBoxVch2Mesures.visible=true then
                          begin
                          labelVch2Max.caption:='U2max = ' +floattostrf(Amax2,ffFixed,4,3)+' V';
                          labelVch2Min.caption:='U2min = ' +floattostrf(Amin2,ffFixed,4,3)+' V';
                          labelVch2DC.caption:=  'U2 DC  = ' +floattostrf(vdc2,ffFixed,4,3)+' V';
                          labelVch2AC.caption:=  'U2 AC  = ' +floattostrf(vac2,ffFixed,4,3)+' V';
                          labelVch2ACDC.caption:='U2        = ' +floattostrf(vacdc2,ffFixed,4,3)+' V' + #9'AC+DC';
                          end;
                    end
                 else
                    begin
                          if (LabelTch2.visible=true) then
                          begin
                          LabelTch2.caption:='T2 = ';
                          LabelFch2.caption:='F2 = ';
                          end;
                          if  GroupBoxVch2Mesures.visible=true then
                          begin
                          labelVch2Max.caption:='U2max = ' +floattostrf(Amax2,ffFixed,4,3)+' V';
                          labelVch2Min.caption:='U2min = ' +floattostrf(Amin2,ffFixed,4,3)+' V';
                          labelVch2DC.caption:=  'U2 DC   ';
                          labelVch2AC.caption:=  'U2 AC   ' ;
                          labelVch2ACDC.caption:='U2        ';
                          end;
                    end;

            end;    //du multimétre et/ou fréq.














        if zoom1.checked=true then
        begin
           Affichage_voies(EcranControle);




            //  rectangle sourie ROUGE dans le zoom
          if positionboutton=1 then
           begin
             ecrancontrole.canvas.pen.color:=clRed;
             ecrancontrole.canvas.moveto(  startX , StartY  );
             ecrancontrole.canvas.lineto(  instantX , StartY  );
             ecrancontrole.canvas.lineto(  instantX , instantY  );
             ecrancontrole.canvas.lineto(   StartX , instantY );
             ecrancontrole.canvas.lineto(  StartX , StartY  );
           end;

           //Affichage_Zoom: teste permanent de la taille du zoom
           GetSensitivity( lCh1, @Calibre1);
           V11 := ((1000-Scrollbar4.position) * 2*Calibre1 / 1000)- calibre1;
           V21 := ((1000-Scrollbar3.position) * 2*Calibre1 / 1000) - calibre1;
           GetSensitivity( lCh2, @Calibre2);
           V12 := ((1000-Scrollbar4.position) * 2*Calibre2 / 1000) - calibre2;
           V22 := ((1000-Scrollbar3.position) * 2*Calibre2 / 1000) - calibre2;
           T1 := ScrollBar1.position *  Abs(GetRecordLength()) / 1000;
           T2 := ScrollBar2.position *  Abs(GetRecordLength()) / 1000;
          //  if modeXY=1 then  Affichage_voiesXY(ecran); else
           Affichage_Zoom(ecran);




           //essai correction du bug affichage de rectangle JAUNE dans zoom

ecrancontrole.Canvas.Pen.Color := clYellow;
ecrancontrole.Canvas.MoveTo(round(T1*(ecrancontrole.Width/Long)), round(Abs(ecrancontrole.Height-((V11*(ecrancontrole.Height/2))/(calibre1)+ecrancontrole.Height/2))));
ecrancontrole.Canvas.LineTo(round(T2*(ecrancontrole.Width/Long)), round(Abs(ecrancontrole.Height-((V11*(ecrancontrole.Height/2))/(calibre1)+ecrancontrole.Height/2))));
ecrancontrole.Canvas.LineTo(round(T2*(ecrancontrole.Width/Long)), round(Abs(ecrancontrole.Height-((V21*(ecrancontrole.Height/2))/(calibre1)+ecrancontrole.Height/2))));
ecrancontrole.Canvas.LineTo(round(T1*(ecrancontrole.Width/Long)), round(Abs(ecrancontrole.Height-((V21*(ecrancontrole.Height/2))/(calibre1)+ecrancontrole.Height/2))));
ecrancontrole.Canvas.LineTo(round(T1*(ecrancontrole.Width/Long)), round(Abs(ecrancontrole.Height-((V11*(ecrancontrole.Height/2))/(calibre1)+ecrancontrole.Height/2))));
           //fin de l'essai de corection...





           
           // if multi=1 then Affichage_voies(paintbox1);
          { if multi=1 then
                  begin
                       T1:=0;
                       if ti1[2]>=ti2[2] then T2:=Ti1[2] else T2:=Ti2[2];
                       if Amax1>=Amax2   then V21:=Amax1 else V21:=Amax2;
                       V22:=V21;
                       if Amin1<=Amin2   then V11:=Amin1 else V11:=Amin2;
                       V12:=V11;
                       Affichage_Zoom(paintbox1);
                  end; }
         end;

        if biecran1.checked=true then
            begin
                ecran.Visible:=false;
                temp1:=modech1;
                temp2:=modech2;
                modech1:=1;
                modech2:=0;
                Affichage_voies(EcranCH1);
                modech1:=0;
                modech2:=1;
                Affichage_voies(EcranCH2);
                modech1:=temp1  ;
                modech2:=temp2   ;
                if  trigCH1.tabstop=true   then
                begin
                ScrollBar6.top:=0;
                ScrollBar6.height:=ecranCH1.height+30 ;
                end;
                if  trigCH2.tabstop=true   then
                begin
                ScrollBar6.top:=ecranCH2.top-15;
                ScrollBar6.height:=ecranCH2.height+30 ;
                end;



            end;

        if simple.checked=true then
           begin

            {
               GetSensitivity( lCh1, @Calibre1);
               V11 := ((1000-Scrollbar4.position) * 2*Calibre1 / 1000)- calibre1;
               V21 := ((1000-Scrollbar3.position) * 2*Calibre1 / 1000) - calibre1;
               GetSensitivity( lCh2, @Calibre2);
               V12 := ((1000-Scrollbar4.position) * 2*Calibre2 / 1000) - calibre2;
               V22 := ((1000-Scrollbar3.position) * 2*Calibre2 / 1000) - calibre2;
               T1 := ScrollBar1.position *  Abs(GetRecordLength()) / 1000;
               T2 := ScrollBar2.position *  Abs(GetRecordLength()) / 1000;
             }
               EcranCH2.Visible:=false;
               EcranCH1.Visible:=false;
               ecran.Visible:=true;
               ScrollBar6.top:=0;
               ScrollBar6.height:=ecran.height+32;
             //  Affichage_voies(Ecran);

               
               if (modeXY=0) then Affichage_voies(Ecran);

             {  if (modeXY=1) and (XYetTemporel1.checked=false) then
               begin
               Affichage_voiesXY(ecran);
               EcranXY.Visible:=false;
               end
               else
               begin
               Affichage_voies(Ecran);
               EcranXY.Visible:=false;
               end;

               if (modeXY=1) and (XYetTemporel1.checked=true) then
               begin
               Affichage_voiesXY(EcranXY);
               Affichage_voies(Ecran);
               end;
             }
            end;


   {     if  (XYbutton.checked=false)and (XYetTemporel1.checked=true) then
          begin
              EcranXY.Visible:=false;
              EcranXY.Canvas.Brush.Color := clBtnFace;
              EcranXY.Canvas.Rectangle(-1, -1, EcranXY.Width +1, EcranXY.Height +1);
          end;
    }
            //(xyradiobuton )
        if  (XYbutton.checked=true) and (XYetTemporel1.checked=false)then
          begin
               Affichage_voiesXY(ecran);
               //EcranXY.Visible:=false;

          end;

        if {(XYbutton.checked=true) and }(XYetTemporel1.checked=true) then
          begin
               Affichage_voiesXY(EcranXY);
               Affichage_voies(Ecran);
          end;

             {  if multi=1 then
                  begin
                       T1:=0;
                       if ti1[2]>=ti2[2] then T2:=Ti1[2] else T2:=Ti2[2];
                       if Amax1>=Amax2   then V21:=Amax1 else V21:=Amax2;
                       V22:=V21;
                       if Amin1<=Amin2   then V11:=Amin1 else V11:=Amin2;
                       V12:=V11;
                       Affichage_Zoom(paintbox1);
                       //Affichage_voies(paintbox1);
                  end;  }


      except end;//pour voir!!!
      end; { if }
      Timer1.enabled := True;
      //bInTimerProcedure := FALSE;
    end; { if }
  end; { if }
end;



/////////////////////////////////////////////////////////////////////////////////
/////////             FIN               TIMER                           ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////                                                              /////////  ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

//mose ONE SHOT :

/////////////////////////////////////////////////////////////////////////////////
/////////             MODE  ONE   SHOT                                  ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////                                                               ///////// ////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
procedure TOscilloCaba.ONESHOT1Click(Sender: TObject);
begin
     GroupShot.Visible:=true;
     ONESHOT1.Checked:=true;     ///1_34

     if  (Mutimetre1.Checked=true) then  Mutimetre1Click(sender);
     if  (frquencemtre1.Checked=true) then  frquencemtre1Click(sender);

     Timer1.enabled   :=False;

end;

procedure TOscilloCaba.StopShotClick(Sender: TObject);
var
L:dword;
begin
   ONESHOT1.Checked:=false;  ///1_34

     L:=getRecordlength();
     setpostsamples(L);
     GroupShot.Visible:=false;
     //Timer1.enabled   :=true;
     {notrig}
     SetTriggerSource ( 5 ) ;
     NOTrigButton.checked:=true;
    levelintereval:=0;
    ScrollBar6.visible:=false;
    setTriggerTimeOUT(1);
    StartMeasurement();
    Timer1.enabled   :=true;
end;

procedure TOscilloCaba.ButtonShotClick(Sender: TObject);
var Erreur    :  word;
L:dword;
begin
    //setTriggerTimeOUT(10000);

    if NOTrigButton.Checked=true then
    begin
    showmessage('Le trigger est dans le mode "AUCUN", choisir une source de déclenchement, vérifier le niveau de déclenchement puis lancer une acquisition MONO COUP');
    end
    else
    begin

    setTriggerTimeOUT(1);
    StartMeasurement();
    L:=getRecordlength();
    setpostsamples(round(L-L*Scrollbar7.Position/100));
    setpostsamples(round(L-L*Scrollbar7.Position/100));
     setTriggerTimeOUT(10000);

    ButtonShot.Caption:='TRIGGER ?';
    erreur := StartMeasurement();    // Lance l'acquisition
    if erreur <> E_NO_ERRORS then
    ShowMessage('Appareil non initialisé');
    erreur := GetMeasurement( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.
    if erreur <> E_NO_ERRORS then
    ShowMessage('Problème De Getmeasurement');
    Affichage_voies(Ecran);
     ButtonShot.Caption:='Lancement';
    end;
end;

procedure TOscilloCaba.ScrollBar7Change(Sender: TObject);
begin
    label8.Caption:='Pré Trig : '+ floattostr( Scrollbar7.Position)+'%';
end;

//////////////////////////////////   ////////////////////////////////////////////////////////////////////
//FIN des réglages ONE SHOT /////// //////////////////////////////////////////////////////////////////// //////////////////////////////////////////////////
/////////////////////////////////// ////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////
//gestion de la base de temps v3.0 code compacte  ///////// ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////  ////////////////////////////////////////////////////////////////////


procedure TOscilloCaba.BDTClick(Sender: TObject);
begin
    if calibre1mics.Checked=true  then begin REGOSC.frequenceHS3:=50000000; REGOSC.LongEnrgHS3:=500;   REGOSC.TimeOUTHS3:=1;   ScrollBar5.position:=1; end;
    if calibre2mics.Checked=true  then begin REGOSC.frequenceHS3:=50000000; REGOSC.LongEnrgHS3:=1000;  REGOSC.TimeOUTHS3:=1;   ScrollBar5.position:=2; end;
    if calibre5mics.Checked=true  then begin REGOSC.frequenceHS3:=50000000; REGOSC.LongEnrgHS3:=2500;  REGOSC.TimeOUTHS3:=1;   ScrollBar5.position:=3; end;
    if calibre10mics.Checked=true then begin REGOSC.frequenceHS3:=50000000; REGOSC.LongEnrgHS3:=5000;  REGOSC.TimeOUTHS3:=5;   ScrollBar5.position:=4; end;
    if calibre20mics.Checked=true then begin REGOSC.frequenceHS3:=50000000; REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=5;   ScrollBar5.position:=5; end;
    if calibre50mics.Checked=true then begin REGOSC.frequenceHS3:=10000000; REGOSC.LongEnrgHS3:=5000;  REGOSC.TimeOUTHS3:=5;   ScrollBar5.position:=6; end;
    if calibre01ms.Checked=true   then begin REGOSC.frequenceHS3:=10000000; REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=10;  ScrollBar5.position:=7; end;
    if calibre02ms.Checked=true   then begin REGOSC.frequenceHS3:=5000000;  REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=10;  ScrollBar5.position:=8; end;
    if calibre05ms.Checked=true   then begin REGOSC.frequenceHS3:=2000000;  REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=10;  ScrollBar5.position:=9; end;
    if calibre1ms.Checked=true    then begin REGOSC.frequenceHS3:=1000000;  REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=15; ScrollBar5.position:=10;end;
    if calibre2ms.Checked=true    then begin REGOSC.frequenceHS3:=500000;   REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=30; ScrollBar5.position:=11;end;
    if calibre5ms.Checked=true    then begin REGOSC.frequenceHS3:=200000;   REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=75; ScrollBar5.position:=12;end;
    if calibre10ms.Checked=true   then begin REGOSC.frequenceHS3:=100000;   REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=150; ScrollBar5.position:=13;end;
    if calibre20ms.Checked=true   then begin REGOSC.frequenceHS3:=50000;    REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=250; ScrollBar5.position:=14;end;
    if calibre50ms.Checked=true   then begin REGOSC.frequenceHS3:=10000;    REGOSC.LongEnrgHS3:=10000; REGOSC.TimeOUTHS3:=500; ScrollBar5.position:=15;end;

    setTriggerTimeOUT(REGOSC.TimeOUTHS3);
    SetMeasureMode ( 3 ) ; //Mesure sur les 2 voies
    SetRecordLength ( REGOSC.LongEnrgHS3 ) ;  // enregistrer sur 1024 échantillons
    SetPostSamples ( REGOSC.LongEnrgHS3 ) ;
    SetRecordLength ( REGOSC.LongEnrgHS3 ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
    SetSampleFrequency (@REGOSC.frequenceHS3) ;

end;


procedure TOscilloCaba.ScrollBar5Change(Sender: TObject);
begin
    if ScrollBar5.position=1 then calibre1mics.Checked:=true;
    if ScrollBar5.position=2 then calibre2mics.Checked:=true;
    if ScrollBar5.position=3 then calibre5mics.Checked:=true;
    if ScrollBar5.position=4 then calibre10mics.Checked:=true;
    if ScrollBar5.position=5 then calibre20mics.Checked:=true;
    if ScrollBar5.position=6 then calibre50mics.Checked:=true;
    if ScrollBar5.position=7 then calibre01ms.Checked:=true;
    if ScrollBar5.position=8 then calibre02ms.Checked:=true;
    if ScrollBar5.position=9 then calibre05ms.Checked:=true;
    if ScrollBar5.position=10 then calibre1ms.Checked:=true;
    if ScrollBar5.position=11 then calibre2ms.Checked:=true;
    if ScrollBar5.position=12 then calibre5ms.Checked:=true;
    if ScrollBar5.position=13 then calibre10ms.Checked:=true;
    if ScrollBar5.position=14 then calibre20ms.Checked:=true;
    if ScrollBar5.position=15 then calibre50ms.Checked:=true;
    RadioButton_FctCH1_Click(sender); //modif des calibre pour l'intégrale
end;



//base temps perso

procedure TOscilloCaba.BoxFreqEch1Change(Sender: TObject);
var freqR:dword;
begin
    if BoxFreqEch.itemindex=0 then  freqEch:= 50000000 ;
    if BoxFreqEch.itemindex=1 then  freqEch:= 25000000 ;
    if BoxFreqEch.itemindex=2 then  freqEch:= 10000000 ;
    if BoxFreqEch.itemindex=3 then  freqEch:=  5000000 ;
    if BoxFreqEch.itemindex=4 then  freqEch:=  2000000 ;
    if BoxFreqEch.itemindex=5 then  freqEch:=  1000000 ;
    if BoxFreqEch.itemindex=6 then  freqEch:=   500000 ;
    if BoxFreqEch.itemindex=7 then  freqEch:=   200000 ;
    if BoxFreqEch.itemindex=8 then  freqEch:=   100000 ;
    if BoxFreqEch.itemindex=9 then  freqEch:=    50000 ;
    if BoxFreqEch.itemindex=10 then  freqEch:=   20000 ;
    if BoxFreqEch.itemindex=11 then  freqEch:=   10000 ;
    if BoxFreqEch.itemindex=12 then  freqEch:=    5000 ;
    if BoxFreqEch.itemindex=13 then  freqEch:=    2000 ;
    if BoxFreqEch.itemindex=14 then  freqEch:=    1000 ;
    if BoxFreqEch.itemindex=15 then  freqEch:=     500 ;
    if BoxFreqEch.itemindex=16 then  freqEch:=     200 ;
    if BoxFreqEch.itemindex=17 then  freqEch:=     100 ;
    if BoxFreqEch.itemindex=18 then  freqEch:=      50 ;
    SetSampleFrequency (@freqEch) ;
    freqR:=getSampleFrequency();
    showmessage('f = '+ floattostr(freqR));
end;



procedure TOscilloCaba.BoxLongAcq1Change(Sender: TObject);
begin
    if BoxLongAcq.itemindex=0 then  NBEch:= 130972 ;
    if BoxLongAcq.itemindex=1 then  NBEch:=  65536 ;
    if BoxLongAcq.itemindex=2 then  NBEch:=  16384 ;
    if BoxLongAcq.itemindex=3 then  NBEch:=  15000 ;
    if BoxLongAcq.itemindex=4 then  NBEch:=  10000 ;
    if BoxLongAcq.itemindex=5 then  NBEch:=   5000 ;
    if BoxLongAcq.itemindex=6 then  NBEch:=   2500 ;
    if BoxLongAcq.itemindex=7 then  NBEch:=   1000 ;
    if BoxLongAcq.itemindex=8 then  NBEch:=    500 ;
    if BoxLongAcq.itemindex=9 then  NBEch:=    250 ;
    if BoxLongAcq.itemindex=10then  NBEch:=    100 ;
    if BoxLongAcq.itemindex=11 then FormEchantillons.visible:=true  ;



    SetMeasureMode ( 3 ) ; //Mesure sur les 2 voies
    SetRecordLength ( NBEch ) ;  // enregistrer sur NBech échantillons
    SetPostSamples ( NBEch ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
    SetRecordLength ( NBEch ) ;  // enregistrer sur 2* sinon marche pas ! échantillons
end;




procedure TOscilloCaba.DcalibBDTClick(Sender: TObject);       //gestion interface décalibrage de la base de temps
begin
    if DcalibBDT.Checked=false then
    begin
    if GroupBoxZOOM.Visible then  simpleClick(sender);
    if Boitedenregistrements1.Checked=true then Boitedenregistrements1Click(sender);
    DcalibBDT.Checked:=true;
    GroupBox10.Height:=121;
    ScrollBarDcalibBDT.Visible:=true;

    TimerDecalibrageBDT.Enabled:=true;        //1_21 FM
   // LabelWARNING.Visible:=true;


    end
    else
    begin
    DcalibBDT.Checked:=false;
    GroupBox10.Height:=97;
    ScrollBarDcalibBDT.Visible:=false;
    ScrollBarDcalibBDT.position:=1000;

    TimerDecalibrageBDT.Enabled:=false;     //1_21 FM
    if LabelWARNING.Visible=true then LabelWARNING.Visible:=false; //1_28FM
    //LabelWARNING.Visible:=false;


    end

end;

procedure TOscilloCaba.ScrollBarDcalibBDTChange(Sender: TObject);    //décalibrage BDT
begin
   DBDT:=ScrollBarDcalibBDT.position;
end;
/////////////////////////////////////////////////////////// //////////   ////////////////////////////////////////////////////////////////////
//    FIN     gestion de la base de temps v3.0 code compacte  /////////   ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////  ////////////   ////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////       ////////////////////////////////////////////////////////////////////
//gestion de la SENSIBILITEE DES VOIX              /////////       ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////          ////////////////////////////////////////////////////////////////////


procedure TOscilloCaba.CALIBREClick(Sender: TObject);
begin
  if CALIBCH1_80V.Checked=true   then  begin REGOSC.calibreCH1:=80; Calibrech1scrollbar.position:=1; end;        //1_23 FM
  if CALIBCH1_40V.Checked=true   then  begin REGOSC.calibreCH1:=40; Calibrech1scrollbar.position:=2; end;        //1_21 FM
  if CALIBCH1_20V.Checked=true   then  begin REGOSC.calibreCH1:=20; Calibrech1scrollbar.position:=3; end;
  if CALIBCH1_8V.Checked=true    then  begin REGOSC.calibreCH1:=8;  Calibrech1scrollbar.position:=4; end;
  if CALIBCH1_4V.Checked=true    then  begin REGOSC.calibreCH1:=4;  Calibrech1scrollbar.position:=5; end;
  if CALIBCH1_2V.Checked=true    then  begin REGOSC.calibreCH1:=2;  Calibrech1scrollbar.position:=6; end;
  if CALIBCH1_08V.Checked=true   then  begin REGOSC.calibreCH1:=0.8;Calibrech1scrollbar.position:=7; end;
  if CALIBCH1_04V.Checked=true   then  begin REGOSC.calibreCH1:=0.4;Calibrech1scrollbar.position:=8; end;
  if CALIBCH1_02V.Checked=true   then  begin REGOSC.calibreCH1:=0.2;Calibrech1scrollbar.position:=9; end;
  if CALIBCH1_0225V.Checked=true then  begin REGOSC.calibreCH1:=0.2;Calibrech1scrollbar.position:=10; end;
  if CALIBCH1_0215V.Checked=true then  begin REGOSC.calibreCH1:=0.2;Calibrech1scrollbar.position:=11; end;
  if CALIBCH1_0210V.Checked=true then  begin REGOSC.calibreCH1:=0.2;Calibrech1scrollbar.position:=12;end;

   SetSensitivity ( lCh1 , @REGOSC.calibreCH1 ) ;  // Calibre voie 1 : 0.2V . Attention passage par adresse.

  if CALIBreCH2_80V.Checked=true   then  begin REGOSC.calibreCH2:=80; Calibrech2scrollbar.position:=1; end;      //1_23 FM
  if CALIBreCH2_40V.Checked=true   then  begin REGOSC.calibreCH2:=40; Calibrech2scrollbar.position:=2; end;      //1_21 FM
  if CALIBreCH2_20V.Checked=true   then  begin REGOSC.calibreCH2:=20; Calibrech2scrollbar.position:=3; end;
  if CALIBreCH2_8V.Checked=true    then  begin REGOSC.calibreCH2:=8;  Calibrech2scrollbar.position:=4; end;
  if CALIBreCH2_4V.Checked=true    then  begin REGOSC.calibreCH2:=4;  Calibrech2scrollbar.position:=5; end;
  if CALIBreCH2_2V.Checked=true    then  begin REGOSC.calibreCH2:=2;  Calibrech2scrollbar.position:=6; end;
  if CALIBreCH2_08V.Checked=true   then  begin REGOSC.calibreCH2:=0.8;Calibrech2scrollbar.position:=7; end;
  if CALIBreCH2_04V.Checked=true   then  begin REGOSC.calibreCH2:=0.4;Calibrech2scrollbar.position:=8; end;
  if CALIBreCH2_02V.Checked=true   then  begin REGOSC.calibreCH2:=0.2;Calibrech2scrollbar.position:=9; end;
  if CALIBreCH2_0225V.Checked=true then  begin REGOSC.calibreCH2:=0.2;Calibrech2scrollbar.position:=10; end;
  if CALIBreCH2_0215V.Checked=true then  begin REGOSC.calibreCH2:=0.2;Calibrech2scrollbar.position:=11; end;
  if CALIBreCH2_0210V.Checked=true then  begin REGOSC.calibreCH2:=0.2;Calibrech2scrollbar.position:=12;end;
  SetSensitivity ( lCh2 , @REGOSC.calibreCH2 ) ;  // Calibre voie 1 : 0.2V . Attention passage par adresse.
end;


procedure TOscilloCaba.Calibrech1scrollbarChange(Sender: TObject);
begin
    if Calibrech1scrollbar.position=1 then CALIBCH1_80V.Checked:=true;             //1_23 FM
    if Calibrech1scrollbar.position=2 then CALIBCH1_40V.Checked:=true;             //1_21 FM
    if Calibrech1scrollbar.position=3 then CALIBCH1_20V.Checked:=true;
    if Calibrech1scrollbar.position=4 then CALIBCH1_8V.Checked:=true;
    if Calibrech1scrollbar.position=5 then CALIBCH1_4V.Checked:=true;
    if Calibrech1scrollbar.position=6 then CALIBCH1_2V.Checked:=true;
    if Calibrech1scrollbar.position=7 then CALIBCH1_08V.Checked:=true;
    if Calibrech1scrollbar.position=8 then CALIBCH1_04V.Checked:=true;
    if Calibrech1scrollbar.position=9 then CALIBCH1_02V.Checked:=true;
    if Calibrech1scrollbar.position=10 then CALIBCH1_0225V.Checked:=true;   //calibre artificiel
    if Calibrech1scrollbar.position=11 then CALIBCH1_0215V.Checked:=true;   //calibre artificiel
    if Calibrech1scrollbar.position=12 then CALIBCH1_0210V.Checked:=true;  //calibre artificiel
    ScrollBar6Change(Sender); //trigger : raffréchissement aprés chg de calibres
    RadioButton_FctCH1_Click(sender); //modif calibres de l'intégrale
end;


procedure TOscilloCaba.Calibrech2ScrollBarChange(Sender: TObject);
begin
    if Calibrech2scrollbar.position=1 then CalibreCH2_80V.Checked:=true;         //1_23 FM
    if Calibrech2scrollbar.position=2 then CalibreCH2_40V.Checked:=true;         //1_21 FM
    if Calibrech2scrollbar.position=3 then CalibreCH2_20V.Checked:=true;
    if Calibrech2scrollbar.position=4 then CalibreCH2_8V.Checked:=true;
    if Calibrech2scrollbar.position=5 then CalibreCH2_4V.Checked:=true;
    if Calibrech2scrollbar.position=6 then CalibreCH2_2V.Checked:=true;
    if Calibrech2scrollbar.position=7 then CalibreCH2_08V.Checked:=true;
    if Calibrech2scrollbar.position=8 then CalibreCH2_04V.Checked:=true;
    if Calibrech2scrollbar.position=9 then CalibreCH2_02V.Checked:=true;
    if Calibrech2scrollbar.position=10 then CalibreCH2_0225V.Checked:=true;
    if Calibrech2scrollbar.position=11 then CalibreCH2_0215V.Checked:=true;
    if Calibrech2scrollbar.position=12 then CalibreCH2_0210V.Checked:=true;
    ScrollBar6Change(Sender);
end;


procedure TOscilloCaba.CalibreFCTch1scrollbarChange(Sender: TObject);
begin
   { if Calibrech1scrollbar.position=1 then CALIBfctCH1_1.Checked:=true;
    if Calibrech1scrollbar.position=2 then CALIBfctCH1_2.Checked:=true;
    if Calibrech1scrollbar.position=3 then CALIBfctCH1_3.Checked:=true;
    if Calibrech1scrollbar.position=4 then CALIBfctCH1_4.Checked:=true;
    if Calibrech1scrollbar.position=5 then CALIBfctCH1_5.Checked:=true;
    if Calibrech1scrollbar.position=6 then CALIBfctCH1_6.Checked:=true;
    if Calibrech1scrollbar.position=7 then CALIBfctCH1_7.Checked:=true; }
   // ScrollBar6Change(Sender); trigger pour les chg de calibres de voies normales

    case CalibreFCTch1scrollbar.position of
         1 : CALIBfctCH1_1.Checked:=true;
         2 : CALIBfctCH1_2.Checked:=true;
         3 : CALIBfctCH1_3.Checked:=true;
         4 : CALIBfctCH1_4.Checked:=true;
         5 : CALIBfctCH1_5.Checked:=true;
         6 : CALIBfctCH1_6.Checked:=true;
         7 : CALIBfctCH1_7.Checked:=true;

    end;
end;

procedure TOscilloCaba.RadioButton_FctCH1_Click(Sender: TObject);

begin

    CALIBfctCH1_1.Caption:=floattostrf(1/100,ffExponent,2,1);
    CALIBfctCH1_2.Caption:=floattostrf(1/200,ffExponent,2,1);
    CALIBfctCH1_3.Caption:=floattostrf(1/500,ffExponent,2,1);
    CALIBfctCH1_4.Caption:=floattostrf(1/1000,ffExponent,2,1);
    CALIBfctCH1_5.Caption:=floattostrf(1/2000,ffExponent,2,1);
    CALIBfctCH1_6.Caption:=floattostrf(1/5000,ffExponent,2,1);
    CALIBfctCH1_7.Caption:=floattostrf(1/10000,ffExponent,2,1);


    if CALIBfctCH1_1.checked  = true then
      begin

        calibreFCTch1:=4/100 ;
        CalibreFCTch1scrollbar.position:=1;
      end;
    if CALIBfctCH1_2.checked  = true then
       begin

        calibreFCTch1:=4/200 ;
        CalibreFCTch1scrollbar.position:=2;
      end;
    if CALIBfctCH1_3.checked  = true then
     begin

         calibreFCTch1:=4/500 ;
        CalibreFCTch1scrollbar.position:=3;
      end;
    if CALIBfctCH1_4.checked  = true then
     begin

        calibreFCTch1:=4/1000 ;
        CalibreFCTch1scrollbar.position:=4;
      end;
    if CALIBfctCH1_5.checked  = true then
     begin

        calibreFCTch1:=4/2000 ;
        CalibreFCTch1scrollbar.position:=5;
      end;
    if CALIBfctCH1_6.checked  = true then
     begin

        calibreFCTch1:=4/5000 ;
        CalibreFCTch1scrollbar.position:=6;
      end;
    if CALIBfctCH1_7.checked  = true then
     begin

        calibreFCTch1:=4/10000 ;
        CalibreFCTch1scrollbar.position:=7;
      end;

end;


procedure TOscilloCaba.INVch1Click(Sender: TObject);
begin
    invech1:=invech1*(-1);

end;

procedure TOscilloCaba.INVch2Click(Sender: TObject);
begin
    invech2:=invech2*(-1);

end;

///////////////////////////////////////////////////////////         ////////////////////////////////////////////////////////////////////
//FIN       gestion de la SENSIBILITEE DES VOIX   /////////         ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////          ////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////         ////////////////////////////////////////////////////////////////////
//       gestion du TRIGGER                             ///         ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////           ////////////////////////////////////////////////////////////////////



procedure TOscilloCaba.TRIGCH1Click(Sender: TObject);
var level : double;

begin
   level := StrToFloat(triglevelbox.Text);
   //levelintereval:=1;
    ScrollBar6.visible:=true;
   SetTriggerSource ( 0 ) ;
  // SetTriggerMode (  ltkrising ) ;  // trigger sur front montant
   SetTriggerLevel ( lCh1 , level ) ;
   SetTriggerHys(lch1,0.5);
   ScrollBar6Change(Sender);
end;


procedure TOscilloCaba.TRIGCH2Click(Sender: TObject);
var level : double;

begin
    level := StrToFloat(triglevelbox.Text);
    //levelintereval:=1;
     ScrollBar6.visible:=true;
   SetTriggerSource ( 1 ) ;
  // SetTriggerMode (  ltkrising ) ;  // trigger sur front montant
   SetTriggerLevel ( lCh2 , level ) ;
   SetTriggerHys(lch2,0.5);
   ScrollBar6Change(Sender);
end;

procedure TOscilloCaba.NOTrigButtonClick(Sender: TObject);
begin
    SetTriggerSource ( 5 ) ;
    //levelintereval:=0;
    ScrollBar6.visible:=false;
end;


procedure TOscilloCaba.TRIGMONTClick(Sender: TObject);
begin

   SetTriggerMode ( 0 );



     // trigger sur front montant
end;

procedure TOscilloCaba.TRIGDESCClick(Sender: TObject);
begin

   SetTriggerMode (  1) ;

   // SetTriggerMode (  ltkfalling );  // trigger sur front decendant
end;

procedure TOscilloCaba.COUPLAGECH1ACClick(Sender: TObject);
begin
     SetCoupling ( lCh1 , lctAC ) ;      // Couplage voie 1 en AC
end;

procedure TOscilloCaba.COUPLAGECH2ACClick(Sender: TObject);
begin
     SetCoupling ( lCh2, lctAC ) ;      // Couplage voie 1 en AC
end;

procedure TOscilloCaba.COUPLAGECH1DCClick(Sender: TObject);
begin
     SetCoupling ( lCh1 , lctDC ) ;      // Couplage voie 1 en DC
end;

procedure TOscilloCaba.COUPLAGECH2DCClick(Sender: TObject);
begin
     SetCoupling ( lCh2 , lctDC ) ;      // Couplage voie 1 en DC
end;

procedure TOscilloCaba.SpinTriglevelDownClick(Sender: TObject);
(*
 * Procedures to set triggerlevel
 *)
var levelvalue : double;
    Calibre1,Calibre2,calibre:double;
begin


     GetSensitivity( lCh1, @Calibre1);
     GetSensitivity( lCh2, @Calibre2);
     if trigCH1.tabstop=true then
     calibre:=calibre1;
    // levelvalue:=-(scrollbar6.position-500)*calibre1/500;
     if trigCH2.tabstop=true then
     calibre:=calibre2;
    // levelvalue:=-(scrollbar6.position-500)*calibre2/500;
    // triglevelbox.Text := FloatToStr(levelvalue);


  {
  levelvalue := StrToFloat(triglevelbox.Text);
  if (levelvalue-(calibre/8)) > (levelmin+calibre/16) then
  begin
    levelvalue :=levelvalue-(calibre/8);
    triglevelbox.Text := FloatToStr(levelvalue);
    scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end { if }
 { else
  begin
    levelvalue := levelmin+calibre/16;
    triglevelbox.Text := FloatToStr(levelvalue);
    scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end; { else }

   levelvalue := StrToFloat(triglevelbox.Text);                           //   modif sans tenir compte des crétes.....   cabalab 1_26
  if levelvalue > (-calibre) then
  begin
    levelvalue :=levelvalue-0.1;
    triglevelbox.Text := FloatToStr(levelvalue);
    scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end { if }
  else
  begin
   // levelvalue := levelmin+calibre/16;
   // triglevelbox.Text := FloatToStr(levelvalue);
   // scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end; { else }


end; { TForm1.SpinTriglevelCh1DownClick }


procedure TOscilloCaba.SpinTriglevelUpClick(Sender: TObject);
var levelvalue : double;
    Calibre1,Calibre2,calibre:double;
begin

     GetSensitivity( lCh1, @Calibre1);
     GetSensitivity( lCh2, @Calibre2);
     if trigCH1.tabstop=true then
     calibre:=calibre1;
    // levelvalue:=-(scrollbar6.position-500)*calibre1/500;
     if trigCH2.tabstop=true then
     calibre:=calibre2;

 { levelvalue := StrToFloat(triglevelbox.Text);
  if (levelvalue+ (calibre/8)) < (levelmax-calibre/16) then
  begin
    levelvalue := levelvalue + (calibre/8);
    triglevelbox.Text := FloatToStr(levelvalue);
    scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end { if }
 { else
  begin
    levelvalue := levelmax-calibre/16;
    triglevelbox.Text := FloatToStr(levelvalue);
    scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end; { else }



     levelvalue := StrToFloat(triglevelbox.Text);                           //   modif sans tenir compte des crétes.....   cabalab 1_26
  if levelvalue < calibre then
  begin
    levelvalue := levelvalue + 0.1;
    triglevelbox.Text := FloatToStr(levelvalue);
    scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end { if }
  else
  begin
    //levelvalue := levelmax-calibre/16;
    //triglevelbox.Text := FloatToStr(levelvalue);
    //scrollbar6.position:=round(-((levelvalue*500/calibre1)-500));
  end; { else }


end; { TForm1.SpinTriglevelCh1UpClick }


procedure TOscilloCaba.TrigLevelBoxChange(Sender: TObject);              //modifier pour cabalab 1_26
var level : double;
    voietrig : byte;
    calibretrig : double;
    Calibre1,Calibre2,calibre:double;
begin

  GetSensitivity( lCh1, @Calibre1);
  GetSensitivity( lCh2, @Calibre2);

     if trigCH1.tabstop=true then
     begin
     calibre:=calibre1;

     end;

     if trigCH2.tabstop=true then
     begin
     calibre:=calibre2;

     end;



  try
  begin
  level := StrToFloat(triglevelbox.Text);

  if level >  calibre then  level:=calibre;          //pb aux des bornes!!!!!
  if level < - calibre then  level:=-calibre;

  if trigCH1.tabstop=true then                        //réglage HS3
     begin

     settriggerlevel(1,level);
     end;

     if trigCH2.tabstop=true then
     begin

      settriggerlevel(2,level);
     end;



  scrollbar6.position:=round(-((level*500/calibre)-500));      //mise a jour ascenseur trig oscillo
  end;
  except
  end;



end; { TForm1.TrigLevelCh1BoxChange }

procedure TOscilloCaba.SpinHystlevelDownClick(Sender: TObject);
(*
 * Procedures to set triggerlevel
 *)
var levelvalue : double;
begin
  levelvalue := StrToFloat(HystLevelBox.Text);
  if levelvalue > 0 then
  begin
    levelvalue :=levelvalue - 10;
    HystLevelBox.Text := FloatToStr(levelvalue);
  end { if }
  else
  begin
    levelvalue := 0;
    HystLevelBox.Text := FloatToStr(levelvalue);
  end; { else }
end; { TForm1.SpinTriglevelCh1DownClick }


procedure TOscilloCaba.SpinHystlevelUpClick(Sender: TObject);
var levelvalue : double;
begin
  levelvalue := StrToFloat(HystLevelBox.Text);
  if levelvalue < 9999 then
  begin
    levelvalue := levelvalue + 10;
    HystLevelBox.Text := FloatToStr(levelvalue);
  end { if }
  else
  begin
    levelvalue := 9999;
    HystLevelBox.Text := FloatToStr(levelvalue);
  end; { else }
end; { TForm1.SpinTriglevelCh1UpClick }


procedure TOscilloCaba.HystLevelBoxChange(Sender: TObject);
var level : double;
    voietrig : byte;
    calibretrig : double;

begin
  level := StrToFloat(HystLevelBox.Text);
 // settriggerlevel(1,level);
  //settriggerlevel(2,level);
  getTriggerSource( @voietrig );
  if voietrig=0 then SetTriggerHys( lCh1, level/1000);
  if voietrig=1 then SetTriggerHys( lCh2, level/1000);
  //SpinTrigLevelButton.Top:=ecrancontrole.top+round ( -((100*level)/calibretrig)+100 );
end; { TForm1.TrigLevelCh1BoxChange }

 //gestion du zoom par la sourie :








 


procedure TOscilloCaba.ScrollBar6Change(Sender: TObject);
var
   levelvalue:double;
   calibre1,calibre2 : double;
begin
     GetSensitivity( lCh1, @Calibre1);
     GetSensitivity( lCh2, @Calibre2);
     if trigCH1.tabstop=true then
     levelvalue:=-(scrollbar6.position-500)*calibre1/500;
     if trigCH2.tabstop=true then
     levelvalue:=-(scrollbar6.position-500)*calibre2/500;
     triglevelbox.Text := FloatToStr(levelvalue);
end;





///////////////////////////////////////////////////////////                 ////////////////////////////////////////////////////////////////////
//   FIN      gestion du TRIGGER                        ///                 ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                  ////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////                ////////////////////////////////////////////////////////////////////
//         gestion des ENREGISTREMENTS                  ///                ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                 ////////////////////////////////////////////////////////////////////



procedure TOscilloCaba.ENRGBRclick(Sender: TObject);
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

procedure TOscilloCaba.ScrollBarEnregistrementsChange(Sender: TObject);

begin
     CheckBoxA.caption:='C'+inttostr(ScrollBarEnregistrements.position);
     CheckBoxB.caption:='C'+inttostr(ScrollBarEnregistrements.position+1);
     LabelCalCh1A.visible:=false;
     LabelCalCh1B.visible:=false;
     LabelCalCh2A.visible:=false;
     LabelCalCh2B.visible:=false;
     Label1BDTA.visible:=false;
     LabelBDTB.visible:=false;
     OptionsA.visible:=false;
     OptionsB.visible:=false;
     SuprimerA.Visible:=false;
     SuprimerB.Visible:=false;

     if  ScrollBarEnregistrements.position= nb_courbes_stockees then
         begin

                        CheckBoxA.caption:=courbes [ScrollBarEnregistrements.position].nom;
                        CheckBoxA.checked:=courbes [ScrollBarEnregistrements.position].visible;
                        num_de_courbe:=ScrollBarEnregistrements.position;
                        affichageEnregistrements( paintboxA);
                      //  OptionsA.visible:=true;
                        SuprimerA.Visible:=true;
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
                        SuprimerA.Visible:=true;
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
         end ;

     if  ScrollBarEnregistrements.position>= nb_courbes_stockees then
         begin
             PaintBoxB.Canvas.Brush.Color := clBlack;
             PaintBoxB.Canvas.Rectangle(0, 0, PaintBoxB.Width - 1, PaintBoxB.Height - 1);
             CheckBoxB.checked:=false;
         end;
     if  ScrollBarEnregistrements.position> nb_courbes_stockees then
         begin
             PaintBoxA.Canvas.Brush.Color := clBlack;
             PaintBoxA.Canvas.Rectangle(0, 0, PaintBoxB.Width - 1, PaintBoxB.Height - 1);
             CheckBoxA.checked:=false;
         end;
end;

procedure TOscilloCaba.ButtonEnregClick(Sender: TObject);
var
   calibre1,calibre2:double;
begin

     if ( nb_courbes_stockees < 10 ) then

        begin


        nb_courbes_stockees := nb_courbes_stockees + 1 ;
        courbes[nb_courbes_stockees].Valide := true ;    //last modif!!!
        courbes[ nb_courbes_stockees ].visible:=true;
        //compteur_courbes_stockees :=  compteur_courbes_stockees + 1 ;

        {stockage de la courbe }
        if (sender=ButtonCH1Enreg) or  (sender=ButtonDUALEnreg) then
         courbes [nb_courbes_stockees].voie1    := Ch1doubleArray;

        if (sender=ButtonCH2Enreg) or  (sender=ButtonDUALEnreg) then
         courbes [nb_courbes_stockees].voie2    := Ch2doubleArray;
         
         courbes [nb_courbes_stockees].couleur1 := clGreen;
         courbes [nb_courbes_stockees].couleur2 := clBlue;
         courbes [nb_courbes_stockees].freq_ech:= GetSampleFrequency();
         courbes [nb_courbes_stockees].long_ech:= GetRecordLength();
         courbes [nb_courbes_stockees].BDT:=ScrollBar5.position;

         courbes [nb_courbes_stockees].CouplageCH1DC := COUPLAGECH1DC.checked;
         courbes [nb_courbes_stockees].CouplageCH2DC := COUPLAGECH2DC.checked;

         courbes [nb_courbes_stockees].INVCH1 := INVch1.checked;
         courbes [nb_courbes_stockees].INVCH2 := INVch2.checked;
         courbes [nb_courbes_stockees].ADD    := ADDButton.checked;

         courbes [nb_courbes_stockees].XY    := XYButton.checked;

      //   courbes [nb_courbes_stockees].BDT:=

         GetSensitivity( lCh1, @Calibre1);
         GetSensitivity( lCh2, @Calibre2);
         courbes [nb_courbes_stockees].calibCh1_ech:= Calibre1;
         courbes [nb_courbes_stockees].calibCh2_ech:= Calibre2;

         if Sender = ButtonCH1Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch1;

                 courbes [nb_courbes_stockees].nom  := 'courbe' + inttostr( nb_courbes_stockees ) + ' (Voie 1)' ;
            end;
         if Sender = ButtonCH2Enreg then
            begin
                 courbes [nb_courbes_stockees].mode := Ch2;
                 courbes [nb_courbes_stockees].nom  := 'courbe' + inttostr( nb_courbes_stockees ) + ' (Voie 2)' ;
            end;
         if Sender = ButtonDUALEnreg then
            begin
                 courbes [nb_courbes_stockees].mode := Chop;
                 courbes [nb_courbes_stockees].nom  := 'courbe' + inttostr( nb_courbes_stockees ) + ' (Voies 1 et 2)' ;
            end;

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

procedure TOscilloCaba.CheckBoxAClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position].visible:=CheckBoxA.checked;
end;

procedure TOscilloCaba.CheckBoxBClick(Sender: TObject);
begin
     courbes [ScrollBarEnregistrements.position+1].visible:=CheckBoxB.checked;
end;

procedure TOscilloCaba.OptionsAClick(Sender: TObject);
begin
     if nb_courbes_stockees<>0 then
     begin
     courbe_options:=ScrollBarEnregistrements.position;
     oscillocaba.visible:=false;
     Options.visible:=true;
     end;
     
end;

procedure TOscilloCaba.OptionsBClick(Sender: TObject);
begin
     courbe_options:=ScrollBarEnregistrements.position+1;
     oscillocaba.visible:=false;
     Options.visible:=true;

end;

procedure TOscilloCaba.SuprimerAClick(Sender: TObject);
var i : integer ;
begin
   courbe_options:=ScrollBarEnregistrements.position+1;

   if courbe_options <> nb_courbes_stockees then
      for i:= courbe_options to nb_courbes_stockees - 1 do
          courbes[i] := courbes[i+1];

   courbes[nb_courbes_stockees].valide:=false;
   nb_courbes_stockees := nb_courbes_stockees - 1 ;
   ScrollBarEnregistrementsChange(sender);
end;

procedure TOscilloCaba.SuprimerBClick(Sender: TObject);
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


///////////////////////////////////////////////////////////                     ////////////////////////////////////////////////////////////////////
//    FIN     gestion des ENREGISTREMENTS              ///                      ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                      ////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////                      ////////////////////////////////////////////////////////////////////
//        gestion du ZOOM                              ///                       ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                       ////////////////////////////////////////////////////////////////////






//scroolbars du zoom et action réciproques

procedure TOscilloCaba.ScrollBar1Change(Sender: TObject);
begin
if  ScrollBar2.position < ( ScrollBar1.position + 100) then
    ScrollBar2.position:=ScrollBar1.position + 100 ;
if  ScrollBar2.max < ( ScrollBar1.position + 100) then
    ScrollBar1.position:=ScrollBar2.max-100 ;
end;

procedure TOscilloCaba.ScrollBar2Change(Sender: TObject);
begin
if  ScrollBar2.position < ( ScrollBar1.position + 100 ) then
    ScrollBar1.position:=ScrollBar2.position - 100 ;
if  ScrollBar2.position < ( ScrollBar1.min + 100) then
    ScrollBar2.position:=ScrollBar1.min + 100 ;
end;

procedure TOscilloCaba.ScrollBar3Change(Sender: TObject);
begin
if  ScrollBar4.position < ( ScrollBar3.position + 100) then
    ScrollBar4.position:=ScrollBar3.position + 100 ;
if  ScrollBar4.max < ( ScrollBar3.position + 100) then
    ScrollBar3.position:=ScrollBar4.max - 100 ;
end;

procedure TOscilloCaba.ScrollBar4Change(Sender: TObject);
begin
if  ScrollBar4.position < ( ScrollBar3.position + 100) then
    ScrollBar3.position:=ScrollBar4.position - 100 ;
if  ScrollBar4.position < ( ScrollBar3.min + 100) then
    ScrollBar4.position:=ScrollBar3.min +100 ;
end;


{Utilisez ce code comme gestionnaire de l'événement OnMouseDown de la fiche:}
procedure TOscilloCaba.FormMouseDown(Sender: TObject; Button: TMouseButton;
                               Shift: TShiftState; X, Y: Integer);
begin
  positionboutton:=1;
  StartX := X;
  StartY := Y;
end;

{Utilisez ce code comme gestionnaire de l'événement OnMouseUp de la fiche:}
procedure TOscilloCaba.FormMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
begin
   positionboutton:=0;
   if abs(X-startX)>round(0.1*ecrancontrole.Height) then
      begin
           if abs(Y-startY)>round(0.1*ecrancontrole.Width) then
              begin
                   if startX<X  then
                      begin
                            Scrollbar1.position:=round(startX*1000/ecrancontrole.width) ;
                            Scrollbar2.position:=round(X *1000/ecrancontrole.width) ;
                      end
                   else
                       begin
                            Scrollbar1.position:=round(X*1000/ecrancontrole.width) ;
                            Scrollbar2.position:=round(startX*1000/ecrancontrole.width) ;
                       end;
                   if startY<Y then
                      begin
                            Scrollbar4.position:=round(Y*1000/ecrancontrole.height);
                            Scrollbar3.position:=round(startY*1000/ecrancontrole.height)  ;
                      end
                   else
                      begin
                            Scrollbar4.position:=round(startY*1000/ecrancontrole.height);
                            Scrollbar3.position:=round(Y*1000/ecrancontrole.height)  ;
                      end;
               end;
      end;

  // Affichage_Zoom(ecran);
end;

{Utilisez ce code comme gestionnaire de l'événement OnMouseMove de la fiche:}
procedure TOscilloCaba.FormMouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);
begin
   instantX:=X;
   instantY:=Y;
end;



procedure TOscilloCaba.ResetZoomClick(Sender: TObject);
begin
    ScrollBar1.position:=0;
    ScrollBar2.position:=1000;
    ScrollBar3.position:=0;
    ScrollBar4.position:=1000;
end;





///////////////////////////////////////////////////////////                      ////////////////////////////////////////////////////////////////////
//   FIN     gestion du ZOOM                            ///                      ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                       ////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////                      ////////////////////////////////////////////////////////////////////
//       gestion de   REGRESSI                          ///                      ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                       ////////////////////////////////////////////////////////////////////




procedure TOscilloCaba.REGRESSIUtiliClick(Sender: TObject);   //apparition interface régressi utilisateur
begin
    FormRegressiTransfert.visible:=true;
end;


procedure TOscilloCaba.REGRESSIBR1Click(Sender: TObject);
var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    t,v1,v2               : double;
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



{
assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2.txt');

reset(bloc1);
   while not (eof(bloc1)) do
         begin
              readln(bloc1,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc1);
}




for inc:=1 to 113 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC1[inc]);





writeln(fichier,'£1 PAGE COMMENT');
writeln(fichier,'Enregistrement Oscilloscope HS3 page 1');
writeln(fichier,'&' + inttostr(round(Recordlength/10)) +' VALEUR VAR');

   for inc:=0 to round(Recordlength/10)-1 do
       begin
            t:=10*inc/freqR;
            v1:=(Ch1DoubleArray [inc*10]);
            v2:=(Ch2DoubleArray [inc*10]);
            writeln(fichier,t,' ',v1,' ',v2);
       end;


{
reset(bloc2);
   while not (eof(bloc2)) do
         begin
              readln(bloc2,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc2);
}


for inc:=1 to 27 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC2[inc]);




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




procedure TOscilloCaba.REGRESSIHD1Click(Sender: TObject);
var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    t,v1,v2               : double;
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



{
assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2.txt');

reset(bloc1);
   while not (eof(bloc1)) do
         begin
              readln(bloc1,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc1);
}

for inc:=1 to 113 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC1[inc]);


writeln(fichier,'£1 PAGE COMMENT');
writeln(fichier,'Enregistrement Oscilloscope HS3 page 1');
writeln(fichier,'&' + inttostr(Recordlength) +' VALEUR VAR');

   for inc:=0 to Recordlength-1 do
       begin
            t:=inc/freqR;
            v1:=(Ch1DoubleArray [inc]);
            v2:=(Ch2DoubleArray [inc]);
            writeln(fichier,t,' ',v1,' ',v2);
       end;


{
reset(bloc2);
   while not (eof(bloc2)) do
         begin
              readln(bloc2,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc2);
}

for inc:=1 to 27 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC2[inc]);



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



procedure TOscilloCaba.Regressi1Click(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    t,v1,v2               : double;
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



{
assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2.txt');

reset(bloc1);
   while not (eof(bloc1)) do
         begin
              readln(bloc1,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc1);
}

for inc:=1 to 113 do                               ////cabalab 1_26
writeln(fichier,RegressiBLOC1[inc]);





{
writeln(fichier,'£1 PAGE COMMENT');
writeln(fichier,'Enregistrement Oscilloscope HS3 page 1');
writeln(fichier,'&' + inttostr(round(Recordlength/1)) +' VALEUR VAR');

   for inc:=0 to round(Recordlength/1)-1 do
       begin
            t:=1*inc/freqR;
            v1:=(Ch1DoubleArray [inc*1]);
            v2:=(Ch2DoubleArray [inc*1]);
            writeln(fichier,t,' ',v1,' ',v2);
       end;

reset(bloc2);
   while not (eof(bloc2)) do
         begin
              readln(bloc2,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc2);
}

{écriture voies stockées }
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


                  {
                  reset(bloc2);
                  while not (eof(bloc2)) do
                  begin
                  readln(bloc2,chaine);
                  writeln(fichier,chaine);
                  end;
                  closefile(bloc2);
                   }

                  for inc:=1 to 27 do                               ////cabalab 1_26
                  writeln(fichier,RegressiBLOC2[inc]);






             end;
  end;


closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;





procedure TOscilloCaba.regressiClick(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin                 : shortstring;
    x1,y1,z1               : double;
    fichier,fichier2                : textfile;
    inc                    :integer;
    chemin_de_regressi     : shortstring;
begin
try
assignfile(fichier2,'cheminregf.txt');
reset(fichier2);
readln(fichier2,chemin_de_regressi);
closefile(fichier2);
except
end;
GetWindowsDirectory(@chemin_windows,255);
chemin:=shortstring(chemin_windows)+'\temp\bode.txt';

assignfile(fichier,chemin);
rewrite(fichier);

writeln(fichier,'regtemp');
writeln(fichier,'f',#9,'G',#9,'phi');
writeln(fichier,'Hz',#9,'dB',#9,'°');
writeln(fichier,'frequence',#9,'gain',#9,'phase');
   for inc:=0 to 10 do
   begin
   x1:=1;
   y1:=1;
   z1:=1;
   writeln(fichier,x1,#9,y1,#9,z1);
   end;
closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);


end;


procedure TOscilloCaba.Regressi2Click(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin                : shortstring;
    t,v1,v2               : double;
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
writeln(fichier,'OscilloCaba MonoPage');

write(fichier,'t',#9);

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

writeln(fichier);

//writeln(fichier,'frequence',#9,'gain',#9,'phase');

  { for inc:=0 to Bode.indice_derniere_mesure do
   begin
   x1:=Balayage.frequence[inc];
   y1:=Bode.gain[inc];
   z1:=Bode.phase[inc];
   writeln(fichier,x1,#9,y1,#9,z1);
   end;}



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


closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;


///////////////////////////////////////////////////////////                      ////////////////////////////////////////////////////////////////////
//       gestion de   REGRESSI                          ///                      ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////                       ////////////////////////////////////////////////////////////////////











procedure TOscilloCaba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

if  ONESHOT1.Checked=true then  StopShotClick(sender);  //1_34 FM

RadioButton3.Checked:=true;
RadioButton3Click(sender);/////mode DUAL

INVch2.checked:=false;                           ////1_21 FM
INVch1.checked:=false;
INVech1:=1;
INVech2:=1;


COUPLAGECH1DC.Checked:=true;
COUPLAGECH1DCClick(sender) ;
COUPLAGECH2DC.Checked:=true;
COUPLAGECH2DCClick (sender);

Calibrech1scrollbar.position:=2;
Calibrech1scrollbarChange(sender);
Calibrech2ScrollBar.position:=2;
Calibrech2ScrollBarChange(sender);

ScrollBar5.position:=9;
ScrollBar5Change(sender);



NOTrigButton.Checked:=true;
NOTrigButtonClick(sender);


TRIGMONT.Checked:=true;
TRIGMONTClick(sender);

simpleClick(sender);
AeteCLOSED:=true;
timer1.Enabled:=false;
init.visible:=true;             //Boutons

button3.Visible:=true;

passif[1]:=true;
Formcabalab.SpeedButtonOscillo.down:=false;
Formcabalab.GestionButtons(sender);


//cabalab.De_BloquageBoutonsOscillo;
//cabalab.SpeedButtonOscillo.down:=false;

end;

procedure TOscilloCaba.FormActivate(Sender: TObject);
begin
if ONESHOT1.Checked=false then timer1.Enabled:=true;    //1_34 ne pas débloquer le timer si en mode one shot

Oscillocaba.Repaint;       //1_30 pour activer l'apparition du boutton de liason GBF fait ds le onpaint

if AeteCLOSED=true then    ///////////1_21 modif f merle
  begin
  initialisation(sender);                     ///////////1_21 modif f merle
  InterfaceCompacteClick(Sender);    ///////1_21 modif f merle
  end;
AeteCLOSED:=false;
end;

procedure TOscilloCaba.InterfaceNormalClick(Sender: TObject);
begin
InterfaceCompacte.Checked:=false;
InterfaceNormal.Checked:=true;
portable:=0;//seul variable d état a garder!!!!

oscillocaba.Width:=1200;
oscillocaba.Height:=900;
//reglage_generateur;
//acquisition;
//affichage_voies(ecran);
init.visible:=false;
button3.Visible:=false;

label3.visible:=false;
label4.visible:=false;
//label5.visible:=false;
//label6.visible:=false;
label7.Visible:=false;
//image1.visible:=false;
Label9.Visible:=false;
//Label13.Visible:=false;

 Fichier1.Enabled:=true;
 Visualisation1.Enabled:=true;
 Options1.Enabled:=true;
 Mesures1.Enabled:=true;
 Enregistrements.Enabled:=true;
 signal.Enabled:=true;
 GroupBox4.Enabled:=true;
 GroupBox7.Enabled:=true;
 GroupBox2.Enabled:=true;
 GroupBox10.Enabled:=true;
 GroupBox11.Enabled:=true;

 OPTIONBDT.Top:=288;
 OPTIONBDT.left:=8;


 Button2.Top:=768;



 GroupShot.Top:=648;
 GroupShot.Left:=8;

 GroupBoxFoncMath.Top:=376;
 GroupBoxFoncMath.left:=8;

 GroupBoxVch1Mesures.Top:=672;
 GroupBoxVch2Mesures.Top:=672;
 GroupBoxFreqmetre.Top:=672;

// EcranXY.Top:=392;
// EcranXY.left:=8;
  GroupBoxXY.Top:=376;
 GroupBoxXY.left:=8;


                                                //gestion interface norùmale (DEUX écrans de visualisation des enregistrements)
 GroupBoxEnregistrements.Top:=376;
 GroupBoxEnregistrements.left:=8;
 GroupBoxEnregistrements.Height:=273;
 ScrollBarEnregistrements.Height:=249;
 CheckBoxB.Visible:=true;
 OptionsB.Visible:=true;
 LabelCalCh1B.Visible:=true;
 LabelCalCh2B.Visible:=true;
 LabelBDTB.Visible:=true;
 PaintBoxB.Visible:=true;
end;

procedure TOscilloCaba.InterfaceCompacteClick(Sender: TObject);
begin
InterfaceCompacte.Checked:=true;
InterfaceNormal.Checked:=false;
portable:=1;    ///seule variable d état a garder!!!!!

oscillocaba.Width:=1024;
oscillocaba.Height:=768;

//reglage_generateur;
//acquisition;
//affichage_voies(ecran);
init.visible:=false;             //Boutons
button3.Visible:=false;

label3.visible:=false;            //Présentation OscilloCaba
label4.visible:=false;
//label5.visible:=false;
//label6.visible:=false;
label7.Visible:=false;
//image1.visible:=false;
Label9.Visible:=false;
//Label13.Visible:=false;

 Fichier1.Enabled:=true;              //Déverouillage des menus
 Visualisation1.Enabled:=true;
 Options1.Enabled:=true;
 Mesures1.Enabled:=true;
 Enregistrements.Enabled:=true;
 signal.Enabled:=true;
 GroupBox4.Enabled:=true;             //dévérouillage des interfaces
 GroupBox7.Enabled:=true;
 GroupBox2.Enabled:=true;
 GroupBox10.Enabled:=true;
 GroupBox11.Enabled:=true;




 Button2.Top:=672;                       //position bouton rapel GBF

 GroupBoxEnregistrements.Top:=384;
 GroupBoxEnregistrements.left:=8;
 GroupBoxEnregistrements.Height:=145;
 ScrollBarEnregistrements.Height:=121;

 GroupShot.Top:=640;
 GroupShot.Left:=8;

 GroupBoxFoncMath.Top:=376;
 GroupBoxFoncMath.left:=8;

 OPTIONBDT.Top:=288;
 OPTIONBDT.left:=8;

 GroupBoxVch1Mesures.Top:=576;

 GroupBoxFreqmetre.Top:=576;
 GroupBoxVch2Mesures.Top:=576;


 GroupShot.Top:=536;
 GroupShot.Left:=8;

// EcranXY.Top:=392;
// EcranXY.left:=8;
 GroupBoxXY.Top:=376;
 GroupBoxXY.left:=8;

 CheckBoxB.Visible:=false;                 //gestion interface compacte(un seul écran de visualisation des enregistrements)
 OptionsB.Visible:=false;
 LabelCalCh1B.Visible:=false;
 LabelCalCh2B.Visible:=false;
 LabelBDTB.Visible:=false;
 PaintBoxB.Visible:=false;


end;

procedure TOscilloCaba.Accumulation1Click(Sender: TObject);
begin
if Accumulation1.Checked=false then Accumulation1.Checked:=true else Accumulation1.Checked:=false;
end;

procedure TOscilloCaba.TimerDecalibrageBDTTimer(Sender: TObject);
begin
if LabelWARNING.Visible=true then LabelWARNING.Visible:=false else LabelWARNING.Visible:=true;
end;

///////////// liaison brigtofrobt cabalab//// ////////////////////////////////////////////////////////////////////////////////////////////////
procedure TOscilloCaba.SpeedButtonFrontCabalabClick(Sender: TObject);
begin
FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
FormCabaLab.BringToFront;
end;

///////////// liaison brigtofrobt cabalab////////////////////////////////////////////////////////////////////////////////////////////////////





procedure TOscilloCaba.FormPaint(Sender: TObject);          //     1_30FM
begin
   if unitcabalab.passif[2]= false then
      ButtonCabaLabAutreAPLI.Visible:=true
   else
      ButtonCabaLabAutreAPLI.Visible:=false;
end;

procedure TOscilloCaba.ButtonCabaLabAutreAPLIClick(Sender: TObject);
begin
    formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
    formGBF.BringToFront;             //   1_30Fm
end;

procedure TOscilloCaba.ecranPaint(Sender: TObject);
begin
   if ONESHOT1.Checked=true then Affichage_voies(Ecran);       //1_34 repaint dans le cas du one shot car timer bloqué......

end;

procedure TOscilloCaba.Apropos2Click(Sender: TObject);
begin
FormApropos.Visible := true ;
FormApropos.BringToFront;
end;

end.
