unit Unit1Mesures_XY_GTI2;

{$DEFINE CABALABin}           //: fonctionne DANS CABALAB
//{$DEFINE Independant}           //: pour utiliser sans cabalab

{$IFDEF Independant}            //: dans cabalab les DEFINE sont fais par CABALABHS3 ou CABALABGTI2//
  {$DEFINE GTI2}
  //{$DEFINE HS3}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dlldecl,
  ExtCtrls, StdCtrls, Menus, jpeg, Buttons, Spin;
  
{definition de l'objet configuration, de l'interface utilisateur, oscillo}
type config = record

   Start   : Boolean;       //true: timer en route, variable controlé par le button Run/Stop

   Trigger : integer;     //0 : sans, 1 : Y1, 2 : Y2, 3 : Y3, 4 : Y4.
   front   : integer;     //1 : montant, 0 decendant.
   Level   : double;        //?????

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

type TXY = record
     ABSvoie:integer; //X : voie 1,2,3,4
     ORDvoie:integer; //Y : voie 1,2,3,4
     ABSsensibilite:double;
     ORDsensibilite:double;
     ABScal:double;
     ORDcal:double;
end;

type
  TForm1MesuresCaba_GTI2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    SaisieDuPoint: TButton;
    Button3: TButton;
    Memo1: TMemo;
    GroupBoxCh1: TGroupBox;
    CALIBCH1_20V: TRadioButton;
    CALIBCH1_8V: TRadioButton;
    CALIBCH1_4V: TRadioButton;
    CALIBCH1_2V: TRadioButton;
    CALIBCH1_08V: TRadioButton;
    CALIBCH1_04V: TRadioButton;
    CALIBCH1_02V: TRadioButton;
    Calibrech1scrollbar: TScrollBar;
    GroupBoxCh2: TGroupBox;
    CalibreCH2_20V: TRadioButton;
    CalibreCH2_8V: TRadioButton;
    CalibreCH2_4V: TRadioButton;
    CalibreCH2_2V: TRadioButton;
    CalibreCH2_08V: TRadioButton;
    CalibreCH2_04V: TRadioButton;
    CalibreCH2_02V: TRadioButton;
    Calibrech2ScrollBar: TScrollBar;
    SerieM: TButton;
    MainMenu1: TMainMenu;
    Options: TMenuItem;
    SeriedeMesuresoption: TMenuItem;
    CalManu: TButton;
    CalibresAutomatiques2: TMenuItem;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelCh21: TLabel;
    LabelCh11: TLabel;
    LabelCh12: TLabel;
    Labelch13: TLabel;
    LabelCh14: TLabel;
    LabelCh15: TLabel;
    LabelCh16: TLabel;
    LabelCh22: TLabel;
    Labelch23: TLabel;
    LabelCh26: TLabel;
    LabelCh25: TLabel;
    LabelCh24: TLabel;
    LabelCh1: TLabel;
    LabelCh2: TLabel;
    GraduationsCalibres1: TMenuItem;
    Label10: TLabel;
    Label12: TLabel;
    Montages1: TMenuItem;
    Montage1RsistancecapteurdecourantsurCH11: TMenuItem;
    Montage2RsistancecapteurdecourantsurCH11: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpinButtonSERIEACTIVE: TSpinButton;
    menuinterface: TMenuItem;
    InterfaceNormal: TMenuItem;
    N5127681: TMenuItem;
    ButtonCabaLabAUTREAPPLI: TButton;
    Apropos1: TMenuItem;
    Apropos2: TMenuItem;
    Fichier1: TMenuItem;
    RegressiBR1: TMenuItem;
    RegressiBR2: TMenuItem;
    RegressiDDE1: TMenuItem;
    MenuRegUtilisateur1: TMenuItem;
    N2: TMenuItem;
    Quitter1: TMenuItem;
    Config1: TMenuItem;
    ALLuni: TMenuItem;
    ALLdiff: TMenuItem;
    N3: TMenuItem;
    UniY1: TMenuItem;
    DiffY1: TMenuItem;
    N4: TMenuItem;
    UniY2: TMenuItem;
    DiffY2: TMenuItem;
    N5: TMenuItem;
    UniY3: TMenuItem;
    DiffY3: TMenuItem;
    N6: TMenuItem;
    UniY4: TMenuItem;
    DiffY4: TMenuItem;
    ConfigOscillo1: TMenuItem;
    menuCouleurs1: TMenuItem;
    MenuInterfaceTaille1: TMenuItem;
    ConfigOscilo1: TMenuItem;
    ConfigOscilo2: TMenuItem;
    ConfigOscilo3: TMenuItem;
    MenuEnregChargConfig1: TMenuItem;
    MenuEnregConfig1: TMenuItem;
    Charger1: TMenuItem;
    N10: TMenuItem;
    Enregistrement1: TMenuItem;
    Chargement1: TMenuItem;
    N11: TMenuItem;
    menuRESETconfig1: TMenuItem;
    MenuConfigVoieABSCISSE: TMenuItem;
    MenuConfigVoieOrdonne: TMenuItem;
    ABSVoie1: TMenuItem;
    ABSVoie2: TMenuItem;
    ABSVoie3: TMenuItem;
    ABSVoie4: TMenuItem;
    ORDVoie1: TMenuItem;
    ORDVoie2: TMenuItem;
    ORDVoie3: TMenuItem;
    ORDVoie4: TMenuItem;
    N13: TMenuItem;
    U: TMenuItem;
    ABSVoie1D: TMenuItem;
    ABSVoie2D: TMenuItem;
    ABSVoie3D: TMenuItem;
    ABSVoie4D: TMenuItem;
    ORDVoie1D: TMenuItem;
    ORDVoie2D: TMenuItem;
    ORDVoie3D: TMenuItem;
    ORDVoie4D: TMenuItem;


    procedure Affichage_voiesXY(Sender: TPaintBox);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Regressi1Click(Sender: TObject);
    procedure SaisieDuPointClick(Sender: TObject);

    procedure Calibrech1scrollbarChange(Sender: TObject);
    procedure Calibrech2ScrollBarChange(Sender: TObject);
    procedure CALIBCH1_20VClick(Sender: TObject);
    procedure CALIBCH1_8VClick(Sender: TObject);
    procedure CALIBCH1_4VClick(Sender: TObject);
    procedure CALIBCH1_2VClick(Sender: TObject);
    procedure CALIBCH1_08VClick(Sender: TObject);
    procedure CALIBCH1_04VClick(Sender: TObject);
    procedure CALIBCH1_02VClick(Sender: TObject);

 
    procedure CALIBCH2_20VClick(Sender: TObject);
    procedure CALIBCH2_8VClick(Sender: TObject);
    procedure CALIBCH2_4VClick(Sender: TObject);
    procedure CALIBCH2_2VClick(Sender: TObject);
    procedure CALIBCH2_08VClick(Sender: TObject);
    procedure CALIBCH2_04VClick(Sender: TObject);
    procedure CALIBCH2_02VClick(Sender: TObject);

    procedure SerieMClick(Sender: TObject);
    procedure SeriedeMesuresoptionClick(Sender: TObject);

    procedure CalManuClick(Sender: TObject);
   
    procedure CalibresAutomatiques2Click(Sender: TObject);
    procedure GraduationsCalibres1Click(Sender: TObject);
    procedure cheminRegresi1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpinButtonSERIEACTIVEUpClick(Sender: TObject);
    procedure SpinButtonSERIEACTIVEDownClick(Sender: TObject);

    procedure Montage1RsistancecapteurdecourantsurCH11Click(
      Sender: TObject);
    procedure Montage2RsistancecapteurdecourantsurCH11Click(
      Sender: TObject);
  
    procedure InterfaceNormalClick(Sender: TObject);
    procedure N5127681Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ButtonCabaLabAUTREAPPLIClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Apropos2Click(Sender: TObject);
   
    procedure TraitementDonnees(Sender: TObject);

    procedure ValidConfigINTERFACE_GTI2 (sender: Tobject);
    procedure resetConfiguration (sender: Tobject);
    procedure ConfigurationDesVoiesClick (sender: Tobject);
    

    procedure Affichage_XY_BLEU_DYN(Destination: Tpaintbox);
    procedure ResetEcranXY_bitmap (sender: Tbitmap);
    procedure Affichage_voiesXY_bitmap(Sender: Tbitmap);

 

  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

//const chemin_de_regressi  = 'C:\progra~1\regressi  et portable\Regressi.exe';
//const chemin_de_regressi  = 'D:\regressi2\Regressi.exe';
var
  Form1MesuresCaba_GTI2: TForm1MesuresCaba_GTI2;
  invech1:byte;
  invech2:byte;
  mesures:byte;
  SomCh1,SomCh2 : double;
  compteur:integer;
  MesuresCh1: array[0..11] of array[0..1000] of double;
  MesuresCh2: array[0..11] of array[0..1000] of double;
  compteurt:  array[0..11] of integer;

  CalibresAuto:byte;
  SaisieAuto:byte;
  calibre:double;
  serie:integer;
  serieACTIVE:integer;
  compteurNOTRIG:integer;
  ACQUI:boolean;

  congiguration:config;
  XY:TXY;

  erreur: longint;

  FrequenceEch: dword     ;
  LongEnregistrement: dword  ;
  Sensibilite15 :double;
  Sensibilite75 :double;
  MCV: array [0..4,0..1] of Tmenuitem;      //tableau des Tmenuitem du menu : cofigurations des voies
implementation

{$IFDEF CabaLabin}
        uses  Unit1Mesures_XY_Montages{, demodde}, UnitCabalab, UnitGBF, UnitAPropos,UnitTransfertRegressi,clipbrd;
{$ENDIF}

{$IFDEF Independant}
        uses  Unit1Mesures_XY_Montages{, demodde}{, UnitCabalab, UnitGBF, UnitAPropos},UnitTransfertRegressi,clipbrd;
{$ENDIF}

{$R *.DFM}

procedure TForm1MesuresCaba_GTI2.ConfigurationDesVoiesClick (sender: Tobject);
var
i:integer;
begin
     if sender=ABSVoie1 then begin XY.ABSvoie:=1; ABSVoie1.Checked:=true; congiguration.Unipolaire[1]:=true;     end;
     if sender=ABSVoie2 then begin XY.ABSvoie:=2; ABSVoie2.Checked:=true; congiguration.Unipolaire[2]:=true;     end;
     if sender=ABSVoie3 then begin XY.ABSvoie:=3; ABSVoie3.Checked:=true; congiguration.Unipolaire[3]:=true;     end;
     if sender=ABSVoie4 then begin XY.ABSvoie:=4; ABSVoie4.Checked:=true; congiguration.Unipolaire[4]:=true;     end;

     if sender=ORDVoie1 then begin XY.ORDvoie:=1; ORDVoie1.Checked:=true; congiguration.Unipolaire[1]:=true;     end;
     if sender=ORDVoie2 then begin XY.ORDvoie:=2; ORDVoie2.Checked:=true; congiguration.Unipolaire[2]:=true;     end;
     if sender=ORDVoie3 then begin XY.ORDvoie:=3; ORDVoie3.Checked:=true; congiguration.Unipolaire[3]:=true;     end;
     if sender=ORDVoie4 then begin XY.ORDvoie:=4; ORDVoie4.Checked:=true; congiguration.Unipolaire[4]:=true;     end;

     if sender=ABSVoie1D then begin XY.ABSvoie:=1; ABSVoie1D.Checked:=true; congiguration.Unipolaire[1]:=false;     end;
     if sender=ABSVoie2D then begin XY.ABSvoie:=2; ABSVoie2D.Checked:=true; congiguration.Unipolaire[2]:=false;     end;
     if sender=ABSVoie3D then begin XY.ABSvoie:=3; ABSVoie3D.Checked:=true; congiguration.Unipolaire[3]:=false;     end;
     if sender=ABSVoie4D then begin XY.ABSvoie:=4; ABSVoie4D.Checked:=true; congiguration.Unipolaire[4]:=false;     end;

     if sender=ORDVoie1D then begin XY.ORDvoie:=1; ORDVoie1D.Checked:=true; congiguration.Unipolaire[1]:=false;     end;
     if sender=ORDVoie2D then begin XY.ORDvoie:=2; ORDVoie2D.Checked:=true; congiguration.Unipolaire[2]:=false;     end;
     if sender=ORDVoie3D then begin XY.ORDvoie:=3; ORDVoie3D.Checked:=true; congiguration.Unipolaire[3]:=false;     end;
     if sender=ORDVoie4D then begin XY.ORDvoie:=4; ORDVoie4D.Checked:=true; congiguration.Unipolaire[4]:=false;     end;
//
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
        MCV[0,1].checked:=true;
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



end;

procedure TForm1MesuresCaba_GTI2.resetConfiguration (sender: Tobject);
begin

   congiguration.Start  := true;

   //TempoAffichMesures:=0;

   congiguration.Trigger:=0;
   congiguration.front  :=1;
   congiguration.Level  :=0;

   congiguration.VoieVisible[1]:=true;
   congiguration.VoieVisible[2]:=true;
   congiguration.VoieVisible[3]:=true;
   congiguration.VoieVisible[4]:=true;

   congiguration.couleurs[0]:=clblack;
   congiguration.couleurs[1]:=clblue;
   congiguration.couleurs[2]:=clgreen;
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

   congiguration.sensibilitee[1]:=1;
   congiguration.sensibilitee[2]:=1;
   congiguration.sensibilitee[3]:=1;
   congiguration.sensibilitee[4]:=1;

   congiguration.BaseDetemps:=5;
   congiguration.Vitesse:=2;
   congiguration.TimeOut:=2;
  // congiguration.timeoutVALEURutilisateur:=

   congiguration.affichage:=1;

   congiguration.ConfigOscillo:=1;

   XY.ABSvoie:=1;
   XY.ORDvoie:=2;

end;





procedure TForm1MesuresCaba_GTI2.ValidConfigINTERFACE_GTI2 (sender: Tobject);
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

     for i:=1 to 4 do
     begin
          if XY.ABSvoie=i then
          begin
              SetSensitivity ( i, @XY.ABSsensibilite );
          end;
          if XY.ORDvoie=i then
          begin
              SetSensitivity ( i, @XY.ORDsensibilite );
          end;
     end;




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





     SetRecordLength    (LongEnregistrement ) ;
     SetSampleFrequency (@FrequenceEch) ;
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






procedure Initialisation;
var
    DLLSource      : array[0..255] of char;
    erreur         : longint;
    calibre:double;
    tabser: integer;
    freqech:double;
begin







   // réglages voies défaut
   calibre := 15 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 2 : 20V . Attention passage par adresse.
   SetCoupling ( lCh1 , lctDC ) ;      // Couplage voie 1 en DC
   SetCoupling ( lCh2 , lctDC ) ;      // Couplage voie 2 en DC

   // trigger non : mesures immédiates
   SetTriggerSource ( 5 ) ;
   SetTriggerTimeout(0);
   //echantillonage par défaut

   SetMeasureMode ( 3 ) ; //Mesure sur les 2 voies
   SetRecordLength ( 100 ) ;  // enregistrer sur 1000 échantillons
   SetPostSamples ( 100 ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
   freqech := 10000;
   SetSampleFrequency (@freqEch);

   compteur:=0;
   serie:=1;
   serieACTIVE:=1;

   for tabser:=1 to 11 do
   compteurt[tabser]:=0 ;

   
end;

{ exemple de réglage du générateur :     }






{ exemple d'acquisition des voies 1 et 2
dans les tableaux Ch1DoubleArray et Ch2DoubleArray déjà déclarés dans la DLL
ne pas oublier de lancer la procédure initialisation avant l'acquisition.
}


procedure acquisition;

var Erreur    :  word;
  //  Frequence :  dword;
  //  NBEch : integer;


begin

   erreur := StartMeasurement();    // Lance l'acquisition
   if erreur <> E_NO_ERRORS then
   ShowMessage('Appareil non initialisé');
   erreur := GetMeasurement( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.
   if erreur <> E_NO_ERRORS then
   ShowMessage('Problème De Getmeasurement');


end;




procedure MiseEnPlaceCalibre;
begin
  



end;





{ Affichage des deux voies dans une fenetre.

Pour l'utiliser :
créer sur la fiche un objet TPaintBox de la taille voulue ( menu VOIR puis LISTE DE COMPOSANTS )
lui donner un nom dans l'inspecteur d'objet par exemple 'ecran'
pour afficher les 2 voies après une acquisition, il suffit d'écrire :
Affichage_voies(ecran);
}

procedure TForm1MesuresCaba_GTI2.Affichage_voiesXY(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    X,Y,t:integer;
    tabser:integer;
begin

Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh1, @Calibre1);
//GetSensitivity( lCh3, @Calibre2);
Calibre1:=XY.ABScal;
Calibre2:=XY.ORDcal;
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





// Affichage VoiesXY

    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(Curseur_abscisse ,Curseur_Ordonnee );

          SomCh1:=0 ;
          SomCh2:=0 ;
          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin
          //SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
          //SomCh2:=SomCh2 + Ch3DoubleArray[  positiontableau  ];
               if XY.ABSvoie=1 then SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
               if XY.ABSvoie=2 then SomCh1:=SomCh1 + Ch2DoubleArray[  positiontableau  ];
               if XY.ABSvoie=3 then SomCh1:=SomCh1 + Ch3DoubleArray[  positiontableau  ];
               if XY.ABSvoie=4 then SomCh1:=SomCh1 + Ch4DoubleArray[  positiontableau  ];
               if XY.ORDvoie=1 then SomCh2:=SomCh2 + Ch1DoubleArray[  positiontableau  ];
               if XY.ORDvoie=2 then SomCh2:=SomCh2 + Ch2DoubleArray[  positiontableau  ];
               if XY.ORDvoie=3 then SomCh2:=SomCh2 + Ch3DoubleArray[  positiontableau  ];
               if XY.ORDvoie=4 then SomCh2:=SomCh2 + Ch4DoubleArray[  positiontableau  ];


          end;

          Curseur_abscisse := Round(( SomCh1/Longueur_Acquisition  )*(Sender.width/2) / Calibre1 + (Sender.width/2));
          Curseur_Ordonnee := Round(( -SomCh2/Longueur_Acquisition  )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));

          Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);


         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);
     //    Sender.Canvas.MoveTo(Curseur_abscisse   , Curseur_Ordonnee   );



      //   Sender.Canvas.Pen.Color := clRed;
      //   Sender.Canvas.MoveTo(Round(( MesuresCh1[1])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[1])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );

          for tabser := 1 to serie do
          begin
          for positiontableau := 1 to compteurt[tabser] do
          begin
          if tabser=serieACTIVE then
          Sender.Canvas.Pen.Color := clyellow
          else
          Sender.Canvas.Pen.Color := clRed;
         Sender.Canvas.MoveTo(Round(( MesuresCh1[tabser,positiontableau])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[tabser,positiontableau])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );



          Curseur_abscisse := Round(( MesuresCh1[tabser,positiontableau]  )*(Sender.Width/2) / Calibre1 + (Sender.Width/2));
          Curseur_Ordonnee := Round(( -MesuresCh2[tabser,positiontableau] )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));

          Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee);


         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);
      //   Sender.Canvas.MoveTo(Curseur_abscisse   , Curseur_Ordonnee   );
          end;
          end;
end;



procedure TForm1MesuresCaba_GTI2.Affichage_XY_BLEU_DYN(Destination: Tpaintbox);
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

procedure TForm1MesuresCaba_GTI2.Affichage_voiesXY_bitmap(Sender: Tbitmap);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 ,Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    x,y,t,i:integer;
    INV1,INV2,INV3,INV4:integer;
    ValeurrealOrdonnee:real;
     ValeurrealAbscisse:real;
     tabser:integer;
begin

sender.Canvas.Pen.Width :=1;
sender.Canvas.pen.Color :=clinfobk ;

sender.Canvas.Brush.Color := clinfobk;
sender.Canvas.Rectangle(0, 0, sender.Width - 1 , sender.Height - 1 );

Longueur_Acquisition := GetRecordLength();
//GetSensitivity( lCh1, @Calibre1);
//GetSensitivity( lCh3, @Calibre2);
Calibre1:=XY.ABScal;
Calibre2:=XY.ORDcal;


Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(Curseur_abscisse ,Curseur_Ordonnee );

          SomCh1:=0 ;
          SomCh2:=0 ;
          for positiontableau := 0 to Longueur_Acquisition-1 do
          begin
          //SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
          //SomCh2:=SomCh2 + Ch3DoubleArray[  positiontableau  ];
               if XY.ABSvoie=1 then SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
               if XY.ABSvoie=2 then SomCh1:=SomCh1 + Ch2DoubleArray[  positiontableau  ];
               if XY.ABSvoie=3 then SomCh1:=SomCh1 + Ch3DoubleArray[  positiontableau  ];
               if XY.ABSvoie=4 then SomCh1:=SomCh1 + Ch4DoubleArray[  positiontableau  ];
               if XY.ORDvoie=1 then SomCh2:=SomCh2 + Ch1DoubleArray[  positiontableau  ];
               if XY.ORDvoie=2 then SomCh2:=SomCh2 + Ch2DoubleArray[  positiontableau  ];
               if XY.ORDvoie=3 then SomCh2:=SomCh2 + Ch3DoubleArray[  positiontableau  ];
               if XY.ORDvoie=4 then SomCh2:=SomCh2 + Ch4DoubleArray[  positiontableau  ];


          end;

          Curseur_abscisse := Round(( SomCh1/Longueur_Acquisition  )*(Sender.width/2) / Calibre1 + (Sender.width/2));
          Curseur_Ordonnee := Round(( -SomCh2/Longueur_Acquisition  )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));

          Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);


         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);
     //    Sender.Canvas.MoveTo(Curseur_abscisse   , Curseur_Ordonnee   );



      //   Sender.Canvas.Pen.Color := clRed;
      //   Sender.Canvas.MoveTo(Round(( MesuresCh1[1])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[1])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );

          for tabser := 1 to serie do
          begin
          for positiontableau := 1 to compteurt[tabser] do
          begin
          if tabser=serieACTIVE then
          Sender.Canvas.Pen.Color := clyellow
          else
          Sender.Canvas.Pen.Color := clRed;
         Sender.Canvas.MoveTo(Round(( MesuresCh1[tabser,positiontableau])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[tabser,positiontableau])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );



          Curseur_abscisse := Round(( MesuresCh1[tabser,positiontableau]  )*(Sender.Width/2) / Calibre1 + (Sender.Width/2));
          Curseur_Ordonnee := Round(( -MesuresCh2[tabser,positiontableau] )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));

          Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee);


         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);
      //   Sender.Canvas.MoveTo(Curseur_abscisse   , Curseur_Ordonnee   );
          end;
          end;

end;

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

procedure TForm1MesuresCaba_GTI2.ResetEcranXY_bitmap (sender: Tbitmap);
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

          coulFOND:=TSL_TO_RVB_TCOLOR(140,225,119-5*(largeur-i))  ;

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












procedure TForm1MesuresCaba_GTI2.Button1Click(Sender: TObject);
var
tabser:integer;
begin
     {
     Initialisation;
     resetConfiguration(sender);
     ValidConfigINTERFACE_GTI2(sender);


     Calibrech1scrollbar.position:=1;
     CALIBCH1_20V.Checked:=true;
     Calibrech2scrollbar.position:=1;
     CALIBreCH2_20V.Checked:=true;
     mesures:=1;


     memo1.text:=''  ;
     memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
     button1.caption:='Reset';
     Saisiedupoint.caption:='Saisie du point';
     Label4.visible:=true;
     Label6.visible:=true;
     Label7.visible:=true;
     Label5.visible:=true;
     LabelCh11.caption:='5';
     LabelCh12.caption:='10';
     LabelCh13.caption:='15';
     LabelCh16.caption:='- 5';
     LabelCh15.caption:='-10';
     LabelCh14.caption:='-15';
     LabelCh1.caption:='V';
     LabelCh21.caption:='5';
     LabelCh22.caption:='10';
     LabelCh23.caption:='15';
     LabelCh26.caption:='- 5';
     LabelCh25.caption:='-10';
     LabelCh24.caption:='-15';
     LabelCh2.caption:='V';
     Timer1.enabled    := true;

     }
     //Initialisation;


      compteur:=0;
   serie:=1;
   serieACTIVE:=1;

   for tabser:=1 to 11 do
   compteurt[tabser]:=0 ;
     memo1.text:=''  ;
     //memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
     
end;





procedure TForm1MesuresCaba_GTI2.Timer1Timer(Sender: TObject);
begin

    if (timer1.enabled) and (@timer1.OnTimer <> nil) then
    begin
        Timer1.enabled    := False;
        //TempoAffichMesures:=TempoAffichMesures+1;

        if ACQUI=false then
        begin
            ValidConfigINTERFACE_GTI2(sender);
            erreur := StartMeasurement();    // Lance l'acquisition
            if erreur <> E_NO_ERRORS then
            begin
                ShowMessage('Appareil non initialisé');
            end
            else ACQUI:=true;
        end;  {if ACQUI=false}

        erreur := GetMeasurement( @Ch1DoubleArray , @Ch2DoubleArray ); // transfère les données dans les tableaux. Attention passage par adresse.
        if erreur <> E_NO_ERRORS then
        begin
            //RadioButton2.Checked:=true;      //non pas trig/data
        end
        else
        begin
            //RadioButton1.Checked:=true;       //oui un trig/data
        end;



        if erreur = E_NO_ERRORS then
        begin


            //Bool_reset_ecran:=true;
            //Bool_affichage:=true;
            //FormPaint(Sender);

            TraitementDonnees(Sender);



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
           // compteurNOTRIG:=compteurNOTRIG+1;
           // if compteurNOTRIG>=CompteurTIMEOUT then
           // begin
                //Bool_reset_ecran:=true;
                //Bool_affichage:=false;
                //FormPaint(Sender);
           // end;
        end;    {else if erreur = E_NO_ERRORS}

        //TriggerBARREChange(sender);
    end; {if (timer1.enabled)...}

Timer1.enabled    := true;

end;










procedure TForm1MesuresCaba_GTI2.TraitementDonnees(Sender: TObject);
var
Longueur_Acquisition :extended;
Calibre1 , Calibre2 : Double;
begin
          GetSensitivity( lCh1, @Calibre1);
          GetSensitivity( lCh3, @Calibre2);

          Longueur_Acquisition := GetRecordLength();





          //Affichage_voiesXY(PaintBox1);
          Affichage_XY_BLEU_DYN(PaintBox1);

          if  (SomCh1/Longueur_Acquisition>=calibre1-0.001) or (SomCh1/Longueur_Acquisition<=-calibre1+0.001) then
              label1.caption:='> CAL !!!'
          else
              begin
                   if  (SomCh1/Longueur_Acquisition>=0 ) then
                       label1.caption:=' V1=  '+ floattostrf( SomCh1/Longueur_Acquisition,  ffFixed ,10 ,3 )+' V '
                   else
                       label1.caption:=' V1= '+ floattostrf( SomCh1/Longueur_Acquisition,  ffFixed ,10 ,3 )+' V ';
              end;
          if  (SomCh2/Longueur_Acquisition>=calibre2-0.001) or (SomCh2/Longueur_Acquisition<=-calibre2+0.001) then
              label2.caption:='> CAL !!!'
          else
              begin
                   if  (SomCh2/Longueur_Acquisition>=0 ) then
                       label2.caption:=' V2=  '+ floattostrf( SomCh2/Longueur_Acquisition,  ffFixed ,10 ,3 )+' V '
                   else
                       label2.caption:=' V2= '+ floattostrf( SomCh2/Longueur_Acquisition,  ffFixed ,10 ,3 )+' V ';
              end;

          if SaisieAuto=1 then
             begin

             end;

          if CalibresAuto=1 then
             begin
                  if  abs( SomCh1/Longueur_Acquisition)>7                                                   then  CALIBCH1_20V.Checked:=true;
                  if (abs(SomCh1/Longueur_Acquisition)<7)     and  (abs(SomCh1/Longueur_Acquisition)>3.5)   then  CALIBCH1_8V.Checked:=true;
                  if (abs(SomCh1/Longueur_Acquisition)<3.5)   and  (abs(SomCh1/Longueur_Acquisition)>1.75)  then  CALIBCH1_4V.Checked:=true;
                  if (abs(SomCh1/Longueur_Acquisition)<1.75)  and  (abs(SomCh1/Longueur_Acquisition)>0.7)   then  CALIBCH1_2V.Checked:=true;
                  if (abs(SomCh1/Longueur_Acquisition)<0.7)   and  (abs(SomCh1/Longueur_Acquisition)>0.35)  then  CALIBCH1_08V.Checked:=true;
                  if (abs(SomCh1/Longueur_Acquisition)<0.35)  and  (abs(SomCh1/Longueur_Acquisition)>0.15)  then  CALIBCH1_04V.Checked:=true;
                  if  abs(SomCh1/Longueur_Acquisition)<0.15                                                 then  CALIBCH1_02V.Checked:=true;

                  if  abs(SomCh2/Longueur_Acquisition)>7                                                    then  calibreCH2_20V.Checked:=true;
                  if (abs(SomCh2/Longueur_Acquisition)<7)     and  (abs(SomCh2/Longueur_Acquisition)>3.5)   then  CalibreCH2_8V.Checked:=true;;
                  if (abs(SomCh2/Longueur_Acquisition)<3.5)   and  (abs(SomCh2/Longueur_Acquisition)>1.75)  then  CalibreCH2_4V.Checked:=true;
                  if (abs(SomCh2/Longueur_Acquisition)<1.75)  and  (abs(SomCh2/Longueur_Acquisition)>0.7)   then  CalibreCH2_2V.Checked:=true;
                  if (abs(SomCh2/Longueur_Acquisition)<0.7)   and  (abs(SomCh2/Longueur_Acquisition)>0.35)  then  CalibreCH2_08V.Checked:=true;
                  if (abs(SomCh2/Longueur_Acquisition)<0.35)  and  (abs(SomCh2/Longueur_Acquisition)>0.15)  then  CalibreCH2_04V.Checked:=true;
                  if  abs(SomCh2/Longueur_Acquisition)<0.15                                                 then  CalibreCH2_02V.Checked:=true;
            end;

end;






procedure TForm1MesuresCaba_GTI2.Regressi1Click(Sender: TObject);
var
    ligne : string;
    inc,tabser:integer;

const
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';

begin
for tabser:=1 to serie do
begin

sleep(1000);

  FormTransfertRegressi.Donnees := TstringList.create;
  With FormTransfertRegressi.Donnees do
  begin

// Transfert du diagramme en cours
    Clear;
    Add('Cabalab');
    if HS3 then Add('Appareil utilisé : TiePie HS3');
    if GTI2 then Add('Appareil utilisé : Orphy GTI2');
    Add('Mesure caba'); // 3ème = Titre de pagebegin







     ligne := 'X'+crTab+'Y';
     Add(ligne);
     ligne := 'V'+crTab+'V';
     Add(ligne);


          for inc:=1 to Compteurt[tabser] do
          begin
              ligne:=floattostr(MesuresCh1[tabser,inc])+crTab+floattostr(MesuresCh2[tabser,inc]);
              Add(ligne);
          end;

     ClipBoard.AsText := FormTransfertRegressi.Donnees.text;

    // case RadioGroupTypeDeTransfert.itemIndex of
    //      0 : Execute('CLIP|LOAD');           //0 charger en tant que New fichier
    //      1 : Execute('ClIP|ADD');            //1                     New page
    // end;
     FormTransfertRegressi.Execute('ClIP|ADD');

end;
FormTransfertRegressi.Donnees.free;
end;

end;


{
begin

for tabser:=1 to serie do
begin
  FormDDE.EnvoieDonneesGTI_XY(tabser);
end;
end;
}

procedure TForm1MesuresCaba_GTI2.SaisieDuPointClick(Sender: TObject);
var
Longueur_Acquisition :extended;
begin

     if compteur <=1000 then
        begin
             compteur:=compteur+1;
             compteurt[serie]:=compteur;
             Longueur_Acquisition := GetRecordLength();
             MesuresCh1[serie,Compteur]:= SomCh1/Longueur_Acquisition;
             MesuresCh2[serie,Compteur]:= SomCh2/Longueur_Acquisition;
             Saisiedupoint.caption:='Point No ' +inttostr(compteur+1);
             memo1.text:=memo1.text+'Point '+IntToStr(compteur)+':   V1 = '+floattostrf(MesuresCh1[serie,Compteur],  ffFixed ,10 ,3 )+' V     V2 = '+floattostrf( MesuresCh2[serie,Compteur] ,  ffFixed ,10 ,3 )+' V' +#13#10  ;
        end
     else
         Saisiedupoint.caption:= '1000 Max !';
end;

procedure TForm1MesuresCaba_GTI2.Calibrech1scrollbarChange(Sender: TObject);
begin
    if (Calibrech1scrollbar.position=1) and (CALIBCH1_20V.Checked=false) then CALIBCH1_20V.Checked:=true;
    if Calibrech1scrollbar.position=2 then CALIBCH1_8V.Checked:=true;
    if Calibrech1scrollbar.position=3 then CALIBCH1_4V.Checked:=true;
    if Calibrech1scrollbar.position=4 then CALIBCH1_2V.Checked:=true;
    if Calibrech1scrollbar.position=5 then CALIBCH1_08V.Checked:=true;
    if Calibrech1scrollbar.position=6 then CALIBCH1_04V.Checked:=true;
    if Calibrech1scrollbar.position=7 then CALIBCH1_02V.Checked:=true;

    
end;



procedure TForm1MesuresCaba_GTI2.Calibrech2ScrollBarChange(Sender: TObject);
begin
    if (Calibrech2scrollbar.position=1) and (CALIBreCH2_20V.Checked=false) then CalibreCH2_20V.Checked:=true;
    if Calibrech2scrollbar.position=2 then CalibreCH2_8V.Checked:=true;
    if Calibrech2scrollbar.position=3 then CalibreCH2_4V.Checked:=true;
    if Calibrech2scrollbar.position=4 then CalibreCH2_2V.Checked:=true;
    if Calibrech2scrollbar.position=5 then CalibreCH2_08V.Checked:=true;
    if Calibrech2scrollbar.position=6 then CalibreCH2_04V.Checked:=true;
    if Calibrech2scrollbar.position=7 then CalibreCH2_02V.Checked:=true;

end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_20VClick(Sender: TObject);
begin
   calibre := 20 ;
   XY.ABScal:= 20 ;
   XY.ABSsensibilite:=15;
   //SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   Calibrech1scrollbar.position:=1;
   LabelCh11.caption:='5';
   LabelCh12.caption:='10';
   LabelCh13.caption:='15';
   LabelCh16.caption:='- 5';
   LabelCh15.caption:='-10';
   LabelCh14.caption:='-15';
   LabelCh1.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_20VClick(Sender: TObject);
begin
   calibre := 20 ;
   XY.ORDcal:= 20 ;
   XY.ORDsensibilite:=15;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   Calibrech2scrollbar.position:=1;
   LabelCh21.caption:='5';
   LabelCh22.caption:='10';
   LabelCh23.caption:='15';
   LabelCh26.caption:='- 5';
   LabelCh25.caption:='-10';
   LabelCh24.caption:='-15';
   LabelCh2.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_8VClick(Sender: TObject);
begin
   calibre := 8 ;
   XY.ABScal:= 8 ;
   XY.ABSsensibilite:=15;
   //SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 8V . Attention passage par adresse.
   Calibrech1scrollbar.position:=2;
   LabelCh11.caption:='2';
   LabelCh12.caption:='4';
   LabelCh13.caption:='6';
   LabelCh16.caption:='- 2';
   LabelCh15.caption:='-4';
   LabelCh14.caption:='-6';
   LabelCh1.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_8VClick(Sender: TObject);
begin
   calibre := 8 ;
   XY.ORDcal:= 8 ;
   XY.ORDsensibilite:=15;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 8V . Attention passage par adresse.
   Calibrech2scrollbar.position:=2;
   LabelCh21.caption:='2';
   LabelCh22.caption:='4';
   LabelCh23.caption:='6';
   LabelCh26.caption:='- 2';
   LabelCh25.caption:='-4';
   LabelCh24.caption:='-6';
   LabelCh2.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_4VClick(Sender: TObject);
begin
   calibre := 4 ;
   XY.ABScal:= 4 ;
   XY.ABSsensibilite:=7.5;
   //SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 4V . Attention passage par adresse.
   Calibrech1scrollbar.position:=3;
   LabelCh11.caption:='1';
   LabelCh12.caption:='2';
   LabelCh13.caption:='3';
   LabelCh16.caption:='-1';
   LabelCh15.caption:='-2';
   LabelCh14.caption:='-3';
   LabelCh1.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_4VClick(Sender: TObject);
begin
   calibre := 4 ;
   XY.ORDcal:= 4 ;
   XY.ORDsensibilite:=7.5;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 4V . Attention passage par adresse.
   Calibrech2scrollbar.position:=3;
   LabelCh21.caption:='1';
   LabelCh22.caption:='2';
   LabelCh23.caption:='3';
   LabelCh26.caption:='-1';
   LabelCh25.caption:='-2';
   LabelCh24.caption:='-3';
   LabelCh2.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_2VClick(Sender: TObject);
begin
   calibre := 2 ;
   XY.ABScal:= 2 ;
   XY.ABSsensibilite:=7.5;
   //SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 2V . Attention passage par adresse.
   Calibrech1scrollbar.position:=4;
   LabelCh11.caption:='0.5';
   LabelCh12.caption:='1';
   LabelCh13.caption:='1.5';
   LabelCh16.caption:='-0.5';
   LabelCh15.caption:='-1';
   LabelCh14.caption:='-1.5';
   LabelCh1.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_2VClick(Sender: TObject);
begin
   calibre := 2 ;
   XY.ORDcal:= 2 ;
   XY.ORDsensibilite:=7.5;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 2V . Attention passage par adresse.
   Calibrech2scrollbar.position:=4;
   LabelCh21.caption:='0.5';
   LabelCh22.caption:='1';
   LabelCh23.caption:='1.5';
   LabelCh26.caption:='-0.5';
   LabelCh25.caption:='-1';
   LabelCh24.caption:='-1.5';
   LabelCh2.caption:='V';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_08VClick(Sender: TObject);
begin
   calibre := 0.8 ;
   XY.ABScal:= 0.8 ;
   XY.ABSsensibilite:=7.5;
   //SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 0.8V . Attention passage par adresse.
   Calibrech1scrollbar.position:=5;
   LabelCh11.caption:='200';
   LabelCh12.caption:='400';
   LabelCh13.caption:='600';
   LabelCh16.caption:='-200';
   LabelCh15.caption:='-400';
   LabelCh14.caption:='-600';
   LabelCh1.caption:='mV';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_08VClick(Sender: TObject);
begin
   calibre := 0.8 ;
   XY.ORDcal:= 0.8 ;
   XY.ORDsensibilite:=7.5;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 0.8V . Attention passage par adresse.
   Calibrech2scrollbar.position:=5;
   LabelCh21.caption:='200';
   LabelCh22.caption:='400';
   LabelCh23.caption:='600';
   LabelCh26.caption:='-200';
   LabelCh25.caption:='-400';
   LabelCh24.caption:='-600';
   LabelCh2.caption:='mV';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_04VClick(Sender: TObject);
begin
   calibre := 0.4 ;
   XY.ABScal:= 0.4 ;
   XY.ABSsensibilite:=7.5;
  // SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 0.4V . Attention passage par adresse.
   Calibrech1scrollbar.position:=6;
   LabelCh11.caption:='100';
   LabelCh12.caption:='200';
   LabelCh13.caption:='300';
   LabelCh16.caption:='-100';
   LabelCh15.caption:='-200';
   LabelCh14.caption:='-300';
   LabelCh1.caption:='mV';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_04VClick(Sender: TObject);
begin
   calibre := 0.4 ;
   XY.ORDcal:= 0.4 ;
   XY.ORDsensibilite:=7.5;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 0.4V . Attention passage par adresse.
   Calibrech2scrollbar.position:=6;
   LabelCh21.caption:='100';
   LabelCh22.caption:='200';
   LabelCh23.caption:='300';
   LabelCh26.caption:='-100';
   LabelCh25.caption:='-200';
   LabelCh24.caption:='-300';
    LabelCh2.caption:='mV';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH1_02VClick(Sender: TObject);
begin
   calibre := 0.2 ;
   XY.ABScal:= 0.2 ;
   XY.ABSsensibilite:=7.5;
   //SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 0.2V . Attention passage par adresse.
   Calibrech1scrollbar.position:=7;
   LabelCh11.caption:='50 ';
   LabelCh12.caption:='100 ';
   LabelCh13.caption:='150 ';
   LabelCh16.caption:='- 50 ';
   LabelCh15.caption:='-100 ';
   LabelCh14.caption:='-150 ';
    LabelCh1.caption:='mV';
end;

procedure TForm1MesuresCaba_GTI2.CALIBCH2_02VClick(Sender: TObject);
begin
   calibre := 0.2 ;
   XY.ORDcal:= 0.2 ;
   XY.ORDsensibilite:=7.5;
   //SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 0.2V . Attention passage par adresse.
   Calibrech2scrollbar.position:=7;
   LabelCh21.caption:='50';
   LabelCh22.caption:='100';
   LabelCh23.caption:='150 ';
   LabelCh26.caption:='- 50';
   LabelCh25.caption:='-100';
   LabelCh24.caption:='-150';
    LabelCh2.caption:='mV';
end;




procedure TForm1MesuresCaba_GTI2.SerieMClick(Sender: TObject);

begin


    if serie>9 then
       begin
            serieM.caption:= 'MAXIMUM 10 Séries !';
       end
    else
        begin
             if serie=9 then
                 begin
                      serie:=serie+1;
                      serieACTIVE:=serie;
                      serieM.caption:= 'Maximum 10 Series ';
                      compteur:=0;
                      memo1.text:=''  ;
                      memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
                      Saisiedupoint.caption:='Saisie du point';
                 end
             else
                 begin
                      serie:=serie+1 ;
                      serieACTIVE:=serie;
                      //serieM.caption:= 'Série No '+ inttostr(serie+1);     //mis en commentaire pour cabalab 1_21

                      compteur:=0;
                      memo1.text:=''  ;
                      memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
                      Saisiedupoint.caption:='Saisie du point';
                      
                 end;
        end;
end;


procedure TForm1MesuresCaba_GTI2.SeriedeMesuresoptionClick(Sender: TObject);
begin

     SerieM.visible:=true;
     SpinButtonSERIEACTIVE.visible:=true;
end;




procedure TForm1MesuresCaba_GTI2.CalManuClick(Sender: TObject);
begin
     CalibresAuto:=0;
     CalManu.visible:=false;
end;




procedure TForm1MesuresCaba_GTI2.CalibresAutomatiques2Click(Sender: TObject);
begin
     CalibresAuto:=1;
     CalManu.visible:=true;
end;

procedure TForm1MesuresCaba_GTI2.GraduationsCalibres1Click(Sender: TObject);
begin
     LabelCh11.visible:=true;
     LabelCh12.visible:=true;
     LabelCh13.visible:=true;
     LabelCh16.visible:=true;
     LabelCh15.visible:=true;
     LabelCh14.visible:=true;
     LabelCh1.visible:=true;
     LabelCh21.visible:=true;
     LabelCh22.visible:=true;
     LabelCh23.visible:=true;
     LabelCh26.visible:=true;
     LabelCh25.visible:=true;
     LabelCh24.visible:=true;
     LabelCh2.visible:=true;
end;

procedure TForm1MesuresCaba_GTI2.cheminRegresi1Click(Sender: TObject);
begin
     //form2.visible:=true;
end;

procedure TForm1MesuresCaba_GTI2.FormCreate(Sender: TObject);
begin
     //plus de menu graduations calibres en options :
     LabelCh11.visible:=true;
     LabelCh12.visible:=true;
     LabelCh13.visible:=true;
     LabelCh16.visible:=true;
     LabelCh15.visible:=true;
     LabelCh14.visible:=true;
     LabelCh1.visible:=true;
     LabelCh21.visible:=true;
     LabelCh22.visible:=true;
     LabelCh23.visible:=true;
     LabelCh26.visible:=true;
     LabelCh25.visible:=true;
     LabelCh24.visible:=true;
     LabelCh2.visible:=true;





form1MesuresCaba_GTI2.Top:=0;
form1MesuresCaba_GTI2.Left:=0;
form1MesuresCaba_GTI2.height:=768;
form1MesuresCaba_GTI2.width:=1024;

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

 XY.ABSvoie:=1;
 XY.ORDvoie:=2;
 XY.ABSsensibilite:=15;
 XY.ORDsensibilite:=15;
 XY.ABScal:=20;
 XY.ORDcal:=20;


 Initialisation;
     resetConfiguration(sender);
     ValidConfigINTERFACE_GTI2(sender);

     //Initialisation;
     Calibrech1scrollbar.position:=1;
     CALIBCH1_20V.Checked:=true;
     Calibrech2scrollbar.position:=1;
     CALIBreCH2_20V.Checked:=true;
     mesures:=1;
     //serieM.caption:= 'Série de Mesures No '+ inttostr(serie+1);    ////commentaire pour cabalab 1_21

     memo1.text:=''  ;
     memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
     button1.caption:='Reset';
     Saisiedupoint.caption:='Saisie du point';
     Label4.visible:=true;
     Label6.visible:=true;
     Label7.visible:=true;
     Label5.visible:=true;
     LabelCh11.caption:='5';
     LabelCh12.caption:='10';
     LabelCh13.caption:='15';
     LabelCh16.caption:='- 5';
     LabelCh15.caption:='-10';
     LabelCh14.caption:='-15';
     LabelCh1.caption:='V';
     LabelCh21.caption:='5';
     LabelCh22.caption:='10';
     LabelCh23.caption:='15';
     LabelCh26.caption:='- 5';
     LabelCh25.caption:='-10';
     LabelCh24.caption:='-15';
     LabelCh2.caption:='V';
     {$IFDEF Independant}
     Timer1.enabled    := true;
     {$ENDIF}
     //Initialisation;

end;

procedure Tform1MesuresCaba_GTI2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     {$IFDEF CabaLabin}
      timer1.Enabled:=false;

      passif[3]:=true;
      Formcabalab.SpeedButtonMesures.down:=false;
      Formcabalab.GestionButtons(sender);
     {$ENDIF}
end;




//////////////////////////////////////////////////////////////////////////////////////1_21
procedure Tform1MesuresCaba_GTI2.SpeedButton1Click(Sender: TObject);
begin
     {$IFDEF CabaLabin}
      FormCabaLab.WindowState := wsNormal ;
      FormCabaLab.BringToFront;
     {$ENDIF}
end;

procedure Tform1MesuresCaba_GTI2.SpinButtonSERIEACTIVEUpClick(Sender: TObject);
var
i:integer;
begin
if serieACTIVE<serie then serieACTIVE:=serieACTIVE+1;

Saisiedupoint.caption:='Point No ' +inttostr(compteurt[serieACTIVE]+1);
compteur:= compteurt[serieACTIVE];
memo1.text:=''  ;
memo1.text:=memo1.text+'Série No ' + inttostr(serieACTIVE) +#13#10  ;
for i:=1 to compteurt[serieACTIVE] do
begin
memo1.text:=memo1.text+'Point '+IntToStr(i)+':   V1 = '+floattostrf(MesuresCh1[serieACTIVE,i],  ffFixed ,10 ,3 )+' V     V2 = '+floattostrf( MesuresCh2[serieACTIVE,i] ,  ffFixed ,10 ,3 )+' V' +#13#10  ;
end
end;

procedure Tform1MesuresCaba_GTI2.SpinButtonSERIEACTIVEDownClick(Sender: TObject);
var
i:integer;
begin
if serieACTIVE>1 then serieACTIVE:=serieACTIVE-1;

//compteurt[serie]:=compteur;
Saisiedupoint.caption:='Point No ' +inttostr(compteurt[serieACTIVE]+1);
compteur:= compteurt[serieACTIVE];
memo1.text:=''  ;
memo1.text:=memo1.text+'Série No ' + inttostr(serieACTIVE) +#13#10  ;
for i:=1 to compteurt[serieACTIVE] do
begin
memo1.text:=memo1.text+'Point '+IntToStr(i)+':   V1 = '+floattostrf(MesuresCh1[serieACTIVE,i],  ffFixed ,10 ,3 )+' V     V2 = '+floattostrf( MesuresCh2[serieACTIVE,i] ,  ffFixed ,10 ,3 )+' V' +#13#10  ;
end




end;





procedure Tform1MesuresCaba_GTI2.Montage1RsistancecapteurdecourantsurCH11Click(
  Sender: TObject);                                                             //cabala 1_28
begin

 formMontagesXY.top:=0;
 formMontagesXY.left:=0;
 formMontagesXY.Visible:=true;
 formMontagesXY.BringToFront;

 formMontagesXY.image1.visible:=false;
 formMontagesXY.image2.visible:=true;
end;

procedure Tform1MesuresCaba_GTI2.Montage2RsistancecapteurdecourantsurCH11Click(         //cabala 1_28
  Sender: TObject);
begin
 formMontagesXY.top:=0;
 formMontagesXY.left:=0;
 formMontagesXY.Visible:=true;
 formMontagesXY.BringToFront;

 formMontagesXY.image1.visible:=true;
 formMontagesXY.image2.visible:=false;
end;



procedure Tform1MesuresCaba_GTI2.InterfaceNormalClick(Sender: TObject);
begin
Button1.Top:=0;
Button1.left:=8;
Label1.Top:=48;
Label1.left:=8;
Label2.Top:=96;
Label2.left:=8;
SpeedButton1.Top:=144;
SpeedButton1.left:=8;
SerieM.Top:=144;
SerieM.left:=48;
SpinButtonSERIEACTIVE.Top:=144;
SpinButtonSERIEACTIVE.left:=240;
Memo1.Top:=200;
Memo1.left:=8;
SaisieDuPoint.Top:=400;
SaisieDuPoint.left:=8;
Button3.Top:=456;
Button3.left:=8;
CalManu.Top:=504;
CalManu.left:=8;
GroupBoxCh1.Top:=536;
GroupBoxCh1.left:=8;
GroupBoxCh2.Top:=536;
GroupBoxCh2.left:=144;
end;

procedure Tform1MesuresCaba_GTI2.N5127681Click(Sender: TObject);
begin
Button1.Top:=0;
Button1.left:=8;
Label1.Top:=48;
Label1.left:=759;
Label2.Top:=96;
Label2.left:=759;
SpeedButton1.Top:=48;
SpeedButton1.left:=8;
SerieM.Top:=48;
SerieM.left:=48;
SpinButtonSERIEACTIVE.Top:=48;
SpinButtonSERIEACTIVE.left:=240;
Memo1.Top:=106;
Memo1.left:=8;
SaisieDuPoint.Top:=306;
SaisieDuPoint.left:=8;
Button3.Top:=364;
Button3.left:=8;
CalManu.Top:=410;
CalManu.left:=8;
GroupBoxCh1.Top:=536;
GroupBoxCh1.left:=745;
GroupBoxCh2.Top:=536;
GroupBoxCh2.left:=873;
end;

procedure Tform1MesuresCaba_GTI2.FormPaint(Sender: TObject);       //1_30Fm
begin
   {$IFDEF CabaLabin}
   if unitcabalab.passif[2]= false then
      ButtonCabaLabAUTREAPPLI.Visible:=true
   else
      ButtonCabaLabAUTREAPPLI.Visible:=false;
   {$ENDIF}
end;


procedure Tform1MesuresCaba_GTI2.ButtonCabaLabAUTREAPPLIClick(Sender: TObject);
begin
     {$IFDEF CabaLabin}
      formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
      formGBF.BringToFront;             //   1_30Fm
     {$ENDIF}
end;

procedure Tform1MesuresCaba_GTI2.FormActivate(Sender: TObject);
begin
   Timer1.enabled    := true;
  //FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
  //form1MesuresCaba_GTI2.Repaint;       //1_30 pour activer l'apparition du boutton de liason GBF fait ds le onpaint

end;

procedure Tform1MesuresCaba_GTI2.Apropos2Click(Sender: TObject);
begin
     {$IFDEF CabaLabin}
      FormApropos.Visible := true ;
      FormApropos.BringToFront;
     {$ENDIF}
end;









end.
