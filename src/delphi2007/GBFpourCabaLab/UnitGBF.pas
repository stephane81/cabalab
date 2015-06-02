unit UnitGBF;



{$DEFINE CABALABin}           //: fonctionne DANS CABALAB   !!!régler la valeur de : const  UmaxGBF  selon GTI2 ou HS3
//{$DEFINE Independant}           //: pour utiliser sans cabalab

{$IFDEF Independant}            //: dans cabalab les DEFINE sont fais par CABALABHS3 ou CABALABGTI2//
  //{$DEFINE GTI2}                //    !!!!!!UTILISER le DLLdecl CORESPONDANT!!!!!!!!!!!!
  {$DEFINE HS3}                  //    !!!!!!ET les fiches fréquences pour GTI2!!!!!!!!!!
{$ENDIF}                        //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,dlldecl, Buttons, ExtCtrls, ComCtrls, Menus, Spin, ToolWin;

//{$IFDEF HS3}                                                  //modifier pour le forme create voir plus loin...
//const  UmaxGBF=12 ;          // pour HS3  12V maximum
//{$ENDIF}

//{$IFDEF GTI2}
//const  UmaxGBF=10;           // pour GTI2  10V maximum
//{$ENDIF}

/////////////////////////////////////////////////////////MODULATIONS////////////  DEBUT  //////////////////////////////////////////////////////
const
      sErrFreqMod          = 'Erreur de syntaxe de la fréquence Porteuse. Entrez la valeur sous la forme 1234,56';
      sErrFreqPort          = 'Erreur de syntaxe de la fréquence max. Entrez la valeur sous la forme 1234,56';
      sErrGenAmpl          = 'Erreur de syntaxe de l''amplitude du générateur. Entrez la valeur sous la forme 1234,56';
      sErrGenOffs          = 'Erreur de syntaxe de l''Offset du générateur. Entrez la valeur sous la forme 1234,56';
      sErrFreqModulationOutRange     = 'La fréquence modulante doit être comprise entre 0,01 Hz et1 MHz';
      sErrFreqPorteuseOutRange     = 'La fréquence Fmax doit être comprise entre 0,01 Hz et 1 MHz';
      sErrFreqPorteuseFreqModulation          = 'La fréquence Porteuse doit être supérieure à la fréquence Modulation !';
      sErrFreqHorlogeOutRange ='';
      sErrGenAmplRange     = ' L''amplitude du générateur doit être comprise entre 0 et 12 V';
      sErrGenAmplRange2    = 'Attention : avec les valeurs choisies pour l''amplitude et l''offset, ' +
                             'le générateur va sortir de sa plage de fonctionnement (-12V,+12V)';
      sErrIndiceModulation   =' Erreur indice de modulation' ;
      sErrIndiceModulationOutRange  ='L''indice de modulation est hors limite';
      Nrsamples=131072;
      Nrsamples0=1024;

 type
 (*
  * form declarations like buttons, labels displays and boxes
  *)
TGenerator   = record
                      dFreqPorteuse                      : double;
                      dFreqModulation                      : double;
                      dAmplitude                 : double;
                      dIndiceModulation          : double;
                      dDCOffset                  : double;
                      dFreqHorloge               : double;
                    end; { TGenerator }


type GBFE = record
  signal         :integer;
  Frequence      :double;
  coef_freq      :double;
  amplitude      :double;
  coef_amplitude :double;
  offset         :double;
  Symmetry       :double;
  indice         :double;

end;


/////////////////////////////////////////////////////////MODULATIONS/////////  FIN  /////////////////////////////////////////////////////////




Type ConfigType = record
                 allume:boolean; //true=oui false:non!

                   MODE:integer; //1:GBF1 ; 2:GBF2 ; 3:Modulation AM ; 4:Modulation FM ; 5:Modulation PM ; 6:Modulation Num

         GBF_1_2_Signal:integer; // 1 sinus,2 rect,3 triang,4 TTL,5 DC,6 bruit.   (mode=bouttons)
                                 //!! le TTL est gérer différamment des autres cas (réglages directes par validationConfiguration_interface)
                 Signal:integer; //conventions dlldecl tiepie

           GBF_1_2_Freq:integer; //1 1hz, 2 10hz, 3 100hz, 4 1k, 5 10k, 6 100k, 7 1M.   (mode=bouttons)    !!!!!numérotation indépendante des conventions DLL TIEPIE !!!
              coef_freq:double;  //1,10,100... : pour calculs a partir de scrollbarre
              frequence:double;  //val de la fréqence

    GBF_1_2_DBAmplitude:integer; //1 0dB, 2 -20dB, 3 -40dB.   (mode=bouttons)
        coef_amplitude :double;  //0-20-40 dB :   1,10,100 : pour calculs a partir de scrollbarre
              amplitude:double;  //val de l'amplitude

                 offset:double;  //val de l'offset
               Symmetry:double;  //val de rapport cyclique  en %

       validationClavier:boolean; //si true:la valeur vien du clavier utilisateur DONC blocage des calculs aprés mofis des positions des scrollbarre et spinbuttons
end;                              //si false: la valeur vien des réglages directes du GBF...

type GBF_buttons =record
  B_CalFreq  :array [1..7] of TspeedButton;
  B_CalAmpl  :array [1..3] of TspeedButton;
  B_CalSignal:array [1..6] of TspeedButton;

end;


type
  TFormGBF = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheetGBF: TTabSheet;
    TabSheetParam: TTabSheet;
    TabSheetAM: TTabSheet;
    Label1: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;

    ScrollBarFreqGBF1: TScrollBar;
    signalBox: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DC: TSpeedButton;
    bruit: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    TTL: TSpeedButton;
    Label10: TLabel;
    GroupBox3: TGroupBox;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    ScrollBarAmpliGBF1: TScrollBar;
    GroupBox4: TGroupBox;
    ScrollBarOffsetGBF1: TScrollBar;
    ButtonOffset_0: TButton;
    GroupBox5: TGroupBox;
    ScrollBarSymmGBF1: TScrollBar;
    Button_50_symm: TButton;
    TabSheetNum: TTabSheet;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    ControleParam: TMenuItem;
    ModulationAM: TMenuItem;
    ModulationNum: TMenuItem;
    GroupBox8: TGroupBox;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton31: TSpeedButton;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    TabSheetFM: TTabSheet;
    ModulationFM: TMenuItem;
    SpeedButtonON: TSpeedButton;
    SpeedButtonOFF: TSpeedButton;
    SpeedButtonDC: TSpeedButton;
    Label8: TLabel;
    SpeedButtonBRUIT: TSpeedButton;
    Label39: TLabel;
    SpeedButtonFrontCabalab: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButtonCABALAB: TSpeedButton;
    GroupBoxAmplitude: TGroupBox;
    EditAmplitude: TEdit;
    ScrollBarAmpliGBF2: TScrollBar;
    Label30: TLabel;
    Label31: TLabel;
    SpeedButtonGBF2_0dB: TSpeedButton;
    SpeedButtonGBF2_20dB: TSpeedButton;
    SpeedButtonGBF2_40dB: TSpeedButton;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    ButtonAmplitude: TButton;
    GroupBox9: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ScrollBarOffsetGBF2: TScrollBar;
    GroupBox10: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    ScrollBarSymmGBF2: TScrollBar;
    GroupBox11: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    ScrollBarFreqGBF2: TScrollBar;
    ButtonFreq: TButton;
    EditFrequence: TEdit;
    ButtonOffset: TButton;
    ButtonSymmetry: TButton;
    EditOffset: TEdit;
    EditRapportCyclique: TEdit;
    Apropos1: TMenuItem;
    Apropos2: TMenuItem;
    Configuration1: TMenuItem;
    TabSheetPM: TTabSheet;
    ModulationPM: TMenuItem;
    GroupBoxAM: TGroupBox;
    FreqPorteuseAM: TLabel;
    FreqPortAMFast: TSpinButton;
    SetFreqPorteuseAM: TEdit;
    FreqPortAMSlow: TSpinButton;
    GroupBoxFM: TGroupBox;
    Labelporteuse2: TLabel;
    FreqPorteuseFM: TLabel;
    FreqPortFMFast: TSpinButton;
    FreqPortFMSlow: TSpinButton;
    SetFreqPorteuseFM: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    GroupBoxModNum: TGroupBox;
    FreqPorteuseModNum: TLabel;
    SetFreqPorteuseModNum: TEdit;
    GroupBoxRZ: TGroupBox;
    Debit: TLabel;
    SetFreqHorlogebox: TEdit;
    GroupBoxNRZ: TGroupBox;
    M_aires: TLabel;
    DebitM_aires: TLabel;
    M_airesBox: TComboBox;
    SetFreqHorloge: TEdit;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox12: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    AmpNumFast: TSpinButton;
    SetGeneAmpNum: TEdit;
    AmpSlowNum: TSpinButton;
    SpinButton11: TSpinButton;
    SetGeneDCOffsetNum: TEdit;
    SpinButton12: TSpinButton;
    ButtonASK: TToolButton;
    ButtonFSK: TToolButton;
    ButtonPSK: TToolButton;
    toolbarmodnum: TToolBar;
    indicemodFSK: TLabel;
    setindicemodFSK: TEdit;
    IndiceModFSKFast: TSpinButton;
    IndiceModFSKSlow: TSpinButton;
    M_airesBoxASK: TComboBox;
    SetFreqHorlogeMod: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    GroupBoxNum: TGroupBox;
    ToolBarNum: TToolBar;
    ButtonM_aires: TToolButton;
    ButtonRZbipolaire: TToolButton;
    ButtonRZunipolaire: TToolButton;
    ButtonBiphase: TToolButton;
    RZLabel: TLabel;
    RZBox: TComboBox;
    Image1: TImage;
    Label43: TLabel;
    FreqModulanteAM: TLabel;
    FreqModAMFast: TSpinButton;
    SetFreqModulanteAM: TEdit;
    FreqModAMSlow: TSpinButton;
    amp: TLabel;
    AmpFast: TSpinButton;
    SetGeneAmp: TEdit;
    AmpSlow: TSpinButton;
    DCoffset: TLabel;
    DCoffsetFast: TSpinButton;
    SetGeneDCoffset: TEdit;
    DCoffsetSlow: TSpinButton;
    Radiogroupmodulant: TRadioGroup;
    Buttonsinusmod: TRadioButton;
    Buttonsquaremod: TRadioButton;
    Labelporteuse: TLabel;
    Labelmodulante: TLabel;
    ButtonTTLmod: TRadioButton;
    Label17: TLabel;
    SpinButton1: TSpinButton;
    SetGeneAmpFM: TEdit;
    SpinButton2: TSpinButton;
    Label18: TLabel;
    SpinButton3: TSpinButton;
    SetGeneDCOffsetFM: TEdit;
    SpinButton4: TSpinButton;
    FreqModulanteFM: TLabel;
    FreqModFMFast: TSpinButton;
    SetFreqModulantefM: TEdit;
    FreqModFMSlow: TSpinButton;
    RadioGroup1: TRadioGroup;
    Buttonsinusmod2: TRadioButton;
    Buttonsquaremod2: TRadioButton;
    ButtonTTLmod2: TRadioButton;
    Labelmodulante2: TLabel;
    GroupBoxindiceAM: TGroupBox;
    IndiceModAM: TLabel;
    IndiceModAMFast: TSpinButton;
    SetIndiceModAM: TEdit;
    IndiceModAMSlow: TSpinButton;
    GroupBoxindiceFM: TGroupBox;
    IndiceModFM: TLabel;
    SetIndiceModFM: TEdit;
    IndiceModFMSlow: TSpinButton;
    indicemodFMFast: TSpinButton;
    GroupBoxPM: TGroupBox;
    Labelporteuse3: TLabel;
    FreqPorteusePM: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    FreqPortPMFast: TSpinButton;
    FreqPortPMSlow: TSpinButton;
    SetFreqPorteusePM: TEdit;
    SpinButton13: TSpinButton;
    SetGeneAmpPM: TEdit;
    SpinButton14: TSpinButton;
    SpinButton15: TSpinButton;
    SetGeneDCOffsetPM: TEdit;
    SpinButton16: TSpinButton;
    GroupBox7: TGroupBox;
    Label5: TLabel;
    Labelmodulante3: TLabel;
    FreqModPMFast: TSpinButton;
    SetFreqModulantePM: TEdit;
    FreqModPMSlow: TSpinButton;
    RadioGroup2: TRadioGroup;
    ButtonSinus3: TRadioButton;
    Buttonsquaremod3: TRadioButton;
    ButtonTTLmod3: TRadioButton;
    GroupBox14: TGroupBox;
    Label20: TLabel;
    SetIndiceModPM: TEdit;
    IndiceModPMSlow: TSpinButton;
    IndiceModPMFast: TSpinButton;
    Image2: TImage;
    Image3: TImage;
    Labelporteuse4: TLabel;
    LabelModulante4: TLabel;
    Freqexacte: TLabel;
    FreqexacteRZ: TLabel;
    SignauxNumeriques: TToolButton;
    ModNum: TToolButton;
    ToolButton1: TToolButton;
    RadioButtonmodulantAM: TCheckBox;
    RadioButtonmodulantFM: TCheckBox;
    RadioButtonmodulantPM: TCheckBox;
    RadioButtonmodulantNum: TCheckBox;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure Image1Click(Sender: TObject);
    procedure ModAnalogiquesClick(Sender: TObject);

    procedure RZBoxChange(Sender: TObject);
    procedure ButtonBiphaseClick(Sender: TObject);

    procedure AmpNumFastDownClick(Sender: TObject);
    procedure AmpNumFastUpClick(Sender: TObject);
    procedure AmpNumSlowDownClick(Sender: TObject);
    procedure AmpNumSlowUpClick(Sender: TObject);
    procedure SignauxNumeriquesClick(Sender: TObject);
    procedure ModNumClick(Sender: TObject);
    

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    
    procedure SpeedButtonCABALABClick(Sender: TObject);
    procedure Apropos2Click(Sender: TObject);

    procedure ResetConfiguration(Sender: TObject);
    procedure ValidationConfiguration(Sender: TObject);
    procedure ValidationConfiguration_Interface(Sender: TObject);

    procedure PageControl1Change(Sender: TObject);

    procedure AffichageAfficheursGBF(Sender: TObject);
    ////////////////////////////////////////////////////////////////////////////
    procedure SpeedButton_ON_OFF_Click(Sender: TObject);

    procedure FrequenceClick(Sender: TObject);               //calibres de fréquences
    procedure ScrollBarFreqGBF1_2Change(Sender: TObject);

    procedure AmplitudeClick(Sender: TObject);               //button dB
    procedure ScrollBarAmpliGBFChange(Sender: TObject);

    procedure OffsetGBFChange(Sender: TObject);
    
    procedure SymmetryChange(Sender: TObject);

    procedure SIGNALClick(Sender: TObject);
    ///////////////////////////////////////////////////////////////////////////
    procedure EditClick(Sender: TObject);
    procedure convertion(Edit:Tedit ;var syntaxe:boolean;var valeur:double);
    procedure ValidationValeursClick(Sender: TObject);

    procedure VALIDER_GBF2_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    ////////////////////////////////////////////////////////////////////////////
    procedure ControleParamClick(Sender: TObject);
    procedure ModulationAMClick(Sender: TObject);
    procedure ModulationFMClick(Sender: TObject);
    procedure ModulationPMClick(Sender: TObject);
    procedure ModulationNumClick(Sender: TObject);

    ///////////////////////////////////////////////////////////////

    /////////////////////////////////////////MODULATIONS/////////////////////////// DEBUT

    procedure ButtonRZunipolaireClick(Sender: TObject);
    procedure Debit_NRZ_change(Sender: TObject);
    procedure Debit_RZ_change(Sender: TObject);
    procedure IndiceFMSlowUpclick(Sender: TObject);
    procedure IndiceFMSlowDownclick(Sender: TObject);
    procedure IndiceFMFastUpclick(Sender: TObject);
    procedure IndiceFMFastDownclick(Sender: TObject);
    procedure IndicePMSlowUpclick(Sender: TObject);
    procedure IndicePMSlowDownclick(Sender: TObject);
    procedure IndicePMFastUpclick(Sender: TObject);
    procedure IndicePMFastDownclick(Sender: TObject);
    procedure FreqModFMSlowUpClick(Sender: TObject);
    procedure FreqModFMSlowDownClick(Sender: TObject);
    procedure FreqModFMFastUpClick(Sender: TObject);
    procedure FreqModFMFastDownClick(Sender: TObject);
    procedure FreqPortFMSlowUpClick(Sender: TObject);
    procedure FreqPortFMSlowDownClick(Sender: TObject);
    procedure FreqPortFMFastUpClick(Sender: TObject);
    procedure FreqPortFMFastDownClick(Sender: TObject);
    procedure FreqModPMSlowUpClick(Sender: TObject);
    procedure FreqModPMSlowDownClick(Sender: TObject);
    procedure FreqModPMFastUpClick(Sender: TObject);
    procedure FreqModPMFastDownClick(Sender: TObject);
    procedure FreqPortPMSlowUpClick(Sender: TObject);
    procedure FreqPortPMSlowDownClick(Sender: TObject);
    procedure FreqPortPMFastUpClick(Sender: TObject);
    procedure FreqPortPMFastDownClick(Sender: TObject);
    procedure FreqPortAMSlowUpClick(Sender: TObject);
    procedure FreqPortAMSlowDownClick(Sender: TObject);
    procedure FreqPortAMFastUpClick(Sender: TObject);
    procedure FreqPortAMFastDownClick(Sender: TObject);
    procedure FreqModAMFastUpClick(Sender: TObject);
    procedure IndiceAMFastDownclick(Sender: TObject);
    procedure IndiceAMFastupclick(Sender: TObject);
    procedure IndiceAMSlowUpclick(Sender: TObject);
    procedure IndiceAMSlowDownclick(Sender: TObject);

    //procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButtonOFFClick(Sender: TObject);
    procedure SpeedButtonONClick(Sender: TObject);
    procedure DCoffsetSlowDownClick(Sender: TObject);
    procedure DCoffsetSlowUpClick(Sender: TObject);
    procedure DCoffsetFastUpClick(Sender: TObject);
    procedure DCoffsetFastDownClick(Sender: TObject);
    procedure AmpFastDownClick(Sender: TObject);
    procedure AmpFastUpClick(Sender: TObject);
    procedure AmpSlowUpClick(Sender: TObject);
    procedure AmpSlowDownClick(Sender: TObject);
    procedure AmpFMFastDownClick(Sender: TObject);
    procedure AmpFMFastUpClick(Sender: TObject);
    procedure AmpFMSlowUpClick(Sender: TObject);
    procedure AmpFMSlowDownClick(Sender: TObject);
    procedure AmpPMFastDownClick(Sender: TObject);
    procedure AmpPMFastUpClick(Sender: TObject);
    procedure AmpPMSlowUpClick(Sender: TObject);
    procedure AmpPMSlowDownClick(Sender: TObject);
    procedure FreqModAMSlowDownClick(Sender: TObject);
    procedure FreqModAMFastDownClick(Sender: TObject);
    procedure FreqModAMSlowUpClick(Sender: TObject);

    (*
     * procedures to make program work!!!!
     *)
 {   function  TesterSyntaxe            (Sender: TObject) : boolean;}
    function  TesterSyntaxeSansMessage (Sender: TObject) : boolean;
    function  TesterSyntaxeFM            (Sender: TObject) : boolean;
    function  TesterSyntaxePM            (Sender: TObject) : boolean;
    function  TesterSyntaxeAM            (Sender: TObject) : boolean;
    function  TesterSyntaxeRZ            (Sender: TObject) : boolean;
    function  TesterSyntaxeNRZM_aires( Sender : TObject ) : boolean;
    function  TesterSyntaxeASK( Sender : TObject ) : boolean;
    function  TestFrequence(Freqwanted:double):double;
      function tiragealeatoire(M:word):double;
    procedure ButtonM_airesClick         (Sender: TObject); {procedure to stopprogram}
    procedure M_airesBoxChange(Sender: TObject);
    //procedure FormClose                (Sender: TObject; var Action: TCloseAction); {cosing program procedure}
    //procedure FormCreate(Sender: TObject);
    procedure ButtonPMclick(Sender: TObject);
    procedure ButtonFMclick(Sender: TObject);
    procedure ButtonAMClick(Sender: TObject);
    procedure ButtonRZbipolaireClick(Sender: TObject);
    procedure ButtonASKClick(Sender: TObject);
    procedure ButtonFSKClick(Sender: TObject);
    procedure ButtonPSKClick(Sender: TObject);
    procedure SetFreqPorteuseModNumboxChange(Sender: TObject);
    procedure AleatoireSymbole(Sender: TObject);
    procedure IndiceModFSKFastDownClick(Sender: TObject);
    procedure IndiceModFSKFastUpClick(Sender: TObject);
    procedure IndiceModFSKSlowDownClick(Sender: TObject);
    procedure IndiceModFSKSlowUpClick(Sender: TObject);
    procedure setindicemodFSKChange(Sender: TObject);
    procedure M_airesBoxASKChange(Sender: TObject);
    procedure SetFreqHorlogeModChange(Sender: TObject);
    procedure Image4Click(Sender: TObject);


      /////////////////////////////////////////MODULATIONS/////////////////////////// FIN





  private
    { Déclarations privées}
  public
    { Déclarations publiques}
    ///////////////////////////////////////////////// /MODULATIONS//////////////////
     Generateur : TGenerator;
     ///////////////////////////////////////////////// /MODULATIONS//////////////////
  end;

var
  FormGBF: TFormGBF;
  FuncGen:TWArray;
  GBF1Button:GBF_buttons;
  GBF2Button:GBF_buttons;
  // numod:boolean;
  Configuration:ConfigType;

  {$IFDEF Independant}
    {$IFDEF HS3}
  DLLSource      : array[0..255] of char;      // si HS3, ET, pas ds CABALAB!!
    {$ENDIF}
    GTI2:boolean;        //!!ds cabalab c varriables sont dclarée ds le projet  ??? a vérifier!!!!
    HS3 :boolean;
  {$ENDIF}

  erreur,Nmemoire,compteurNRZ,wAmpmemoire        : longint;
  UmaxGBF         : integer;


  ///////////////////////////////////////////MODULATIONS

    init0,init1           :double;
  Demarage:integer;
  GBF:GBFE;
      etatgbf:word;


  ///////////////////////////////////////////MODULATIONS


implementation

{$IFDEF CABALABin}     //GTI2 ou HS3
uses {principaloscillocaba,} UnitCabalab, UnitApropos, Unit_GBF_AWG_AM, Unit_GBF_AWG_modulation,spectrumFFT;
{$ENDIF}


{$R *.DFM}

procedure TFormGBF.FormCreate(Sender: TObject);
begin

   {$IFDEF Independant}   //GTI2 ou HS3
      {$IFDEF HS3}    // HS3

          GTI2:=false;
          HS3 :=true;

          StrPCopy( DLLSource, ExtractFilePath( Application.ExeName) +'HS3.dll'    ) ;
          DLLHandle := Loadlibrary(DLLSource);
          if DLLHandle = 0 then  showmessage('problème d''allocation mémoire lors du chargement de la DLL');
          RetrieveAllProcAddresses;
          InitInstrument ($308);   //valeur du HS3! !!!uniquement en morceaux détachés de CABALAB
      {$ENDIF}
      {$IFDEF GTI2}  // GTI2

          GTI2:=true;
          HS3 :=false;

          InitInstrument ($308);   //valeur du HS3! !!!uniquement en morceaux détachés de CABALAB
      {$ENDIF}
   {$ENDIF}


    if HS3  then UmaxGBF:=12 ;     //  !!ds cabalab c varriables sont dclarée ds le projet
    if GTI2 then UmaxGBF:=10 ;

    if GTI2 then
        begin
             bruit.Visible:=false;
             Label7.Visible:=false;
             SpeedButtonBRUIT.Visible:=false;
             Label39.Visible:=false;
        end;




   DecimalSeparator   :=   '.'  ;      //permet de fixer window sur le '.' comme séparateur décimal au leiu de ','

   if HS3 then
   begin
   ModulationAM.enabled:=true;
   ModulationAM.visible:=true;

   ModulationFM.enabled:=true;
   ModulationFM.visible:=true;

   ModulationPM.enabled:=true;
   ModulationPM.visible:=true;

   ModulationNum.enabled:=true;
   ModulationNum.visible:=true;
   end;


   if GTI2 then
   begin
   ModulationAM.enabled:=false;
   ModulationAM.visible:=false;

   ModulationFM.enabled:=false;
   ModulationFM.visible:=false;

   ModulationPM.enabled:=false;
   ModulationPM.visible:=false;

   ModulationNum.enabled:=false;
   ModulationNum.visible:=false;
   end;




   formGBF.Top:=0;
   formGBF.Left:=0;
  // form3.height:=480;
  // form3.width:=282;
   TabSheetParam.TabVisible:=false;
   TabSheetAM.TabVisible:=false;
   TabSheetFM.TabVisible:=false;
   TabSheetPM.TabVisible:=false;
   TabSheetNum.TabVisible:=false;

   GBF1Button.B_CalFreq[1]:=SpeedButton2;
   GBF1Button.B_CalFreq[2]:=SpeedButton3;
   GBF1Button.B_CalFreq[3]:=SpeedButton4;
   GBF1Button.B_CalFreq[4]:=SpeedButton5;
   GBF1Button.B_CalFreq[5]:=SpeedButton6;
   GBF1Button.B_CalFreq[6]:=SpeedButton7;
   GBF1Button.B_CalFreq[7]:=SpeedButton8;

   GBF1Button.B_CalSignal[1]:=SpeedButton1;
   GBF1Button.B_CalSignal[2]:=SpeedButton9;
   GBF1Button.B_CalSignal[3]:=SpeedButton10;
   GBF1Button.B_CalSignal[4]:=TTL;
   GBF1Button.B_CalSignal[5]:=DC;
   GBF1Button.B_CalSignal[6]:=bruit;

   GBF1Button.B_CalAmpl[1]:=SpeedButton11;
   GBF1Button.B_CalAmpl[2]:=SpeedButton12;
   GBF1Button.B_CalAmpl[3]:=SpeedButton13;

   GBF2Button.B_CalFreq[1]:=SpeedButton14;
   GBF2Button.B_CalFreq[2]:=SpeedButton27;
   GBF2Button.B_CalFreq[3]:=SpeedButton28;
   GBF2Button.B_CalFreq[4]:=SpeedButton29;
   GBF2Button.B_CalFreq[5]:=SpeedButton30;
   GBF2Button.B_CalFreq[6]:=SpeedButton32;
   GBF2Button.B_CalFreq[7]:=SpeedButton33;

   GBF2Button.B_CalSignal[1]:=SpeedButton24;
   GBF2Button.B_CalSignal[2]:=SpeedButton25;
   GBF2Button.B_CalSignal[3]:=SpeedButton26;
   GBF2Button.B_CalSignal[4]:=SpeedButton31;
   GBF2Button.B_CalSignal[5]:=SpeedButtonDC;
   GBF2Button.B_CalSignal[6]:=SpeedButtonBRUIT;

   GBF2Button.B_CalAmpl[1]:=SpeedButtonGBF2_0dB;
   GBF2Button.B_CalAmpl[2]:=SpeedButtonGBF2_20dB;
   GBF2Button.B_CalAmpl[3]:=SpeedButtonGBF2_40dB;

   ScrollBarAmpliGBF1.Max:=UmaxGBF*1000;            //position max des scrollbarres en fonction de GTI2 ou HS3
   ScrollBarOffsetGBF1.Max:=UmaxGBF*1000*2;
   ScrollBarAmpliGBF2.Max:=UmaxGBF*1000;
   ScrollBarOffsetGBF2.Max:=UmaxGBF*1000*2;

   ResetConfiguration(Sender);
   ValidationConfiguration(Sender);



   //////////////////////////////////////////////MODULATIONS
{   GroupBoxAM.Visible:=False;
 GroupBoxFM.Visible:=False;
 GroupBoxPM.Visible:=False;
 GroupBoxRZ.Visible:=False;
 GroupBoxNRZ.Visible:=False;
 GroupBoxModNum.Visible:=False;  }
 //ButtonFM.down:=False;
 Buttonsinusmod.Checked:=True;
 {ButtonRZbipolaire.down:=False;
 ButtonRZunipolaire.down:=False;
 ButtonM_aires.down:=False;
 ButtonASK.down:=False;
 ButtonFSK.down:=False;
 //ButtonPM.down:=False;
 ButtonPSK.down:=False; }
   //numod0.checked:=false;
      init0:=0;
      init1:=0;
   RadioButtonmodulantAM.checked:=False;
   RadioButtonmodulantFM.checked:=False ;
   RadioButtonmodulantFM.checked:=False;
   RadioButtonmodulantNum.checked:=False;

   GBF.signal:=0;
   GBF.Frequence:=1000;
   GBF.coef_freq:=1000;
   GBF.coef_amplitude:=1;
   GBF.amplitude:=5000;
   GBF.offset:=0;
   GBF.Symmetry:=50;
   //////////////////////////////////////////////MODULATIONS

   Randomize;
   
end;

procedure TFormGBF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Configuration.allume:=false;      //close : éteint
     SpeedButtonOFF.Down:=true;
     ValidationConfiguration_Interface(Sender);

     {$IFDEF Independant}     //GTI2 ou HS3
          Exitinstrument;
     {$ENDIF}

     {$IFDEF CABALABin}       //GTI2 ou HS3
          passif[2]:=true;
          Formcabalab.SpeedButtonGBF.down:=false;
          Formcabalab.GestionButtons(sender);
     {$ENDIF}

end;

procedure TFormGBF.SpeedButtonCABALABClick(Sender: TObject);
begin

    {$IFDEF CABALABin}       //GTI2 ou HS3
        FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
        FormCabaLab.BringToFront;
    {$ENDIF}
end;

procedure TFormGBF.Apropos2Click(Sender: TObject);
begin
    {$IFDEF CABALABin}      //GTI2 ou HS3
        FormApropos.Visible := true ;
        FormApropos.BringToFront;
    {$ENDIF}
end;



procedure TFormGBF.ResetConfiguration(Sender: TObject);
begin
      Configuration.allume:=false;      //démarrage: éteint

      Configuration.MODE:=1;           //Mode GBF_1

      Configuration.GBF_1_2_Signal:=1; //Sinus
      Configuration.Signal:=0;         //sinus convention dlldecl

      Configuration.GBF_1_2_Freq:=4;        //1k
      Configuration.coef_freq:=1000;   //div par 1000 scrollbarre
      Configuration.frequence:=1000;    //1k

      Configuration.GBF_1_2_DBAmplitude:=1;  //0dB
      Configuration.coef_amplitude:=1;       //0dB
      Configuration.amplitude:=5;            //5V

      Configuration.offset:=0;

      Configuration.Symmetry:=50;

      configuration.validationClavier:=false;
end;



procedure TFormGBF.RZBoxChange(Sender: TObject);
begin
  buttonRZunipolaireclick(sender);
end;

procedure TFormGBF.ValidationConfiguration(Sender: TObject);
begin
      if Configuration.MODE=1 then PageControl1.ActivePage:=TabSheetGBF;
      if Configuration.MODE=2 then PageControl1.ActivePage:=TabSheetParam;
      if Configuration.MODE=3 then PageControl1.ActivePage:=TabSheetAM;  //nom a modifier...
      if Configuration.MODE=4 then PageControl1.ActivePage:=TabSheetFM;
      if Configuration.MODE=5 then PageControl1.ActivePage:=TabSheetNum;
      if Configuration.MODE=6 then PageControl1.ActivePage:=TabSheetPM;

      if ( Configuration.MODE=1) or (Configuration.MODE=2 ) then
      begin
      GBF1Button.B_CalFreq[Configuration.GBF_1_2_Freq].down:=true;                //restet de position des Tbuttons GBF1
      GBF1Button.B_CalAmpl[Configuration.GBF_1_2_DBAmplitude].down:=true;
      GBF1Button.B_CalSignal[Configuration.GBF_1_2_Signal].down:=true;

      GBF2Button.B_CalFreq[Configuration.GBF_1_2_Freq].down:=true;                //restet de position des Tbuttons GBF2
      GBF2Button.B_CalAmpl[Configuration.GBF_1_2_DBAmplitude].down:=true;
      GBF2Button.B_CalSignal[Configuration.GBF_1_2_Signal].down:=true;


      ScrollBarFreqGBF1.position  :=round(1000*Configuration.frequence/Configuration.coef_freq);   //GBF1
      ScrollBarFreqGBF2.position  :=round(1000*Configuration.frequence/Configuration.coef_freq);   //GBF2

      ScrollBarAmpliGBF1.position :=ScrollBarAmpliGBF1.MAX-round(Configuration.amplitude*Configuration.coef_amplitude*1000);    //PB de l'origine a droite ou a gauche
      ScrollBarAmpliGBF2.position :=round(Configuration.amplitude*Configuration.coef_amplitude*1000);

      ScrollBarOffsetGBF1.position:=12000-round(1000*Configuration.offset);
      ScrollBarOffsetGBF2.position:=round(1000*Configuration.offset)+round(ScrollBarOffsetGBF2.MAX/2);

      ScrollBarSymmGBF1.position  :=round(10*Configuration.Symmetry) ;
      ScrollBarSymmGBF2.position  :=round(10*Configuration.Symmetry) ;


      ValidationConfiguration_Interface(Sender);// sinon probleme en retour de signaux modulations!!!!!!!!!!
      end;

      /////////////////////////////////////////////////////////MODULATIONS////////////////////////////////////////

      if Configuration.MODE=3 then  ButtonAMClick(sender);
      if Configuration.MODE=4 then  ButtonFMClick(sender);
      if Configuration.MODE=6 then  ButtonPMClick(sender);
      if Configuration.MODE=5 then
                                begin
                                  SignauxNumeriques.Down:=True;
                                  groupboxnum.Visible:=true;
                                  ButtonM_airesClick(sender);
                                end;
        //par défaut le premier ?!!!!!


      /////////////////////////////////////////////////////////MODULATIONS////////////////////////////////////////


end;

procedure TFormGBF.ValidationConfiguration_Interface(Sender: TObject);
var
  etatgbf:word;
begin

     if Configuration.allume=true and ( (Configuration.mode = 1) or (Configuration.mode = 2) ) then
     begin
          getFuncGenOutputOn(@ETATGBF);
          if etatgbf=0 then
          SetFuncGenOutputOn ( 1 ) ; // allume le gené

          SetFuncGenSignalType ( Configuration.signal         );

          SetFuncGenFrequency  ( @Configuration.frequence     );  // frequence  attention passage par adresse.

          if configuration.GBF_1_2_Signal=4 then   //TTL
          begin
               SetFuncGenAmplitude  ( 2.5 );
               SetFuncGenDCOffset   ( 2.5 );
               SetFuncGenSymmetry   ( 50  );
          end
          else
          begin                                   //pas TTL
               SetFuncGenAmplitude  ( Configuration.amplitude      );
               SetFuncGenDCOffset   ( Configuration.offset         );
               SetFuncGenSymmetry   ( Configuration.Symmetry       );

               getFuncGenFrequency  ( @Configuration.frequence );  //vérif de la fréquence reel/possible
              //getFuncGenAmplitude  ( Configuration.amplitude );
            //  getFuncGenDCOffset   ( @Configuration.offset         );    //pas définit sur GTI2 !!!!!
            //  getFuncGenSymmetry   ( @Configuration.Symmetry       );    //pas définit sur GTI2 !!!!!
          end;
     end
     else
     begin
       getFuncGenOutputOn(@ETATGBF);
          if etatgbf=0 then
          SetFuncGenOutputOn ( 1 ) ; // allume le gené

     end;

     if Configuration.allume=false then
     begin
          getFuncGenOutputOn(@ETATGBF);
          if etatgbf=1 then
          SetFuncGenOutputOn ( 0 ) ; // ettein le gené
     end;

     AffichageAfficheursGBF(Sender);
end;

procedure TFormGBF.PageControl1Change(Sender: TObject);
begin
     if PageControl1.ActivePage=TabSheetGBF   then Configuration.MODE:=1 ;
     if PageControl1.ActivePage=TabSheetParam then Configuration.MODE:=2 ;
     if PageControl1.ActivePage=TabSheetAM    then Configuration.MODE:=3 ;
     if PageControl1.ActivePage=TabSheetFM    then Configuration.MODE:=4 ;
     if PageControl1.ActivePage=TabSheetNum   then Configuration.MODE:=5 ;
     if PageControl1.ActivePage=TabSheetPM    then Configuration.MODE:=6 ;
     ValidationConfiguration(Sender);  //transferts des valeurs de réglages actuels entres les pages GBF1 et GBF2
end;

procedure TFormGBF.AffichageAfficheursGBF(Sender: TObject);
begin
    //GBF1
    //fréquence
     if Configuration.coef_freq<=100 then
     begin
         label1.caption:=floattostrf(Configuration.frequence,fffixed,5,3);
         label9.caption:='   Hz';
     end;
     if (Configuration.coef_freq>100) and (Configuration.coef_freq<=100000) then
     begin
         label1.caption:=floattostrf(Configuration.frequence/1000,fffixed,5,3);
         label9.caption:='kHz';
     end;
     if Configuration.coef_freq=1000000 then
     begin
         label1.caption:=floattostrf(Configuration.frequence/1000000,fffixed,5,3);
         label9.caption:='MHz';
     end;

    //GBF2
    //fréquence
    if Configuration.Frequence<1000 then
    begin
        Label28.caption:=floattostrf(Configuration.frequence,fffixed,5,3);
        label29.caption:='   Hz';
    end;
    if (Configuration.Frequence<=999900) and (Configuration.Frequence>=1000)  then
    begin
        Label28.caption:=floattostrf(Configuration.frequence/1000,fffixed,6,3);
        label29.caption:='kHz';
    end;
    if Configuration.Frequence>999900  then
    begin
        Label28.caption:=floattostrf(Configuration.frequence/1000000,fffixed,5,3);
        label29.caption:='MHz';
    end;

     //GBF2
    //amplitude
    if ((Configuration.amplitude/Configuration.coef_amplitude)<=1.2) then
    begin
        Label30.caption:=floattostrf((Configuration.amplitude*1000),fffixed,5,0);
        label31.caption:=' mV';                                                                  //origine : position de la scrollbar
    end;
    if ((Configuration.amplitude/Configuration.coef_amplitude)>1.2)  then
    begin
        Label30.caption:=floattostrf((Configuration.amplitude),fffixed,5,3);
        label31.caption:='  V';
    end;

     //GBF2
    //offset
    if (ABS(Configuration.offset)<=1) then
    begin
        Label33.caption:=floattostrf(Configuration.offset*1000,fffixed,5,0);
        label34.caption:=' mV';
    end;
    if (ABS(Configuration.offset)>1)  then
    begin
        Label33.caption:=floattostrf(Configuration.offset,fffixed,5,3);
        label34.caption:=' V';
    end;

     //GBF2
    //symmetry
    Label37.caption:=floattostrf(Configuration.symmetry,fffixed,5,2);
    Label38.caption:=' %';
end;

procedure TFormGBF.SpeedButton_ON_OFF_Click(Sender: TObject);
begin
     if sender=SpeedButtonON  then
     begin
          Configuration.allume:=true;
         Fenetre_spectre.buttonGBF.Visible:=true;
     end;

     if sender=SpeedButtonOFF then
     begin
          Configuration.allume:=false;
     end;



     if (Configuration.allume=true) and (PageControl1.ActivePage=TabSheetAM)  then
      begin
        ModanalogiquesClick(sender);
        if speedbuttonON.down=true then SetFuncGenOutputOn ( 1 ) ; // allumer le gené
      end;
     if (Configuration.allume=true) and (PageControl1.ActivePage=TabSheetFM)  then
      begin
        ButtonFMClick(sender);
        if speedbuttonON.down=true then SetFuncGenOutputOn ( 1 ) ; // allumer le gené
      end;
     if (Configuration.allume=true) and (PageControl1.ActivePage=TabSheetPM)  then
      begin
        ButtonPMClick(sender);
        SetFuncGenOutputOn ( 1 ) ; // allumer le gené
      end;
     if (Configuration.allume=true) and (PageControl1.ActivePage=TabSheetNum) then
     begin
    { if Numod0.checked=true then
      begin
       // ModNumclick(sender);

       { if buttonASK.Down=true then } //buttonASKclick(self);
        {if buttonFSK.Down=true then  buttonFSKclick(self);
        if buttonPSK.Down=true then  buttonPSKclick(self);  }
       // SetFuncGenOutputOn ( 1 )
    //  end
     //else
     // begin
        SignauxNumeriquesClick(sender){RIEN};
        SetFuncGenOutputOn ( 1 ) ;
     //end;
     end;
     if (Configuration.allume=true) {and ((PageControl1.ActivePage=TabSheetGBF) or (PageControl1.ActivePage=TabSheetParam))} then
     begin
     ValidationConfiguration_Interface(Sender);
     end;
     if (Configuration.allume=false) then
     begin


      ValidationConfiguration_Interface(Sender);

     end;
end;

procedure TFormGBF.AmpNumFastUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpNum.Text );
 if levelvalue<11.1 then
        GBF.amplitude:= levelvalue+1
 else GBF.amplitude:=12;
 setGeneAmpNum.Text := FloattoStr(GBF.amplitude);
 //if TesterSyntaxeSansMessage (self) then
        SetFuncGenAmplitude(GBF.amplitude);
// else
   //  begin
       // setGeneAmpNum.Text := FloattoStr(levelvalue);
    // end;
end;

procedure TFormGBF.AmpNumFastDownClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpNum.Text );
 if levelvalue>0.99 then GBF.amplitude:= levelvalue-1
 else  GBF.amplitude:= 0;
 SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)});
 setGeneAmpNum.Text := FloattoStr(GBF.amplitude);
end;


procedure TFormGBF.FrequenceClick(Sender: TObject);
begin
if configuration.validationClavier=false then
begin

     if  (sender=SpeedButton2) or  (sender=SpeedButton14) then begin Configuration.coef_freq:=1;         Configuration.GBF_1_2_Freq:=1; end;
     if  (sender=SpeedButton3) or  (sender=SpeedButton27) then begin Configuration.coef_freq:=10;        Configuration.GBF_1_2_Freq:=2; end;
     if  (sender=SpeedButton4) or  (sender=SpeedButton28) then begin Configuration.coef_freq:=100;       Configuration.GBF_1_2_Freq:=3; end;
     if  (sender=SpeedButton5) or  (sender=SpeedButton29) then begin Configuration.coef_freq:=1000;      Configuration.GBF_1_2_Freq:=4; end;
     if  (sender=SpeedButton6) or  (sender=SpeedButton30) then begin Configuration.coef_freq:=10000;     Configuration.GBF_1_2_Freq:=5; end;
     if  (sender=SpeedButton7) or  (sender=SpeedButton32) then begin Configuration.coef_freq:=100000;    Configuration.GBF_1_2_Freq:=6; end;
     if  (sender=SpeedButton8) or  (sender=SpeedButton33) then begin Configuration.coef_freq:=1000000;   Configuration.GBF_1_2_Freq:=7; end;

     if PageControl1.ActivePage =TabSheetGBF        then
     Configuration.frequence := Configuration.coef_freq*ScrollBarFreqGBF1.position/1000;

     if PageControl1.ActivePage=TabSheetParam then
     Configuration.frequence := Configuration.coef_freq*ScrollBarFreqGBF2.position/1000;

     ValidationConfiguration_Interface(Sender);
end;
end;

procedure TFormGBF.ScrollBarFreqGBF1_2Change(Sender: TObject);  //1_23 FM
begin
if configuration.validationClavier=false then
begin
     if sender=ScrollBarFreqGBF1        then
     Configuration.frequence := Configuration.coef_freq*ScrollBarFreqGBF1.position/1000;

     if sender=ScrollBarFreqGBF2 then
     Configuration.frequence := Configuration.coef_freq*ScrollBarFreqGBF2.position/1000;

     ValidationConfiguration_Interface(Sender);

end;
end;

procedure TFormGBF.ScrollBarAmpliGBFChange(Sender: TObject);
begin
if configuration.validationClavier=false then
begin
     if sender=ScrollBarAmpliGBF1 then
     begin
          configuration.amplitude:=((ScrollBarAmpliGBF1.MAX-ScrollBarAmpliGBF1.position)/configuration.coef_amplitude)/1000;
     end;

     if sender=ScrollBarAmpliGBF2 then
     begin
          configuration.amplitude:=(ScrollBarAmpliGBF2.position/configuration.coef_amplitude)/1000;
     end;

     ValidationConfiguration_Interface(Sender);

end;
end;

procedure TFormGBF.AmplitudeClick(Sender: TObject);
begin

if configuration.validationClavier=false then
begin
     // GBF.amplitude:=GBF.amplitude*GBF.coef_amplitude;

     if  (SpeedButton11=Sender) or  (SpeedButtonGBF2_0dB=Sender) then
     begin
          configuration.coef_amplitude     :=1;   //0db
          configuration.GBF_1_2_DBAmplitude:=1;
     end;

     if  (SpeedButton12=Sender) or (SpeedButtonGBF2_20dB=Sender) then
     begin
          configuration.coef_amplitude     :=10;
          configuration.GBF_1_2_DBAmplitude:=2;      //-20db
     end;

     if  (SpeedButton13=Sender) or (SpeedButtonGBF2_40dB=Sender) then
     begin
          configuration.coef_amplitude     :=100;
          configuration.GBF_1_2_DBAmplitude:=3;       //-40db
     end;


     if configuration.mode=1 then //GBF1
     configuration.amplitude:=((ScrollBarAmpliGBF1.MAX-ScrollBarAmpliGBF1.position)/configuration.coef_amplitude)/1000;
     if configuration.mode=2 then //GBF2
     configuration.amplitude:=(ScrollBarAmpliGBF2.position/configuration.coef_amplitude)/1000;

     ValidationConfiguration_Interface(Sender);

end;
end;



procedure TFormGBF.OffsetGBFChange(Sender: TObject);
begin
if configuration.validationClavier=false then
begin
     if sender=ScrollBarOffsetGBF1 then
     begin
          configuration.offset:= (ScrollBarAmpliGBF1.MAX-ScrollBarOffsetGBF1.position)/1000;
     end;

     if sender=ScrollBarOffsetGBF2 then
     begin
          configuration.offset:= (ScrollBarOffsetGBF2.position-ScrollBarAmpliGBF2.MAX)/1000;
     end;

     if sender=ButtonOffset_0 then
     begin
          ScrollBarOffsetGBF1.position:=12000;
     end;

     ValidationConfiguration_Interface(Sender);

end;
end;

procedure TFormGBF.SymmetryChange(Sender: TObject);
begin
if configuration.validationClavier=false then
begin
    if sender=ScrollBarSymmGBF1 then
    begin
        configuration.Symmetry:=ScrollBarSymmGBF1.position/10;
    end;

    if sender=ScrollBarSymmGBF2 then
    begin
        configuration.Symmetry:=ScrollBarSymmGBF2.position/10;
    end;

    if sender=Button_50_symm then
    begin
        ScrollBarSymmGBF1.position:=500;
        configuration.Symmetry:=50;
    end;

    ValidationConfiguration_Interface(Sender);
end;
end;


procedure TFormGBF.SIGNALClick(Sender: TObject);
begin
    if (sender=SpeedButton1) or (sender=SpeedButton24)      then   begin configuration.Signal:=0; configuration.GBF_1_2_Signal:=1; end;   //sinus
    if (sender=SpeedButton9) or (sender=SpeedButton25)      then   begin configuration.Signal:=2; configuration.GBF_1_2_Signal:=2; end;   //rectangle
    if (sender=SpeedButton10) or (sender=SpeedButton26)     then   begin configuration.Signal:=1; configuration.GBF_1_2_Signal:=3; end;   //triangle
    if (sender=SpeedButtonDC) or (sender=DC)                then   begin configuration.Signal:=3; configuration.GBF_1_2_Signal:=5; end;   //DC
    if (sender=SpeedButtonBRUIT) or (sender=bruit)          then   begin configuration.Signal:=4; configuration.GBF_1_2_Signal:=6; end;   //Bruit

    if (sender=TTL) or (sender=SpeedButton31)               then   begin configuration.Signal:=2; configuration.GBF_1_2_Signal:=4; end;   //TTL
    //RQ: pour le TTL les valeurs particulères des réglages sont générés par  ValidationConfiguration_Interface

    if (configuration.GBF_1_2_Signal=4) or (configuration.GBF_1_2_Signal=5)or (configuration.GBF_1_2_Signal=6) then
    begin      //remarque : fréquence tj visible
        if configuration.GBF_1_2_Signal=6 then   // bruit
        begin
            GroupBox4.Visible:=true;   //GBF  offset
            GroupBox9.Visible:=true;   //GBF2  offset
            GroupBox3.Visible:=true;         //GBF  amplitude
            GroupBoxAmplitude.Visible:=true; //GBF2 amplitude
            GroupBox5.Visible:=false;   //GBF  rapport cyclique
            GroupBox10.Visible:=false;  //GBF2 rapport cyclique
        end;
        if configuration.GBF_1_2_Signal=5 then   // DC
        begin
            GroupBox4.Visible:=false;   //GBF    offset
            GroupBox9.Visible:=false;   //GBF2   offset
            GroupBox3.Visible:=true;         //GBF  amplitude
            GroupBoxAmplitude.Visible:=true; //GBF2 amplitude
            configuration.offset:=0;
            GroupBox5.Visible:=false;   //GBF  rapport cyclique
            GroupBox10.Visible:=false;  //GBF2 rapport cyclique
        end;
        if configuration.GBF_1_2_Signal=4 then   //TTL
        begin
            GroupBox4.Visible:=false;   //GBF  offset
            GroupBox9.Visible:=false;   //GBF2  offset
            GroupBox3.Visible:=false;         //GBF  amplitude
            GroupBoxAmplitude.Visible:=false; //GBF2 amplitude
            GroupBox5.Visible:=false;   //GBF  rapport cyclique
            GroupBox10.Visible:=false;  //GBF2 rapport cyclique
        end;
    end
    else
    begin
         GroupBox4.Visible:=true;   //GBF  offset
         GroupBox9.Visible:=true;   //GBF2  offset
         GroupBox3.Visible:=true;         //GBF  amplitude
         GroupBoxAmplitude.Visible:=true; //GBF2 amplitude
         GroupBox5.Visible:=true;   //GBF  rapport cyclique
         GroupBox10.Visible:=true;  //GBF2 rapport cyclique
    end;

    ValidationConfiguration_Interface(Sender);
end;

////////////////////////////////////////////////
//valeur clavier utilisateur   : DEBUT       ///
////////////////////////////////////////////////

procedure TFormGBF.convertion(Edit:Tedit ;var syntaxe:boolean;var valeur:double);
var
//i:integer;
tempon:string;
begin
    syntaxe:=true;
    tempon:='';

   { for i:=1 to Length(Edit.Text) do
    begin
        // if  Edit.text[i]='.' then  tempon[i]:=',' else tempon[i]:=Edit.text[i];
        if  Edit.text[i]='.' then  Edit.text[i]:=',';
    end;
    }
    try
    begin
    //valeur:=strToFloat(tempon);
    valeur:=strToFloat(Edit.Text);
    end;
    except
    on EConvertError do syntaxe:=false;
    end;

    if syntaxe=false then
                      Edit.Text:='Syntaxe !'
                     else
                      Edit.Text:='Valeur ?';

    //re_focalisation
    PageControl1.setfocus ;    //permet de sortir du t EDIT si validation par clavier "enter" et donc obligation de click pour nouvel valeur...
end;

procedure TFormGBF.EditClick(Sender: TObject);
begin
   if sender=EditFrequence        then  EditFrequence.Text:='';
   if sender=EditAmplitude        then  EditAmplitude.Text:='';
   if sender=EditOffset           then  EditOffset.Text:='';
   if sender=EditRapportCyclique then  EditRapportCyclique.Text:='';

end;

procedure TFormGBF.VALIDER_GBF2_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_RETURN	 then
    begin
        ValidationValeursClick(Sender);
    end;
end;


procedure TFormGBF.ValidationValeursClick(Sender: TObject);
var
Syntaxe:boolean;
casenumber:integer;
retourValeur:double;
begin
   configuration.validationClavier:=true;

   if (sender=ButtonFreq     ) or (sender=EditFrequence)        then begin casenumber:=1;  convertion(EditFrequence      ,syntaxe,retourValeur);end;
   if (sender=ButtonAmplitude) or (sender=EditAmplitude)        then begin casenumber:=2;  convertion(EditAmplitude      ,syntaxe,retourValeur);end;
   if (sender=ButtonOffset   ) or (sender=EditOffset   )        then begin casenumber:=3;  convertion(EditOffset         ,syntaxe,retourValeur);end;
   if (sender=ButtonSymmetry ) or (sender=EditRapportCyclique ) then begin casenumber:=4;  convertion(EditRapportCyclique,syntaxe,retourValeur);end;

   if (syntaxe=true) then
   begin
   case casenumber of
                1 : if (retourValeur<=2000000) and (retourValeur>0) then
                              begin

                              configuration.frequence:=retourValeur;
                              //frequence:= GBF.frequence;
                              SetFuncGenFrequency ( @configuration.frequence );  // frequence /2 : attention passage par adresse.
                              getFuncGenFrequency  ( @configuration.frequence );  //vérif de la fréquence reelk
                              //GBF.Frequence:=frequence;
                              //re positionnement des calibres de fréquence et de la scrollbar
                              if (configuration.frequence<=2) then begin
                                                         configuration.coef_freq:=1;
                                                         configuration.GBF_1_2_Freq:=1;
                                                      end;
                              if (configuration.frequence>2) and (configuration.frequence<=20) then begin
                                                                              configuration.coef_freq:=10;
                                                                              configuration.GBF_1_2_Freq:=2;
                                                                        end;
                              if (configuration.frequence>20) and (configuration.frequence<=200) then begin
                                                                              configuration.coef_freq:=100;
                                                                              configuration.GBF_1_2_Freq:=3;
                                                                        end;
                              if (configuration.frequence>200) and (configuration.frequence<=2000) then begin
                                                                              configuration.coef_freq:=1000;
                                                                              configuration.GBF_1_2_Freq:=4;
                                                                        end;
                              if (configuration.frequence>2000) and (configuration.frequence<=20000) then begin
                                                                              configuration.coef_freq:=10000;
                                                                              configuration.GBF_1_2_Freq:=5;
                                                                        end;
                              if (configuration.frequence>20000) and (configuration.frequence<=200000) then begin
                                                                              configuration.coef_freq:=100000;
                                                                              configuration.GBF_1_2_Freq:=6;
                                                                        end;
                              if (configuration.frequence>200000) and (configuration.frequence<=2000000) then begin
                                                                              configuration.coef_freq:=1000000;
                                                                              configuration.GBF_1_2_Freq:=7;
                                                                        end;
                              //re positionnemet Tbutton
                              GBF2Button.B_CalFreq  [configuration.GBF_1_2_Freq].Down      :=true;
                              //re positionnemet de la scrollbar
                              ScrollBarFreqGBF2.position:=round(1000*configuration.frequence/configuration.coef_freq);

                              end
                              else EditFrequence.Text:='<>Limites';


                2 :  if (retourValeur<=UmaxGBF) and (retourValeur>=0) then
                                begin
                                configuration.amplitude:=retourValeur;  //l'utilisateur rentre des valeurs en V





                         {       if (configuration.amplitude>(UmaxGBF/10))                  then
                                                                                  begin
                                                                                  configuration.coef_amplitude:=1;
                                                                                  configuration.GBF_1_2_DBAmplitude:=1;
                                                                                  //configuration.amplitude:=configuration.amplitude;
                                                                                  end;
                                if (configuration.amplitude>(UmaxGBF/100)) and (configuration.amplitude<=(UmaxGBF/10)) then
                                                                                  begin
                                                                                  configuration.coef_amplitude:=10;
                                                                                  configuration.GBF_1_2_DBAmplitude:=2;
                                                                                  configuration.amplitude:=configuration.amplitude*10;
                                                                                  end;
                                if (configuration.amplitude<=(UmaxGBF/100))               then
                                                                                  begin
                                                                                  configuration.coef_amplitude:=100;
                                                                                  configuration.GBF_1_2_DBAmplitude:=3;
                                                                                  configuration.amplitude:=configuration.amplitude*100;
                                                                                  end;
                          }
                            //re positionnemet de la scrollbar
                                //if ScrollBarAmpliGBF2.position<>round(configuration.amplitude*configuration.coef_amplitude*1000)then
                                 ScrollBarAmpliGBF2.position:=round(configuration.amplitude*configuration.coef_amplitude*1000);


                            //re positionnemet Tbutton 0 -20 -40 dB
                                 // if  GBF2Button.B_CalAmpl[configuration.GBF_1_2_DBAmplitude].down=false then

                                //  GBF2Button.B_CalAmpl[configuration.GBF_1_2_DBAmplitude].down:=true;



                                end
                                else EditAmplitude.Text:='<>Limites';


               3 :  if (retourValeur<=UmaxGBF) and (retourValeur>=-UmaxGBF) then
                                begin
                                   configuration.offset:=retourValeur;
                                   SetFuncGenDCOffset ( configuration.offset );

                                  //re positionnemet de la scrollbar
                                   ScrollBarOffsetGBF2.position:=round(ScrollBarOffsetGBF2.MAX/2+configuration.offset*1000);

                                end
                                else EditOffset.Text:='<>Limites';


               4  :  if (retourValeur<=100) and (retourValeur>=0) then
                                begin
                                    configuration.symmetry:=retourValeur;
                                    SetFuncGenSymmetry ( configuration.Symmetry );
                                    //re positionnemet de la scrollbar
                                    ScrollBarSymmGBF2.position:=round(10*configuration.Symmetry);

                                end
                                else EditRapportCyclique.Text:='<>Limites';

   end;//cases
   end;//if (syntaxe=true)

   ValidationConfiguration_Interface(Sender);
   //AffichageAfficheursGBF(sender);
   configuration.validationClavier:=false;
end;

////////////////////////////////////////////////
//valeur clavier utilisateur : FIN           ///
////////////////////////////////////////////////




procedure TFormGBF.ControleParamClick(Sender: TObject);     //GBF2
begin
    if ControleParam.Checked=false then
    begin
    ControleParam.Checked:=true;
    TabSheetParam.TabVisible:=true;
    end
    else
    begin
    ControleParam.Checked:=false;
    TabSheetParam.TabVisible:=false;
    end;
end;


procedure TFormGBF.SignauxNumeriquesClick(Sender: TObject);
begin
Modnum.Down:=False;
SignauxNumeriques.Down:=True;
groupboxmodnum.Visible:=False;
groupboxnum.Visible:=True;
groupboxRZ.Visible:=False;
groupboxNRZ.Visible:=True;
ButtonM_airesClick(sender);
Nmemoire:=0;
wAmpmemoire:=32767;
//numod0.Checked:=False;
end;


procedure TFormGBF.ModAnalogiquesClick(Sender: TObject);
begin
ButtonAMclick(sender);
    init0:=0;
    init1:=0;
 //   buttonsinusmod.Checked:=true;
end;

procedure TFormGBF.ModNumClick(Sender: TObject);
begin
Modnum.Down:=True;
SignauxNumeriques.Down:=False;
groupboxnum.Visible:=False;
groupboxmodnum.Visible:=true;
groupboxRZ.Visible:=False;
groupboxNRZ.Visible:=False;
if ButtonPSK.down=true then  buttonPSKclick(sender)
  else if ButtonFSK.down=true then buttonFSKclick(sender)
    else ButtonASKclick(sender);
end;

procedure TFormGBF.ModulationAMClick(Sender: TObject);    //enabeld false pour l'instant
begin
    if ModulationAM.Checked=false then
    begin
    ModulationAM.Checked:=true;
    TabSheetAM.TabVisible:=true;
    end
    else
    begin
    ModulationAM.Checked:=false;
    TabSheetAM.TabVisible:=false;
    end;
end;

procedure TFormGBF.ModulationFMClick(Sender: TObject);  //enabeld false pour l'instant
begin
    if ModulationFM.Checked=false then
    begin
    ModulationFM.Checked:=true;
    TabSheetFM.TabVisible:=true;
    end
    else
    begin
    ModulationFM.Checked:=false;
    TabSheetFM.TabVisible:=false;
    end;
end;

procedure TFormGBF.ModulationPMClick(Sender: TObject);  //enabeld false pour l'instant
begin
    if ModulationPM.Checked=false then
    begin
    ModulationPM.Checked:=true;
    TabSheetPM.TabVisible:=true;
    end
    else
    begin
    ModulationPM.Checked:=false;
    TabSheetPM.TabVisible:=false;
    end;
end;



procedure TFormGBF.ModulationNumClick(Sender: TObject);   //enabeld false pour l'instant
begin
    if ModulationNum.Checked=false then
    begin
    ModulationNum.Checked:=true;
    TabSheetNum.TabVisible:=true;
    end
    else
    begin
    ModulationNum.Checked:=false;
    TabSheetNum.TabVisible:=false;
    end;

end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                           MODULATIONS JG                                                                                        //
//                                                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFormGBF.Image1Click(Sender: TObject);
begin
Form_GBF_AWG_AM.visible:=true;
Form_GBF_AWG_AM.BringToFront;
end;

procedure TFormGBF.Image4Click(Sender: TObject);
begin
Form_GBF_AWG_modulation.visible:=true;
Form_GBF_AWG_modulation.BringToFront;
end;

procedure TFormGBF.IndiceAMFastDownclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModAM.Text );
 if value>0.101 then GBF.indice:= value-0.1
 else  GBF.indice:= 0;
 buttonAMclick(sender);

   SetIndiceModAM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceAMFastupclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModAM.Text );
 if value<10 then GBF.indice:= value+0.1
 else  GBF.indice:= 10;
 buttonAMclick(sender);

   SetIndiceModAM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceAMSlowDownclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModAM.Text );
 if value>0.011 then GBF.indice:= value-0.01
 else  GBF.indice:= 0;
 buttonAMclick(sender);

   SetIndiceModAM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceAMSlowUpclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModAM.Text );
 if value<10 then GBF.indice:= value+0.01
 else  GBF.indice:= 10;
 buttonAMclick(sender);

   SetIndiceModAM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.FreqModAMFastUpClick(Sender: TObject);

var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteAM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;

  SetFreqModulanteAM.Text:=FloatToStr(lFreq);
  buttonAMclick(self);
end;

procedure TFormGBF.FreqModAMFastDownClick(Sender: TObject);

var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteAM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;


         SetFreqModulanteAM.Text:=FloatToStr(lFreq);
         buttonAMclick(self);
end;


procedure TFormGBF.FreqModAMSlowDownClick(Sender: TObject);

var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteAM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;


        SetFreqModulanteAM.Text:=FloatToStr(lFreq);
buttonAMclick(self);
end;



procedure TFormGBF.FreqModAMSlowUpClick(Sender: TObject);

var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteAM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqModulanteAM.Text:=FloatToStr(lFreq);
         buttonAMclick(self);
end;


procedure TFormGBF.FreqPortAMFastDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseAM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;
        SetFreqPorteuseAM.Text:=FloatToStr(lFreq);
        buttonAMclick(self);
end;

procedure TFormGBF.FreqPortAMFastUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat(  SetFreqPorteuseAM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;
  SetFreqPorteuseAM.Text:=FloatToStr(lFreq);
  buttonAMclick(self);
end;

procedure TFormGBF.FreqPortAMSlowDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseAM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;
        SetFreqPorteuseAM.Text:=FloatToStr(lFreq);
buttonAMclick(self);
end;

procedure TFormGBF.FreqPortAMSlowUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseAM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqPorteuseAM.Text:=FloatToStr(lFreq);
         buttonAMclick(self);
end;


procedure TFormGBF.IndiceFMFastDownclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModFM.Text );
 if value>1 then GBF.indice:= value-1
 else  GBF.indice:= 0;
 buttonFMclick(sender);

   SetIndiceModFM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceFMFastUpclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModFM.Text );
 if value<1000 then GBF.indice:= value+1
 else  GBF.indice:= 1000;
 buttonFMclick(sender);

   SetIndiceModFM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceFMSlowDownclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModFM.Text );
 if value>0.1 then GBF.indice:= value-0.1
 else  GBF.indice:= 0;
 buttonFMclick(sender);

   SetIndiceModFM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceFMSlowUpclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModFM.Text );
 if value<1000 then GBF.indice:= value+0.1
 else  GBF.indice:= 1000;
 buttonFMclick(sender);

   SetIndiceModFM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndiceModFSKFastDownClick(Sender: TObject);
var lFreq,lFreqOld : double;
begin
        lFreqOld := StrToFloat( SetFreqPorteuseModNum.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;
         SetFreqPorteuseModNum.Text:=FloatToStr(lFreq);
if ButtonASK.down=true then  buttonASKclick(self);
if ButtonFSK.down=true then  buttonFSKclick(self);
if ButtonPSK.down=true then  buttonPSKclick(self);

end;

procedure TFormGBF.IndiceModFSKFastUpClick(Sender: TObject);
var lFreq,lFreqOld : double;
begin
         lFreqOld := StrToFloat( SetFreqPorteuseModNum.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;
                SetFreqPorteuseModNum.Text:=FloatToStr(lFreq);
if ButtonASK.down=true then  buttonASKclick(self);
if ButtonFSK.down=true then  buttonFSKclick(self);
if ButtonPSK.down=true then  buttonPSKclick(self);

end;

procedure TFormGBF.IndiceModFSKSlowDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseModNum.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;
        SetFreqPorteuseModNum.Text:=FloatToStr(lFreq);
if ButtonASK.down=true then  buttonASKclick(self);
if ButtonFSK.down=true then  buttonFSKclick(self);
if ButtonPSK.down=true then  buttonPSKclick(self);
end;

procedure TFormGBF.IndiceModFSKSlowUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat(SetFreqPorteuseModNum.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqPorteuseModNum.Text:=FloatToStr(lFreq);
if ButtonASK.down=true then  buttonASKclick(self);
if ButtonFSK.down=true then  buttonFSKclick(self);
if ButtonPSK.down=true then  buttonPSKclick(self);
end;

procedure TFormGBF.FreqModFMFastDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteFM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;
         SetFreqModulanteFM.Text:=FloatToStr(lFreq);
         buttonFMclick(self);
end;

procedure TFormGBF.FreqModFMFastUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteFM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;
  SetFreqModulanteFM.Text:=FloatToStr(lFreq);
  buttonFMclick(self);
end;

procedure TFormGBF.FreqModFMSlowDownClick(Sender: TObject);

var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteFM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;
        SetFreqModulanteFM.Text:=FloatToStr(lFreq);
buttonFMclick(self);
end;

procedure TFormGBF.FreqModFMSlowUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulanteFM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqModulanteFM.Text:=FloatToStr(lFreq);
         buttonFMclick(self);
end;


procedure TFormGBF.FreqPortFMFastDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseFM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;
        SetFreqPorteuseFM.Text:=FloatToStr(lFreq);
         buttonFMclick(self);
end;

procedure TFormGBF.FreqPortFMFastUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat(  SetFreqPorteuseFM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;
   SetFreqPorteuseFM.Text:=FloatToStr(lFreq);
  buttonFMclick(self);
end;

procedure TFormGBF.FreqPortFMSlowDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseFM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;
        SetFreqPorteuseFM.Text:=FloatToStr(lFreq);
buttonFMclick(self);
end;

procedure TFormGBF.FreqPortFMSlowUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteuseFM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqPorteuseFM.Text:=FloatToStr(lFreq);
         buttonFMclick(self);
end;




procedure TFormGBF.IndicePMFastDownclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModPM.Text );
 if value>1 then GBF.indice:= value-1
 else  GBF.indice:= 0;
 buttonPMclick(sender);

   SetIndiceModPM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndicePMFastUpclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModPM.Text );
 if value<1000 then GBF.indice:= value+1
 else  GBF.indice:= 1000;
 buttonPMclick(sender);

   SetIndiceModPM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndicePMSlowDownclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModPM.Text );
 if value>0.1 then GBF.indice:= value-0.1
 else  GBF.indice:= 0;
 buttonPMclick(sender);

   SetIndiceModPM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.IndicePMSlowUpclick(Sender: TObject);
var   value:double;
begin
value:= StrToFloat( SetIndiceModPM.Text );
 if value<1000 then GBF.indice:= value+0.1
 else  GBF.indice:= 1000;
 buttonPMclick(sender);

   SetIndiceModPM.Text:= FloattoStr(GBF.indice);
end;

procedure TFormGBF.FreqModPMFastDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulantePM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;
         SetFreqModulantePM.Text:=FloatToStr(lFreq);
         buttonPMclick(sender);
end;

procedure TFormGBF.FreqModPMFastUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulantePM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;
  SetFreqModulantePM.Text:=FloatToStr(lFreq);
  buttonPMclick(sender);
end;

procedure TFormGBF.FreqModPMSlowDownClick(Sender: TObject);

var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulantePM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;
        SetFreqModulantePM.Text:=FloatToStr(lFreq);
buttonPMclick(sender);
end;

procedure TFormGBF.FreqModPMSlowUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqModulantePM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqModulantePM.Text:=FloatToStr(lFreq);
         buttonPMclick(sender);
end;


procedure TFormGBF.FreqPortPMFastDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteusePM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-500000 else
           if lFreq > 100000 then lFreq:=lFreq-50000  else
            if lFreq > 10000 then lFreq:=lFreq-5000  else
             if lFreq > 1000 then lFreq:=lFreq-500  else
               lFreq:=lFreq-50;
        SetFreqPorteusePM.Text:=FloatToStr(lFreq);
         buttonPMclick(sender);
end;

procedure TFormGBF.FreqPortPMFastUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat(  SetFreqPorteusePM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+100 else
           if lFreq < 10000 then lFreq:=lFreq+1000  else
            if lFreq < 100000 then lFreq:=lFreq+10000  else
             if lFreq < 500000 then lFreq:=lFreq+100000  else
               lFreq:=lFreq+500000;
   SetFreqPorteusePM.Text:=FloatToStr(lFreq);
  buttonPMclick(self);
end;

procedure TFormGBF.FreqPortPMSlowDownClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteusePM.Text);
          lFreq:=lFreqOld;
          if lFreq > 1000000 then lFreq:=lFreq-10000 else
           if lFreq > 100000 then lFreq:=lFreq-1000  else
            if lFreq > 10000 then lFreq:=lFreq-100  else
             if lFreq > 1000 then lFreq:=lFreq-10  else
               lFreq:=lFreq-5;
        SetFreqPorteusePM.Text:=FloatToStr(lFreq);
buttonPMclick(sender);
end;

procedure TFormGBF.FreqPortPMSlowUpClick(Sender: TObject);
var lFreq,lFreqOld : double;

begin
        lFreqOld := StrToFloat( SetFreqPorteusePM.Text);
          lFreq:=lFreqOld;
          if lFreq < 1000 then lFreq:=lFreq+10 else
           if lFreq < 10000 then lFreq:=lFreq+100  else
            if lFreq < 100000 then lFreq:=lFreq+1000  else
             if lFreq < 500000 then lFreq:=lFreq+10000  else
               lFreq:=lFreq+50000;
         SetFreqPorteusePM.Text:=FloatToStr(lFreq);
         buttonPMclick(sender);
end;
//procedure TFormGBF.SpeedButton35Click(Sender: TObject);
//begin
//FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
//FormCabaLab.BringToFront;
//end;


procedure TFormGBF.SpeedButtonOFFClick(Sender: TObject);            //1_23xxx
begin
  getFuncGenOutputOn(@ETATGBF);
  if etatgbf=1 then
  begin
     {SpeedButton15Click(Sender);}
     SetFuncGenOutputOn ( 0 ) ; // éteindre le gené
  end;

end;

procedure TFormGBF.SpeedButtonONClick(Sender: TObject);             //1_23xxx
begin
 getFuncGenOutputOn(@ETATGBF);
 if etatgbf=0 then
 begin
  {   SetFuncGenFrequency ( @GBF.Frequence );  // frequence  attention passage par adresse.
     SetFuncGenSignalType ( GBF.signal ) ; // mode

    // SetFuncGenAmplitude (  GBF.amplitude/1000);   // amplitude
     SetFuncGenAmplitude(GBF.amplitude/(1000*GBF.coef_amplitude));    //1_37FM

     SetFuncGenDCOffset ( GBF.offset );  //Offset
     SetFuncGenSymmetry ( GBF.Symmetry );} // signal symétrie

     SetFuncGenOutputOn ( 1 ) ; // allumer le gené
  {   getFuncGenFrequency  ( @frequence );
     setfreqsinus.text:=floattostr(frequence/1000);}
 end;
end;



procedure TFormGBF.SetFreqHorlogeModChange(Sender: TObject);
begin
if ButtonASK.down=true then  buttonASKclick(self);
if ButtonFSK.down=true then  buttonFSKclick(self);
if ButtonPSK.down=true then  buttonPSKclick(self);
end;

procedure TFormGBF.SetFreqPorteuseModNumboxChange(Sender: TObject);
var Freq1,
    Freq3    : dword;
begin
  if setFreqHorlogebox.Text = '' then
  begin
    setFreqHorlogebox.Text := IntToStr(1); {the large values are clock freqs in Hz}
  end; { if }
  Freq1 := StrToInt( setFreqHorlogebox.Text);
  if Freq1 < 1 then
  begin
    Freq1 := 1;
  end; { if }
  Freq3 := GetMaxSampleFrequency;
  if Freq1 > Freq3 then
  begin
    Freq1 := Freq3;
  end; { if }
  SetFuncGenFrequency(@Freq1);

   if ButtonASK.down=True then ButtonASKclick(sender)
else if ButtonFSK.down=True then ButtonFSKclick(sender )
else if ButtonPSK.down=True then ButtonPSKclick(sender );

end;


procedure TFormGBF.setindicemodFSKChange(Sender: TObject);
begin

if ButtonFSK.down=true then  buttonFSKclick(self);
if ButtonPSK.down=true then  buttonPSKclick(self);
end;

procedure TFormGBF.AmpSlowDownClick(Sender: TObject);
var levelvalue: double;
begin
 levelvalue:= StrToFloat( SetgeneAmp.Text );
 if levelvalue>0.09 then GBF.amplitude:= levelvalue-0.1
 else  GBF.amplitude:= 0;
   SetFuncGenAmplitude(GBF.amplitude*2{/(1000*GBF.coef_amplitude)});
   setGeneAmp.Text := FloattoStr(GBF.amplitude);
end;

procedure TFormGBF.AmpFMSlowDownClick(Sender: TObject);
var levelvalue: double;
begin
 levelvalue:= StrToFloat( SetgeneAmpFM.Text );
 if levelvalue>0.09 then GBF.amplitude:= levelvalue-0.1
 else  GBF.amplitude:= 0;
   SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)});
   setGeneAmpFM.Text := FloattoStr(GBF.amplitude);
end;

procedure TFormGBF.AmpPMSlowDownClick(Sender: TObject);
var levelvalue: double;
begin
 levelvalue:= StrToFloat( SetgeneAmpPM.Text );
 if levelvalue>0.09 then GBF.amplitude:= levelvalue-0.1
 else  GBF.amplitude:= 0;
   SetFuncGenAmplitude(GBF.amplitude*2{/(1000*GBF.coef_amplitude)});
   setGeneAmpPM.Text := FloattoStr(GBF.amplitude);
end;

procedure TFormGBF.AmpNumSlowDownClick(Sender: TObject);
var levelvalue: double;
begin
 levelvalue:= StrToFloat( SetgeneAmpNum.Text );
 if levelvalue>0.09 then GBF.amplitude:= levelvalue-0.1
 else  GBF.amplitude:= 0;
   SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)});
   setGeneAmpNum.Text := FloattoStr(GBF.amplitude);
end;

{ TForm1.SpinButton2DownClick }

procedure TFormGBF.AmpSlowUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmp.Text );
 if levelvalue<6 then GBF.amplitude:= levelvalue+0.1
 else GBF.amplitude:=6;

    setGeneAmp.Text := FloatToStr(GBF.amplitude);
   // if TesterSyntaxeSansMessage (self) then
    SetFuncGenAmplitude(GBF.amplitude*2{/(1000*GBF.coef_amplitude)}) ;
   // else
   // begin
   //   setGeneAmp.Text := FloattoStr(levelvalue);
  //  end;
end; { TForm1.SpinButton2UpClick }


procedure TFormGBF.AmpFMSlowUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpFM.Text );
 if levelvalue<12 then GBF.amplitude:= levelvalue+0.1
 else GBF.amplitude:=12;

    setGeneAmpFM.Text := FloatToStr(GBF.amplitude);
    if TesterSyntaxeSansMessage (self) then
    SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)})
    else
    begin
      setGeneAmpFM.Text := FloattoStr(levelvalue);
    end;
end; { TForm1.SpinButton2UpClick }

procedure TFormGBF.AmpPMSlowUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpPM.Text );
 if levelvalue<12 then GBF.amplitude:= levelvalue+0.1
 else GBF.amplitude:=12;

    setGeneAmpPM.Text := FloatToStr(GBF.amplitude);
    if TesterSyntaxeSansMessage (self) then
    SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)})
    else
    begin
      setGeneAmpPM.Text := FloattoStr(levelvalue);
    end;
end; { TForm1.SpinButton2UpClick }

procedure TFormGBF.AmpNumSlowUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpNum.Text );
 if levelvalue<12 then GBF.amplitude:= levelvalue+0.1
 else GBF.amplitude:=12;
    setGeneAmpNum.Text := FloattoStr(GBF.amplitude);
    if TesterSyntaxeSansMessage (self) then
    SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)})
    else
    begin
      setGeneAmpNum.Text := FloattoStr(levelvalue);
    end;
end; { TForm1.SpinButton2UpClick }

procedure TFormGBF.AmpFastDownClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmp.Text );
 if levelvalue>0.99 then GBF.amplitude:= levelvalue-1
 else  GBF.amplitude:= 0;

   {if TesterSyntaxeSansMessage (self) then
        begin    }
   SetFuncGenAmplitude(GBF.amplitude*2{/(1000*GBF.coef_amplitude)});
{        end;      }
   setGeneAmp.Text := FloattoStr(GBF.amplitude);
end; { TForm1.SpinButton3DownClick }

procedure TFormGBF.AmpFastUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmp.Text );
if levelvalue<5.1 then
        GBF.amplitude:= levelvalue+1
          else GBF.amplitude:=6;
        setGeneAmp.Text := FloattoStr(GBF.amplitude);
        if TesterSyntaxeSansMessage (self) then
        SetFuncGenAmplitude(GBF.amplitude*2)
          else
          begin
          setGeneAmp.Text := FloattoStr(levelvalue);
          end;
end; { TForm1.SpinButton3UpClick }

procedure TFormGBF.AmpFMFastDownClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpFM.Text );
 if levelvalue>0.99 then GBF.amplitude:= levelvalue-1
 else  GBF.amplitude:= 0;

   {if TesterSyntaxeSansMessage (self) then
        begin    }
   SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)});
{        end;      }
   setGeneAmpFM.Text := FloattoStr(GBF.amplitude);
end; { TForm1.SpinButton3DownClick }

procedure TFormGBF.AmpFMFastUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpFM.Text );
if levelvalue<11.1 then
        GBF.amplitude:= levelvalue+1
          else GBF.amplitude:=12;
        setGeneAmpFM.Text := FloattoStr(GBF.amplitude);
        if TesterSyntaxeSansMessage (self) then
        SetFuncGenAmplitude(GBF.amplitude)
          else
          begin
          setGeneAmpFM.Text := FloattoStr(levelvalue);
          end;
end; { TForm1.SpinButton3UpClick }


procedure TFormGBF.AmpPMFastDownClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpPM.Text );
 if levelvalue>0.99 then GBF.amplitude:= levelvalue-1
 else  GBF.amplitude:= 0;

   {if TesterSyntaxeSansMessage (self) then
        begin    }
   SetFuncGenAmplitude(GBF.amplitude{/(1000*GBF.coef_amplitude)});
{        end;      }
   setGeneAmpPM.Text := FloattoStr(GBF.amplitude);
end; { TForm1.SpinButton3DownClick }

procedure TFormGBF.AmpPMFastUpClick(Sender: TObject);
var levelvalue : double;
begin
 levelvalue:= StrToFloat( SetgeneAmpPM.Text );
if levelvalue<11.1 then
        GBF.amplitude:= levelvalue+1
          else GBF.amplitude:=12;
        setGeneAmpPM.Text := FloattoStr(GBF.amplitude);
        if TesterSyntaxeSansMessage (self) then
        SetFuncGenAmplitude(GBF.amplitude)
          else
          begin
          setGeneAmpPM.Text := FloattoStr(levelvalue);
          end;
end; { TForm1.SpinButton3UpClick }


procedure TFormGBF.DCoffsetSlowDownClick(Sender: TObject);
var levelvalue: double;
begin
   levelvalue:= StrToFloat( SetgeneDCoffset.Text );
   if (levelvalue>-10) then
   GBF.offset:= levelvalue-0.1
   else  levelvalue:=-10;
   if GBF.offset<0.01 then
      begin
        if GBF.offset>-0.01 then GBF.offset:=0;
      end;
   setGeneDCoffset.Text := FloattoStr(GBF.offset);
   setGeneDCoffsetFM.Text := FloattoStr(GBF.offset);
   setGeneDCoffsetPM.Text := FloattoStr(GBF.offset);
   setGeneDCoffsetNum.Text := FloattoStr(GBF.offset);
   if TesterSyntaxeSansMessage (self) then
   SetFuncGenDCOffset ( GBF.offset )
   else
   begin
    setGeneDCoffset.Text := FloattoStr(levelvalue);
    setGeneDCoffsetFM.Text := FloattoStr(levelvalue);
    setGeneDCoffsetPM.Text := FloattoStr(levelvalue);
    setGeneDCoffsetNum.Text := FloattoStr(levelvalue);
   end;
end; { TForm1.SpinButton2DownClick }

procedure TFormGBF.DCoffsetSlowUpClick(Sender: TObject);
var levelvalue : double;
begin
    levelvalue:= StrToFloat( SetgeneDCoffset.Text );
    if (levelvalue<10) then
    GBF.offset:= levelvalue+0.1
    else levelvalue:=10;
       if GBF.offset<0.01 then
      begin
        if GBF.offset>-0.01 then GBF.offset:=0;
      end;
    setGeneDCoffset.Text := FloattoStr(GBF.offset);
    setGeneDCoffsetFM.Text := FloattoStr(GBF.offset);
    setGeneDCoffsetPM.Text := FloattoStr(GBF.offset);
    setGeneDCoffsetNum.Text := FloattoStr(GBF.offset);
    if TesterSyntaxeSansMessage (self) then
    SetFuncGenDCOffset ( GBF.offset )
    else
    begin
      setGeneDCoffset.Text := FloattoStr(levelvalue);
      setGeneDCoffsetFM.Text := FloattoStr(levelvalue);
      setGeneDCoffsetPM.Text := FloattoStr(levelvalue);
      setGeneDCoffsetNum.Text := FloattoStr(levelvalue);
    end;
end;

procedure TFormGBF.Debit_NRZ_change(Sender: TObject);
begin
ButtonM_airesclick(sender);
end;

procedure TFormGBF.Debit_RZ_change(Sender: TObject);
begin
if ButtonRZbipolaire.down=true then ButtonRZbipolaireclick(sender);
if ButtonRZunipolaire.down=true then ButtonRZunipolaireclick(sender);
if Buttonbiphase.down=true then Buttonbiphaseclick(sender);
end;
{ TForm1.SpinButton2UpClick }

procedure TFormGBF.DCoffsetFastDownClick(Sender: TObject);
var levelvalue : double;
begin
   levelvalue:= StrToFloat( SetgeneDCoffset.Text );
   if (levelvalue>-9.1) then
   GBF.offset:= levelvalue-1
   else  levelvalue:=-10;
   setGeneDCoffset.Text := FloattoStr(GBF.offset);
   setGeneDCoffsetFM.Text := FloattoStr(GBF.offset);
   setGeneDCoffsetPM.Text := FloattoStr(GBF.offset);
   setGeneDCoffsetNum.Text := FloattoStr(GBF.offset);
   if TesterSyntaxeSansMessage (self) then
   SetFuncGenDCOffset ( GBF.offset )
   else
   begin
    setGeneDCoffset.Text := FloattoStr(levelvalue);
    setGeneDCoffsetFM.Text := FloattoStr(levelvalue);
    setGeneDCoffsetPM.Text := FloattoStr(levelvalue);
    setGeneDCoffsetNum.Text := FloattoStr(levelvalue);
   end;
end; { TForm1.SpinButton3DownClick }

procedure TFormGBF.DCoffsetFastUpClick(Sender: TObject);
var levelvalue : double;
begin
    levelvalue:= StrToFloat( SetgeneDCoffset.Text );
    if (levelvalue<9.1) then
    GBF.offset:= levelvalue+1
    else levelvalue:=10;
    setGeneDCoffset.Text := FloattoStr(GBF.offset);
    setGeneDCoffsetFM.Text := FloattoStr(GBF.offset);
    setGeneDCoffsetPM.Text := FloattoStr(GBF.offset);
    setGeneDCoffsetNum.Text := FloattoStr(GBF.offset);
    if TesterSyntaxeSansMessage (self) then
    SetFuncGenDCOffset ( GBF.offset )
    else
    begin
      setGeneDCoffset.Text := FloattoStr(levelvalue);
      setGeneDCoffsetFM.Text := FloattoStr(levelvalue);
      setGeneDCoffsetPM.Text := FloattoStr(levelvalue);
      setGeneDCoffsetNum.Text := FloattoStr(levelvalue);
    end;
end; { TForm1.SpinButton3UpClick }


procedure TFormGBF.M_airesBoxASKChange(Sender: TObject);
begin
if buttonASK.Down=true then buttonASKclick(self);
if buttonFSK.Down=true then buttonFSKclick(self);
if buttonPSK.Down=true then buttonPSKclick(self);
end;

procedure TFormGBF.M_airesBoxChange(Sender: TObject);
{var M1: dword;}
begin
  buttonM_aires.Click;
end; { TForm1.M_airesBoxChange }


function TFormGBF.TesterSyntaxeRZ( Sender : TObject ) : boolean;

begin
  Result := True;

  if ( SetFreqHorlogeBox.Text <> '' ) then
  begin
  try
    Generateur.dFreqHorloge:=StrToFloat(setfreqHorlogebox.text);
  if ( Generateur.dFreqHorloge < 0.1 ) or ( Generateur.dFreqHorloge > 50000000 ) then
  begin
    ShowMessage( sErrFreqHorlogeOutRange );
    Result := False;
  end; { if }
  except
   ShowMessage( sErrFreqHorlogeOutRange );
   Result := False;
  end;
  end
  else
    begin
      SetFreqHorlogeBox.Text:='';
      Result := False;
    end;
 {*
  * Valeur Possible pour l'amplitude du générateur ?
  *}
 { if ( SetGeneAmp.Text <> '' ) then
  begin
    try   }
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
{    except
      ShowMessage( sErrGenAmpl );
      Result := False;
    end;
  end
  else
    SetGeneAmp.Text:='1';

  if ( SetGeneDCOffset.Text <> '' ) then
  begin
    try}
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
{    except
      ShowMessage( sErrGenOffs );
      Result := False;
    end;
  end
  else
    SetGeneDCOffset.Text:='0';

  if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
  begin
    ShowMessage( sErrGenAmplRange );
    Result := False;
  end { if }
 { else
  begin
   {*
    * Valeur Possible pour l'offset du générateur
    *}
    if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
       ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
    begin
      ShowMessage( sErrGenAmplRange2 );
      Result := False;
    end; { if }
  {end; { else }
end; { function TForm1.TesterSyntaxeRZ }

 function  TFormGBF.TestFrequence(Freqwanted:double):double;
 begin
   if Freqwanted >= 0.0381 then
              begin
              if Freqwanted >= 0.0610 then
              if Freqwanted >= 0.2441 then
              if Freqwanted >= 0.9765 then
              if Freqwanted >= 3.9062 then
              if Freqwanted >= 7.8125 then
              if Freqwanted >= 15.625 then
              if Freqwanted >= 32.15 then
              if Freqwanted >= 62.5 then
              if Freqwanted >= 125 then
                if Freqwanted >= 250 then
                  if Freqwanted >= 500 then
                    if Freqwanted >= 1000 then
                      if Freqwanted >= 2500 then
                        if Freqwanted >= 5000 then result:=50e6
                        else result:= 25e6
                      else result:=10e6
                    else result:=5e6
                  else result:=2500000
                else  result:=1250000
                else result:=625000
                else result:=321500
                else result:=156250
                else result:=78125
                else result:=39062
                else result:=9765
                else result:=2441
                else result:=610
               end
              else result:=38.1;
 end;

function TFormGBF.TesterSyntaxeNRZM_aires( Sender : TObject ) : boolean;

begin
  Result := True;

  if ( SetFreqHorloge.Text <> '' ) then
  begin
  try
    Generateur.dFreqHorloge:=StrToFloat(setfreqHorloge.text);
  if ( Generateur.dFreqHorloge < 0.1 ) or ( Generateur.dFreqHorloge > 50000000 ) then
  begin
    ShowMessage( sErrFreqHorlogeOutRange );
    Result := False;
  end; { if }
  except
   ShowMessage( sErrFreqHorlogeOutRange );
   Result := False;
  end;
  end
  else
    begin
      SetFreqHorloge.Text:='';
      Result := False;
    end;
 {*
  * Valeur Possible pour l'amplitude du générateur ?
  *}
 { if ( SetGeneAmp.Text <> '' ) then
  begin
    try    }
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
{    except
      ShowMessage( sErrGenAmpl );
      Result := False;
    end;
  end
  else
    SetGeneAmp.Text:='1';

  if ( SetGeneDCOffset.Text <> '' ) then
  begin
    try   }
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
 {   except
      ShowMessage( sErrGenOffs );
      Result := False;
    end;
  end
  else
    SetGeneDCOffset.Text:='0';

  if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
  begin
    ShowMessage( sErrGenAmplRange );
    Result := False;
  end { if }
  {else
  begin
   {*
    * Valeur Possible pour l'offset du générateur
    *}
    if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
       ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
    begin
      ShowMessage( sErrGenAmplRange2 );
      Result := False;
    end; { if }
  {end; { else }


end; { function TForm1.TesterSyntaxeNRZM_aires }



function TFormGBF.TesterSyntaxeFM( Sender : TObject ) : boolean;

begin
  Result := True;

  if ( SetFreqPorteuseFM.Text <> '' ) then
    begin
      try
        Generateur.dFreqPorteuse := StrToFloat( SetFreqPorteuseFM.Text );
        if ( Generateur.dFreqPorteuse < 0.1 ) or ( Generateur.dFreqPorteuse > 20000000 ) then
        begin
          ShowMessage( sErrFreqPorteuseOutRange );
          Result := False;
        end; { if }
      except
        ShowMessage( sErrFreqPort );
        Result := False;
      end; { except }
    end
  else
    begin
      SetFreqPorteuseFM.Text:='';
      Result := False;
    end;

  if ( SetFreqModulanteFM.Text <> '' ) then
  begin
    try
      Generateur.dFreqModulation:=StrToFloat(setfreqmodulanteFM.text);
      if ( Generateur.dFreqModulation < 0.01 ) or ( Generateur.dFreqModulation > 2000000 ) then
        begin
          ShowMessage( sErrFreqModulationOutRange );
          Result := False;
        end; { if }
    except
      ShowMessage( sErrFreqMod );
      Result := False;
    end;
  end
  else
    begin
      SetFreqModulanteFM.Text:='';
      Result := False;
    end;

  if ( SetIndiceModFM.Text <> '' ) then
  begin
    try
      Generateur.dIndiceModulation:=StrToFloat(setIndiceModFM.text);
      if{ ( Generateur.dIndiceModulation < 0.01 ) or} ( Generateur.dIndiceModulation > 20000 ) then
        begin
          ShowMessage( sErrIndiceModulationOutRange );
          Result := False;
        end; { if }
    except
      ShowMessage( sErrIndiceModulation );
      Result := False;
    end;
  end
  else
    begin
      SetIndiceModFM.Text:='';
      Result := False;
    end;
  if Generateur.dFreqModulation > Generateur.dFreqPorteuse then
  begin
    ShowMessage( sErrFreqPorteuseFreqModulation );
    Result := False;
  end;
 {*
  * Valeur Possible pour l'amplitude du générateur ?
  *}
{  if ( SetGeneAmp.Text <> '' ) then
  begin
    try}
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
{    except
      ShowMessage( sErrGenAmpl );
      Result := False;
    end;
  end
  else
    SetGeneAmp.Text:='1';

  if ( SetGeneDCOffset.Text <> '' ) then
  begin
    try  }
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
{    except
      ShowMessage( sErrGenOffs );
      Result := False;
    end;
  end
  else
    SetGeneDCOffset.Text:='0';

  if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
  begin
    ShowMessage( sErrGenAmplRange );
    Result := False;
  end { if }
 { else
  begin
   {*
    * Valeur Possible pour l'offset du générateur
    *}
    if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
       ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
    begin
      ShowMessage( sErrGenAmplRange2 );
      Result := False;
    end; { if }
{  end; { else }
end; { function TForm1.TesterSyntaxeFM }

function TFormGBF.TesterSyntaxePM( Sender : TObject ) : boolean;

begin
  Result := True;

  if ( SetFreqPorteusePM.Text <> '' ) then
    begin
      try
        Generateur.dFreqPorteuse := StrToFloat( SetFreqPorteusePM.Text );
        if ( Generateur.dFreqPorteuse < 0.1 ) or ( Generateur.dFreqPorteuse > 20000000 ) then
        begin
          ShowMessage( sErrFreqPorteuseOutRange );
          Result := False;
        end; { if }
      except
        ShowMessage( sErrFreqPort );
        Result := False;
      end; { except }
    end
  else
    begin
      SetFreqPorteusePM.Text:='';
      Result := False;
    end;

  if ( SetFreqModulantePM.Text <> '' ) then
  begin
    try
      Generateur.dFreqModulation:=StrToFloat(setfreqmodulantePM.text);
      if ( Generateur.dFreqModulation < 0.01 ) or ( Generateur.dFreqModulation > 2000000 ) then
        begin
          ShowMessage( sErrFreqModulationOutRange );
          Result := False;
        end; { if }
    except
      ShowMessage( sErrFreqMod );
      Result := False;
    end;
  end
  else
    begin
      SetFreqModulantePM.Text:='';
      Result := False;
    end;

  if ( SetIndiceModPM.Text <> '' ) then
  begin
    try
      Generateur.dIndiceModulation:=StrToFloat(setIndiceModPM.text);
      if{ ( Generateur.dIndiceModulation < 0.01 ) or} ( Generateur.dIndiceModulation > 20000 ) then
        begin
          ShowMessage( sErrIndiceModulationOutRange );
          Result := False;
        end; { if }
    except
      ShowMessage( sErrIndiceModulation );
      Result := False;
    end;
  end
  else
    begin
      SetIndiceModPM.Text:='';
      Result := False;
    end;
  if Generateur.dFreqModulation > Generateur.dFreqPorteuse then
  begin
    ShowMessage( sErrFreqPorteuseFreqModulation );
    Result := False;
  end;
 {*
  * Valeur Possible pour l'amplitude du générateur ?
  *}
 { if ( SetGeneAmp.Text <> '' ) then
  begin
    try    }
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
{    except
      ShowMessage( sErrGenAmpl );
      Result := False;
    end;
  end
  else
    SetGeneAmp.Text:='1';

  if ( SetGeneDCOffset.Text <> '' ) then
  begin
    try }
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
{    except
      ShowMessage( sErrGenOffs );
      Result := False;
    end;
  end
  else
    SetGeneDCOffset.Text:='0';

  if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
  begin
    ShowMessage( sErrGenAmplRange );
    Result := False;
  end { if }
 { else
  begin
   {*
    * Valeur Possible pour l'offset du générateur
    *}
    if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
       ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
    begin
      ShowMessage( sErrGenAmplRange2 );
      Result := False;
    end; { if }
  {end; { else }
end; { function TForm1.TesterSyntaxePM }


function TFormGBF.TesterSyntaxeAM( Sender : TObject ) : boolean;

begin
  Result := True;

  if ( SetFreqPorteuseAM.Text <> '' ) then
    begin
      try
        Generateur.dFreqPorteuse := StrToFloat( SetFreqPorteuseAM.Text );
        if ( Generateur.dFreqPorteuse < 1 ) or ( Generateur.dFreqPorteuse > 20000000 ) then
        begin
          ShowMessage( sErrFreqPorteuseOutRange );
          Result := False;
        end; { if }
      except
        ShowMessage( sErrFreqPort );
        Result := False;
      end; { except }
    end
  else
    begin
      SetFreqPorteuseAM.Text:='';
      Result := False;
    end;

  if ( SetFreqModulanteAM.Text <> '' ) then
  begin
    try
      Generateur.dFreqModulation:=StrToFloat(setfreqmodulanteAM.text);
      if ( Generateur.dFreqModulation < 0.01 ) or ( Generateur.dFreqModulation > 2000000 ) then
        begin
          ShowMessage( sErrFreqModulationOutRange );
          Result := False;
        end; { if }
    except
      ShowMessage( sErrFreqMod );
      Result := False;
    end;
  end
  else
    begin
      SetFreqModulanteAM.Text:='';
      Result := False;
    end;

  if ( SetIndiceModAM.Text <> '' ) then
  begin
    try
      Generateur.dIndiceModulation:=StrToFloat(setIndiceModAM.text);
      if{ ( Generateur.dIndiceModulation < 0.01 ) or} ( Generateur.dIndiceModulation > 5000 ) then
        begin
          ShowMessage( sErrIndiceModulationOutRange );
          Result := False;
        end; { if }
    except
      ShowMessage( sErrIndiceModulation );
      Result := False;
    end;
  end
  else
    begin
      SetIndiceModAM.Text:='';
      Result := False;
    end;
  if Generateur.dFreqModulation > Generateur.dFreqPorteuse then
  begin
    ShowMessage( sErrFreqPorteuseFreqModulation );
    Result := False;
  end;
 {*
  * Valeur Possible pour l'amplitude du générateur ?
  *}
{  if ( SetGeneAmp.Text <> '' ) then
  begin
    try}
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
{    except
      ShowMessage( sErrGenAmpl );
      Result := False;
    end;
  end
  else
    SetGeneAmp.Text:='1';

  if ( SetGeneDCOffset.Text <> '' ) then
  begin
    try}
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
{    except
      ShowMessage( sErrGenOffs );
      Result := False;
    end;
  end
  else
    SetGeneDCOffset.Text:='0';

  if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
  begin
    ShowMessage( sErrGenAmplRange );
    Result := False;
  end { if }
 { else
  begin
   {*
    * Valeur Possible pour l'offset du générateur
    *}
    if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
       ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
    begin
      ShowMessage( sErrGenAmplRange2 );
      Result := False;
    end; { if }
  {end; { else }
end; { function TForm1.TesterSyntaxeAM }


function  TFormGBF.TesterSyntaxeASK( Sender : TObject ) : boolean;
 begin
  Result := True;

  if ( SetFreqPorteuseModNum.Text <> '' ) then
    begin
      try
        Generateur.dFreqPorteuse := StrToFloat( SetFreqPorteuseModNum.Text );
        if ( Generateur.dFreqPorteuse < 0.1 ) or ( Generateur.dFreqPorteuse > 20000000 ) then
        begin
          ShowMessage( sErrFreqPorteuseOutRange );
          Result := False;
        end; { if }
      except
        ShowMessage( sErrFreqPort );
        Result := False;
      end; { except }
    end
  else
    begin
      SetFreqPorteuseModNum.Text:='';
      Result := False;
    end;


  if ( SetFreqHorloge.Text <> '' ) then
  begin
  try
    Generateur.dFreqHorloge:=StrToFloat(setfreqHorloge.text);
  if ( Generateur.dFreqHorloge < 0.1 ) or ( Generateur.dFreqHorloge > 50000000 ) then
  begin
    ShowMessage( sErrFreqHorlogeOutRange );
    Result := False;
  end; { if }
  except
   ShowMessage( sErrFreqHorlogeOutRange );
   Result := False;
  end;
  end
  else
    begin
      SetFreqHorloge.Text:='';
      Result := False;
    end;
  if Generateur.dFreqHorloge > Generateur.dFreqPorteuse then
  begin
    ShowMessage( sErrFreqPorteuseFreqModulation );
    Result := False;
  end;
 {*
  * Valeur Possible pour l'amplitude du générateur ?
  *}
  {if ( SetGeneAmp.Text <> '' ) then
  begin
    try }
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
   { except
      ShowMessage( sErrGenAmpl );
      Result := False;
    end;
  end
  else
    SetGeneAmp.Text:='1';

  if ( SetGeneDCOffset.Text <> '' ) then
  begin
    try    }
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
{    except
      ShowMessage( sErrGenOffs );
      Result := False;
    end;
  end
  else
    SetGeneDCOffset.Text:='0';
 }
 { if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
  begin
    ShowMessage( sErrGenAmplRange );
    Result := False;
  end { if }
  {else
  begin
   {*
    * Valeur Possible pour l'offset du générateur
    *}
    if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
       ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
    begin
      ShowMessage( sErrGenAmplRange2 );
      Result := False;
    end; { if }
  {end; { else }
end;

function TFormGBF.TesterSyntaxeSansMessage( Sender : TObject) : boolean;
{* DESCRIPTION
 *   This routine checks whether user input values are within the limits.
 *   Does NOT display a message when input is fault.
 * INPUT
 *   -
 * OUTPUT
 *   returnvalue : True = all values within limits, False = error
 *}
begin
  Result := True;
 { if ( SetGeneAmp.Text <> '' ) and ( SetGeneDCOffset.Text <> '' ) then
  begin
   {*
    * syntaxe Amplitude du générateur
    *}
  {  try}
      Generateur.dAmplitude := StrToFloat( SetgeneAmp.Text );
{    except
      Result := False;
    end; { except }
   {*
    * syntaxe Offset du générateur
    *}
 {   try}
      Generateur.dDCOffset := StrToFloat( SetGeneDCOffset.Text );
{    except
      Result := False;
    end; { except }
   {*
    * Valeur Possible pour l'amplitude du générateur ?
    *}
    if ( Generateur.dAmplitude < 0 ) or ( Generateur.dAmplitude > 12 ) then
    begin
//    ShowMessage( sErrGenAmplRange );
     { SetgeneAmp.Text := '';}
      Result          := False;
    end { if }
    else
    begin
     {*
      * Valeur Possible pour l'offset du générateur  ?
      *}
      if ( Generateur.dDCOffset - Generateur.dAmplitude < -12 ) or
         ( Generateur.dDCOffset + Generateur.dAmplitude >  12 ) then
      begin
//      ShowMessage( sErrGenAmplRange2 );
       { SetGeneDCOffset.Text := '';}
        Result               := False;
      end; { if }
    end; { else }
 { end { then }
 { else
  begin
    Result := False;
  end; { else }
end; { function TForm1.TesterSyntaxeSansMessage }



procedure TFormGBF.ButtonPMclick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,Nmemoireport   : dword;
      wAmp,compteurmod     : word;
      rFreq,rFreqPort,rFreqMod,rFreqMin,Freqreelle   : double;
      m,tau,tetaenv,tetaport    :real;
begin
if buttonsquaremod3.Checked=true then GroupBox14.Visible:=False else GroupBox14.Visible:=True;
GroupBoxPM.visible:=True;
     m:=StrtoFloat( SetIndiceModPM.Text);
     rFreq := 50e6;
     rFreqPort :=  StrtoFloat( SetFreqPorteusePM.Text) {50e6};
     rFreqMod :=  StrtoFloat( SetFreqModulantePM.Text) ;
     rFreqMin:= rFreqPort-m*rFreqMod;

  FillFuncGenMemory   (NrSamples, @FuncGenArray);

  if testersyntaxePM(self) then
 begin
      rfreq:=TestFrequence(rfreqMin);
          SetfuncGenFrequency( @rFreq);
          GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;
  // if buttonTTLmod2.Checked=true then  groupboxindiceFM.visible:=false
  // else  groupboxindiceFM.visible:=True;


  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end;
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;
  Nmemoireport:=0;
  compteurport:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaport:=(dwIndex1-Nmemoireport)*2*pi*rFreqport/Freqreelle;
        if tetaport>2*pi then
          begin
            repeat
              tetaport:=tetaport-2*pi;
              Nmemoireport:=dwindex1;
              compteurport:=compteurport+1;
            until tetaport<=2*pi;
          end;
  end;
  rFreqport:= compteurport* rFreqMod/compteurmod;

 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;
        tau{enveloppe[dwIndex1+1]}:= cos(tetaenv);
        enveloppe[dwIndex1+1]:=sin(tetaenv);
        if buttonsquaremod3.Checked=true then
          begin
            if enveloppe[dwIndex1+1]>0 then
              begin
                tau{enveloppe[dwIndex1+1]}:=pi/2;
                enveloppe[dwIndex1+1]:=1;
              end
            else
              begin
                tau{enveloppe[dwIndex1+1]}:=-pi/2;
                enveloppe[dwIndex1+1]:=-1;
              end;
          end;
        if buttonTTLmod3.Checked=true then
          begin
            if enveloppe[dwIndex1+1]>0 then
              begin
                tau{enveloppe[dwIndex1+1]}:=pi;
                enveloppe[dwIndex1+1]:=1;
              end
            else
              begin
                tau{enveloppe[dwIndex1+1]}:=0;
                enveloppe[dwIndex1+1]:=0;
              end;
            m:=1;
          end;

        enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]*m;
        tetaport:=2*pi*dwIndex1*rFreqport/Freqreelle;

    wAmp:=32767+trunc(32767*sin(tetaport+m*tau{enveloppe[dwIndex1+1]})) ;
    FuncGenArray[dwIndex1] := wAmp;


  end; { for }
     Labelporteuse3.Caption:='fréquence réelle = '+inttostr(round(rFreqport))+' Hz';
    Labelmodulante3.caption:='fréquence réelle = '+inttostr(round(rFreqmod))+' Hz';

  SetFuncGenAmplitude ( StrtoFloat( SetGeneAmpPM.Text)       );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetPM.Text)        );
  SetFuncGenSymmetry  ( 50        );

end;

  FillFuncGenMemory   (NrSamples, @FuncGenArray);

end;

procedure TFormGBF.ButtonFMclick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,Nmemoireport  : dword;
      wAmp,compteurmod      : word;
      rFreq ,rFreqPort,rFreqMod,rFreqMin,Freqreelle   : double;
      m,tau,tetaenv,tetaport  :real;
begin

GroupBoxFM.visible:=True;
     m:=StrtoFloat( SetIndiceModFM.Text);
     rFreq := 50e6;
     rFreqPort :=  StrtoFloat( SetFreqPorteuseFM.Text) {50e6};
     rFreqMod :=  StrtoFloat( SetFreqModulanteFM.Text) ;
     rFreqMin:= rFreqPort-m*rFreqMod;

  FillFuncGenMemory   (NrSamples, @FuncGenArray);

  if testersyntaxeFM(self) then
 begin

     rfreq:=TestFrequence(rfreqMin);
          SetfuncGenFrequency( @rFreq);
          GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;

  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end;
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;
  Nmemoireport:=0;
  compteurport:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaport:=(dwIndex1-Nmemoireport)*2*pi*rFreqport/Freqreelle;
        if tetaport>2*pi then
          begin
            repeat
              tetaport:=tetaport-2*pi;
              Nmemoireport:=dwindex1;
              compteurport:=compteurport+1;
            until tetaport<=2*pi;
          end;
  end;
  rFreqport:= compteurport* rFreqMod/compteurmod;

 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;
        tau{enveloppe[dwIndex1+1]}:= sin(tetaenv);
        enveloppe[dwIndex1+1]:=tau;
        if buttonsquaremod2.Checked=true then
          begin
            if tau{enveloppe[dwIndex1+1]}>0 then
              begin
                tau{enveloppe[dwIndex1+1]}:=tetaenv;
                enveloppe[dwIndex1+1]:=1;
              end
            else
              begin
                tau{enveloppe[dwIndex1+1]}:=-tetaenv;
                enveloppe[dwIndex1+1]:=-1;
              end;
          end;
        if buttonTTLmod2.Checked=true then
          begin
            if tau{enveloppe[dwIndex1+1]}>0 then
              begin
                tau{enveloppe[dwIndex1+1]}:=tetaenv;
                enveloppe[dwIndex1+1]:=1;
              end
            else
              begin
                tau{enveloppe[dwIndex1+1]}:=0;
                enveloppe[dwIndex1+1]:=0;
              end;
            m:=1;
          end;

        enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]*m;
        tetaport:=2*pi*dwIndex1*rFreqport/Freqreelle;

    wAmp:=32767+trunc(32767*sin(tetaport+m*tau{enveloppe[dwIndex1+1]})) ;
    FuncGenArray[dwIndex1] := wAmp;

  end; { for }
      Labelporteuse2.Caption:='fréquence réelle = '+inttostr(round(rFreqport))+' Hz';
    Labelmodulante2.caption:='fréquence réelle = '+inttostr(round(rFreqmod))+' Hz';

  SetFuncGenAmplitude ( StrtoFloat( SetGeneAmpFM.Text)      );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetFM.Text)        );
  SetFuncGenSymmetry  ( 50        );

end;

  FillFuncGenMemory   (NrSamples, @FuncGenArray);

end;


procedure TFormGBF.ButtonAMClick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,Nmemoireport  : dword;
      wAmp,compteurmod  : word;
      rFreq,rFreqPort,rFreqMod,Freqreelle  : double;
      m ,Amplitude,indice,tetaenv,tetaport    :real;

begin


m:=StrtoFloat( SetIndiceModAM.Text);
if m>1 then indice:=1/m
else indice:=1;

       FillFuncGenMemory   (NrSamples, @FuncGenArray);

//rFreq := 50e6;
rFreqPort :=  StrtoFloat( SetFreqPorteuseAM.Text) {50e6};
rFreqMod :=  StrtoFloat( SetFreqModulanteAM.Text) ;
if testersyntaxeAM(self) then
begin
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;
   if buttonTTLmod.Checked=true then  groupboxindiceAM.visible:=false
   else  groupboxindiceAM.visible:=True;
  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; { for }
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;
  Nmemoireport:=0;
  compteurport:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaport:=(dwIndex1-Nmemoireport)*2*pi*rFreqport/Freqreelle;
        if tetaport>2*pi then
          begin
            repeat
              tetaport:=tetaport-2*pi;
              Nmemoireport:=dwindex1;
              compteurport:=compteurport+1;
            until tetaport<=2*pi;
          end;
  end;
  rFreqport:= compteurport* rFreqMod/compteurmod;

 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if buttonsquaremod.Checked=true then
        begin
          if enveloppe[dwIndex1+1]>0 then  enveloppe[dwIndex1+1]:=1
          else enveloppe[dwIndex1+1]:=-1;

        end;
          if buttonTTLmod.Checked=true then
        begin
          if enveloppe[dwIndex1+1]>0 then m:=1
          else m:=-1;
          enveloppe[dwIndex1+1]:=1;
        end;
        enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]*m;
        tetaport:=2*pi*dwIndex1*rFreqport/Freqreelle;
        wAmp:=round(32767+16383*indice*(1+{m*}enveloppe[dwIndex1+1])*sin(tetaport));
        FuncGenArray[dwIndex1+1] := wAmp;
  end; { for }
    Labelporteuse.Caption:='fréquence réelle = '+inttostr(round(rFreqport))+' Hz';
    Labelmodulante.caption:='fréquence réelle = '+inttostr(round(rFreqmod))+' Hz';

  Amplitude:= StrtoFloat( SetGeneAmp.Text)*2;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffset.Text)          );
  SetFuncGenSymmetry  ( 50        );
end;

     FillFuncGenMemory   (NrSamples, @FuncGenArray);
   //   GroupBoxAM.Visible:=True;
end;


procedure TFormGBF.ButtonRZbipolaireClick(Sender: TObject);

 var   dwIndex1,compteurport,Nmemoiremod,wAmp  : dword;
      compteurmod,MM: word;
      rFreq,rFreqMod,Freqreelle  : double;
      Amplitude,tetaenv    :real;
      envmem,numbermem :double;
      i,j : integer;
      ValeurAleatoire : double;
begin
if GroupBoxNRZ.Visible=True then GroupBoxNRZ.Visible:=False;
if GroupBoxRZ.Visible=False then GroupBoxRZ.Visible:=True;
Buttonbiphase.down:=False;
ButtonRZunipolaire.down:=False;
ButtonM_aires.down:=False;
RZbox.Visible:=false;
RZlabel.Visible:=false;
ButtonRZbipolaire.down:=True;


rFreqMod :=  StrtoFloat( SetFreqHorlogeBox.Text) ;
MM:= 2;

if testersyntaxeRZ(self)  then
  begin

//SE : Choix Freq du tiepie ( 64 bits/1024 points par période //  16 points par bit )
  FillFuncGenMemory   (1024, @FuncGenArray); // pour passer en mode DDS
  rFreq := rFreqMod/512  ;
  SetfuncGenFrequency( @rFreq);
  //GetfuncGenFrequency( @rFreq);
  //showmessage(floattostr(rfreq));

  // remplissage tableau
     for i := 0 to 512 - 1 do
     begin
     FuncGenArray[2*i] := trunc(32767+32767*tiragealeatoire(MM));
     FuncGenArray[2*i+1] := trunc(32767);
     end;

  // Réglage TiePie
  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (1024, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );

 end;





{ procedure Jacques
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;

  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; :: for
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;

  compteurport:=0;
  tetaenv:=-2*pi*rFreqMod/Freqreelle;
  envmem:=1;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=tetaenv+2*pi*rFreqMod/Freqreelle;
        if tetaenv>2*pi then tetaenv:=tetaenv-2*pi;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;
         if tetaenv<=pi then
         begin
         if tetaenv>(pi/2) then enveloppe[dwIndex1+1]:=0;
         end;
         if tetaenv>=(3*pi/2) then enveloppe[dwIndex1+1]:=0;
  FuncGenArray[dwIndex1+1] := trunc(32767+32767*enveloppe[dwIndex1+1]);

  end; // for
    wAmp:=round(ln(MM)/ln(2));
    FreqExacteRZ.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' bps';

  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );
end;

     FillFuncGenMemory   (NrSamples, @FuncGenArray);   }



end;


procedure TFormGBF.ButtonRZunipolaireClick(Sender: TObject);

 var   dwIndex1,compteurport,Nmemoiremod,wAmp  : dword;
      compteurmod,MM: word;
      rFreq,rFreqMod,Freqreelle  : double;
      Amplitude,tetaenv    :real;
      envmem,numbermem,RZratio :double;
      i : integer;


{var   dwIndex1,z  : dword;
      j,N,i,jj,wAmp   : word;
      Amp,FreqHorloge,rFreq,Freqreelle,RZratio  : double;   }

begin
if GroupBoxNRZ.Visible=True then GroupBoxNRZ.Visible:=False;
if GroupBoxRZ.Visible=False then GroupBoxRZ.Visible:=True;
ButtonRZbipolaire.down:=False;
Buttonbiphase.down:=False;
ButtonM_aires.down:=False;
ButtonRZunipolaire.down:=True;
RZbox.Visible:=True;
RZlabel.Visible:=True;


//compteurNRZ:=0;
if RZbox.Text='1/3' then RZratio:=1/3;
if RZbox.Text='1/2' then RZratio:=1/2;
if RZbox.Text='2/3' then RZratio:=2/3;




rFreqMod :=  StrtoFloat( SetFreqHorlogebox.Text) ;
MM:= 2;

   if testersyntaxeRZ(self)  then
   begin
 //SE : Choix Freq du tiepie ( 64 bits/1024 points par période //  16 points par bit )
  FillFuncGenMemory   (1024, @FuncGenArray); // pour passer en mode DDS
  rFreq := rFreqMod/512  ;
  SetfuncGenFrequency( @rFreq);
  //GetfuncGenFrequency( @rFreq);
  //showmessage(floattostr(rfreq));

  // remplissage tableau
     for i := 0 to 512 - 1 do
     begin
     if ( random<0.5 ) then FuncGenArray[2*i] := trunc(32767+32767) else FuncGenArray[2*i] := trunc(32767);
     FuncGenArray[2*i+1] := trunc(32767);
     end;

  // Réglage TiePie
  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (1024, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );

 end;


 { begin
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;

  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; //for
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;

  compteurport:=0;
  tetaenv:=-2*pi*rFreqMod/Freqreelle;
  envmem:=1;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=tetaenv+2*pi*rFreqMod/Freqreelle;
        if tetaenv>2*pi then tetaenv:=tetaenv-2*pi;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;
         if tetaenv<pi then
         begin
           if enveloppe[dwIndex1+1]>0 then
            begin
              if tetaenv>=(RZratio*pi) then enveloppe[dwIndex1+1]:=0;
            end;
           if enveloppe[dwIndex1+1]<0 then
            begin
              if tetaenv>((1-RZratio)*pi) then enveloppe[dwIndex1+1]:=0;
                enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]+1;
            end;
         end;
          if tetaenv>pi then
         begin
           if enveloppe[dwIndex1+1]>0 then
            begin
              if tetaenv>=(pi+RZratio*pi) then enveloppe[dwIndex1+1]:=0;
            end;
           if enveloppe[dwIndex1+1]<0 then
            begin
              if tetaenv>(pi+(1-RZratio)*pi) then enveloppe[dwIndex1+1]:=0;
               enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]+1;
            end;
         end;
          if tetaenv=(pi) then enveloppe[dwIndex1+1]:=0;

         {if tetaenv>(pi/2) then enveloppe[dwIndex1+1]:=0;
         end;
         if tetaenv>(3*pi/2) then enveloppe[dwIndex1+1]:=0;
  FuncGenArray[dwIndex1+1] := trunc(32767+32767*enveloppe[dwIndex1+1]);

   end; // for
    wAmp:=round(ln(MM)/ln(2));
    FreqExacteRZ.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' bps';

  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );
end;

     FillFuncGenMemory   (NrSamples, @FuncGenArray);     }


end;

procedure TFormGBF.ButtonM_airesClick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,wAmp  : dword;
      compteurmod,MM : word;
      rFreq,rFreqMod,Freqreelle  : double;
      Amplitude,tetaenv    :real;
      envmem,numbermem :double;
      ValeurAleatoire : double ;  //SE
      i,j: integer; //SE

begin
   if GroupBoxRZ.Visible=True then GroupBoxRZ.Visible:=False;
   if GroupBoxNRZ.Visible=False then GroupBoxNRZ.Visible:=True;
Buttonbiphase.down:=False;
ButtonRZbipolaire.down:=False;
ButtonRZunipolaire.down:=False;
ButtonM_aires.down:=True;

rFreqMod :=  StrtoFloat( SetFreqHorloge.Text) ;
MM:= strToInt( M_airesBox.Text );

if testersyntaxeNRZM_aires(self)  then
  begin
 {
  //SE : Choix Freq du tiepie ( 64 bits/1024 points par période //  16 points par bit )
  FillFuncGenMemory   (1024, @FuncGenArray); // pour passer en mode DDS
  rFreq := rFreqMod / 64  ;
  SetfuncGenFrequency( @rFreq);

  // remplissage tableau
  for i := 0 to 64 - 1 do
  begin
  ValeurAleatoire := tiragealeatoire(MM);
    for j := 0 to 15 do
      FuncGenArray[16*i+j] := trunc(32767+32767*ValeurAleatoire);
  end;  }

  //SE : Choix Freq du tiepie ( 64 bits/1024 points par période //  16 points par bit )
  FillFuncGenMemory   (1024, @FuncGenArray); // pour passer en mode DDS
  rFreq := rFreqMod/512  ;
  SetfuncGenFrequency( @rFreq);
  //GetfuncGenFrequency( @rFreq);
  //showmessage(floattostr(rfreq));

  // remplissage tableau
  for i := 0 to 512 - 1 do
  begin
  ValeurAleatoire:= tiragealeatoire(MM);
       FuncGenArray[2*i] := trunc(32767+32767*ValeurAleatoire);
       FuncGenArray[2*i+1] := trunc(32767+32767*ValeurAleatoire);

  end;


  // Réglage TiePie
  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (1024, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );

 end;


{     procedure Jacques :


  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;

  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>=2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<2*pi;
  end; // for
  rFreqMod:=rFreqMod/131072*(Nmemoiremod) ;
  // rFreqMod:=Freqreelle/131072*(compteurmod);
  compteurport:=0;

  envmem:=1;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        //tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;   // ancien JG
        tetaenv:=2*pi*dwIndex1*compteurmod/131072;       //correction SE
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;
  FuncGenArray[dwIndex1+1] := trunc(32767+32767*enveloppe[dwIndex1+1]);

  end; // for
    wAmp:=round(ln(MM)/ln(2));
    FreqExacte.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' x'+' '+inttostr(wAmp)+' bps';

  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );    
end;     }


end;


procedure TFormGBF.AleatoireSymbole(Sender: TObject);

var   dwIndex1  : dword;
      wAmp,M,i,deltaM,j,N ,z : word;
      Amp,FreqHorloge,rFreq,rFreqPort,alpha,beta,freqreelle  : double;

begin
     rFreq := 50e6;
     rFreqPort :=  StrtoFloat( SetFreqPorteuseModNum.Text) ;
     FreqHorloge:=StrtoFloat( SetFreqHorloge.Text);
     alpha:=rFreqport/rFreq;
     beta:=FreqHorloge/rFreq;
     j:=trunc(1/beta);
     N:=trunc(NrSamples/j);
     M:= StrToInt( M_airesBoxASK.Text );
     deltaM:=trunc(65535/(M-1));
     rfreq:=TestFrequence(FreqHorloge);
     SetfuncGenFrequency( @rFreq);
     GetFuncGenFrequency(@Freqreelle);
     j:=trunc(Freqreelle/FreqHorloge);
          if j>1 then
          N:=trunc(NrSamples/j)
          else
          begin
          N:=1;
          j:=1;
          end;

   //  Randomize; SE
     wAmp:=0;
for dwIndex1 := 0 to N do
begin
    Amp:=random(M);
    if M=2 then
      begin
        if trunc(Amp)>=1 then wAmp:=65535
        else wAmp:=0;
      end;
    if M=4 then
      begin
        if trunc(Amp)>=1 then
          begin
            if trunc(Amp)>=2 then
              if trunc(Amp) >= 3 then wAmp:=65535
              else  wAmp:=deltaM*2
            else wAmp:=deltaM
          end
        else wAmp:=0;
      end;
    if M=8 then
     begin
      if trunc(Amp)>=1 then
        begin
        if trunc(Amp)>=2 then
          if trunc(Amp)>=3 then
            if trunc(Amp)>=4 then
              if trunc(Amp)>=5 then
                if trunc(Amp)>=6 then
                  if trunc(Amp)>=7 then wAmp:=65535
                  else  wAmp:=deltaM*(M-2)
                else wAmp:=deltaM*(M-3)
              else wAmp:=deltaM*(M-4)
            else wAmp:=deltaM*(M-5)
          else wAmp:=deltaM*(M-6)
        else wAmp:=deltaM
        end
        else wAmp:=0;
    end;
  if M=16 then
     begin
      if trunc(Amp)>=1 then
        begin
        if trunc(Amp)>=2 then
          if trunc(Amp)>=3 then
            if trunc(Amp)>=4 then
              if trunc(Amp)>=5 then
                if trunc(Amp)>=6 then
                  if trunc(Amp)>=7 then
                    if trunc(Amp)>=8 then
                      if trunc(Amp)>=9 then
                        if trunc(Amp)>=10 then
                          if trunc(Amp)>=11 then
                            if trunc(Amp)>=12 then
                              if trunc(Amp)>=13 then
                                if trunc(Amp)>=14 then
                                if trunc(Amp)>=15 then wAmp:=65535
                                else  wAmp:=deltaM*(M-2)
                              else wAmp:=deltaM*(M-3)
                            else wAmp:=deltaM*(M-4)
                          else wAmp:=deltaM*(M-5)
                        else wAmp:=deltaM*(M-6)
                      else  wAmp:=deltaM*(M-7)
                    else wAmp:=deltaM*(M-8)
                  else wAmp:=deltaM*(M-9)
                else wAmp:=deltaM*(M-10)
              else wAmp:=deltaM*(M-11)
            else  wAmp:=deltaM*(M-12)
          else wAmp:=deltaM*(M-13)
        else wAmp:=deltaM*(M-14)
        else wAmp:=deltaM
        end
        else wAmp:=0;
    end;
  for i:=0 to j do
      begin
        z:=dwIndex1*j+i;
        if z<NrSamples then
        FuncGenArray[z] := wAmp;
      end;
end;

end;


 function TFormGBF.tiragealeatoire(M:word):double;
  var
    Amp :double;
    wAmp,deltaM: word;
  begin
     //Randomize; SE
     wAmp:=0;
     deltaM:=trunc(65535/(M-1));
     Amp:=random(M);
    if M=2 then
      begin
        if trunc(Amp)>=1 then wAmp:=65535
        else wAmp:=0;
      end;
    if M=4 then
      begin
        if trunc(Amp)>=1 then
          begin
            if trunc(Amp)>=2 then
              if trunc(Amp) >= 3 then wAmp:=65535
              else  wAmp:=deltaM*2
            else wAmp:=deltaM
          end
        else wAmp:=0;
      end;
    if M=8 then
     begin
      if trunc(Amp)>=1 then
        begin
        if trunc(Amp)>=2 then
          if trunc(Amp)>=3 then
            if trunc(Amp)>=4 then
              if trunc(Amp)>=5 then
                if trunc(Amp)>=6 then
                  if trunc(Amp)>=7 then wAmp:=65535
                  else  wAmp:=deltaM*(M-2)
                else wAmp:=deltaM*(M-3)
              else wAmp:=deltaM*(M-4)
            else wAmp:=deltaM*(M-5)
          else wAmp:=deltaM*(M-6)
        else wAmp:=deltaM
        end
        else wAmp:=0;
    end;
  if M=16 then
     begin
      if trunc(Amp)>=1 then
        begin
        if trunc(Amp)>=2 then
          if trunc(Amp)>=3 then
            if trunc(Amp)>=4 then
              if trunc(Amp)>=5 then
                if trunc(Amp)>=6 then
                  if trunc(Amp)>=7 then
                    if trunc(Amp)>=8 then
                      if trunc(Amp)>=9 then
                        if trunc(Amp)>=10 then
                          if trunc(Amp)>=11 then
                            if trunc(Amp)>=12 then
                              if trunc(Amp)>=13 then
                                if trunc(Amp)>=14 then
                                if trunc(Amp)>=15 then wAmp:=65535
                                else  wAmp:=deltaM*(M-2)
                              else wAmp:=deltaM*(M-3)
                            else wAmp:=deltaM*(M-4)
                          else wAmp:=deltaM*(M-5)
                        else wAmp:=deltaM*(M-6)
                      else  wAmp:=deltaM*(M-7)
                    else wAmp:=deltaM*(M-8)
                  else wAmp:=deltaM*(M-9)
                else wAmp:=deltaM*(M-10)
              else wAmp:=deltaM*(M-11)
            else  wAmp:=deltaM*(M-12)
          else wAmp:=deltaM*(M-13)
        else wAmp:=deltaM*(M-14)
        else wAmp:=deltaM
        end
        else wAmp:=0;
    end;
    result:=(wAmp-32767)/32767;
end;


procedure TFormGBF.ButtonBiphaseClick(Sender: TObject);
{var   dwIndex1,z  : dword;
      j,N,i,jj,wAmp   : word;
      Amp,FreqHorloge,rFreq,Freqreelle  : double;      }
 var   dwIndex1,compteurport,Nmemoiremod,wAmp  : dword;
      compteurmod,MM: word;
      rFreq,rFreqMod,Freqreelle  : double;
      Amplitude,tetaenv,RZratio    :real;
      envmem,numbermem :double;
      i : integer;
begin
if GroupBoxNRZ.Visible=True then GroupBoxNRZ.Visible:=False;
if GroupBoxRZ.Visible=False then GroupBoxRZ.Visible:=True;
ButtonRZbipolaire.down:=False;
ButtonRZunipolaire.down:=False;
ButtonM_aires.down:=False;
RZbox.Visible:=false;
RZlabel.Visible:=false;
Buttonbiphase.down:=true;
RZratio:=1/2;




rFreqMod :=  StrtoFloat( SetFreqHorlogebox.Text) ;
MM:= 2;

  if testersyntaxeRZ(self)  then
  begin
//SE : Choix Freq du tiepie ( 64 bits/1024 points par période //  16 points par bit )
  FillFuncGenMemory   (1024, @FuncGenArray); // pour passer en mode DDS
  rFreq := rFreqMod/512  ;
  SetfuncGenFrequency( @rFreq);
  //GetfuncGenFrequency( @rFreq);
  //showmessage(floattostr(rfreq));

  // remplissage tableau
     for i := 0 to 512 - 1 do
     begin    
        if (random>0.5) then
        begin
        FuncGenArray[2*i] := trunc(32767+32767);
        FuncGenArray[2*i+1] := trunc(32767);
        end
        else
        begin
        FuncGenArray[2*i] := trunc(32767);
        FuncGenArray[2*i+1] := trunc(32767+32767);
     end;
     end;

  // Réglage TiePie
  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (1024, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );

 end;


  {
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;

  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; { for
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;

  compteurport:=0;
  tetaenv:=-2*pi*rFreqMod/Freqreelle;
  envmem:=1;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=tetaenv+2*pi*rFreqMod/Freqreelle;
        if tetaenv>2*pi then tetaenv:=tetaenv-2*pi;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;
         if tetaenv<pi then
         begin
           if enveloppe[dwIndex1+1]>0 then
            begin
              if tetaenv>(RZratio*pi) then enveloppe[dwIndex1+1]:=0;
            end;
           if enveloppe[dwIndex1+1]<0 then
            begin
              if tetaenv>((1-RZratio)*pi) then enveloppe[dwIndex1+1]:=0;
                enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]+1;
            end;
         end;
          if tetaenv>pi then
         begin
           if enveloppe[dwIndex1+1]>0 then
            begin
              if tetaenv>(pi+RZratio*pi) then enveloppe[dwIndex1+1]:=0;
            end;
           if enveloppe[dwIndex1+1]<0 then
            begin
              if tetaenv>(pi+(1-RZratio)*pi) then enveloppe[dwIndex1+1]:=0;
               enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]+1;
            end;
         end;
          if tetaenv=(pi) then enveloppe[dwIndex1+1]:=0;

         {if tetaenv>(pi/2) then enveloppe[dwIndex1+1]:=0;
         end;
         if tetaenv>(3*pi/2) then enveloppe[dwIndex1+1]:=0;
  FuncGenArray[dwIndex1+1] := trunc(32767+32767*enveloppe[dwIndex1+1]);

   end; { for
    wAmp:=round(ln(MM)/ln(2));
    FreqExacteRZ.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' bps';

  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );
end;

     FillFuncGenMemory   (NrSamples, @FuncGenArray);       }



end;


procedure TFormGBF.ButtonASKClick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,Nmemoireport,wAmp  : dword;
      compteurmod,MM : word;
      rFreq,rFreqPort,rFreqMod,Freqreelle  : double;
      Amplitude,tetaenv,tetaport    :real;
      envmem,numbermem :double;
begin
ButtonASK.down:=true;
ButtonPSK.down:=False;
ButtonFSK.down:=false;
indicemodFSK.visible:=False;
setindicemodFSK.visible:=False;
 //numod0.Checked:=True;
  MM:= StrToInt( M_airesBoxASK.Text );
//  m:=StrtoFloat( SetIndiceModFSK.Text);
//if m>1 then indice:=1/m
//else indice:=1;
// indice:=m;
       FillFuncGenMemory   (NrSamples, @FuncGenArray);

//rFreq := 50e6;
rFreqPort :=  StrtoFloat( SetFreqPorteuseModNum.Text) {50e6};
rFreqMod :=  StrtoFloat( SetFreqHorlogeMod.Text)/2 ;
if testersyntaxeASK(self) then
  begin
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;
 //  if buttonTTLmod.Checked=true then  groupboxindiceAM.visible:=false
   //else  groupboxindiceAM.visible:=True;
  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; { for }
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;
  Nmemoireport:=0;
  compteurport:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaport:=(dwIndex1-Nmemoireport)*2*pi*rFreqport/Freqreelle;
        if tetaport>2*pi then
          begin
            repeat
              tetaport:=tetaport-2*pi;
              Nmemoireport:=dwindex1;
              compteurport:=compteurport+1;
            until tetaport<=2*pi;
          end;
  end;
  envmem:=1;
  rFreqport:= compteurport* rFreqMod/compteurmod;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;

      //    if buttonTTLmod.Checked=true then
       // begin
        //  if enveloppe[dwIndex1+1]>0 then m:=1
        //  else m:=-1;
        //  enveloppe[dwIndex1+1]:=1;
        //end;
     //   enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]*m;
        tetaport:=2*pi*dwIndex1*rFreqport/Freqreelle;
        wAmp:=trunc(32767+32767*({m*}enveloppe[dwIndex1+1])*sin(tetaport));
        FuncGenArray[dwIndex1+1] := wAmp;


    //   wAmp:=round((enveloppe[dwIndex1])*sin(tetaport));
    //  FuncGenArray[dwIndex1] := {32767+}(wAmp);
  end; { for }
    wAmp:=round(ln(MM)/ln(2));
    Labelporteuse4.Caption:='fréquence réelle = '+inttostr(round(rFreqport))+' Hz';
    Labelmodulante4.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' x'+' '+inttostr(wAmp)+' bps';

  Amplitude:= StrtoFloat( SetGeneAmpNum.Text) ;
  SetFuncGenAmplitude ( Amplitude    );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );
end;
     //if speedbuttonon.Down=true then setfuncgenoutputon(1);
     FillFuncGenMemory   (NrSamples, @FuncGenArray);
   //   GroupBoxAM.Visible:=True;
   //   FillFuncGenMemory   (NrSamples, @FuncGenArray);
end;



procedure TFormGBF.ButtonFSKClick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,Nmemoireport,wAmp  : dword;
      compteurmod,MM : word;
      rFreq,rFreqPort,rFreqMod,Freqreelle  : double;
      m ,tetaenv,tetaport    :real;
      envmem,numbermem :double;
begin
ButtonFSK.down:=True;
ButtonASK.down:=False;
ButtonPSK.down:=False;
//numod0.checked:=True;
//mindice:=StrtoFloat( SetIndiceModFSK.Text);;

indicemodFSK.visible:=true;
setindicemodFSK.visible:=True;

  MM:= StrToInt( M_airesBoxASK.Text );
  m:=StrtoFloat( SetIndiceModFSK.Text);
//if m>1 then indice:=1/m
//else indice:=1;
// indice:=m;
       FillFuncGenMemory   (NrSamples, @FuncGenArray);

//rFreq := 50e6;
rFreqPort :=  StrtoFloat( SetFreqPorteuseModNum.Text) {50e6};
rFreqMod :=  StrtoFloat( SetFreqHorlogeMod.Text)/2 ;
if testersyntaxeASK(self) then
  begin
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;
 //  if buttonTTLmod.Checked=true then  groupboxindiceAM.visible:=false
   //else  groupboxindiceAM.visible:=True;
  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; { for }
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;
  Nmemoireport:=0;
  compteurport:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaport:=(dwIndex1-Nmemoireport)*2*pi*rFreqport/Freqreelle;
        if tetaport>2*pi then
          begin
            repeat
              tetaport:=tetaport-2*pi;
              Nmemoireport:=dwindex1;
              compteurport:=compteurport+1;
            until tetaport<=2*pi;
          end;
  end;
  envmem:=1;
  rFreqport:= compteurport* rFreqMod/compteurmod;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;

        enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]*m;

        tetaport:=2*pi*dwIndex1*(rFreqPort+enveloppe[dwIndex1+1]*rFreqMod)/Freqreelle;
        wAmp:=trunc(32767+32767*sin(tetaport));
        FuncGenArray[dwIndex1+1] := wAmp;
     end;


    wAmp:=round(ln(MM)/ln(2));
    Labelporteuse4.Caption:='fréquence réelle = '+inttostr(round(rFreqport))+' Hz';
    Labelmodulante4.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' x'+' '+inttostr(wAmp)+' bps';

  SetFuncGenFrequency ( @rFreq     );
  SetFuncGenAmplitude ( StrtoFloat( SetGeneAmpNum.Text)       );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   ( NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );
 end;
 // FillFuncGenMemory   ( NrSamples, @FuncGenArray);

  FillFuncGenMemory   ( NrSamples, @FuncGenArray)


end;



procedure TFormGBF.ButtonPSKClick(Sender: TObject);
var   dwIndex1,compteurport,Nmemoiremod,Nmemoireport,wAmp  : dword;
      compteurmod,MM : word;
      rFreq,rFreqPort,rFreqMod,Freqreelle  : double;
      tetaenv,tetaport    :real;
      envmem,numbermem :double;
begin
ButtonPSK.down:=True;
ButtonASK.down:=False;
ButtonFSK.down:=False;
//numod0.Checked:=True;

indicemodFSK.visible:=False;
setindicemodFSK.visible:=False;

  MM:= StrToInt( M_airesBoxASK.Text );
 // m:=StrtoFloat( SetIndiceModFSK.Text);
//if m>1 then indice:=1/m
//else indice:=1;
// indice:=m;
       FillFuncGenMemory   (NrSamples, @FuncGenArray);

//rFreq := 50e6;
rFreqPort :=  StrtoFloat( SetFreqPorteuseModNum.Text) {50e6};
rFreqMod :=  StrtoFloat( SetFreqHorlogeMod.Text)/2 ;
if testersyntaxeASK(self) then
  begin
  rFreq:=TestFrequence(rFreqMod);
  SetfuncGenFrequency( @rFreq);
  GetFuncGenFrequency(@Freqreelle);
    enveloppe[0]:=Freqreelle;
 //  if buttonTTLmod.Checked=true then  groupboxindiceAM.visible:=false
   //else  groupboxindiceAM.visible:=True;
  compteurmod:=0;
  Nmemoiremod:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=(dwIndex1-Nmemoiremod)*2*pi*rFreqMod/Freqreelle;
        repeat
        if tetaenv>2*pi then
          begin
            tetaenv:=tetaenv-2*pi;
            Nmemoiremod:=dwindex1;
            compteurmod:=compteurmod+1;
          end;
        until tetaenv<=2*pi;
  end; { for }
  rFreqMod:=rFreqMod/131071*(Nmemoiremod) ;
  Nmemoireport:=0;
  compteurport:=0;
  for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaport:=(dwIndex1-Nmemoireport)*2*pi*rFreqport/Freqreelle;
        if tetaport>2*pi then
          begin
            repeat
              tetaport:=tetaport-2*pi;
              Nmemoireport:=dwindex1;
              compteurport:=compteurport+1;
            until tetaport<=2*pi;
          end;
  end;
  envmem:=1;
  rFreqport:= compteurport* rFreqMod/compteurmod;
  numbermem:=tiragealeatoire(MM);
 for dwIndex1 := 0 to NrSamples-1 do
  begin
        tetaenv:=2*pi*dwIndex1*rFreqMod/Freqreelle;
        enveloppe[dwIndex1+1]:= sin(tetaenv);
        if enveloppe[dwIndex1+1]>0 then enveloppe[dwIndex1+1]:=1
        else enveloppe[dwIndex1+1]:=-1;

       if enveloppe[dwIndex1+1]=envmem then
        begin
           enveloppe[dwIndex1+1]:=numbermem;
        end
       else
        begin
           envmem:=enveloppe[dwIndex1+1];
           enveloppe[dwIndex1+1]:=tiragealeatoire(MM);
           numbermem:=enveloppe[dwIndex1+1];
        end;

     //   enveloppe[dwIndex1+1]:=enveloppe[dwIndex1+1]*m;

        tetaport:=2*pi*dwIndex1*(rFreqPort)/Freqreelle+pi*enveloppe[dwIndex1+1]*(MM-1)/MM;
        wAmp:=trunc(32767+32767*sin(tetaport));
        FuncGenArray[dwIndex1+1] := wAmp;
     end;

  end;
    wAmp:=round(ln(MM)/ln(2));
    Labelporteuse4.Caption:='fréquence réelle = '+inttostr(round(rFreqport))+' Hz';
    Labelmodulante4.caption:='débit réel = '+inttostr(round(rFreqmod*2))+' x'+' '+inttostr(wAmp)+' bps';

  SetFuncGenFrequency ( @rFreq     );
  SetFuncGenAmplitude ( StrtoFloat( SetGeneAmpNum.Text)       );
  SetFuncGenSignalType( lstarbitrary );
  FillFuncGenMemory   ( NrSamples, @FuncGenArray);
  SetFuncGenDCOffset  ( StrtoFloat( SetGeneDCoffsetNum.Text)          );
  SetFuncGenSymmetry  ( 50        );


   //  FillFuncGenMemory   (NrSamples, @FuncGenArray);
  FillFuncGenMemory   ( NrSamples, @FuncGenArray);

end;






////////////////////////////////////////////////////////////////FIN MODULATIONS///////////////////////////////////////////////////////
                                                 ///////////////////////////////////////////////
                                                 ///////////////////////////////////////////////
                                                 ///////////////////////////////////////////////
                                                 ///////////////////////////////////////////////









end.








