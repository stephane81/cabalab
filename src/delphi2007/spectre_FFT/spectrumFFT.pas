unit spectrumFFT;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Spin, DllDecl,
  AppEvnts,Math, jpeg, Kaiserdecl,regressispecdecl,clipbrd, ToolWin, ComCtrls,
  ImgList;

const
      sErrFreqMod          = 'Erreur de syntaxe de la fréquence. Entrez la valeur sous la forme 1234,56';
      sErrFreqPort          = 'Erreur de syntaxe de la fréquence max. Entrez la valeur sous la forme 1234,56';
      sErrGenAmpl          = 'Erreur de syntaxe de l''amplitude du générateur. Entrez la valeur sous la forme 1,234';
      sErrGenOffs          = 'Erreur de syntaxe de l''Offset du générateur. Entrez la valeur sous la forme 1,234';
      sErrFreqModulationOutRange     = 'La fréquence doit être comprise entre 0,01 Hz et 2 MHz';
      sErrFreqPorteuseOutRange     = 'La fréquence Fmax doit être comprise entre 10 Hz et 50 MHz';
      sErrFreqPorteuseFreqModulation          = 'La fréquence Porteuse doit être supérieure à la fréquence Modulation !';
      sErrFreqHorlogeOutRange ='';
      sErrGenAmplRange     = ' L''amplitude du générateur doit être comprise entre 0 et 12 V';
      sErrGenAmplRange2    = 'Attention : avec les valeurs choisies pour l''amplitude et l''offset, ' +
                             'le générateur va sortir de sa plage de fonctionnement (-12V,+12V)';
      sErrIndiceModulation   =' Erreur in dice de modulation' ;
      sErrIndiceModulationOutRange  ='L''indice de modulation est hors limite';
      Nrsamples=131072;
      Nrsamples0=1024;

      type
      tabint=array[0..65536] of integer;
      tabLabelFreq=array[1..10] of TLabel;
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


  TFenetre_Spectre = class(TForm)
    Panel1               : TPanel;
    Display              : TPaintBox;
    MainMenu1            : TMainMenu;
   // Regressi: TMenuItem;
    Timer1               : TTimer;

    Horizontal            : TGroupBox;

    TriggerBox            : TGroupBox;
      SetTrigSourceLabel  : TLabel;
      TrigSourceBox       : TComboBox;
      SetTrigModeLabel    : TLabel;
      TrigModeBox         : TComboBox;
      SetTrigTimeoutLabel : TLabel;
      SetTimeoutBox       : TEdit;
      SpinTimeOut         : TSpinButton;
      GetTimeoutBox       : TEdit;
    Button2: TButton;
   // MainMenu1: TMainMenu;
    Regressi1: TMenuItem;
    accumulation: TMenuItem;
        GestiondesCouleurs1: TMenuItem;
    Labelacquisition: TLabel;
    Panel2: TPanel;
    PaintBox2: TPaintBox;
    Spectre1Label: TLabel;
    Spectre2Label: TLabel;
    fenetre: TMenuItem;
    rectangle: TMenuItem;
    blackman: TMenuItem;
    bartlett: TMenuItem;
    hamming :TMenuItem;
    hanning: TMenuItem;
    kaiser: TMenuItem;
    declenchement:TMenuItem;
{    gene:TmenuItem;}
    dBvolt:TMenuItem;
    volt:TMenuItem;
    dB:TMenuItem;
    dBwatt:TMenuItem;
    dBm:TMenuItem;
    dBu:TMenuItem;
    voltefficace:TMenuItem;
    FFT_simple:TMenuItem;
    FFT_multiple:TMenuItem;
    oscilloscope:TmenuItem;
    GetCh1OscSensBox: TEdit;
    Image1: TImage;
    zerolabel: TLabel;
    GetCh2OscSensBox: TEdit;
    Image2: TImage;
    GroupBox1: TGroupBox;
    Ch2Box: TGroupBox;
    CouplingCh2: TLabel;
    SetCoupCh2Box: TComboBox;
    GetCoupCh2Box: TEdit;
    Ch1Box: TGroupBox;
    CouplingCh1: TLabel;
    SetCoupCh1Box: TComboBox;
    GetCoupCh1Box: TEdit;
    Channel2Label: TLabel;
    Channel1Label: TLabel;
    Label2: TLabel;
    LabelWARNING1: TLabel;
    LabelWARNING2: TLabel;
    TimerDepassementSignal1: TTimer;
    TimerDepassementSignal2: TTimer;
    LabelFreqInit: TLabel;
    Labelfreq10: TLabel;
    LabelFreq1: TLabel;
    LabelFreq2: TLabel;
    LabelFreq3: TLabel;
    LabelFreq4: TLabel;
    LabelFreq5: TLabel;
 {   LabelFreq6: TLabel;
    LabelFreq7: TLabel;
    LabelFreq8: TLabel;
    LabelFreq9: TLabel;}
    Label1: TLabel;
    LabelAmpSpec: TLabel;
    GroupBoxLevel: TGroupBox;
    SpinTriglevelCh2: TSpinButton;
    triglevelCh2box: TEdit;
    SpinTriglevelCh1: TSpinButton;
    TrigLevelCh1Box: TEdit;
    SetTrigLevCh2Label: TLabel;
    SetTrigLevCh1Label: TLabel;
    LabelLevel2: TLabel;
    LabelLevel1: TLabel;
    SetTrigHystLabel: TLabel;
    TrigHysBox: TComboBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    GetStopSample: TEdit;
    GetStartSample: TEdit;
    LabelFreq6: TLabel;
    LabelFreq7: TLabel;
    LabelFreq8: TLabel;
    LabelFreq9: TLabel;
    GetSampleFreqEdit: TEdit;
    Groupsensibilite1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    sensibilite14: TRadioButton;
    sensibilite12: TRadioButton;
    sensibilite13: TRadioButton;
    sensibilite11: TRadioButton;
    sensibilite15: TRadioButton;
    sensibilite16: TRadioButton;
    sensibilite17: TRadioButton;
    sensibilite18: TRadioButton;
    sensibilite19: TRadioButton;
    SetCh1SensLabel: TLabel;
    GetCh1SensBox: TEdit;
    GetCh1SensBoxdBV: TEdit;
    GetCh1SensBoxdB: TEdit;
    GetCh1SensBoxdBW: TEdit;
    GetCh1SensBoxdBm: TEdit;
    GetCh1SensBoxdBu: TEdit;
    Groupplageanalyse: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    SetFreqLabel: TLabel;
    position4: TRadioButton;
    position2: TRadioButton;
    position3: TRadioButton;
    position1: TRadioButton;
    position5: TRadioButton;
    position6: TRadioButton;
    position7: TRadioButton;
    position8: TRadioButton;
    position9: TRadioButton;
    position10: TRadioButton;
    position11: TRadioButton;
    position0: TRadioButton;
    position12: TRadioButton;
    position13: TRadioButton;
    position14: TRadioButton;
    position15: TRadioButton;
    GetFreqPerDiv: TEdit;
    Groupsensibilite2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    sensibilite24: TRadioButton;
    sensibilite22: TRadioButton;
    sensibilite23: TRadioButton;
    sensibilite21: TRadioButton;
    sensibilite25: TRadioButton;
    sensibilite26: TRadioButton;
    sensibilite27: TRadioButton;
    sensibilite28: TRadioButton;
    sensibilite29: TRadioButton;
    sensibilite20: TRadioButton;
    SetCh2SensLabel: TLabel;
    GetCh2SensBox: TEdit;
    GetCh2SensBoxdBV: TEdit;
    GetCh2SensBoxdB: TEdit;
    GetCh2SensBoxdBW: TEdit;
    GetCh2SensBoxdBm: TEdit;
    GetCh2SensBoxdBu: TEdit;
    sensibilite10: TRadioButton;
    shapecalibre1: TShape;
    Shapecalibre2: TShape;
    Shapefreq: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Shapefreq0: TShape;
    localisation: TGroupBox;
    ZeroEdit: TEdit;
    Labelzero: TLabel;
    TrackBarStartFreq: TTrackBar;
    TrackBarStopFreq: TTrackBar;
    Panel3: TPanel;
    Shape3: TPaintBox;
    Shape4: TShape;
    Label4: TLabel;
    GetStartFreq: TLabel;
    GetStopFreq: TLabel;
    TrackBarzero: TTrackBar;
    Shape5: TShape;
    Label7: TLabel;
    decalage: TLabel;
    ImageList1: TImageList;
    GroupBox4: TGroupBox;
    ToolBar4: TToolBar;
    ButtonVoie1: TToolButton;
    ButtonVoie2: TToolButton;
    ButtonVoies1_2: TToolButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Recordlengthbox: TEdit;
    TrackBar1: TTrackBar;
    ProgressBar1: TProgressBar;
    ToolBar1: TToolBar;
    Image4: TImage;
    Image3: TImage;
    ToolButton3: TToolButton;
    ButtonGBF: TImage;
    procedure ButtonVoies1_2Click(Sender: TObject);
    procedure ButtonVoie2Click(Sender: TObject);
    procedure ButtonVoie1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure positionclick(Sender: TObject);
    procedure SetFreqLabelClick(Sender: TObject);
    procedure declenchementclick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

    {const  LabelFreq:array[1..5] of string = ( 'LabelFreq1','LabelFreq2','LabelFreq3','LabelFreq4',
      'LabelFreq5');}
    (*
     * procedures to make program work!!!!
     *)
//    function  Testerplagefrequence     (Sender: TObject) : boolean;
    function  TesterFreqechantillonnage(Sender: TObject) : boolean;
 {   function  TesterSyntaxeSinus            (Sender: TObject) : boolean;
    function  TesterSyntaxeRectangle            (Sender: TObject) : boolean;
    function  TesterSyntaxeTriangle            (Sender: TObject) : boolean;
    function  TesterSyntaxebruit         ( Sender : TObject ) : boolean;}
    function TesterDepassementSignal1( Sender : TObject) : boolean;
    function TesterDepassementSignal2( Sender : TObject) : boolean;
 //   procedure Buttonbruit         (Sender: TObject); {procedure to stopprogram}

    procedure FormClose                (Sender: TObject; var Action: TCloseAction); {cosing program procedure}
    procedure DLLBoxChange             (Sender: TObject); {procedure to change DLL}

    procedure Timer1Timer              (Sender: TObject); {timer procedure to make timerticks}

//    procedure MeasureModeBoxChange     (Sender: TObject); {procedure to change measuremode}
    procedure InitButtonClick          (Sender: TObject); {procedure to reinitialize instrument}

    procedure FormShow                 (Sender: TObject); {sets init value on startup}
    procedure SetCoupCh1BoxChange      (Sender: TObject);
    procedure SetCoupCh2BoxChange      (Sender: TObject);
    procedure DisplayPaint             (Sender: TObject); { procedure to draw spectrum data}
    procedure DisplayPaint1             (Sender: TObject); { procedure to draw grid}
    procedure DisplayPaintCH             (Sender: TObject); { procedure to draw measured da}
    procedure CalculDisplayPaint(Sender: TObject);
    procedure TrigModeBoxChange        (Sender: TObject); {procedure to set triggermode}
    procedure SpinTimeOutDownClick     (Sender: TObject);
    procedure SpinTimeOutUpClick       (Sender: TObject);
    procedure SetTimeoutBoxChange      (Sender: TObject);
//    procedure SetDcLevCh1BoxChange     (Sender: TObject);
    procedure TrigSourceBoxChange      (Sender: TObject);
    procedure TrigHysBoxChange         (Sender: TObject);
 //   procedure SetDcLevCh2BoxChange     (Sender: TObject);
    procedure RecordlengthboxoldChange    (Sender: TObject);
   { procedure PostSamplesBoxChange     (Sender: TObject);}
    procedure StartMeasureButtonClick  (Sender: TObject); {procedure to start the measurement again after a stop}
    procedure InitButtonKeyDown        (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinTriglevelCh1DownClick(Sender: TObject);
    procedure SpinTriglevelCh1UpClick  (Sender: TObject);
    procedure TrigLevelCh1BoxChange    (Sender: TObject);
    procedure SpinTriglevelCh2DownClick(Sender: TObject);
    procedure SpinTriglevelCh2UpClick  (Sender: TObject);
    procedure triglevelCh2boxChange    (Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2click(Sender: TObject);
    procedure TimerDepassementSignal1Timer(Sender: TObject);
    procedure TimerDepassementSignal2Timer(Sender: TObject);
       procedure Enregistrerlesdonnees(Sender: TObject);
       procedure Enregistrerlesdonnees2(Sender: TObject);
       procedure accumulationClick(Sender: TObject);
       procedure rectangleClick(Sender: TObject);
       procedure hammingClick(Sender: TObject);
       procedure bartlettClick(Sender: TObject);
       procedure blackmanClick(Sender: TObject);
       procedure hanningClick(Sender: TObject);
       procedure kaiserClick(Sender: TObject);
       procedure GBFonClick(Sender: TObject);
       procedure SCOPEonClick(Sender: TObject);
       procedure dBvoltClick(Sender: TObject);
       procedure voltClick(Sender: TObject);
       procedure dBClick(Sender: TObject);
       procedure voltefficaceClick(Sender: TObject);
       procedure dBwattClick(Sender: TObject);
       procedure dBmClick(Sender: TObject);
       procedure dBuClick(Sender: TObject);
       procedure FFTsimpleclick(Sender: TObject);
       procedure FFTmultipleclick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ButtonGBFClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure AuteurClick(Sender: TObject);
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
    procedure Couleurs1Click(Sender: TObject);
    procedure positionChange (Sender: TObject);
    procedure calibre1Change (Sender: TObject);
    procedure calibre2Change (Sender: TObject);
    procedure changementcalibre1 (Sender: TObject);
    procedure changementcalibre2 (Sender: TObject);
    procedure Trackbar1Change(Sender: TObject);
    procedure TrackbarStartFreqChange(Sender: TObject);
    procedure TrackbarStopFreqChange(Sender: TObject);
    procedure TrackbarzeroChange(Sender: TObject);
    private
    { Private declarations }
    bInTimerProcedure : Boolean;
    bPaint            : Boolean;
    bAllowMeasuring   : boolean;
  public
    { Public declarations }
    Generateur : TGenerator;

  Spectre      : record
     CouleurSpectre1     : Tcolor;
     CouleurSpectre2     : Tcolor;
     CouleurFond      : Tcolor;
     CouleurGrille    : Tcolor;
     end;

 Voies      : record
     CouleurVoie1     : Tcolor;
     CouleurVoie2     : Tcolor;
     CouleurVoie3     : Tcolor;
     CouleurFond      : Tcolor;
     CouleurGrille    : Tcolor;
     end;
  end;


var Fenetre_Spectre          : TFenetre_Spectre;
    init0,init1,rapport      : double;
    timearray,freqarray      : DArray;
      ximag,xreal            : DArray;
      xxreal,xximag          : DArray;
      tabi                   : DArray;
      tabr                   : DArray;
      spectre1               : DArray;
      spectre2               : DArray;
      FFTre,FFTim            : DArray;
      indice,indice2         : tabint;
      expo,delta,expo2       : integer;
      LabelFreq              : tabLabelFreq;
      compteur,calibre1,calibre2,positionmemoire,MeasureMode  : word;
implementation

uses {stop, chemReg,} UnitCabalab, UnitGBF, UnitApropos, Unit_aide_FFT_abscisse,
Unit_aide_FFT,Unit_aide_FFT_ordonnee,Unit_aide_FFT_BdeT,Unit_aide_FFT_trigger,
Unit_aide_FFT_transfert, Unit_aide_FFT_frequence, Unit_aide_FFT_stop,
  Unit_aide_FFT_logo, Unit_aide_FFT_accu, Unit_Base_de_Frequence,UnitSpectreCouleurGraphes,
  UnitTransfertRegressi;          //////////////modif f.merle pour cabalab3

{$R *.DFM}

{procedure TForm1.CloseButtonClick(Sender: TObject);
(*
 * Close button procedure to stop the program
 *)
begin
  Timer1.OnTimer := nil;
  Display.OnPaint := nil;

{  if Form2.ShowModal = mrYes then
  begin
    if DLLHandle >= 32 then
    begin
      Exitinstrument;
    end; { if }
 {   Freelibrary(DLLHandle);
    NilAllProcAddresses;
  end { if }
  {else
  begin
    Timer1.OnTimer  := Timer1Timer;
    Display.OnPaint := DisplayPaint;
  end; { else }
 {end; { TForm1.CloseButtonClick }

procedure TFenetre_Spectre.TimerDepassementSignal1Timer(Sender: TObject);
begin
if LabelWARNING1.Visible=true then LabelWARNING1.Visible:=false else LabelWARNING1.Visible:=true;
end;

procedure TFenetre_Spectre.TimerDepassementSignal2Timer(Sender: TObject);
begin
if LabelWARNING2.Visible=true then LabelWARNING2.Visible:=false else LabelWARNING2.Visible:=true;
end;

procedure TFenetre_Spectre.FormClose(Sender: TObject; var Action: TCloseAction);
(*
 * To stop the program by al means like right corner button and "alt F4"
 * Free the library and the instrument resources
 *)
begin
  Timer1.OnTimer  := nil;
 //Display.OnPaint := nil;
{  cabalab.De_BloquageBoutons;
cabalab.SpeedButtonSpectre.down:=false;}


  passif[6]:=true;
  Formcabalab.SpeedButtonFFT.down:=false;
  Formcabalab.GestionButtons(sender);


end; { TForm1.FormClose }


procedure TFenetre_Spectre.DLLBoxChange(Sender: TObject);
(*
 * Inits the chosen instrument library
 * makes stop measuring button active
 *)
begin
  InitButtonClick( Self );
end; { TForm1.DLLBoxChange }


procedure TFenetre_Spectre.TrackbarStartFreqChange(Sender: TObject);
var StartSample,StopSample,delta,i : word;
    StartFreq,Freq : dword;
        affichage:string;
begin
startsample:= TrackBarStartFreq.Position;
stopsample:=TrackBarStopFreq.Position;
if (startsample >= stopsample) then TrackBarStartFreq.Position:=stopsample-1;
           if TrackBarStartFreq.Position=9 then
            begin
              StartSample :=9;
            end;
           if TrackBarStartFreq.Position=8 then
            begin
              StartSample :=8;
            end;
           if TrackBarStartFreq.Position=7 then
            begin
              StartSample :=7;
            end;
           if TrackBarStartFreq.Position=6 then
            begin
              StartSample :=6;
            end;
           if TrackBarStartFreq.Position=5 then
            begin
              StartSample :=5;
            end;
           if TrackBarStartFreq.Position=4 then
            begin
              StartSample :=4;
            end;
           if TrackBarStartFreq.Position=3 then
            begin
              StartSample :=3;
            end;
           if TrackBarStartFreq.Position=2 then
             begin
              StartSample :=2;
             end;
           if TrackBarStartFreq.Position=1 then
            begin
              StartSample :=1;
            end;
           if TrackBarStartFreq.Position=0 then
             begin
              StartSample :=0;
             end;
 GetStartSample.Text:=IntToStr(StartSample);
  StartFreq:=round(StartSample*GetSampleFrequency/20{100*8});

    if StartFreq > 1000000 then
      affichage:=FloatToStr(round(StartFreq/10)/100000)+' MHz'
    else
    if StartFreq < 1000 then
      affichage:= IntToStr(StartFreq)+' Hz'
    else
    affichage:=FloatToStr(round(StartFreq/10)/100)+' kHz';

  GetStartFreq.Caption := affichage;
  LabelFreqInit.caption:=affichage;
   delta:=StopSample-StartSample;
   if delta=10 then
   begin
   shape4.Left:=shape3.Left ;
   end;

    if delta>0 then
      begin
        for i := 1 to 10 do
           begin
              Freq:=round((StartSample+i*delta/10)*GetSampleFrequency/20{100*8});
               if Freq < 1000 then
                affichage:= IntToStr(Freq)+' Hz'
               else
               if Freq>1000000 then
                affichage:=FloatToStr(round(Freq/10)/100000)+' MHz'
               else
               affichage:=FloatToStr(round(Freq/10)/100)+' kHz';
              LabelFreq[i].Caption :=affichage;
           end;
      end;
      shape4.Left:=round(shape3.Width/10)*StartSample;
      shape4.width:=round(shape3.Width/10)*delta;
     // imageStartFreqUp.left:= round(shape3.Width/10)*StartSample;
     // imageStartFreqDown.left:= round(shape3.Width/10)*StartSample-imageStartFreqUp.Width;
      getstartfreq.Left:=round(shape3.Width/10)*StartSample{-getstartfreq.Width]+round(getstartfreq.Width/4)};



end;

procedure TFenetre_Spectre.TrackbarStopFreqChange(Sender: TObject);
var StartSample,StopSample,delta,i : word;
    Stopfreq,Freq : dword;
    affichage : string;
begin
startsample:= TrackBarStartFreq.Position;
stopsample:=TrackBarStopFreq.Position;
if (stopsample <= startsample) then TrackBarStopFreq.Position:=startsample+1;
            if TrackBarStopFreq.Position=10 then
             begin
              StopSample :=10;
             end;
           if TrackBarStopFreq.Position=9 then
             begin
              StopSample :=9;
             end;
           if TrackBarStopFreq.Position=8 then
            begin
              StopSample :=8;
            end;
           if TrackBarStopFreq.Position=7 then
            begin
              StopSample :=7;
            end;
           if TrackBarStopFreq.Position=6 then
            begin
              StopSample :=6;
            end;
           if TrackBarStopFreq.Position=5 then
            begin
              StopSample :=5;
            end;
           if TrackBarStopFreq.Position=4 then
            begin
              StopSample :=4;
            end;
           if TrackBarStopFreq.Position=3 then
            begin
              StopSample :=3;
            end;
           if TrackBarStopFreq.Position=2 then
             begin
              StopSample :=2;
             end;
           if TrackBarStopFreq.Position=1 then
            begin
              StopSample :=1;
            end;
           if TrackBarStopFreq.Position=0 then
             begin
              StopSample :=0;
             end;
 GetStopSample.Text:=IntToStr(StopSample);
  StopFreq:=round(StopSample*GetSampleFrequency/20{100*8});

    if StopFreq > 1000000 then
      affichage:=FloatToStr(round(StopFreq/10)/100000)+' MHz'
    else
    if StopFreq < 1000 then
      affichage:= IntToStr(StopFreq)+' Hz'
    else
    affichage:=FloatToStr(round(StopFreq/10)/100)+' kHz';

    GetStopFreq.caption :=affichage;


    delta:=StopSample-StartSample;
    if delta=10 then
    begin
       shape4.Left:=shape3.Left ;
//     freqminplus.Visible:=false;
  //    freqmaxmoins.Visible:=False;
  //  imageStartFreqUp.visible:=False;
 //   imageStopFreqDown.visible:=False;
   end
   else
   begin
  //  imageStartFreqUp.visible:=true;
   // imageStopFreqDown.visible:=true;
   end;
    if delta>0 then
      begin
        for i := 1 to 10 do
           begin
              Freq:=round((StartSample+i*delta/10)*GetSampleFrequency/20{100*8});
               if Freq < 1000 then
                affichage:= IntToStr(Freq)+' Hz'
               else
               if Freq>1000000 then
                affichage:=FloatToStr(round(Freq/10)/100000)+' MHz'
               else
               affichage:=FloatToStr(round(Freq/10)/100)+' kHz';
              LabelFreq[i].Caption :=affichage;
           end;
      end;
    shape4.Left:=round(shape3.Width/10)*StartSample;
    shape4.width:=round(shape3.Width/10)*delta;
  //  imageStopFreqUp.left:= round(shape3.Width/10)*StopSample;
   // imageStopFreqDown.left:=round(shape3.Width/10)*StopSample-imageStopFreqUp.Width;
    getstopfreq.Left:=round(0.98*shape3.Width/10)*StopSample{+round(getstopfreq.Width/2)};
   if StopSample=10 then   getstopfreq.Left:=round(0.98*shape3.Width/10)*StopSample;

end;



procedure TFenetre_Spectre.Trackbar1Change(Sender: TObject);
var lSample : dword;
 dwLength,i,d,j    : dword;
    sCurrLength : string;
begin
           if TrackBar1.Position=6 then
            begin
              lSample :=65536;
              expo := 16;
              delta:= 64;
              progressbar1.Position:=6;
            end;
           if TrackBar1.Position=5 then
            begin
              lSample :=32768;
              expo := 15;
              delta:= 32;
              progressbar1.Position:=5;
            end;
           if TrackBar1.Position=4 then
            begin
              lsample:=16384;
              expo := 14;
              delta:= 16;
              progressbar1.Position:=4;
            end;
           if TrackBar1.Position=3 then
            begin
              lSample :=8192;
              expo := 13;
              delta:= 8;
              progressbar1.Position:=3;
            end;
           if TrackBar1.Position=2 then
            begin
              lsample:=4096;
              expo := 12;
              delta:= 4;
              progressbar1.Position:=2;
            end;
           if TrackBar1.Position=1 then
            begin
              lSample :=2048;
              expo := 11;
              delta:= 2;
              progressbar1.Position:=1;
            end;
           if TrackBar1.Position=0 then
             begin
              lsample:=1024;
              expo := 10;
              delta := 1;
              progressbar1.Position:=0;
             end;
// resolutionplus.visible:=true;
 Recordlengthbox.text:= IntToStr (lSample);
 dwLength := GetRecordlength;
 sCurrLength := FloatToStr( dwlength );
 if Recordlengthbox.Text <> sCurrLength then
 begin
   dwLength := strToint( RecordLengthBox.Text );
   SetRecordLength( dwLength );
  SetPostSamples( dwLength );
 end;
 SetPostSamples( dwLength );
  if Recordlengthbox.Text <> sCurrLength then
 begin
   dwLength := strToint( RecordLengthBox.Text );
   SetRecordLength( dwLength );
  SetPostSamples( dwLength );
 end;
 SetPostSamples( dwLength );
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

end;


{procedure TFenetre_Spectre.MeasureModeBoxChange(Sender: TObject);
(*
 * selects measuremode doesn't set it
 *)
begin
  if MeasureModeBox.Text = 'Voie 1' then
  begin
    Channel1Label.Visible := True;
    Channel2Label.Visible := False;
    Spectre1Label.Visible := True;
    Spectre2Label.Visible := False;
    ch2box.Visible:=false;
    ch1box.Visible:=true;
    GetCh1OscSensBox.Visible:=True;
    GetCh2OscSensBox.Visible:=False;

  end { if }
 { else
  begin
    if MeasureModeBox.Text = 'Voie 2' then
    begin
      Channel1Label.Visible := False;
      Channel2Label.Visible := True;
      Spectre1Label.Visible := False;
      Spectre2Label.Visible := True;
      ch1box.Visible:=false;
      ch2box.Visible:=true;
    GetCh1OscSensBox.Visible:=False;
    GetCh2OscSensBox.Visible:=True;

    end { if }
  {  else
    begin
      if MeasureModeBox.Text = 'Voies 1 et 2' then
      begin
        ch1box.Visible:=true;
        ch2box.Visible:=true;
        Channel1Label.Visible := True;
        Channel2Label.Visible := True;
        Spectre1Label.Visible := True;
        Spectre2Label.Visible := True;
        GetCh1OscSensBox.Visible:=True;
        GetCh2OscSensBox.Visible:=True;

      end; { if }
   { end; { else}
 { end; { else }
{end;   }

procedure TFenetre_Spectre.positionclick(Sender: TObject);
var d:dword;
alpha:real;
begin
d:=8;
alpha:=0.95;
if position0.Checked=true then
    begin
      compteur:=0;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[0])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[0])));
    end;
if position1.Checked=true then
    begin
      compteur:=1;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[1])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[1])));
    end;
if position2.Checked=true then
    begin
      compteur:=2;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[2])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[2])));
    end;
if position3.Checked=true then
    begin
      compteur:=3;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[3])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[3])));
    end;
if position4.Checked=true then
    begin
      compteur:=4;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[4])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[4])));
    end;
if position5.Checked=true then
    begin
      compteur:=5;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[5])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[5])));
    end;
if position6.Checked=true then
    begin
      compteur:=6;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[6])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[6])));
    end;
if position7.Checked=true then
    begin
      compteur:=7;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[7])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[7])));
    end;
if position8.Checked=true then
    begin
      compteur:=8;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[8])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[8])));
    end;
if position9.Checked=true then
    begin
      compteur:=9;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[9])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[9])));
    end;
if position10.Checked=true then
    begin
      compteur:=10;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[10])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[10])));
    end;
if position11.Checked=true then
    begin
      compteur:=11;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[11])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[11])));
    end;
if position12.Checked=true then
    begin
      compteur:=12;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[12])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[12])));
    end;
if position13.Checked=true then
    begin
      compteur:=13;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[13])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[13])));
    end;
if position14.Checked=true then
    begin
      compteur:=14;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[14])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[14])));
    end;
{if position15.Checked=true then
    begin
      compteur:=15;
      shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[15])));
      shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[15])));
    end;    }
 positionChange(self);
end;

procedure TFenetre_Spectre.calibre1Change (Sender: TObject);
var d:dword;
alpha : real;
begin
 d:=8;
alpha:=0.95;

if sensibilite10.Checked=true then
    begin
      calibre1:=0;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[0])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[0])));
    end;
if sensibilite11.Checked=true then
    begin
      calibre1:=1;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[1])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[1])));
    end;
if sensibilite12.Checked=true then
    begin
      calibre1:=2;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[2])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[2])));
    end;
if sensibilite13.Checked=true then
    begin
      calibre1:=3;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[3])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[3])));
    end;
if sensibilite14.Checked=true then
    begin
      calibre1:=4;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[4])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[4])));
    end;
if sensibilite15.Checked=true then
    begin
      calibre1:=5;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[5])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[5])));
    end;
if sensibilite16.Checked=true then
    begin
      calibre1:=6;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[6])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[6])));
    end;
if sensibilite17.Checked=true then
    begin
      calibre1:=7;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[7])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[7])));
    end;
if sensibilite18.Checked=true then
    begin
      calibre1:=8;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[8])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[8])));

    end;
if sensibilite19.Checked=true then
    begin
      calibre1:=9;
      shape1.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[9])));
      shape1.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[9])));

    end;

 changementcalibre1(self);
end;

procedure TFenetre_Spectre.calibre2Change (Sender: TObject);
var d:dword;
alpha : real;
begin
 d:=8;
alpha:=0.95;
if sensibilite20.Checked=true then
    begin
      calibre2:=0;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[0])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[0])));
    end;
if sensibilite21.Checked=true then
    begin
      calibre2:=1;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[1])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[1])));
    end;
if sensibilite22.Checked=true then
    begin
      calibre2:=2;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[2])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[2])));
    end;
if sensibilite23.Checked=true then
    begin
      calibre2:=3;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[3])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[3])));
    end;
if sensibilite24.Checked=true then
    begin
      calibre2:=4;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[4])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[4])));
    end;
if sensibilite25.Checked=true then
    begin
      calibre2:=5;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[5])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[5])));
    end;
if sensibilite26.Checked=true then
    begin
      calibre2:=6;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[6])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[6])));
    end;
if sensibilite27.Checked=true then
    begin
      calibre2:=7;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[7])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[7])));
    end;
if sensibilite28.Checked=true then
    begin
      calibre2:=8;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[8])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[8])));
    end;
if sensibilite29.Checked=true then
    begin
      calibre2:=9;
      shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[9])));
      shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[9])));
    end;

 changementcalibre2(self);
end;

procedure TFenetre_Spectre.changementcalibre1 (Sender:Tobject);
var dHelp,dHelpdBV : double;
begin
 if calibre1=0 then
        begin
          dHelp :=  0.1;
          dHelpdBV:=0.025
        end;
  if calibre1=1 then
        begin
          dHelp :=  0.2;
          dHelpdBV:=0.1
        end;
  if calibre1=2 then
        begin
          dHelp :=  0.4;
          dHelpdBV:=0.2
        end;
  if calibre1=3 then
        begin
          dHelp :=  0.8;
          dHelpdBV:=0.4
        end;
  if calibre1=4 then
        begin
          dHelp :=  2.0;
          dHelpdBV:=1
        end;
  if calibre1=5 then
        begin
          dHelp :=  4.0;
          dHelpdBV:=2
        end;
  if calibre1=6 then
        begin
        dHelp :=  8.0;
        dHelpdBV:=4
        end;
  if calibre1=7 then
        begin
        dHelp := 20.0;
        dHelpdBV:=10
        end;
  if calibre1=8 then
        begin
        dHelp := 40.0;
        dHelpdBV:=20
        end;
   if calibre1=9 then
        begin
        dHelp := 80.0;
        dHelpdBV:=40
        end;

   // SetCh1SensBox.Text := FloatToStr( dHelp );
   { SetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV );}
    SetSensitivity( lCh1, @dHelp);
    GetSensitivity( lCh1, @dHelp);
    GetCh1SensBox.Text := FloatToStr( dHelp/8 ) + ' V/div';
    GetCh1SensBoxdB.Text := FloatToStr( dHelpdBV*2 ) + ' dB/div';
    GetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV*2 ) + ' dBV/div';
    GetCh1SensBoxdBW.Text := FloatToStr( dHelpdBV*2 ) + ' dBW/div';
    GetCh1SensBoxdBm.Text := FloatToStr( dHelpdBV*2 ) + ' dBm/div';
    GetCh1SensBoxdBu.Text := FloatToStr( dHelpdBV*2 ) + ' dBu/div';
    GetCh1OscSensBox.Text := FloatToStr( dHelp/4 ) + ' V/div';
   {     if volt.Checked or  voltefficace.Checked then
    begin
      sensibilite10.hint:=FloatToStr( dHelp0/8 ) + ' V/div';
      sensibilite11.hint:=FloatToStr( dHelp1/8 ) + ' V/div';
      sensibilite12.hint:=FloatToStr( dHelp2/8 ) + ' V/div';
      sensibilite13.hint:=FloatToStr( dHelp3/8 ) + ' V/div';
      sensibilite14.hint:=FloatToStr( dHelp4/8 ) + ' V/div';
      sensibilite15.hint:=FloatToStr( dHelp5/8 ) + ' V/div';
      sensibilite16.hint:=FloatToStr( dHelp6/8 ) + ' V/div';
      sensibilite17.hint:=FloatToStr( dHelp7/8 ) + ' V/div';
      sensibilite18.hint:=FloatToStr( dHelp8/8 ) + ' V/div';
      sensibilite19.hint:=FloatToStr( dHelp9/8 ) + ' V/div';
    end
    else
    begin
      sensibilite10.hint:=FloatToStr( dHelpdBV0/8 ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpdBV1/8 ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpdBV2/8 ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpdBV3/8 ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpdBV4/8 ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpdBV5/8 ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpdBV6/8 ) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpdBV7/8 ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpdBV8/8 ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpdBV9/8 ) + ' dB/div';

      end;}
end;

procedure TFenetre_Spectre.changementcalibre2 (Sender:Tobject);
var dHelp:double;
      //dHelpdBV: double;

begin
 if calibre2=0 then
        begin
          dHelp := dHelpi[0];
//          dHelpdBV:=0.025;
        //  dHelpdBV:=dHelp/4
        end;
  if calibre2=1 then
        begin
          dHelp := dHelpi[1];
  //        dHelpdBV:=0.1;
        //  dHelpdBV:=dHelp
        end;
  if calibre2=2 then
        begin
          dHelp := dHelpi[2];
//          dHelpdBV:=0.2;
        //  dHelpdBV:=dHelp
        end;
  if calibre2=3 then
        begin
          dHelp := dHelpi[3];
  //        dHelpdBV:=0.4;
        //  dHelpdBV:=dHelp
        end;
  if calibre2=4 then
        begin
          dHelp := dHelpi[4];
//          dHelpdBV:=1;
         // dHelpdBV:=dHelp
        end;
  if calibre2=5 then
        begin
          dHelp :=dHelpi[5];
  //        dHelpdBV:=2;
         // dHelpdBV:=dHelp
        end;
  if calibre2=6 then
        begin
        dHelp :=dHelpi[6];
//        dHelpdBV:=4;
       // dHelpdBV:=dHelp
        end;
  if calibre2=7 then
        begin
        dHelp := dHelpi[7];
     //   dHelpdBV:=10;
      //  dHelpdBV:=dHelp
        end;
  if calibre2=8 then
        begin
        dHelp := dHelpi[8];
   //     dHelpdBV:=20;
        //dHelpdBV:=dHelp
        end;
   if calibre2=9 then
        begin
        dHelp :=dHelpi[9];
//        dHelpdBV:=40;
        //dHelpdBV:=dHelp
        end;

  //  SetCh2SensBox.Text := FloatToStr( dHelp );
   { SetCh1SensBoxdBV.Text := FloatToStr( dHelpdBV );}
    SetSensitivity( lCh2, @dHelp);
    GetSensitivity( lCh2, @dHelp);
    GetCh2SensBox.Text := FloatToStr( dHelp/8 ) + ' V/div';
    GetCh2SensBoxdB.Text := FloatToStr( dHelp ) + ' dB/div';
    GetCh2SensBoxdBV.Text := FloatToStr( dHelp) + ' dBV/div';
    GetCh2SensBoxdBW.Text := FloatToStr( dHelp ) + ' dBW/div';
    GetCh2SensBoxdBm.Text := FloatToStr( dHelp ) + ' dBm/div';
    GetCh2SensBoxdBu.Text := FloatToStr( dHelp) + ' dBu/div';
    GetCh2OscSensBox.Text := FloatToStr( dHelp/4 ) + ' V/div';
    if volt.Checked or  voltefficace.Checked then
    begin
      sensibilite20.hint:=FloatToStr( dHelpi[0]/8 ) + ' V/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1]/8 ) + ' V/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2]/8 ) + ' V/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3]/8 ) + ' V/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4]/8 ) + ' V/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5]/8 ) + ' V/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]/8 ) + ' V/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7]/8 ) + ' V/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8]/8 ) + ' V/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9]/8 ) + ' V/div';
    end
    else
    begin
      sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';

      end;
end;

procedure TFenetre_Spectre.positionChange (Sender: TObject);
 var lSampleFreq,samplefreq2,StopFreq,StartFreq,Freq : dword;
  i,StartSample,StopSample,delta:word;
      basedetemps,calibrefreq    : double;
      affichage : string;
  begin
       //     lcompteur.Text:=InttoStr(compteur);
          lsampleFreq:=Frequence_echantillonnage[compteur];
          if lsampleFreq < 1000 then
          affichage:= IntToStr(lsampleFreq)+' Hz'
          else
          if lsampleFreq>1000000 then
             affichage:=FloatToStr(round(lsampleFreq/10)/100000)+' MHz'
          else
             affichage:=FloatToStr(round(lsampleFreq/10)/100)+' kHz';

//          SetSampelFreqBox.Text := (affichage);
          SetsampleFrequency(@lsamplefreq);

  samplefreq2 := GetSampleFrequency;
//  edit1.text:=FloatToStr(samplefreq2);
  basedetemps:= 100000000/samplefreq2;
 { calibrefreq:= 8000/basedetemps;}
    calibrefreq:= 8*samplefreq2/100000;
    if basedetemps >= 1000 then
      begin
      GetSampleFreqEdit.Text := FloatToStrF( basedetemps/1000, ffNumber, 18 , 0)+' ms/div';
//      GetFreqPerDiv.Text :='0 - '+ FloatToStrF(samplefreq2/2, ffNumber, 18 , 0)+' Hz'  ;
      end
    else
     begin
      GetSampleFreqEdit.Text := FloatToStrF( basedetemps, ffNumber, 18 , 0)+' µs/div';
     end;

    if calibrefreq < 0.75 then
        GetFreqPerDiv.Text := '0 - '+FloatToStrF(samplefreq2/2, ffNumber, 18 , 0)+' Hz'
    else
     if calibrefreq > 99 then
        GetFreqPerDiv.Text :='0 - '+ FloatToStr(round(samplefreq2/20000)/100{, ffNumber, 18 , 0})+' MHz'
     else
        GetFreqPerDiv.Text :='0 - '+ FloatToStr(round(samplefreq2/200)/10{, ffNumber, 18 , 0})+' kHz';

    StopSample:=StrToInt( GetStopSample.Text);
    StopFreq:=round(StopSample*GetSampleFrequency /20{100*8});

    if StopFreq > 1000000 then
      affichage:=FloatToStr(round(StopFreq/10)/100000)+' MHz'
    else
    if StopFreq < 1000 then
      affichage:= IntToStr(StopFreq)+' Hz'
    else
    affichage:=FloatToStr(round(StopFreq/10)/100)+' kHz';

    GetStopFreq.Caption :=affichage;
//    LabelFreqEnd.caption:= affichage;
    StartSample:= StrToInt( GetStartSample.Text);
    StartFreq:= round(StartSample*GetSampleFrequency /20{100*8});

    if StartFreq > 1000000 then
      affichage:=FloatToStr(round(StartFreq/10)/100000)+' MHz'
    else
    if StartFreq < 1000 then
      affichage:= IntToStr(StartFreq)+' Hz'
    else
    affichage:=FloatToStr(round(StartFreq/10)/100)+' kHz';

    GetStartFreq.Caption := affichage;
    LabelFreqInit.caption:=affichage;

    delta:=StopSample-StartSample;
  if delta>0 then
      begin
        for i := 1 to 10 do
           begin
              Freq:=round((StartSample+i*delta/10)*GetSampleFrequency/20{100*8});
               if Freq < 1000 then
                affichage:= IntToStr(Freq)+' Hz'
               else
               if Freq>1000000 then
                affichage:=FloatToStr(round(Freq/10)/100000)+' MHz'
               else
               affichage:=FloatToStr(round(Freq/10)/100)+' kHz';
              LabelFreq[i].Caption :=affichage;
           end;
      end;
  end;

procedure TFenetre_Spectre.InitButtonClick(Sender: TObject);

var lSampleFreq,i,d,j   : dword;
     byMode         : byte;
     dSens,alpha          : Double;
begin
        SetRecordLength( 1024 );
        SetPostSamples( 1024);
        compteur:=7;
        RecordLengthBox.Text  := '1024';
        lSampleFreq           := Frequence_echantillonnage[compteur];
      //  lcompteur.Text:=InttoStr(compteur);
        GetStartsample.Text:= InttoStr(0);
        GetStopsample.Text:= InttoStr(10);
//        SetSampelFreqBox.Text := IntToStr(lSampleFreq );
        SetSampleFrequency( @lSampleFreq );
      {  GetSampleFreqEdit.Text := FloatToStrF( 2, ffNumber, 18 , 0)+' ms/div';
        GetFreqPerDiv.Text :='0 - '+ FloatToStrF(100, ffNumber, 18 , 0)+' kHz'  ;
       }
       for i :=  1 to 9 do
           begin
             //LabelFreq[i].left:=round(100)*i-10;
             LabelFreq[i].Caption :=FloatToStr(2.5*i)+' kHz';
            // LabelFreq[i].visible:=True;
           end;

  {  GetStartFreq.Text :=IntToStr(0)+' Hz';
    GetStopFreq.Text :=IntToStr(100)+' kHz';
{    LabelFreqInit.text :=  IntToStr(0)+' Hz';}
 {   LabelFreqEnd.text :=  IntToStr(24)+' kHz';}

        expo := 10;
        expo2:=8;
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
        for i:=1 to expo2 do
        begin
              d:=1 shl (i-1);
              for j:=1 to d do
              begin
                indice2[j]:=indice2[j]*2;
                indice2[j+d]:=indice2[j]+1;
              end;
        end;
        dSens := 20;
        SetSensitivity ( lCh1, @dSens );
        SetSensitivity ( lCh2, @dSens );
        SetTriggerLevel( lCh1, 0.1    );
        SetTriggerHys  ( lCh1, 0.5    );
        byMode := 0;
        Settriggermode( byMode );
        SetTriggerSource( ltsCh1    );
    triglevelCh2box.Visible:=False;
    SpinTriglevelCh2.Visible:=False;
    SetTrigLevCh2Label.Visible:=False;
    triglevelCh1box.Visible:=True;
    SpinTriglevelCh1.Visible:=True;
    SetTrigLevCh1Label.Visible:=True;
    LabelLevel1.Visible:=True;
    LabelLevel2.Visible:=True;
        timer1.OnTimer := Timer1Timer;
     //   StartMeasureButtonClick(StartMeasureButton);
//StartMeasureButton.Down:=True;
Channel2Label.Visible:=False;
Fenetre_Spectre.Top:=0;
Fenetre_Spectre.Height:=742;
TriggerBox.Visible:=True;

ch1box.Visible:=True;
ch2box.Visible:=False;
//GroupBdeT.Visible:=True;
    rectangle.Checked:=False;
    blackman.Checked:=False;
    bartlett.Checked:=False;
    hamming.Checked:=False;
    hanning.Checked:=True;
    kaiser.Checked:=False;
    dBvolt.checked := False;
    volt.checked := False;
    dB.checked := True;
    dBwatt.checked := False;
    dBm.checked := False;
    dBu.checked := False;
    FFT_simple.Checked:=False;
    FFT_multiple.Checked:=True;
    voltefficace.checked := False;
    oscilloscope.checked := True;
    accumulation.Checked:=False;
    labelacquisition.visible:=False;
 //   image4.Visible:=true;
   // image3.Visible:=false;

SetCoupling( 1,  1 );
SetCoupling( 2,  1 );
GetCoupCh1Box.Text:='DC';
GetCoupCh2Box.Text:='DC';
Image1.Visible:=True;
//SetCh1SensBox.Visible:=False;
DisplayPaint1(self);
      bPaint := TRUE;
      init0:=0;
      init1:=0;

  Voies.CouleurFond := clBlack;
  Voies.CouleurGrille := clSilver ;
  Voies.CouleurVoie1 := clYellow;
  Voies.CouleurVoie2 := clLime;
  Voies.CouleurVoie3 := clWhite;
  Spectre.CouleurFond := clBlack;
Spectre.CouleurGrille := clSilver ;
Spectre.CouleurSpectre1 := clYellow;
Spectre.CouleurSpectre2 := clLime;
//ch1box.Font.color:=Spectre.CouleurSpectre1;
shapecalibre1.brush.color:=Spectre.CouleurSpectre1;
Spectre1Label.Font.color:=Spectre.CouleurSpectre1;
//ch2box.Font.color:=Spectre.CouleurSpectre2;
shapecalibre2.brush.color:=Spectre.CouleurSpectre2;
Spectre2Label.Font.color:=Spectre.CouleurSpectre2;
channel1Label.Font.color:=Voies.CouleurVoie1 ;
channel2Label.Font.color:=Voies.CouleurVoie2 ;
GetCh1OscSensBox.Font.color:=Voies.CouleurVoie1 ;
Getch2OscSensbox.Font.color:=Voies.CouleurVoie2 ;
Spectre1Label.color:=Spectre.CouleurFond ;
Spectre2Label.color:=Spectre.CouleurFond ;

Fenetre_Spectre.GetCh1OscSensBox.Font.color:=Fenetre_Spectre.Voies.CouleurFond  ;
Fenetre_Spectre.Getch2OscSensbox.Font.color:=Fenetre_Spectre.Voies.CouleurFond  ;
Fenetre_Spectre.GetCh1OscSensBox.color:=Fenetre_Spectre.Voies.CouleurFond ;
Fenetre_Spectre.Getch2OscSensbox.color:=Fenetre_Spectre.Voies.CouleurFond ;
Fenetre_Spectre.GetCh1OscSensBox.Font.color:=Fenetre_Spectre.Voies.CouleurVoie1;
Fenetre_Spectre.Getch2OscSensbox.Font.color:=Fenetre_Spectre.Voies.CouleurVoie2 ;
d:=15;
alpha:=1.6;
position0.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[0])));
position1.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[1])));
position2.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[2])));
position3.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[3])));
position4.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[4])));
position5.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[5])));
position6.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[6])));
position7.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[7])));
position8.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[8])));
position9.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[9])));
position10.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[10])));
position11.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[11])));
position12.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[12])));
position13.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[13])));
position14.left:=shapefreq.Left+round((shapefreq.Width-d)/2*(1-alpha*sin(teta50[14])));
position0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[0])));
position1.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[1])));
position2.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[2])));
position3.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[3])));
position4.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[4])));
position5.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[5])));
position6.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[6])));
position7.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[7])));
position8.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[8])));
position9.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[9])));
position10.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[10])));
position11.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[11])));
position12.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[12])));
position13.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[13])));
position14.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[14])));

 alpha:=1.6;
sensibilite10.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[0])));
sensibilite11.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[1])));
sensibilite12.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[2])));
sensibilite13.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[3])));
sensibilite14.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[4])));
sensibilite15.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[5])));
sensibilite16.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[6])));
sensibilite17.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[7])));
sensibilite18.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[8])));
sensibilite19.top:=shapecalibre1.Top+round((shapecalibre1.height-d)/2*(1-alpha*cos(tetasenssibilite[9])));
sensibilite10.left:=(shapecalibre1.Left)+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[0])));
sensibilite11.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[1])));
sensibilite12.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[2])));
sensibilite13.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[3])));
sensibilite14.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[4])));
sensibilite15.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[5])));
sensibilite16.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[6])));
sensibilite17.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[7])));
sensibilite18.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[8])));
sensibilite19.left:=shapecalibre1.Left+round((shapecalibre1.width-d)/2*(1-alpha*sin(tetasenssibilite[9])));

sensibilite20.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[0])));
sensibilite21.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[1])));
sensibilite22.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[2])));
sensibilite23.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[3])));
sensibilite24.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[4])));
sensibilite25.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[5])));
sensibilite26.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[6])));
sensibilite27.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[7])));
sensibilite28.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[8])));
sensibilite29.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[9])));
sensibilite20.left:=(shapecalibre2.Left)+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[0])));
sensibilite21.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[1])));
sensibilite22.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[2])));
sensibilite23.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[3])));
sensibilite24.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[4])));
sensibilite25.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[5])));
sensibilite26.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[6])));
sensibilite27.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[7])));
sensibilite28.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[8])));
sensibilite29.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[9])));
d:=8;
alpha:=0.95;
shape2.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[7])));
shape2.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[7])));

shape1.top:=shapecalibre2.Top+round((shapecalibre2.height-d)/2*(1-alpha*cos(tetasenssibilite[7])));
shape1.left:=shapecalibre2.Left+round((shapecalibre2.width-d)/2*(1-alpha*sin(tetasenssibilite[7])));

shapefreq0.top:=shapefreq.Top+round((shapefreq.height-d)/2*(1-alpha*cos(teta50[7])));
shapefreq0.left:=shapefreq.Left+round((shapefreq.width-d)/2*(1-alpha*sin(teta50[7])));

shape1.Visible:=true;
shape2.Visible:=true;
positionchange(self);
calibre1change(self);
calibre2change(self);
triggerbox.visible:=false;
declenchement.checked:=false;
     sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
   //   image7.Width:=panel3.width;
     // imageStartFreqUp.width:=round(image7.Width/20);
     // imageStopFreqDown.width:=round(image7.Width/20);
     // imageStartFreqDown.width:=round(image7.Width/20);
     // imageStopFreqUp.width:=round(image7.Width/20);
    //  panel3.Width:=localisation.Width-trackbarzero.width;
     // panel3.left:= trackbarzero.width{round(getstopfreq.Width/2)};
   {   imageStopFreqUp.Left:=image7.Width;
      imageStopFreqDown.Left:=image7.Width-imageStopFreqDown.Width;}
    //  shape3.Left:=0;
      shape3.Top:=58;
     // shape3.Width:=panel3.Width;
      shape3.Height:=52;
      shape4.Height:=shape3.Height;
      //shape4.Left:=0;
      shape4.Top:=shape3.Top;
      shape4.width:=shape3.Width;
     // imageStartFreqUp.visible:=true;
   //   imageStopFreqDown.visible:=true;
      getstartfreq.Left:=30;
      getstopfreq.Left:=round(0.98*panel3.Width){+round(getstopfreq.Width/2)};
  TrackBar1.Position:=0;
  positionmemoire:=0;
 // TrackBarStopFreq.Width:=Shape3.Width-15{-trackbarzero.width};
 // TrackBarStartFreq.Width:=Shape3.Width-15{-trackbarzero.width};
 // TrackBarStopFreq.Left:=25+trackbarzero.width;
//  TrackBarStartFreq.Left:=-8+trackbarzero.width;
  TrackBarStartFreq.Position:=0;
  TrackBarStopFreq.Position:=10;
  TrackBarzero.Position:=3;
 // TrackBarzero.height:=panel3.Top+panel3.height;
  rapport:=0.34{panel3.width/Paintbox2.Width};
  MeasureMode:=0;
  SetMeasureMode(lCh1);
  buttonVoie2.Visible:=True;
  buttonVoies1_2.Visible:=True;
     image3click(self);
end; { TForm1.InitButtonClick }


procedure TFenetre_Spectre.declenchementclick(Sender: TObject);
begin
   if declenchement.checked=true then
    begin
      triggerbox.visible:=False;
      declenchement.checked:=False;
    end
   else
    begin
      triggerbox.visible:=true;
      declenchement.checked:=true;
    end;
end;



procedure TFenetre_Spectre.TrackbarzeroChange(Sender: TObject);
var dcal : integer;
begin
ZeroEdit.Text:= IntToStr(Trackbarzero.Position);
dcal:=StrToInt(ZeroEdit.Text);
shape5.top:=Panel3.top+round((dcal+3)*panel3.Height/11); {ligne horizontale zero}
decalage.Top:=340+round((dcal-1)*panel3.Height/11);
end; { TForm1.ZeroButtonUpClick }



procedure TFenetre_Spectre.Timer1Timer(Sender: TObject);
begin
  if (timer1.enabled) and (@timer1.OnTimer <> nil) then
  begin
    if bAllowMeasuring then
    begin
      Timer1.enabled    := False;
      bInTimerProcedure := TRUE;
      if StartMeasurement = E_NO_ERRORS then
      begin
        GetMeasurementRaw( @Ch1WordArray, @Ch2WordArray );
          Display.Repaint;
          PaintBox2.Repaint;
          Panel3.Repaint
      end; { if }
      Timer1.enabled := True;
      bInTimerProcedure := FALSE;
    end; { if }
  end; { if }
end; { TForm1.Timer1Timer }


procedure TFenetre_Spectre.FormShow(Sender: TObject);
var wIndex: dWord;
begin    {initialize program}
  if application.terminated then
  begin
  end
  else
  begin
    DLLHandle := 0;
    bPaint := FALSE;
    bInTimerProcedure := FALSE;
  (*  Display.color:= clblack;*)
  //  MeasureModeBox.ItemIndex := 0;
   { InitButtonClick(Self); }    //!!!!!!!!!!!!!!!!!!!!!!!!!!!a voir!!!!!!!!!!!!!!!!fmerle!!!!

    for wIndex := 0 to 1024 do
      begin
        Ch1WordArray[wIndex] := 32767;
        Ch2WordArray[wIndex] := 32767;
      end; { for }
    for wIndex := 0 to 1024 do
      begin
        spectre1[windex]:=-100;
        spectre2[windex]:=-100;
      end; { for }
    LabelFreq[1]:=LabelFreq1;
    LabelFreq[2]:=LabelFreq2;
    LabelFreq[3]:=LabelFreq3;
    LabelFreq[4]:=LabelFreq4;
    LabelFreq[5]:=LabelFreq5;
    LabelFreq[6]:=LabelFreq6;
    LabelFreq[7]:=LabelFreq7;
    LabelFreq[8]:=LabelFreq8;
    LabelFreq[9]:=LabelFreq9;
    LabelFreq[10]:=LabelFreq10;

    InitButtonClick(Self);
  end;
   if application.terminated then
  begin
  end
  else
  begin


    InitButtonClick(Self);

  end;
end;  { TForm1.FormShow }



procedure TFenetre_Spectre.SetCoupCh1BoxChange(Sender: TObject);
var byCoupling : byte;
begin
  if SetCoupCh1Box.Text = 'AC' then
  begin
    byCoupling := 0;
  end { if }
  else
  begin
    byCoupling := 1;
  end; { else }
  SetCoupling( 1,  byCoupling );
  getCoupling( 1, @byCoupling );

  if byCoupling = 0 then
  begin
    GetCoupCh1Box.Text := 'AC';
  end { if }
  else
  begin
    GetCoupCh1Box.Text := 'DC';
  end; { else }
end; { TForm1.SetCoupCh1BoxChange }


procedure TFenetre_Spectre.SetCoupCh2BoxChange(Sender: TObject);
var byCoupling : byte;
begin
  if SetCoupCh2Box.Text = 'AC' then
  begin
    byCoupling := 0;
  end { if }
  else
  begin
    byCoupling := 1;
  end; { else }
  SetCoupling( 2,  byCoupling );
  getCoupling( 2, @byCoupling );

  if byCoupling = 0 then
  begin
    GetCoupCh2Box.Text := 'AC';
  end { if }
  else
  begin
    GetCoupCh2Box.Text := 'DC';
  end; { else }
end;
procedure TFenetre_Spectre.SetFreqLabelClick(Sender: TObject);
begin

end;

{ TForm1.SetCoupCh2BoxChange }




{dBW=dBV-17 si 50 ohms}
{dBm=dBV+13 si 50 ohms}
{dBu=dBV+2,2 si 600 ohms}

procedure TFenetre_Spectre.DisplayPaint(Sender: TObject);
var cal,wIndex,rlength,min,max,debut :integer;
    Index,fin,coeff :dWord;
    rSens,wCurrentY, wCurrentX,echelle: Double;
    decale:double;
    Mode: double;
     z,u,d,NbCol,NumCol,NbTre,NumTre,NbPap,NumPap,BasePap,OffsetPap :integer;
     a,b,n,nn,NF3,NF4,NF2,w,c,i,j:longint;
     maxsamples:longint;
     x,y,Freqech,Tech,angle,re,im,co,si,deltaf,coefdBV: double;
     samplefreq : dword;
     Currentlength : string;

begin
 {if positionmemoire=progressbar1.position then
 begin   }
     DisplayPaint1(self);
     DisplayPaintCH(Self);
  //   CalculDisplayPaint(self);
     GetMeasureMode( @Mode );
     rLength := (GetPostSamples);
                currentlength := IntToStr (rlength);
                samplefreq:= GetSampleFrequency;
                Freqech:=(samplefreq);
                Tech := 1/Freqech;
                maxsamples:=rlength;

      NF4:=1 shl (expo2);
      NF3:=2*NF4-1;
      NF2:=NF4*4;
if FFT_simple.Checked=true then
  begin
      if (MeasureMode{Box.ItemIndex }= 0) or
      (MeasureMode{Box.ItemIndex} = 2) then
      begin
       { if MeasureModeBox.ItemIndex = 0 then
          begin
           SetMeasureMode( lCh1 );
          end { if }
        {else
          begin
           SetmeasureMode( mCh12 );
          end;    }
        for a:=1 to NF2 do
          begin
            tabi[a] :=0;
            tabr[a] :=0;
            spectre1[a] :=0;
            FFTre[a] :=0;
            FFTim[a] :=0;
          end;

        if (hanning.checked) then
          begin
           for i:=1 to rLength do
                begin
                   xreal[i]:=(ch1WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                end;
          end
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
          end;

                  {début FFT}

         for i:=1 to maxsamples do FFTre[i]:=xreal[indice[i]+1];
                         NbCol:=expo;
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

         for i:=1 to 2*NF3+1 do
           begin
            spectre1[i]:=(sqrt(FFTre[i]*FFTre[i]+FFTim[i]*FFTim[i])/maxsamples*2/32767);
           end;

         spectre1[1]:=spectre1[1]/2;
         spectre1[2]:=spectre1[2]/2;
         if dB.Checked then
          begin
           for i:=1 to 2*NF3+1 do
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
         else if dBvolt.Checked then
          begin
            if  spectre1[1]<>0 then
             spectre1[1]:=20*Log10(spectre1[1])
            else
             spectre1[1]:=-80;
            for i:=2 to 2*NF3+1 do
              begin
               if  spectre1[i]<>0 then
                spectre1[i]:=20*Log10(spectre1[i])-3
               else
                spectre1[i]:=-80;
              end;
          end
         else if dBwatt.Checked then
          begin
            if  spectre1[1]<>0 then
             spectre1[1]:=20*Log10(spectre1[1])
            else
             spectre1[1]:=-80;
            for i:=2 to 2*NF3+1 do
              begin
               if  spectre1[i]<>0 then
                spectre1[i]:=20*Log10(spectre1[i])-20
               else
                spectre1[i]:=-80;
              end;
          end
         else if dBm.Checked then
          begin
           if  spectre1[1]<>0 then
             spectre1[1]:=20*Log10(spectre1[1])
           else
            spectre1[1]:=-80;
            for i:=2 to 2*NF3+1 do
              begin
                if  spectre1[i]<>0 then
                  spectre1[i]:=20*Log10(spectre1[i])+10
                else
                  spectre1[i]:=-80;
              end;
          end
         else if dBu.Checked then
          begin
            if  spectre1[1]<>0 then
              spectre1[1]:=20*Log10(spectre1[1])
            else
              spectre1[1]:=-80;
              for i:=2 to 2*NF3+1 do
                begin
                  if  spectre1[i]<>0 then
                    spectre1[i]:=20*Log10(spectre1[i])-0.8
                  else
                    spectre1[i]:=-80;
                end;
          end
         else if voltefficace.Checked then
          begin
            for i:=2 to 2*NF3+1 do
              begin
                spectre1[i]:=(spectre1[i])*0.707;
              end;
          end;
      end;
      if (MeasureMode{Box.ItemIndex }= 1) or
        (MeasureMode{Box.ItemIndex }= 2) then
        begin
        {if MeasureModeBox.ItemIndex = 1 then
          begin
            SetMeasureMode( lCh2 );
          end { if }
         { else
            begin
              SetmeasureMode( mCh12 );
            end;   }
          for a:=1 to NF2 do
            begin
              tabi[a] :=0;
              tabr[a] :=0;
              spectre2[a] :=0;
              FFTre[a] :=0;
              FFTim[a] :=0;
            end;

          if (hanning.checked) then
            begin
              for i:=1 to maxsamples do
                begin
                  xreal[i]:=(ch2WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                end;
            end
          else if(hamming.checked) then
            begin
              for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*(0.54+0.46*cos(pi*(2*i-1-maxsamples)/maxsamples));
                      end;
            end
          else if(blackman.checked) then
            begin
              for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*(0.42+0.5*cos(pi*(2*i-1-maxsamples)/maxsamples)+0.08*cos(2*pi*(2*i-1-maxsamples)/maxsamples));
                      end;
            end
          else if(bartlett.checked) then
            begin
              for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*(1-abs(2*i-1-maxsamples)/maxsamples);
                      end;
            end
          else if (kaiser.checked) then
            begin
              for i:=1 to maxsamples do
                      begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*KaiserFile[i*round(64/delta)];
                      end;
            end
          else
            begin
              for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767);
                      end;
            end;

          for i:=1 to maxsamples do FFTre[i]:=xreal[indice[i]+1];
                         NbCol:=expo;
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

         for i:=1 to 2*NF3+1 do
          begin
            spectre2[i]:=(sqrt(FFTre[i]*FFTre[i]+FFTim[i]*FFTim[i])/maxsamples*2/32767);
          end;

         spectre2[1]:=spectre2[1]/2;
         spectre2[2]:=spectre2[2]/2;
         if dB.Checked then
          begin
            for i:=1 to 2*NF3+1 do
              begin
                if  spectre2[i]<>0 then
                  spectre2[i]:=20*Log10(spectre2[i])
                else
                spectre2[i]:=-80;
              end;

          end
         else  if volt.Checked then
          begin
          end
         else if dBvolt.Checked then
          begin
            if  spectre2[1]<>0 then
              spectre2[1]:=20*Log10(spectre2[1])
            else
              spectre2[1]:=-80;
            for i:=2 to 2*NF3+1 do
              begin
                if  spectre2[i]<>0 then
                  spectre2[i]:=20*Log10(spectre2[i])-3
                else
                  spectre2[i]:=-80;
              end;
          end
         else if dBwatt.Checked then
          begin
            if  spectre2[1]<>0 then
              spectre2[1]:=20*Log10(spectre2[1])
            else
              spectre2[1]:=-80;
              for i:=2 to 2*NF3+1 do
                begin
                  if  spectre2[i]<>0 then
                   spectre2[i]:=20*Log10(spectre2[i])-20
                  else
                    spectre2[i]:=-80;
                end;
          end
         else if dBm.Checked then
          begin
            if  spectre2[1]<>0 then
              spectre2[1]:=20*Log10(spectre2[1])
            else
              spectre2[1]:=-80;
              for i:=2 to 2*NF3+1 do
                begin
                  if  spectre2[i]<>0 then
                    spectre2[i]:=20*Log10(spectre2[i])+10
                  else
                    spectre2[i]:=-80;
                end;
          end
         else if dBu.Checked then
          begin
            if  spectre2[1]<>0 then
              spectre2[1]:=20*Log10(spectre2[1])
            else
              spectre2[1]:=-80;
            for i:=2 to 2*NF3+1 do
              begin
                if  spectre2[i]<>0 then
                  spectre2[i]:=20*Log10(spectre2[i])-0.8
                else
                  spectre2[i]:=-80;
              end;
          end
         else if voltefficace.Checked then
          begin
            for i:=2 to 2*NF3+1 do
              begin
                spectre2[i]:=(spectre2[i])*0.707;
              end;
          end;
       end;
  end
  else
  begin

      NF2:=NF3+1;
      NF3:=NF4-1;
      NF4:=round((NF3+1)/2);
   if (MeasureMode{Box.ItemIndex }= 0) or
      (MeasureMode{Box.ItemIndex }= 2) then
    begin
      {if MeasureModeBox.ItemIndex = 0 then
        begin
          SetMeasureMode( lCh1 );
        end { if }
      {else
        begin
          SetmeasureMode( mCh12 );
        end;  }


      if (hanning.checked) then
        begin
            for i:=1 to rLength do
                     begin
                       xreal[i]:=(ch1WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                     end;
        end
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
        end;


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
            spectre1[i]:=sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
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
              spectre1[i+NF2]:=sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                {fin du calcul de la deuxième partie du spectre}
            end;

          spectre1[1]:=spectre1[1]/2;
          spectre1[2]:=spectre1[2]/2;
          if dB.Checked then
            begin
              for i:=1 to 2*NF2-1 do
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
          else if dBvolt.Checked then
            begin
              if  spectre1[1]<>0 then
                spectre1[1]:=20*Log10(spectre1[1])
              else
                spectre1[1]:=-80;
              for i:=2 to 2*NF2-1 do
                begin
                  if  spectre1[i]<>0 then
                    spectre1[i]:=20*Log10(spectre1[i])-3
                  else
                    spectre1[i]:=-80;
                end;
            end
          else if dBwatt.Checked then
            begin
              if  spectre1[1]<>0 then
                spectre1[1]:=20*Log10(spectre1[1])
              else
                spectre1[1]:=-80;
              for i:=2 to 2*NF2-1 do
                begin
                  if  spectre1[i]<>0 then
                    spectre1[i]:=20*Log10(spectre1[i])-20
                  else
                    spectre1[i]:=-80;
                end;
            end
          else if dBm.Checked then
            begin
              if  spectre1[1]<>0 then
                spectre1[1]:=20*Log10(spectre1[1])
              else
                spectre1[1]:=-80;
              for i:=2 to 2*NF2-1 do
                begin
                  if  spectre1[i]<>0 then
                    spectre1[i]:=20*Log10(spectre1[i])+10
                  else
                    spectre1[i]:=-80;
                end;
            end
          else if dBu.Checked then
            begin
              if  spectre1[1]<>0 then
                spectre1[1]:=20*Log10(spectre1[1])
              else
                spectre1[1]:=-80;
                for i:=2 to 2*NF2-1 do
                  begin
                    if  spectre1[i]<>0 then
                      spectre1[i]:=20*Log10(spectre1[i])-0.8
                    else
                      spectre1[i]:=-80;
                  end;
            end
          else if voltefficace.Checked then
            begin
              for i:=2 to 2*NF2-1 do
                begin
                  spectre1[i]:=(spectre1[i])*0.707;
                end;
            end;

      end;


     if (MeasureMode{Box.ItemIndex} = 1) or
       (MeasureMode{Box.ItemIndex} = 2) then
      begin
       { if MeasureModeBox.ItemIndex = 1 then
          begin
            SetMeasureMode( lCh2 );
          end { if }
        {else
          begin
            SetmeasureMode( mCh12 );
          end;  }

        if (hanning.checked) then
          begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*(1-cos(2*pi*i/maxsamples));
                      end;
          end
        else if(hamming.checked) then
          begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*(0.54+0.46*cos(pi*(2*i-1-maxsamples)/maxsamples));
                      end;
          end
        else if(blackman.checked) then
          begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*(0.42+0.5*cos(pi*(2*i-1-maxsamples)/maxsamples)+0.08*cos(2*pi*(2*i-1-maxsamples)/maxsamples));
                      end;
          end
        else if(bartlett.checked) then
          begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*(1-abs(2*i-1-maxsamples)/maxsamples);
                      end;
          end
        else if (kaiser.checked) then
          begin
            for i:=1 to maxsamples do
                      begin
                       xreal[i]:=(ch2WordArray[i]-32767)*2*KaiserFile[i*round(64/delta)];
                      end;
          end
        else
          begin
            for i:=1 to maxsamples do
                     begin
                       xreal[i]:=(ch2WordArray[i]-32767);
                      end;
          end;

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
              spectre2[i]:=sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
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
                 { for i:=1 to maxsamples do
                    begin
//                       indice[i]:=0;
                       FFTre[i] :=0;
                       FFTim[i] :=0;
                    end;   }
                  for nn:=1 to NF3+1 do
                    begin
                       b:=4*(nn-1)+u+1;
                       xxreal[nn]:={(ch2Wordarray[b]-32767)*(1-cos(2*pi*b/maxsamples))}xreal[b]*cos(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
                       xximag[nn]:=-{(ch2Wordarray[b]-32767)*(1-cos(2*pi*b/maxsamples))}xreal[b]*sin(2*pi*(z*(nn-1)/(maxsamples/2)+b/4));
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
                spectre2[i+NF2]:=sqrt(tabr[i]*tabr[i]+tabi[i]*tabi[i])/maxsamples*2/32767;
                      {fin du calcul de la deuxième partie du spectre}
              end;

            spectre2[1]:=spectre2[1]/2;
            spectre2[2]:=spectre2[2]/2;
            if dB.Checked then
              begin
                for i:=1 to 2*NF2-1 do
                  begin
                    if  spectre2[i]<>0 then
                      spectre2[i]:=20*Log10(spectre2[i])
                    else
                      spectre2[i]:=-80;
                  end;

              end
            else  if volt.Checked then
              begin
              end
            else if dBvolt.Checked then
              begin
                if  spectre2[1]<>0 then
                  spectre2[1]:=20*Log10(spectre2[1])
                else
                  spectre2[1]:=-80;
                for i:=2 to 2*NF2-1 do
                  begin
                    if  spectre2[i]<>0 then
                      spectre2[i]:=20*Log10(spectre2[i])-3
                    else
                      spectre2[i]:=-80;
                  end;
              end
            else if dBwatt.Checked then
              begin
                if  spectre2[1]<>0 then
                  spectre2[1]:=20*Log10(spectre2[1])
                else
                  spectre2[1]:=-80;
                  for i:=2 to 2*NF2-1 do
                    begin
                      if  spectre2[i]<>0 then
                        spectre2[i]:=20*Log10(spectre2[i])-20
                      else
                        spectre2[i]:=-80;
                    end;
              end
            else if dBm.Checked then
              begin
                if  spectre2[1]<>0 then
                  spectre2[1]:=20*Log10(spectre2[1])
                else
                  spectre2[1]:=-80;
                  for i:=2 to 2*NF2-1 do
                    begin
                      if  spectre2[i]<>0 then
                        spectre2[i]:=20*Log10(spectre2[i])+10
                      else
                        spectre2[i]:=-80;
                    end;
              end
            else if dBu.Checked then
              begin
                if  spectre2[1]<>0 then
                  spectre2[1]:=20*Log10(spectre2[1])
                else
                  spectre2[1]:=-80;
                for i:=2 to 2*NF2-1 do
                    begin
                      if  spectre2[i]<>0 then
                        spectre2[i]:=20*Log10(spectre2[i])-0.8
                      else
                        spectre2[i]:=-80;
                    end;
              end
            else if voltefficace.Checked then
              begin
                for i:=2 to 2*NF2-1 do
                  begin
                    spectre2[i]:=(spectre2[i])*0.707;
                  end;
              end;
      end;

  end;
  CalculDisplayPaint(self);
  {end;
   positionmemoire:=progressbar1.position;}
end; { TForm1.calculDisplayPaint }



procedure TFenetre_Spectre.DisplayPaint1(Sender: TObject);
var cal:integer;
     i,j:longint;
begin
        for i:=1 to 9 do
        for j:=1 to 39 do
          Display.Canvas.Pixels[round((display.Width*i)/10),
          round(display.Height*j/40)]:= Voies.CouleurGrille ; {lignes verticales}
    for i:=1 to 7 do
        for j:=1 to 49 do
          Display.Canvas.Pixels[round((display.Width*j)/50),
          round(display.Height*i/8)]:= Voies.CouleurGrille ; {lignes horizontales}
    for j:=1 to 49 do
          Display.Canvas.Pixels[round((display.Width*j)/50+10),
          round(display.Height/2)]:= Voies.CouleurGrille ;     {ligne horizontale centrale}
        Display.Canvas.Pen.Color := Voies.CouleurGrille ;

      for i:=1 to 9 do
        for j:=1 to 24 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*i)/10),
          round(PaintBox2.Height*j/25)]:= Spectre.CouleurGrille ; {lignes verticales}

     for i:=1 to 4 do
        for j:=1 to 59 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/60),
          round(PaintBox2.Height*i/5)]:= Spectre.CouleurGrille ; {lignes horizontales}
{cal:=0;}
if (MeasureMode{Box.ItemIndex }= 0) or
   (MeasureMode{Box.ItemIndex }= 2) then
  begin
    if volt.Checked or voltefficace.Checked then
    begin
    GetCh1SensBoxdBW.Visible:=False;
    GetCh1SensBoxdBm.Visible:=False;
    GetCh1SensBoxdBu.Visible:=False;
    GetCh1SensBoxdBV.Visible:=False;
    GetCh1SensBoxdB.Visible:=False;
    GetCh1SensBox.Visible:=True;
    zerolabel.Top:=246;
    labelzero.Visible:=False;
    trackbarzero.Visible:=False;
    decalage.Visible:=False;
    shape5.Visible:=False;
    LabelAmpSpec.Caption:='(V)';
    shape3.height:=panel3.height;
    shape3.top:=0;
    shape4.height:=shape3.height;
    shape4.top:=shape3.top;
    end
    else
    begin
      if dBvolt.Checked then
        begin
        GetCh1SensBoxdBV.Visible:=True;
        GetCh1SensBoxdB.Visible:=False;
        GetCh1SensBoxdBW.Visible:=False;
        GetCh1SensBoxdBm.Visible:=False;
        GetCh1SensBoxdBu.Visible:=False;
        LabelAmpSpec.Caption:='(dBV)'
        end
        else if dB.Checked then
        begin
        GetCh1SensBoxdB.Visible:=True;
        GetCh1SensBoxdBW.Visible:=False;
        GetCh1SensBoxdBV.Visible:=False;
        GetCh1SensBoxdBm.Visible:=False;
        GetCh1SensBoxdBu.Visible:=False;
        LabelAmpSpec.Caption:='(dB)'
        end
      else if dBwatt.Checked then
        begin
        GetCh1SensBoxdBW.Visible:=True;
        GetCh1SensBoxdB.Visible:=False;
        GetCh1SensBoxdBV.Visible:=False;
        GetCh1SensBoxdBm.Visible:=False;
        GetCh1SensBoxdBu.Visible:=False;
        LabelAmpSpec.Caption:='(dBW)'
        end
      else if dBm.Checked then
        begin
        GetCh1SensBoxdBm.Visible:=True;
        GetCh1SensBoxdB.Visible:=False;
        GetCh1SensBoxdBV.Visible:=False;
        GetCh1SensBoxdBu.Visible:=False;
        GetCh1SensBoxdBW.Visible:=False;
        LabelAmpSpec.Caption:='(dBm)'
        end
      else if dBu.Checked then
        begin
        GetCh1SensBoxdBu.Visible:=True;
        GetCh1SensBoxdB.Visible:=False;
        GetCh1SensBoxdBV.Visible:=False;
        GetCh1SensBoxdBm.Visible:=False;
        GetCh1SensBoxdBW.Visible:=False;
        LabelAmpSpec.Caption:='(dBu)'
        end;
      shape3.height:=52;
      shape3.top:=58;
      shape4.height:=shape3.height;
      shape4.top:=shape3.top;
      GetCh1SensBox.Visible:=False;
      TrackBarZero.Visible:=True;
      decalage.Visible:=true;
      shape5.Visible:=True;
      labelzero.Visible:=True;
      cal:=StrToInt(ZeroEdit.Text)-1;
      zerolabel.Top:=(cal)*48+6;
{      for j:=0 to 119 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/120),
          round((cal)*PaintBox2.Height)]:= clFuchsia; {ligne horizontale zero}
 {     end;}
        if cal<0 then
        begin
       // decalage.Visible:=True;
       // decalage.caption:=IntToStr(-cal)+' div au dessus';
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          1]:= clLime{clMoneyGreen}
        end;
        if cal=0 then
        begin
       // decalage.Visible:=False;
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          1]:= clFuchsia{clMoneyGreen}
        end;
        if cal>0 then
        begin
       // decalage.Visible:=False;
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          round((cal)*PaintBox2.Height/5)]:= clFuchsia {ligne horizontale zero}
        end;
        if cal=5 then
        begin
       // decalage.Visible:=False;
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          PaintBox2.Height-2]:= clFuchsia{clMoneyGreen};
        end;
   end;
  end;
if (MeasureMode{Box.ItemIndex }= 1) or
   (MeasureMode{Box.ItemIndex }= 2) then
  begin
    if volt.Checked or  voltefficace.Checked then
    begin
    GetCh2SensBoxdBW.Visible:=False;
    GetCh2SensBoxdBm.Visible:=False;
    GetCh2SensBoxdBu.Visible:=False;
    GetCh2SensBoxdBV.Visible:=False;
    GetCh2SensBoxdB.Visible:=False;
    GetCh2SensBox.Visible:=True;
    zerolabel.Top:=228;
    labelzero.Visible:=False;
    trackBarZero.Visible:=False;
    decalage.Visible:=False;
    shape5.Visible:=False;
    shape5.Visible:=False;
    end
    else
    begin
      if dBvolt.Checked then
        begin
        GetCh2SensBoxdBV.Visible:=True;
        GetCh2SensBoxdB.Visible:=False;
        GetCh2SensBoxdBW.Visible:=False;
        GetCh2SensBoxdBm.Visible:=False;
        GetCh2SensBoxdBu.Visible:=False
        end
        else if dB.Checked then
        begin
        GetCh2SensBoxdB.Visible:=True;
        GetCh2SensBoxdBW.Visible:=False;
        GetCh2SensBoxdBV.Visible:=False;
        GetCh2SensBoxdBm.Visible:=False;
        GetCh2SensBoxdBu.Visible:=False
        end
      else if dBwatt.Checked then
        begin
        GetCh2SensBoxdBW.Visible:=True;
        GetCh2SensBoxdB.Visible:=False;
        GetCh2SensBoxdBV.Visible:=False;
        GetCh2SensBoxdBm.Visible:=False;
        GetCh2SensBoxdBu.Visible:=False
        end
      else if dBm.Checked then
        begin
        GetCh2SensBoxdBm.Visible:=True;
        GetCh2SensBoxdB.Visible:=False;
        GetCh2SensBoxdBV.Visible:=False;
        GetCh2SensBoxdBu.Visible:=False;
        GetCh2SensBoxdBW.Visible:=False
        end
      else if dBu.Checked then
        begin
        GetCh2SensBoxdBu.Visible:=True;
        GetCh2SensBoxdB.Visible:=False;
        GetCh2SensBoxdBV.Visible:=False;
        GetCh2SensBoxdBm.Visible:=False;
        GetCh2SensBoxdBW.Visible:=False
        end;
        GetCh2SensBox.Visible:=False;
        trackBarZero.Visible:=True;
        decalage.Visible:=true;
        shape5.Visible:=True;
        labelzero.Visible:=True;
        cal:=StrToInt(ZeroEdit.Text)-1;
        zerolabel.Top:=(cal)*48+6;
        if cal=0 then
        begin
       // decalage.Visible:=False;
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          1]:= clFuchsia{clMoneyGreen} ;
        end;
        if cal>0 then
        begin
      //  decalage.Visible:=False;
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          round(cal*PaintBox2.Height/5)]:= clFuchsia; {ligne horizontale zero}
        end;
        if cal<0 then
        begin
       // decalage.Visible:=True;
      //  decalage.caption:=IntToStr(-cal)+' div';
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          1]:= clLime{clMoneyGreen};
        end;
        if cal=5 then
        begin
      //  decalage.Visible:=False;
        for j:=0 to 239 do
          PaintBox2.Canvas.Pixels[round((PaintBox2.Width*j)/240),
          PaintBox2.Height-2]:= clFuchsia{clMoneyGreen};
        end;
     //  shape5.Visible:=True;

    end;

   end;


end; { TForm1.DisplayPaint1 }



procedure TFenetre_Spectre.DisplayPaintCH(Sender: TObject);
var wIndex :integer;
compteur:longint;
    rSens,wCurrentY,coeff: Double;
begin
//Display.Canvas.Brush.Color := Voies.CouleurFond;
Panel1.Color := Voies.CouleurFond;
if (MeasureMode{Box.ItemIndex }= 0){ or
    (MeasureModeBox.ItemIndex = 2)} then
    begin
    if    TesterDepassementSignal1(self) then
    begin
    end;
    TimerDepassementSignal2.Enabled:=false;
    LabelWARNING2.Visible:=false;
      Display.Canvas.Pen.Color := Voies.CouleurVoie1;
      wCurrentY := ( ((( Ch1WordArray[0] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
      Display.Canvas.MoveTo(0,round(wCurrentY));
      GetSensitivity( lCh1, @rSens);
      try
        for wIndex := 1 to round(Display.Width*2) do
        begin
          wCurrentY :=( ((( Ch1WordArray[wIndex] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
          Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));

        end; { for }
        Display.Canvas.Pen.Color := Voies.CouleurVoie3;
   if FormGBF.SpeedButtonON.down=True then
      begin
       if (FormGBF.TabSheetAM.visible=true) then
          begin
          if FormGBF.RadioButtonmodulantAM.Checked=true then
          begin
          coeff:=getsamplefrequency/enveloppe[0];
           wCurrentY := ( ((( enveloppe[1]/rsens{ - 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
           Display.Canvas.MoveTo(0,round(wCurrentY));
              wIndex := 1;
            repeat
               compteur:=round((wIndex+1)/coeff);
               if compteur>131072 then compteur:=compteur-131072;

               wCurrentY :=( ((( enveloppe[compteur]/rsens {- 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
               Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
               wIndex := wIndex +1;
            until windex>round(Display.Width*2);

          {   for wIndex := 1 to round(Display.Width*2) do
                begin
                  wCurrentY :=( ((( enveloppe[round((wIndex+1)/coeff)]/rsens ) ) * (Display.Height / 2)) + Display.Height / 2);
               {   Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));

                end;  }
          end;
          end;
          if (FormGBF.TabSheetFM.visible=true) then
          begin
          if FormGBF.RadioButtonmodulantFM.Checked=true then
          begin
          coeff:=getsamplefrequency/enveloppe[0];
           wCurrentY := ( ((( enveloppe[1]/rsens{ - 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
           Display.Canvas.MoveTo(0,round(wCurrentY));
              wIndex := 1;
            repeat
               compteur:=round((wIndex+1)/coeff);
               if compteur>131072 then compteur:=compteur-131072;

               wCurrentY :=( ((( enveloppe[compteur]/rsens {- 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
               Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
               wIndex := wIndex +1;
            until windex>round(Display.Width*2);

          {   for wIndex := 1 to round(Display.Width*2) do
                begin
                  wCurrentY :=( ((( enveloppe[round((wIndex+1)/coeff)]/rsens ) ) * (Display.Height / 2)) + Display.Height / 2);
               {   Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));

                end;  }
          end;
          end;
     if (FormGBF.TabSheetPM.visible=true) then
          begin
          if FormGBF.RadioButtonmodulantPM.Checked=true then
          begin
          coeff:=getsamplefrequency/enveloppe[0];
           wCurrentY := ( ((( enveloppe[1]/rsens{ - 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
           Display.Canvas.MoveTo(0,round(wCurrentY));
            wIndex := 1;
            repeat
               compteur:=round((wIndex+1)/coeff);
               if compteur>131072 then compteur:=compteur-131072;

               wCurrentY :=( ((( enveloppe[compteur]/rsens {- 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
               Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
               wIndex := wIndex +1;
            until windex>round(Display.Width*2);
           {  for wIndex := 1 to round(Display.Width*2) do
                begin
                  wCurrentY :=( ((( enveloppe[round((wIndex+1)/coeff)]/rsens ) ) * (Display.Height / 2)) + Display.Height / 2);
                {  Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));

                end; }
          end;
          end;
        if (FormGBF.ModNum.down=true) then
          begin
          if FormGBF.RadioButtonmodulantNum.Checked=true then
          begin
          coeff:=getsamplefrequency/enveloppe[0];
           wCurrentY := ( ((( enveloppe[1]/rsens{ - 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
           Display.Canvas.MoveTo(0,round(wCurrentY));
            wIndex := 1;
            repeat
               compteur:=round((wIndex+1)/coeff);
               if compteur>131072 then compteur:=compteur-131072;

               wCurrentY :=( ((( enveloppe[compteur]/rsens {- 32767 }) {/ -32767}) * (Display.Height / 2)) + Display.Height / 2);
               Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
               wIndex := wIndex +1;
            until windex>round(Display.Width*2);
           {  for wIndex := 1 to round(Display.Width*2) do
                begin
                  wCurrentY :=( ((( enveloppe[round((wIndex+1)/coeff)]/rsens ) ) * (Display.Height / 2)) + Display.Height / 2);
                {  Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));

                end; }
          end;
          end;
      end;
      except
      end; { try }
end;
if (MeasureMode{Box.ItemIndex }= 1){ or
    (MeasureModeBox.ItemIndex = 2)} then
    begin
        if    TesterDepassementSignal2(self) then
    begin
    end;
    TimerDepassementSignal1.Enabled:=false;
    LabelWARNING1.Visible:=false;
      Display.Canvas.Pen.Color := Voies.CouleurVoie2;
      wCurrentY := ( ((( Ch2WordArray[0] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
      Display.Canvas.MoveTo(0,round(wCurrentY));
      GetSensitivity( lCh2, @rSens);
      try
        for wIndex := 1 to round(Display.Width*2) do
        begin
          wCurrentY :=( ((( Ch2WordArray[wIndex] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
          Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
        end; { for }
      except
      end; { try}
    end;
 if (MeasureMode{Box.ItemIndex} = 2) then
    begin
      if    TesterDepassementSignal1(self) then
      begin
      end;
      Display.Canvas.Pen.Color := Voies.CouleurVoie1;
      wCurrentY := ( ((( Ch1WordArray[0] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
      Display.Canvas.MoveTo(0,round(wCurrentY));
      GetSensitivity( lCh1, @rSens);
      try
        for wIndex := 1 to round(Display.Width*2) do
        begin
          wCurrentY :=( ((( Ch1WordArray[wIndex] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
          Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
        end; { for }
      except
      end; { try }
      if    TesterDepassementSignal2(self) then
      begin
      end;
      Display.Canvas.Pen.Color := Voies.CouleurVoie2;
      wCurrentY := ( ((( Ch2WordArray[0] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
      Display.Canvas.MoveTo(0,round(wCurrentY));
      GetSensitivity( lCh2, @rSens);
      try
        for wIndex := 1 to round(Display.Width*2) do
        begin
          wCurrentY :=( ((( Ch2WordArray[wIndex] - 32767 ) / -32767) * (Display.Height / 2)) + Display.Height / 2);
          Display.Canvas.LineTo(round(wIndex*(Display.Width-1)/1000),  Round(wCurrentY));
        end; { for }
      except
      end; { try}
    end;
end; { TForm1.DisplayPaintCH }


procedure TFenetre_Spectre.CalculDisplayPaint(Sender: TObject);
var cal,rlength,min,max,debut,wIndex,FFTcal :integer;
    fin{,positionmemoire}:dWord;
    echelle,rsens,wCurrentY: Double;
     NF4,NF2:longint;
     Currentlength : string;
begin
//positionmemoire:=progressbar1.position;
rLength := (GetPostSamples);
currentlength := IntToStr (rlength);
NF4:=1 shl (expo-2);
NF2:=NF4*4;
max:=StrToInt(GetStopSample.Text);
min:=StrToInt(GetStartSample.Text);
echelle:=(max-min)/10;
debut:=round(NF2*min/10{/1.04});
fin:=round(NF2*max/10{/1.04});
if FFT_simple.Checked=true then FFTcal:=1
else
  begin
    FFTCal:=2;
    //fin:=fin*2;
  end;
{CalculDisplayPaint(Self);}
{if positionmemoire=progressbar1.position then
 begin   }
if (accumulation.checked) then
  begin
      PaintBox2.Visible:=False;
      Display.Visible:=False;
  //    Panel3.Visible:=False;
  end
  else
  begin
      PaintBox2.Visible:=True;
      Display.Visible:=True;
  //    Panel3.Visible:=True;
  end;

 if bPaint then
   begin
  { DisplayPaintCH(Self);}
    Panel2.Color := Spectre.CouleurFond;
    if (MeasureMode{Box.ItemIndex }= 0) or
        (MeasureMode{Box.ItemIndex }= 2) then
     begin
      GetSensitivity( lCh1, @rSens);
      PaintBox2.Canvas.Pen.Color := Spectre.CouleurSpectre1;
      Shape3.Canvas.Pen.Color := Spectre.CouleurSpectre1;
      if voltefficace.Checked or volt.Checked then
        begin
         {cal:=0; }
         wCurrentY :=  spectre1[debut+1] * (-8)/5*PaintBox2.Height+ PaintBox2.Height-1;
         PaintBox2.Canvas.MoveTo(0, Round(wCurrentY));
         try
          for wIndex :=debut+1 to fin-1 do
            begin
              wCurrentY :=  spectre1[wIndex] * (-8)/5*PaintBox2.Height+ PaintBox2.Height-1 ;
              PaintBox2.Canvas.LineTo(round((wIndex-debut)/delta/echelle/4.096*8{50/6}/FFTcal),  Round(wCurrentY));
            end;
         except
         end;
         wCurrentY :=  spectre1[1] * (-8)/5*Shape3.Height+ Shape3.Height-1;
         Shape3.Canvas.MoveTo(0, Round(wCurrentY));
         try
            for wIndex :=1 to NF2 do
              begin
                wCurrentY :=  spectre1[wIndex] * (-8)/5*Shape3.Height+ Shape3.Height-1 ;
                Shape3.Canvas.LineTo(round((wIndex)/delta{/echelle}/4.096*8{50/6}/FFTcal*rapport),  Round(wCurrentY));
              end;
         except
         end;

        end
        else
        begin
          cal:=StrToInt(ZeroEdit.Text)-1;
          wCurrentY := -(spectre1[debut+1]+20*Log10(rSens))*(PaintBox2.Height/(rsens*5))+PaintBox2.Height/5*cal;
          PaintBox2.Canvas.MoveTo(0, Round(wCurrentY));
          try
            for wIndex :=debut+1 to fin-1 do
              begin
                wCurrentY := -(spectre1[windex]+20*Log10(rSens))*(PaintBox2.Height/(rsens*5))+{PaintBox2.Height/4)+}PaintBox2.Height/5*cal;
                PaintBox2.Canvas.LineTo(round((wIndex-debut)/delta/echelle/4.096*8{50/6}/FFTcal),  Round(wCurrentY));
              end;
          except
          end;
          wCurrentY := -(spectre1[1]+20*Log10(rSens))*(Shape3.Height/(rsens*5))+Shape3.Height/5*cal;
          Shape3.Canvas.MoveTo(0, Round(wCurrentY));
          try
            for wIndex :=1 to NF2 do
              begin
                wCurrentY := -(spectre1[windex]+20*Log10(rSens))*(Shape3.Height/(rsens*5))+{PaintBox2.Height/4)+}Shape3.Height/5*cal;
                Shape3.Canvas.LineTo(round((wIndex)/delta{/echelle}/4.096*8{50/6}/FFTcal*rapport),  Round(wCurrentY));
              end;
          except
          end;
        end; { if }
     end;
   if (MeasureMode{Box.ItemIndex} = 1) or
      (MeasureMode{Box.ItemIndex }= 2) then
      begin
       GetSensitivity( lCh2, @rSens);
       PaintBox2.Canvas.Pen.Color := Spectre.CouleurSpectre2;
       shape3.Canvas.Pen.Color := Spectre.CouleurSpectre2;
       if voltefficace.Checked or volt.Checked then
       begin
          {cal:=0; }
          wCurrentY :=  spectre2[debut+1] * (-8)/5*PaintBox2.Height+ PaintBox2.Height-1;
          PaintBox2.Canvas.MoveTo(0, Round(wCurrentY));
          try
          for wIndex :=debut+1 to fin-1 do
            begin
              wCurrentY :=  spectre2[wIndex] * (-8)/5*PaintBox2.Height+ PaintBox2.Height-1 ;
              PaintBox2.Canvas.LineTo(round((wIndex-debut)/delta/echelle/4.096*8{50/6}/FFTcal),  Round(wCurrentY));
            end;
          except
          end;
           wCurrentY :=  spectre2[1] * (-8)/5*Shape3.Height+ Shape3.Height-1;
           Shape3.Canvas.MoveTo(0, Round(wCurrentY));
         try
            for wIndex :=1 to NF2 do
              begin
                wCurrentY :=  spectre2[wIndex] * (-8)/5*Shape3.Height+ Shape3.Height-1 ;
                Shape3.Canvas.LineTo(round((wIndex)/delta{/echelle}/4.096*8{50/6}/FFTcal*rapport),  Round(wCurrentY));
              end;
         except
         end;
        end
        else
        begin
          cal:=StrToInt(ZeroEdit.Text)-1;
          wCurrentY := -(spectre2[debut+1]+20*Log10(rSens))*(PaintBox2.Height/(rsens*5))+PaintBox2.Height/5*cal;
          PaintBox2.Canvas.MoveTo(0, Round(wCurrentY));
          try
          for wIndex :=debut+1 to fin-1 do
          begin
            wCurrentY := -(spectre2[windex]+20*Log10(rSens))*(PaintBox2.Height/(rsens*5))+{PaintBox2.Height/4)+}PaintBox2.Height/5*cal;
            PaintBox2.Canvas.LineTo(round((wIndex-debut)/delta/echelle/4.096*8{50/6}/FFTcal),  Round(wCurrentY));
          end;
          except
          end;
           wCurrentY := -(spectre2[1]+20*Log10(rSens))*(Shape3.Height/(rsens*5))+Shape3.Height/5*cal;
          Shape3.Canvas.MoveTo(0, Round(wCurrentY));
          try
            for wIndex :=1 to NF2 do
              begin
                wCurrentY := -(spectre2[windex]+20*Log10(rSens))*(Shape3.Height/(rsens*5))+{PaintBox2.Height/4)+}Shape3.Height/5*cal;
                Shape3.Canvas.LineTo(round((wIndex)/delta{/echelle}/4.096*8{50/6}/FFTcal*rapport),  Round(wCurrentY));
              end;
          except
          end;
        end;
      end;
{ end;}
 end;       { if }
{ positionmemoire:=progressbar1.position;}
end;

procedure TFenetre_Spectre.Couleurs1Click(Sender: TObject);
begin
if FormSpectreCouleurGraphes.visible = true  then   FormSpectreCouleurGraphes.BringToFront
else
 FormSpectreCouleurGraphes.visible := true;
end;

procedure TFenetre_Spectre.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.checked=True then
begin
{AutoTrigLevel.checked:=true;}
GroupBoxLevel.visible:=False
end
else
begin
{AutoTrigLevel.checked:=False; }
GroupBoxLevel.visible:=True
end;
end;

{ TForm1.DisplayPaint }



procedure TFenetre_Spectre.TrigModeBoxChange(Sender: TObject);
(*
 * Sets triggerslope falling or rising
 *)
var Mode : byte;
begin
  if TrigModebox.Text = 'Montant' then
  begin
    Mode := 0;
  end { if }
  else
  begin
    Mode := 1;
  end; { else }
  SetTriggerMode( Mode );

  GetTriggerMode( @Mode );
  display.repaint;
end; { TForm1.TrigModeBoxChange }


procedure TFenetre_Spectre.SpinTimeOutDownClick(Sender: TObject);
(*
 * Three procedures to set and get the Trigger timeout
 *)
var Timeoutvalue : integer;
begin
  Timeoutvalue := StrToInt( SetTimeoutBox.Text );
  if Timeoutvalue >= 100 then
  begin
    SetTimeOutBox.Text := IntToStr( Timeoutvalue - 100 );
  end { if }
  else
  begin
    SetTimeoutBox.Text := IntToStr( 0 );
  end; { else }
end; { TForm1.SpinTimeOutDownClick }


procedure TFenetre_Spectre.SpinTimeOutUpClick(Sender: TObject);
var Timeoutvalue : integer;
begin
  Timeoutvalue := StrToInt( SetTimeoutBox.Text );
  SetTimeOutBox.Text := IntToStr( Timeoutvalue + 100 );
end; { TForm1.SpinTimeOutUpClick }


procedure TFenetre_Spectre.SetTimeoutBoxChange(Sender: TObject);
var wTimeout : word;
begin
  wTimeout := StrToInt (SetTimeOutBox.Text);
  SetTriggerTimeOut( wTimeOut );
  GetTimeOutBox.Text := floatTostr( GetTriggerTimeout );
end; { TForm1.SetTimeoutBoxChange }


{procedure TForm1.SetDcLevCh1BoxChange(Sender: TObject);
(*
 * Procedures to set and get the DC level for Ch 1 and Ch2
 *)
var dcvalue : double;
begin
 { dcvalue := StrToFloat (SetDcLevCh1Box.Text);}
 { SetDcLevel(1,dcvalue);
  GetDcLevel(1,@dcvalue);
 { GetCh1DcBox.Text := FloatToStr (dcvalue);}
{end; { TForm1.SetDcLevCh1BoxChange }


{procedure TForm1.SetDcLevCh2BoxChange(Sender: TObject);
var dcvalue : double;
begin
 { dcvalue := StrToFloat (SetDcLevCh2Box.Text);}
 { SetDcLevel(2,dcvalue);
  GetDcLevel(2,@dcvalue);
{  GetCh2DcBox.Text := FloatToStr (dcvalue);}
{end; { TForm1.SetDcLevCh2BoxChange }


procedure TFenetre_Spectre.TrigSourceBoxChange(Sender: TObject);
(*
 * Procedure to set Trigger Source
 *)
var bySrc     : byte;
begin
{   strsource := TrigSourceBox.Text;
   if strsource = 'Channel 1' then bySrc := ltsCh1    else
   if strsource = 'Channel 2' then bySrc := ltsCh2    else
   if strSource = 'No trig'   then bySrc := ltsNoTrig else
   if strSource = 'Pxi Ext'   then bySrc := ltsPxiExt;
   SetTriggerSource( bySrc );
}
   bySrc := TrigSourceBox.ItemIndex;
   case bySrc of
     0 : SetTriggerSource( ltsCh1    );
     1 : SetTriggerSource( ltsCh2    );
     2 : SetTriggerSource( ltsNoTrig );
   {  3 : SetTriggerSource( ltsPxiExt );   }
   end; { case }

     if bySrc = 0 then
  begin
    triglevelCh2box.Visible:=False;
    SpinTriglevelCh2.Visible:=False;
    SetTrigLevCh2Label.Visible:=False;
    triglevelCh1box.Visible:=True;
    SpinTriglevelCh1.Visible:=True;
    SetTrigLevCh1Label.Visible:=True;
    LabelLevel1.Visible:=True;
    LabelLevel2.Visible:=True;
    CheckBox1.Visible:=True;
        SetTrigModeLabel.Visible:=True;
        TrigModeBox.Visible:=True;
 {   Label1.Left:=4;     }
  end { if }
  else
  begin
    if bySrc = 1 then
    begin
    triglevelCh1box.Visible:=False;
    SpinTriglevelCh1.Visible:=False;
    SetTrigLevCh1Label.Visible:=False;
    triglevelCh2box.Visible:=True;
    SpinTriglevelCh2.Visible:=True;
    SetTrigLevCh2Label.Visible:=True;
    LabelLevel1.Visible:=True;
    LabelLevel2.Visible:=True;
    CheckBox1.Visible:=True;
        SetTrigModeLabel.Visible:=True;
        TrigModeBox.Visible:=True;
   { Label1.Left:=64;  }
    end { if }
    else
    begin
      if (bySrc = 2){ or (bySrc = 3)} then
      begin
        GroupBoxLevel.Visible:=False;
        CheckBox1.Visible:=False;
        SetTrigModeLabel.Visible:=False;
        TrigModeBox.Visible:=False;
        {Label1.Left:=4;  }
      end; { if }
    end; { else}
  end; { else }

end; { TForm1.TrigSourceBoxChange }


procedure TFenetre_Spectre.TrigHysBoxChange(Sender: TObject);
(*
 * Procedure To set Trigger Hysteresis
 *)
var dHysteresis : double;
begin
  dHysteresis := StrToFloat( TrigHysBox.Text );
  SetTriggerhys( lCh1, dHysteresis );
end; { TForm1.TrigHysBoxChange }


procedure TFenetre_Spectre.RecordlengthboxoldChange(Sender: TObject);
(*
 * Procedure to set recordlength and postsamples
 *)
var dwLength    : dword;
    sCurrLength : string;
begin
 dwLength := GetRecordlength;
 sCurrLength := FloatToStr( dwlength );
 if Recordlengthbox.Text <> sCurrLength then
 begin
   dwLength := strToint( RecordLengthBox.Text );
   SetRecordLength( dwLength );
  SetPostSamples( dwLength );
 end;
 SetPostSamples( dwLength );
end; { TForm1.RecordlengthboxChange }


{procedure TForm1.PostSamplesBoxChange(Sender: TObject);
(*
 * procedure to set postsamples
 *)
var dwPostSamples    : dword;
    sCurrPostSamples : string;
begin
   dwPostSamples := GetpostSamples;
   sCurrPostSamples := FloatToStr( dwPostSamples );
   if PostSamplesBox.Text <> sCurrPostSamples then
   begin
     dwPostSamples := StrToInt( PostSamplesBox.Text );
     SetPostSamples( dwPostSamples );
   end; { if }
{end; { TForm1.postsamplesboxChange }


procedure TFenetre_Spectre.StartMeasureButtonClick(Sender: TObject);
(*
 * procedure to start measuring again
 *)
 begin
{  if StartMeasureButton.Down then
  begin
    timer1.Enabled:=true; ////////////////////////////////ajout modif F merle pour cabalab3
    StartMeasureButton.Caption := 'Stop';
    StartMeasureButton.Font.Color := clRed;
    bAllowMeasuring            := True;
 //   InitButton.Enabled         := False;

  end { if }
 { else
  begin
    StartMeasureButton.Caption := 'Start';
    StartMeasureButton.Font.Color := clGreen;
    bAllowMeasuring            := False;

  end; { else }

  end; { TForm1.startmeasurebuttonClick }

procedure TFenetre_Spectre.Image3Click(Sender: TObject);
begin
     timer1.Enabled:=true; ////////////////////////////////ajout modif F merle pour cabalab3
 //   StartMeasureButton.Caption := 'Stop';
   // StartMeasureButton.Font.Color := clRed;
    bAllowMeasuring   := True;
    image3.Visible    :=false;
    image4.Visible    :=true;
end;

procedure TFenetre_Spectre.Image4Click(Sender: TObject);
begin
 //   StartMeasureButton.Caption := 'Start';
   // StartMeasureButton.Font.Color := clGreen;
    bAllowMeasuring   := False;
    image4.Visible    :=false;
    image3.Visible    :=true;
    image3.top:=3;
end;

procedure TFenetre_Spectre.InitButtonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
(*
 * procedure not necassary its a test on return button click
 *)
begin
  {if Key = VK_RETURN then
  begin
    Key := 0;
  end; { if }
end; { TForm1.InitButtonKeyDown }


procedure TFenetre_Spectre.SpinTriglevelCh1DownClick(Sender: TObject);
(*
 * Procedures to set triggerlevel
 *)
var levelvalue,dHelp : double;
begin
  GetSensitivity( lCh1, @dHelp);
  levelvalue := StrToFloat(triglevelCh1box.Text);
  if levelvalue > -20*lch1 then
  begin
   { if dHelp>1 then  levelvalue :=levelvalue - 1/dHelp
    else }levelvalue :=levelvalue - 1*lch1;
    triglevelCh1box.Text := FloatToStr(levelvalue);
    end { if }
  else
  begin
    levelvalue := -20*lch1;
    triglevelCh1box.Text := FloatToStr(levelvalue);
  end; { else }
end; { TForm1.SpinTriglevelCh1DownClick }


procedure TFenetre_Spectre.SpinTriglevelCh1UpClick(Sender: TObject);
var levelvalue,dHelp : double;
begin
  GetSensitivity( lCh1, @dHelp);
  levelvalue := StrToFloat(triglevelCh1box.Text);
  if levelvalue < 20*lch1 then
  begin
    {if dHelp>1 then  levelvalue :=levelvalue + 1/dHelp
    else} levelvalue := levelvalue + 1*lch1;
    triglevelCh1box.Text := FloatToStr(levelvalue);
  end { if }
  else
  begin
    levelvalue := 20*lch1;
    triglevelCh1box.Text := FloatToStr(levelvalue);
  end; { else }
end; { TForm1.SpinTriglevelCh1UpClick }


procedure TFenetre_Spectre.TrigLevelCh1BoxChange(Sender: TObject);
var level: double;
begin
  level := StrToFloat(triglevelCh1box.Text);
  settriggerlevel(1,level);
end; { TForm1.TrigLevelCh1BoxChange }


procedure TFenetre_Spectre.SpinTriglevelCh2DownClick(Sender: TObject);
var levelvalue,dhelp : double;
begin
  GetSensitivity( lCh2, @dHelp);
  levelvalue := StrToFloat(triglevelCh2box.Text);
  if levelvalue > -20*lch2 then
  begin
    levelvalue :=levelvalue - 1*lch2;
    triglevelCh2box.Text := FloatToStr(levelvalue);
  end { if }
  else
  begin
    levelvalue := -20*lch2;
    triglevelCh2box.Text := FloatToStr(levelvalue);
  end; { else }
end; { TForm1.SpinTriglevelCh2DownClick }


procedure TFenetre_Spectre.SpinTriglevelCh2UpClick(Sender: TObject);
var levelvalue,dhelp : double;
begin
  GetSensitivity( lCh2, @dHelp);
  levelvalue := StrToFloat(triglevelCh2box.Text);
  if levelvalue < 20*lch2 then
  begin
    levelvalue :=levelvalue + 1*lch2;
    triglevelCh2box.Text := FloatToStr(levelvalue);
  end { if }
  else
  begin
    levelvalue := 20*lch2;
    triglevelCh2box.Text := FloatToStr(levelvalue);
  end; { else }
end; { TForm1.SpinTriglevelCh2UpClick }


procedure TFenetre_Spectre.triglevelCh2boxChange(Sender: TObject);
var level : double;
begin
  level := StrToFloat(triglevelCh2box.Text);
  SetTriggerLevel(2, Level);
end; { TForm1.triglevelCh2boxChange }


procedure TFenetre_Spectre.FormCreate(Sender: TObject);
begin
//  bAllowMeasuring := False;
end;

procedure TFenetre_Spectre.SpeedButton1Click(Sender: TObject);
begin
  SetTimeoutBoxChange( self );
end;

procedure TFenetre_Spectre.Button2Click(Sender: TObject);
var wTimeout : word;
begin
  wTimeout := word(-1);
  SetTriggerTimeOut( wTimeOut );
end;

{€function TFenetre_Spectre.Testerplagefrequence(Sender: TObject):boolean;
var StartSample,StopSample,delta,i : word;
    Stopfreq,Freq : dword;
    affichage : string;
begin
  Result:=True;
  if stopsample =10 then freqmaxplus.Visible:=false else freqmaxplus.Visible:=true;
  if delta=1 then
    begin
      freqminplus.Visible:=false;
      freqmaxmoins.Visible:=False;
    end;
end;}

function TFenetre_Spectre.TesterFreqechantillonnage( Sender : TObject) : boolean;
begin
  Result := True;

  {if ( SetSampelFreqBox.Text <> '' ) then
  begin
    try
      Generateur.dFreqHorloge:=StrToFloat(SetSampelFreqBox.Text);
      if ( Generateur.dFreqHorloge < 1000 ) or ( Generateur.dFreqHorloge > 50000000 ) then
        begin
          ShowMessage( sErrFreqPorteuseOutRange);
          Result := False;
        end; { if }
   { except
      ShowMessage( sErrFreqMod );
      Result := False;
    end;
  end
  else
    begin
      SetSampelFreqBox.Text:='';
      Result := False;
    end;
    }
end; { function TForm1.TesterFreqechantillonnage }


function TFenetre_Spectre.TesterDepassementSignal1( Sender : TObject) : boolean;
var max,min,count:dword;I:integer;
testmax,testmin:boolean;
levelsync,dhelp :double;
begin
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

  if (max>65500) then testmax:=True;
  if (max<30) then testmax:=True;
  if (min>65500) then testmin:=True;
  if (min<30) then testmin:=True;
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
    if LabelWARNING1.Visible=true then LabelWARNING1.Visible:=false;
  end;
end; { function TForm1.TesterDepassementSignal}

function TFenetre_Spectre.TesterDepassementSignal2( Sender : TObject) : boolean;
var max,min,count:dword;I:integer;
testmax,testmin:boolean;
levelsync,dhelp :double;
begin
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

  if (max>65500) then testmax:=True;
  if (max<30) then testmax:=True;
  if (min>65500) then testmin:=True;
  if (min<30) then testmin:=True;
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

{
procedure TFenetre_Spectre.Enregistrerlesdonnees(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin_de_regressi     : shortstring;
    chemin                 : shortstring;
    x1,y1,z1,rsens1,rSens2,deltaf : double;
    fichier                : textfile;
    inc,max                : integer;

begin

// Récupération du chemin de régressi dans le fichier 'cheminreg.txt'
try
assignfile(fichier,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\cheminregcabalab.txt');
reset(fichier);
readln(fichier,chemin_de_regressi);
closefile(fichier);
except
end;
max:=round(GetRecordlength/2);

deltaf:=(GetSampleFrequency)/2/(max*2);

for inc:=0 to (2*max-1) do freqarray[inc]:=deltaf*inc;
// Ecriture des données dans le fichier regtemp.rw3
// bloc1spec.txt contient l'entete et bloc2spec.txt la partie qui "sépare" les courbes dans le fichier

   GetWindowsDirectory(@chemin_windows,255);
   chemin:=shortstring(chemin_windows)+'\temp\regtemp.rw3';
   assignfile(fichier,chemin);
   rewrite(fichier);
  { GetMeasureMode( @Mode );
      if MeasureModeBox.ItemIndex = 0 then
      begin
       if (dBvolt.Checked) then
             begin
             for inc:=1 to 97 do
              writeln(fichier,RegressiBLOC1SPECdBVCH1[inc]);
             end
           else if dB.Checked then
             begin
             for inc:=1 to 97 do
              writeln(fichier,RegressiBLOC1SPECdBCH1[inc]);
             end
           else if volt.Checked then
             begin
             for inc:=1 to 97 do
              writeln(fichier,RegressiBLOC1SPECCH1[inc]);
             end
           else
             begin
             for inc:=1 to 97 do
               writeln(fichier,RegressiBLOC1SPECEFFCH1[inc]);
             end
      end { if
      else if MeasureModeBox.ItemIndex = 1 then
      begin
       if (dBvolt.Checked) then
             begin
             for inc:=1 to 97 do
              writeln(fichier,RegressiBLOC1SPECdBVCH2[inc]);
             end
           else if dB.Checked then
             begin
             for inc:=1 to 97 do
              writeln(fichier,RegressiBLOC1SPECdBCH2[inc]);
             end
           else if volt.Checked then
             begin
             for inc:=1 to 97 do
              writeln(fichier,RegressiBLOC1SPECCH2[inc]);
             end
           else
             begin
             for inc:=1 to 97 do
               writeln(fichier,RegressiBLOC1SPECEFFCH2[inc]);
             end
      end
      else
      begin
           if (dBvolt.Checked) then
             begin
             for inc:=1 to 115 do
              writeln(fichier,RegressiBLOC1SPECdBV[inc]);
             end
           else if dB.Checked then
             begin
             for inc:=1 to 115 do
              writeln(fichier,RegressiBLOC1SPECdB[inc]);
             end
           else if volt.Checked then
             begin
             for inc:=1 to 105 do
              writeln(fichier,RegressiBLOC1SPEC[inc]);
             end
           else
             begin
             for inc:=1 to 105 do
               writeln(fichier,RegressiBLOC1SPECEFF[inc]);
             end

      end;

 GetSensitivity( lCh1, @rSens1);
 GetSensitivity( lCh2, @rSens2);

     writeln(fichier,'£1 PAGE COMMENT');
     writeln(fichier,'Spectre d amplitude');
     writeln(fichier,'&' + inttostr(max-3) +' VALEUR VAR');

     for inc:=1 to max-3 do
     begin
          x1:=2*freqarray[inc-1];
          if (dB.Checked) then
          begin
            y1:=(spectre1[inc]+20*Log10(rSens1));
            z1:=(spectre2[inc]+20*Log10(rSens2));
          end
          else if (dBvolt.Checked) then
          begin
            y1:=(spectre1[inc]+20*Log10(rSens1));
            z1:=(spectre2[inc]+20*Log10(rSens2));
          end
          else
          begin
            y1:=spectre1[inc] *rSens1;
            z1:=spectre2[inc] *rSens2;
          end;
         if MeasureModeBox.ItemIndex = 0  then
          writeln(fichier,x1,#9,y1)
         else if MeasureModeBox.ItemIndex = 1 then
          writeln(fichier,x1,#9,z1)
         else
          writeln(fichier,x1,#9,y1,#9,z1);
      end;

   for inc:=1 to 28 do
   begin
    writeln(fichier,RegressiBLOC2SPEC[inc]);
   end;

closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
//chemin:=chemin_de_regressi + 'Regressi.exe ' + chemin + #0 ;
//winexec(@chemin[1],SW_SHOWMAXIMIZED);

end;     }

procedure TFenetre_Spectre.Enregistrerlesdonnees(Sender: TObject);

var ligne : string;
    x1,y1,z1,rsens1,rSens2,deltaf : double;
    inc,max,factor                : integer;
const
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';

begin
max:=round(GetRecordlength/2);
deltaf:=(GetSampleFrequency)/max;


  for inc:=0 to (2*max-1) do
  freqarray[inc]:=deltaf*inc/4;

  FormTransfertRegressi.Donnees := TstringList.create;
  With FormTransfertRegressi.Donnees do
  begin

// Transfert du diagramme en cours
    Clear;
    Add('Cabalab');
    if HS3 then Add('Appareil utilisé : TiePie HS3');
    if GTI2 then Add('Appareil utilisé : Orphy GTI2');
    Add('Spectre'); // 3ème = Titre de page

    // Ajout Grandeurs

    if MeasureMode{Box.ItemIndex }= 0 then
      begin
       if (dBvolt.Checked) then
       begin
              ligne :='f'+crTab+'Niveau1';
              Add(ligne);
              ligne :='Hz'+crTab+'dB';
              Add(ligne);

       end
       else
         if dB.Checked then
         begin
             ligne :='f'+crTab+'Niveau1';
              Add(ligne);
              ligne :='Hz'+crTab+'dB';
              Add(ligne);
         end
         else
           if volt.Checked then
           begin
             ligne :='f'+crTab+'Amplitude1';
              Add(ligne);
              ligne :='Hz'+crTab+'V';
              Add(ligne);
           end
           else
             begin
             ligne :='f'+crTab+'Amplitude1';
              Add(ligne);
              ligne :='Hz'+crTab+'V';
              Add(ligne);
             end
      end; // if MeasureModeBox.ItemIndex = 0


    if MeasureMode{Box.ItemIndex} = 1 then
      begin
       if (dBvolt.Checked) then
       begin
              ligne :='f'+crTab+'Niveau1';
              Add(ligne);
              ligne :='Hz'+crTab+'dB';
              Add(ligne);

       end
       else
         if dB.Checked then
         begin
             ligne :='f'+crTab+'Niveau2';
              Add(ligne);
              ligne :='Hz'+crTab+'dB';
              Add(ligne);
         end
         else
           if volt.Checked then
           begin
             ligne :='f'+crTab+'Amplitude2';
              Add(ligne);
              ligne :='Hz'+crTab+'V';
              Add(ligne);
           end
           else
             begin
             ligne :='f'+crTab+'Amplitude2';
              Add(ligne);
              ligne :='Hz'+crTab+'V';
              Add(ligne);
             end
      end; // if MeasureModeBox.ItemIndex = 1


if MeasureMode{Box.ItemIndex }= 2 then
      begin
       if (dBvolt.Checked) then
       begin
              ligne :='f'+crTab+'Niveau1'+crTab+'Niveau2';
              Add(ligne);
              ligne :='Hz'+crTab+'dB'+crTab+'dB';
              Add(ligne);

       end
       else
         if dB.Checked then
         begin
             ligne :='f'+crTab+'Niveau1'+crTab+'Niveau2';
              Add(ligne);
              ligne :='Hz'+crTab+'dB'+crTab+'dB';
              Add(ligne);
         end
         else
           if volt.Checked then
           begin
             ligne :='f'+crTab+'Amplitude1'+crTab+'Amplitude2';
              Add(ligne);
              ligne :='Hz'+crTab+'V'+crTab+'V';
              Add(ligne);
           end
           else
             begin
             ligne :='f'+crTab+'Amplitude1'+crTab+'Amplitude2';
              Add(ligne);
              ligne :='Hz'+crTab+'V'+crTab+'V';
              Add(ligne);
             end
      end; // if MeasureModeBox.ItemIndex = 2



 GetSensitivity( lCh1, @rSens1);
 GetSensitivity( lCh2, @rSens2);

if FFT_simple.Checked=true then
  begin
    factor:=1;
  end
  else
  factor:=2;
    // Ajout Données
    for inc:=1 to factor*max-3 do
     begin
          x1:=2*freqarray[inc-1]/factor;
          if (dB.Checked) then
          begin
            y1:=(spectre1[inc]+20*Log10(rSens1));
            z1:=(spectre2[inc]+20*Log10(rSens2));
          end
          else if (dBvolt.Checked) then
          begin
            y1:=(spectre1[inc]+20*Log10(rSens1));
            z1:=(spectre2[inc]+20*Log10(rSens2));
          end
          else
          begin
            y1:=spectre1[inc] *rSens1;
            z1:=spectre2[inc] *rSens2;
          end;

         if MeasureMode{Box.ItemIndex} = 0  then
          begin
          ligne := floattostr(x1)+crTab+floattostr(y1);
          Add(ligne);
          end
         else if MeasureMode{Box.ItemIndex }= 1 then
          begin
          ligne := floattostr(x1)+crTab+floattostr(z1);
          Add(ligne);
          end
         else
            begin
           ligne := floattostr(x1)+crTab+floattostr(y1)+crTab+floattostr(z1);
           Add(ligne);
           end
     end; //for


    // Ajout Option echelle horizontale en log
    //Add(symbReg2+'2 LOGX');
    //Add('1');
    //Add('1');

    ClipBoard.AsText := FormTransfertRegressi.Donnees.text;

    FormTransfertRegressi.Execute('CLIP|LOAD');   // charge les données en tant que nouveau fichier
end;//with
end;



procedure TFenetre_Spectre.Enregistrerlesdonnees2(Sender: TObject);

var chemin_windows                : array[0..255] of Char;
    chemin_de_scilab              : shortstring;
    chemin                        : shortstring;
    x1,y1,z1,rSens1,rSens2,deltaf : double;
    fichier                       : textfile;
    inc,max,factor                     : integer;

begin

// Récupération du chemin de scilab dans le fichier 'cheminscil.txt'
try
assignfile(fichier,ExtractFilePath(Application.ExeName)+'\FichierPourScilab\cheminscilcabalab.txt');
reset(fichier);
readln(fichier,chemin_de_scilab);
closefile(fichier);

except
end;
max:=round(GetRecordlength/2);
deltaf:=(GetSampleFrequency)/max;

for inc:=0 to (2*max-1) do freqarray[inc]:=deltaf*inc;

   GetWindowsDirectory(@chemin_windows,255);
   chemin:=shortstring(chemin_windows)+'\temp\blocsignal.dat';
   assignfile(fichier,chemin);

  if (accumulation.Checked) then
  append(fichier)
  else rewrite(fichier);
  GetSensitivity( lCh1, @rSens1);
  GetSensitivity( lCh2, @rSens2);
         {x1:=GetRecordlength;
         y1:=(Ch1WordArray[0] - 32767)/32767 *rSens1;
         z1:=(Ch2WordArray[0] - 32767)/32767 *rSens2;
         writeln(fichier,x1,' ',y1,' ',z1);}

     for inc:=0 to GetRecordlength-1 do
      begin
         x1:=inc/GetSampleFrequency;
         y1:=( Ch1WordArray[inc] - 32767 ) / 32767 *rSens1;
         z1:=(Ch2WordArray [inc] - 32767)/32767 *rSens2;
         writeln(fichier,x1,' ',y1,' ',z1);
      end;

 closefile(fichier);

   chemin:=shortstring(chemin_windows)+'\temp\blocspectre.dat';
   assignfile(fichier,chemin);
  if (accumulation.Checked) then
  append(fichier)
  else
   rewrite(fichier);
if FFT_simple.Checked=true then
  begin
    factor:=1;
  end
  else
  factor:=2;

     for inc:=0 to factor*max-3 do
     begin
          x1:=2*freqarray[inc-1]/factor;
          if (dB.Checked) then
          begin
            y1:=(spectre1[inc]+20*Log10(rSens1));
            z1:=(spectre2[inc]+20*Log10(rSens2));
          end
          else if (dBvolt.Checked) then
          begin
            y1:=(spectre1[inc]+20*Log10(rSens1));
            z1:=(spectre2[inc]+20*Log10(rSens2));
          end
          else
          begin
            y1:=spectre1[inc] *rSens1;
            z1:=spectre2[inc] *rSens2;
          end;
         if MeasureMode{Box.ItemIndex }= 0  then
          writeln(fichier,x1,#9,y1)
         else if MeasureMode{Box.ItemIndex }= 1 then
          writeln(fichier,x1,#9,z1)
         else
          writeln(fichier,x1,#9,y1,#9,z1);
      end;

closefile(fichier);
chemin:=chemin_de_scilab + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);

end;


procedure TFenetre_Spectre.accumulationClick(Sender: TObject);
begin
  if (accumulation.checked)
  then
    begin
      accumulation.checked := False;
      Labelacquisition.Visible:=False;
    end
  else
    begin
      accumulation.checked := True ;
      Labelacquisition.Visible:=True;
      if not oscilloscope.Checked then
      SCOPEonclick(self);
    end;
end;

procedure TFenetre_Spectre.rectangleClick(Sender: TObject);
begin
  if not(rectangle.checked)
  then
    begin
      rectangle.checked := True;
      hamming.checked := False;
      blackman.checked := False;
      bartlett.checked := False;
      hanning.checked := False;
      kaiser.checked := False;
    end;
end;

procedure TFenetre_Spectre.hammingClick(Sender: TObject);
begin
  if not(hamming.checked)
  then
    begin
      rectangle.checked := False;
      hamming.checked := True;
      blackman.checked := False;
      bartlett.checked := False;
      hanning.checked := False;
      kaiser.checked := False;
    end;
end;

procedure TFenetre_Spectre.blackmanClick(Sender: TObject);
begin
  if not(blackman.checked)
  then
    begin
      rectangle.checked := False;
      hamming.checked := False;
      blackman.checked := True;
      bartlett.checked := False;
      hanning.checked := False;
      kaiser.checked := False;
    end;
end;

procedure TFenetre_Spectre.bartlettClick(Sender: TObject);
begin
  if not(bartlett.checked)
  then
    begin
      rectangle.checked := False;
      hamming.checked := False;
      blackman.checked := False;
      bartlett.checked := True;
      hanning.checked := False;
      kaiser.checked := False;
    end;
end;

procedure TFenetre_Spectre.hanningClick(Sender: TObject);
begin
  if not(hanning.checked)
  then
    begin
      rectangle.checked := False;
      hamming.checked := False;
      blackman.checked := False;
      bartlett.checked := False;
      hanning.checked := True;
      kaiser.checked := False;
    end;
end;

procedure TFenetre_Spectre.kaiserClick(Sender: TObject);

begin
  if not(kaiser.checked)
  then
    begin
      rectangle.checked := False;
      hamming.checked := False;
      blackman.checked := False;
      bartlett.checked := False;
      hanning.checked := False;
      kaiser.checked := True;
    end;

end;

procedure TFenetre_Spectre.GBFonClick(Sender: TObject);
begin
 { if (gene.checked)
  then
    begin
      gene.checked := False;
       commandes.Visible:=False;
         SetFuncGenOutputOn  ( 0         );
    end
  else
    begin
      gene.checked := True ;
      commandes.Visible:=True;
         SetFuncGenOutputOn  ( 1         );
    end;}
   FormGBF.visible:=true;
    FormGBF.BringToFront;
end;




procedure TFenetre_Spectre.SCOPEonClick(Sender: TObject);
begin
  if (oscilloscope.checked)
  then
    begin

      oscilloscope.checked := False ;
      TriggerBox.Visible:=False;
//      GroupBdeT.Visible:=False;
      Fenetre_Spectre.Height:=535;
      if accumulation.Checked then
      accumulationClick(self);
      DisplayPaint(self);
    end
  else
    begin
      oscilloscope.checked := True;
      TriggerBox.Visible:=True;
//      GroupBdeT.Visible:=True;
      Fenetre_Spectre.Height:=742;
    end;
end;

procedure TFenetre_Spectre.dBClick(Sender: TObject);
begin
      volt.checked := False;
      dBvolt.checked := False;
      voltefficace.checked := False;
      dB.checked := True;
      dBwatt.checked := False;
      dBm.checked := False;
      dBu.checked := False;

      sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';

end;

procedure TFenetre_Spectre.voltClick(Sender: TObject);
begin
      dBvolt.checked := False;
      voltefficace.checked := False;
      dB.checked := False;
      volt.checked := True;
      dBwatt.checked := False;
      dBm.checked := False;
      dBu.checked := False;

      sensibilite20.hint:=FloatToStr( dHelpi[0]/8 ) + ' V/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1]/8 ) + ' V/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2]/8 ) + ' V/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3]/8 ) + ' V/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4]/8 ) + ' V/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5]/8 ) + ' V/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]/8 ) + ' V/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7]/8 ) + ' V/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8]/8 ) + ' V/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9]/8 ) + ' V/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0]/8 ) + ' V/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1]/8 ) + ' V/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2]/8 ) + ' V/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3]/8 ) + ' V/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4]/8 ) + ' V/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5]/8 ) + ' V/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]/8 ) + ' V/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7]/8 ) + ' V/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8]/8 ) + ' V/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9]/8 ) + ' V/div';

end;

procedure TFenetre_Spectre.dBvoltClick(Sender: TObject);
begin
      volt.checked := False;
      voltefficace.checked := False;
      dB.checked := False;
      dBvolt.checked := True;
      dBwatt.checked := False;
      dBm.checked := False;
      dBu.checked := False;

      sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';

end;

procedure TFenetre_Spectre.voltefficaceClick(Sender: TObject);
begin
      dB.checked := False;
      volt.checked := False;
      dBvolt.checked := False;
      voltefficace.checked := True;
      dBwatt.checked := False;
      dBm.checked := False;
      dBu.checked := False;

      sensibilite20.hint:=FloatToStr( dHelpi[0]/8 ) + ' V/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1]/8 ) + ' V/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2]/8 ) + ' V/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3]/8 ) + ' V/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4]/8 ) + ' V/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5]/8 ) + ' V/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]/8 ) + ' V/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7]/8 ) + ' V/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8]/8 ) + ' V/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9]/8 ) + ' V/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0]/8 ) + ' V/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1]/8 ) + ' V/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2]/8 ) + ' V/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3]/8 ) + ' V/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4]/8 ) + ' V/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5]/8 ) + ' V/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]/8 ) + ' V/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7]/8 ) + ' V/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8]/8 ) + ' V/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9]/8 ) + ' V/div';

end;

procedure TFenetre_Spectre.dBwattClick(Sender: TObject);
begin
      volt.checked := False;
      voltefficace.checked := False;
      dB.checked := False;
      dBvolt.checked := False;
      dBwatt.checked := True;
      dBm.checked := False;
      dBu.checked := False;

      sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';

end;

procedure TFenetre_Spectre.dBmClick(Sender: TObject);
begin
      volt.checked := False;
      voltefficace.checked := False;
      dB.checked := False;
      dBvolt.checked := False;
      dBwatt.checked := False;
      dBm.checked := True;
      dBu.checked := False;

      sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';

end;

procedure TFenetre_Spectre.dBuClick(Sender: TObject);
begin
      volt.checked := False;
      voltefficace.checked := False;
      dB.checked := False;
      dBvolt.checked :=False ;
      dBwatt.checked := False;
      dBm.checked := False;
      dBu.checked := True;

      sensibilite20.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite21.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite22.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite23.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite24.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite25.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite26.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite27.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite28.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite29.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';
      sensibilite10.hint:=FloatToStr( dHelpi[0] ) + ' dB/div';
      sensibilite11.hint:=FloatToStr( dHelpi[1] ) + ' dB/div';
      sensibilite12.hint:=FloatToStr( dHelpi[2] ) + ' dB/div';
      sensibilite13.hint:=FloatToStr( dHelpi[3] ) + ' dB/div';
      sensibilite14.hint:=FloatToStr( dHelpi[4] ) + ' dB/div';
      sensibilite15.hint:=FloatToStr( dHelpi[5] ) + ' dB/div';
      sensibilite16.hint:=FloatToStr( dHelpi[6]) + ' dB/div';
      sensibilite17.hint:=FloatToStr( dHelpi[7] ) + ' dB/div';
      sensibilite18.hint:=FloatToStr( dHelpi[8] ) + ' dB/div';
      sensibilite19.hint:=FloatToStr( dHelpi[9] ) + ' dB/div';

end;

procedure TFenetre_Spectre.FFTsimpleClick(Sender: TObject);
begin
      FFT_multiple.checked := False;
      FFT_simple.checked := True;
end;
procedure TFenetre_Spectre.FFTmultipleClick(Sender: TObject);
begin
      FFT_simple.checked := False;
      FFT_multiple.checked := True;
end;


procedure TFenetre_Spectre.Image1Click(Sender: TObject);
begin
FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
FormCabaLab.BringToFront;
end;


procedure TFenetre_Spectre.ButtonGBFClick(Sender: TObject);
begin
    formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
    formGBF.BringToFront;             //   1_30Fm
end;


procedure TFenetre_Spectre.ButtonVoie1Click(Sender: TObject);
begin
    ButtonVoie1.Visible:=false;
    ButtonVoies1_2.Visible:=True;
    ButtonVoie2.Visible:=True;
    Channel1Label.Visible := True;
    Channel2Label.Visible := False;
    Spectre1Label.Visible := True;
    Spectre2Label.Visible := False;
    ch2box.Visible:=false;
    ch1box.Visible:=true;
    GetCh1OscSensBox.Visible:=True;
    GetCh2OscSensBox.Visible:=False;
    MeasureMode:=0;
    SetMeasureMode(lCh1);
end;

procedure TFenetre_Spectre.ButtonVoie2Click(Sender: TObject);
begin
    ButtonVoie2.Visible:=False;
    ButtonVoie1.Visible:=True;
    ButtonVoies1_2.Visible:=True;
    Channel1Label.Visible := False;
    Channel2Label.Visible := True;
    Spectre1Label.Visible := False;
    Spectre2Label.Visible := True;
    ch1box.Visible:=false;
    ch2box.Visible:=true;
    GetCh1OscSensBox.Visible:=False;
    GetCh2OscSensBox.Visible:=True;
    MeasureMode:=1;
    SetMeasureMode(lCh2);
end;

procedure TFenetre_Spectre.ButtonVoies1_2Click(Sender: TObject);
begin
    ButtonVoies1_2.Visible:=False;
    ButtonVoie1.Visible:=True;
    ButtonVoie2.Visible:=True;
    ch1box.Visible:=true;
    ch2box.Visible:=true;
    Channel1Label.Visible := True;
    Channel2Label.Visible := True;
    Spectre1Label.Visible := True;
    Spectre2Label.Visible := True;
    GetCh1OscSensBox.Visible:=True;
    GetCh2OscSensBox.Visible:=True;
    MeasureMode:=2;
    SetMeasureMode(mCh12);
end;

procedure TFenetre_Spectre.FormPaint(Sender: TObject);
begin
    if unitcabalab.passif[2]= false then
      ButtonGBF.Visible:=true
   else
      ButtonGBF.Visible:=false;
end;

procedure TFenetre_Spectre.AuteurClick(Sender: TObject);
begin
FormApropos.Visible := true ;
FormApropos.BringToFront;
end;


procedure TFenetre_Spectre.Aide1Click(Sender: TObject);
begin
FFT_utilisation.Visible := true ;
FFT_utilisation.BringToFront;
end;

procedure TFenetre_Spectre.Aide2Click(Sender: TObject);
begin
FFT_abscisse.Visible := true ;
FFT_abscisse.BringToFront;
end;


procedure TFenetre_Spectre.Aide3Click(Sender: TObject);
begin
FFT_ordonnee.Visible := true ;
FFT_ordonnee.BringToFront;
end;


procedure TFenetre_Spectre.Aide3bisClick(Sender: TObject);
begin
FFT_frequence.Visible := true ;
FFT_frequence.BringToFront;
end;


procedure TFenetre_Spectre.Aide4Click(Sender: TObject);
begin
FFT_BdeT.Visible := true ;
FFT_BdeT.BringToFront;
end;

procedure TFenetre_Spectre.Aide5Click(Sender: TObject);
begin
FFT_trigger.Visible := true ;
FFT_trigger.BringToFront;
end;

procedure TFenetre_Spectre.Aide6Click(Sender: TObject);
begin
FFT_stop.Visible := true ;
FFT_stop.BringToFront;
end;

procedure TFenetre_Spectre.Aide7Click(Sender: TObject);
begin
FFT_logo.Visible := true ;
FFT_logo.BringToFront;
end;

procedure TFenetre_Spectre.Aide8Click(Sender: TObject);
begin
FFT_Accu.Visible := true ;
FFT_Accu.BringToFront;
end;

procedure TFenetre_Spectre.Aide9Click(Sender: TObject);
begin
FFT_transfert.Visible := true ;
FFT_transfert.BringToFront;
end;


end.





