unit Unit_Traceur_HS3;

{$DEFINE CABALABin}           //: fonctionne DANS CABALAB   !!!régler la valeur de : const  UmaxGBF  selon GTI2 ou HS3
//{$DEFINE Independant}           //: pour utiliser sans cabalab


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dlldecl,
  ExtCtrls, StdCtrls, Menus, jpeg, Buttons;

type
  TForm_Traceur_HS3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    Button3: TButton;
    SerieM: TButton;
    MainMenu1: TMainMenu;
    Options: TMenuItem;
    SeriedeMesuresoption: TMenuItem;
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
    Label12: TLabel;
    Rglages1: TMenuItem;
    cheminRegresi1: TMenuItem;
    Calibres1: TMenuItem;
    Label8: TLabel;
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
    CalManu: TButton;
    Basedetemps1: TMenuItem;
    BDTBOX: TGroupBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton1: TRadioButton;
    ButtonAGAIN: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButtonRUNSTOP: TSpeedButton;
    ButtonCabalabAutreAppli: TButton;
    Apropos1: TMenuItem;
    Apropos2: TMenuItem;


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
    procedure Calibres1Click(Sender: TObject);
    procedure Basedetemps1Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  
    procedure ButtonAGAINClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButtonRUNSTOPClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ButtonCabalabAutreAppliClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Apropos2Click(Sender: TObject);
   
    procedure Transfert_Regressi(Sender: TObject);





    
  private
    { Déclarations privées}
  public
    { Déclarations publiques}
    calibre:double;
  end;

//const chemin_de_regressi  = 'C:\progra~1\regressi  et portable\Regressi.exe';
//const chemin_de_regressi  = 'D:\regressi2\Regressi.exe';
var
  Form_Traceur_HS3: TForm_Traceur_HS3;
  invech1:byte;
  invech2:byte;
  mesures:byte;
  SomCh1,SomCh2 : double;
  compteur:integer;
  MesuresCh1: array[0..11] of array[0..1000] of double;
  MesuresCh2: array[0..11] of array[0..1000] of double;
  compteurt:  array[0..11] of integer;
  compteurtBDT: array[0..11] of array[0..1000] of double;

  CalibresAuto:byte;
  SaisieAuto:byte;
  calibre:double;
  serie:integer;
  BDT:integer;
  temps:extended;

  {$IFDEF Independant}
  DLLSource      : array[0..255] of char;      // si HS3, ET, pas ds CABALAB!!
  {$ENDIF}

implementation

{$IFDEF CABALABin}
uses unitcabalab, UnitGBF, UnitApropos,UnitTransfertRegressi,clipbrd;
{$ENDIF}
{$IFDEF Independant}
uses {unitcabalab,}{regressispecdecl}{, UnitGBF, UnitApropos}UnitTransfertRegressi,clipbrd;
{$ENDIF}
{$R *.DFM}


procedure Initialisation;
var
    DLLSource      : array[0..255] of char;
    erreur         : longint;
    calibre:double;
    tabser: integer;
    freqech:double;
begin

// Chargement de la DLL
//StrPCopy( DLLSource, ExtractFilePath( Application.ExeName) + 'HS3.dll'    ) ;
//DLLHandle := Loadlibrary(DLLSource);
//   if DLLHandle = 0 then  showmessage('problème d''allocation mémoire lors du chargement de la DLL');
//RetrieveAllProcAddresses;

// Initialisation du module TiePie HS3
//erreur:=InitInstrument($308);



//   if erreur <> E_NO_ERRORS then
//   begin
//   showmessage('Appareil non trouvé');
   // Ecrire ici les actions en cas d'absence du module
   // par exemple pour fermer le programme :
//   NilAllProcAddresses;
//   Application.terminate;
 //  end;

   // réglages voies défaut
   calibre := 20 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 2 : 20V . Attention passage par adresse.
   SetCoupling ( lCh1 , lctDC ) ;      // Couplage voie 1 en DC
   SetCoupling ( lCh2 , lctDC ) ;      // Couplage voie 2 en DC

   // trigger non : mesures immédiates
   SetTriggerSource ( 5 ) ;
   SetTriggerTimeOut(0);
   //echantillonage par défaut

   SetMeasureMode ( 3 ) ; //Mesure sur les 2 voies
   SetRecordLength ( 1000 ) ;  // enregistrer sur 1000 échantillons
   SetPostSamples ( 1000 ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
   freqech := 50000000;
   SetSampleFrequency (@freqEch);

   compteur:=0;
   compteurt[1]:=0;
   serie:=1;
   BDT:=1000;
   //Timer1.Interval:=BDT;
   for tabser:=1 to 5 do
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










{ Affichage des deux voies dans une fenetre.

Pour l'utiliser :
créer sur la fiche un objet TPaintBox de la taille voulue ( menu VOIR puis LISTE DE COMPOSANTS )
lui donner un nom dans l'inspecteur d'objet par exemple 'ecran'
pour afficher les 2 voies après une acquisition, il suffit d'écrire :
Affichage_voies(ecran);
}

procedure TForm_Traceur_HS3.Affichage_voiesXY(Sender: TPaintBox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    positiontableau:dword;
    X,Y,t:integer;
    tabser:integer;
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
    //Sender.Canvas.MoveTo( round(Sender.Width/2),0 );
    //Sender.Canvas.LineTo(round(Sender.Width/2) , Sender.Height);





// Affichage VoiesXY

    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(Curseur_abscisse ,Curseur_Ordonnee );
          {
          SomCh1:=0 ;
          SomCh2:=0 ;
          for positiontableau := 1 to Longueur_Acquisition do
          begin
          SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
          SomCh2:=SomCh2 + Ch2DoubleArray[  positiontableau  ];
          end;    }

   {      Curseur_abscisse := Round(( SomCh1/Longueur_Acquisition  )*(Sender.width/2) / Calibre1 + (Sender.width/2));
          Curseur_Ordonnee := Round(( -SomCh2/Longueur_Acquisition  )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));

          Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);


         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);
    }
     //    Sender.Canvas.MoveTo(Curseur_abscisse   , Curseur_Ordonnee   );



      //   Sender.Canvas.Pen.Color := clRed;
      // Sender.Canvas.MoveTo(Round(( MesuresCh1[1])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[1])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );





          Sender.Canvas.Pen.Color := clblue;
          positiontableau := 1  ;
          Curseur_Ordonnee := Round(( -MesuresCh2[serie,positiontableau] )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));
          Curseur_abscisse :=  positiontableau;
          Sender.Canvas.moveTo(Curseur_Abscisse, Curseur_Ordonnee);


          for positiontableau := 1 to (compteurt[serie]-1) do           {affichages des points enregistrés jusque la}
          begin

          Sender.Canvas.Pen.Color := clblue;

          //Sender.Canvas.MoveTo(Round(( MesuresCh1[tabser,positiontableau])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[tabser,positiontableau])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );
         // Curseur_abscisse := Round(( MesuresCh1[tabser,positiontableau]  )*(Sender.Width/2) / Calibre1 + (Sender.Width/2));
          Curseur_Ordonnee := Round(( -MesuresCh2[serie,positiontableau] )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));
          Curseur_abscisse :=  positiontableau;
          Sender.Canvas.lineTo(Curseur_Abscisse, Curseur_Ordonnee);

          end;
         
          Sender.Canvas.Pen.Color := clLime;
          positiontableau := compteurt[1];
          Curseur_Ordonnee := Round(( -MesuresCh2[serie,positiontableau] )*(Sender.Height/2) / Calibre2 + (Sender.Height/2));
          Curseur_abscisse :=  positiontableau;
          Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee);
          Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
          Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
          Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
          Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);         {dessins des croix des points}









          Sender.Canvas.Pen.Color := clRed;
          positiontableau := 1;
          Curseur_Ordonnee := Round(-( MesuresCh1[serie,positiontableau]  )*(Sender.Height/2) / Calibre1 + (Sender.Height/2));
          Curseur_abscisse := positiontableau;
          Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee);            {retour a "l'origine"?}

           {affichages des points enregistrés jusque la}

          for positiontableau := 1 to (compteurt[serie]-1) do
          begin


          Sender.Canvas.Pen.Color := clRed;

          //Sender.Canvas.MoveTo(Round(( MesuresCh1[tabser,positiontableau])*(Sender.Height/2) / Calibre1 + (Sender.Height/2)) ,Round(( -MesuresCh2[tabser,positiontableau])*(Sender.Height/2) / Calibre2 + (Sender.Height/2)) );
         // Curseur_abscisse := Round(( MesuresCh1[tabser,positiontableau]  )*(Sender.Width/2) / Calibre1 + (Sender.Width/2));

          Curseur_Ordonnee := Round(-( MesuresCh1[serie,positiontableau]  )*(Sender.height/2) / Calibre1 + (Sender.Height/2));
          Curseur_abscisse :=  positiontableau;
          Sender.Canvas.lineTo(Curseur_Abscisse, Curseur_Ordonnee);


       {  Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);
         }
      //   Sender.Canvas.MoveTo(Curseur_abscisse   , Curseur_Ordonnee   );
         // end;

       {   for Curseur_abscisse  := 1 to sender.width do
              begin
              Sender.Canvas.Pen.Color := clRed;
              Curseur_Ordonnee := Round(-( MesuresCh1[serie,ScrollBar2.position+Curseur_Abscisse*round(1000*(ScrollBar2.position/100)*(compteurt[serie]-1)/sender.width)]  )*(Sender.height/2) / Calibre1 + (Sender.Height/2));
              Sender.Canvas.lineTo(Curseur_Abscisse, Curseur_Ordonnee);
              end;
        }
           end;






          positiontableau := compteurt[1];
          Sender.Canvas.Pen.Color := clLime;
          Curseur_Ordonnee := Round(-( MesuresCh1[serie,positiontableau]  )*(Sender.height/2) / Calibre1 + (Sender.Height/2));
          Curseur_abscisse :=  positiontableau;
          Sender.Canvas.MoveTo(Curseur_Abscisse, Curseur_Ordonnee);         {retour a "l'origine"?}


         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee-9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee+10);
         Sender.Canvas.MoveTo(Curseur_abscisse-9, Curseur_Ordonnee+9);
         Sender.Canvas.LineTo(Curseur_Abscisse+10, Curseur_Ordonnee-10);      {dessins des croix des points}


end;


procedure TForm_Traceur_HS3.ButtonAGAINClick(Sender: TObject);
begin
     temps:=0;
     mesures:=1;
     compteur:=0;
     compteurt[1]:=0;
     serie:=1;
     //BDT:=1000;
     //Timer1.Interval:=BDT;
end;










procedure TForm_Traceur_HS3.Button1Click(Sender: TObject);
begin
     Initialisation;

     Label12.Visible:=false;

     ButtonAGAIN.Enabled:=true;
     Button3.Enabled:=true;
     Rglages1.Enabled:=true;
     Options.Enabled:=true;
     GroupBoxCh1.Enabled:=true;
     GroupBoxCh2.Enabled:=true;


     Calibrech1scrollbar.position:=1;
     CALIBCH1_20V.Checked:=true;
     Calibrech2scrollbar.position:=1;
     CALIBreCH2_20V.Checked:=true;

     BDT:=1000;
     Timer1.Interval:=BDT;
     RadioButton7.Checked:=true;
     temps:=0;
     mesures:=1;
     serieM.caption:= 'Série de Mesures No '+ inttostr(serie+1);

     //memo1.text:=''  ;
     //memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
     button1.caption:='Reset';
     //Saisiedupoint.caption:='Saisie du point';
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
     Initialisation;

     SpeedButtonRUNSTOP.Visible:=true;      //1_21
     SpeedButtonRUNSTOP.down:=false;
end;



procedure TForm_Traceur_HS3.Timer1Timer(Sender: TObject);
var
Longueur_Acquisition :extended;
Calibre1 , Calibre2 : Double;
begin
if (timer1.enabled) and (@timer1.OnTimer <> nil) then
begin
Timer1.enabled    := False;

     if mesures=1 then
     begin
          GetSensitivity( lCh1, @Calibre1);
          GetSensitivity( lCh2, @Calibre2);
          acquisition;
          Longueur_Acquisition := GetRecordLength();
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


          temps:=temps+(BDT/1000);
          SaisieDuPointClick( sender);
          Affichage_voiesXY(PaintBox1);
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
 
         { if SaisieAuto=1 then
             begin

             end; }

     end;
Timer1.enabled    := true;
end;

end;



procedure TForm_Traceur_HS3.Transfert_Regressi(Sender: TObject);  //nouvelle procedure fichier/page
var i : integer;
    ligne : string;
    //ch1,ch2,ch3,ch4:boolean;
    tabser:integer;
    temps:extended ;
const
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';

begin
      FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin


          Clear;
          Add('Cabalab');
          Add('Appareil utilisé : TiePie HS3');
          Add('Traceur'); // 3ème = Titre de pagebegin

          ligne := 't';
          ligne :=ligne +crTab+'CH1';
          ligne :=ligne +crTab+'CH2';
          Add(ligne);

          ligne := 's';
          ligne :=ligne +crTab+'V';
          ligne :=ligne +crTab+'V';
          Add(ligne);

          tabser:=0;
          temps:=0;
          for i:=1+1000*tabser to Compteurt[tabser+1] do
          begin
            temps:=temps+ compteurtBDT[tabser+1,i]/1000;
            ligne := floattostr(temps) ;
            ligne :=ligne +crTab+FloatToStr(MesuresCh1[tabser+1,i]);
            ligne :=ligne +crTab+FloatToStr(MesuresCh2[tabser+1,i]);
            Add(ligne);
          end;

          //////////////////////////////////////////////////////////////////////////////////////////////////
          ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          //if NewFichier=true then   FormTransfertRegressi.Execute('ClIP|LOAD');
          //if NewFichier=false then   FormTransfertRegressi.Execute('ClIP|ADD');
          FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;
end;


procedure TForm_Traceur_HS3.Regressi1Click(Sender: TObject);

var chemin_windows         : array[0..255] of Char;
    chemin                 : shortstring;
    chemin_de_regressi     : shortstring;
    y1,z1 ,t                 : double;
    fichier                : textfile;
    fichier2                : textfile;
    bloc1                  : textfile;
    bloc2                  : textfile;
    inc                    : integer;
    chaine                 : shortstring;
    tabser:integer;
    temps:extended ;
   // calibre1,calibre2    : double;

begin


    {

    for tabser:=0 to (serie-1) do
    begin

         writeln(fichier,'£1 PAGE COMMENT');
         writeln(fichier,'page '+inttostr(tabser+1));
         writeln(fichier,'&' + inttostr(compteurt[tabser+1]) +' VALEUR VAR');
         temps:=0;

         for inc:=1+1000*tabser to Compteurt[tabser+1] do
             begin
             // x1:=inc/strtoint(SetSampelFreqBox.Text);
                 temps:=temps+ compteurtBDT[tabser+1,inc]/1000;
                 t:=temps   {inc*(BDT/1000)};
    {             y1:=MesuresCh1[tabser+1,inc];
                 z1:=MesuresCh2[tabser+1,inc];
                 writeln(fichier,t,' ',y1,' ',z1);
             end;

    }
    
end;


procedure TForm_Traceur_HS3.SaisieDuPointClick(Sender: TObject);
var
Longueur_Acquisition :dword;
positiontableau:dword;
begin

     if compteur <=1100 then
        begin
             label8.Caption:='t='+ floattostr(temps)+'s';
             compteur:=compteur+1;

             compteurt[serie]:=compteur;
             compteurtBDT[serie,compteur]:=BDT;

             Longueur_Acquisition := GetRecordLength();

             SomCh1:=0 ;
             SomCh2:=0 ;
             for positiontableau := 1 to Longueur_Acquisition do
                begin
                    SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
                    SomCh2:=SomCh2 + Ch2DoubleArray[  positiontableau  ];
                end;




             MesuresCh1[serie,Compteur]:= SomCh1/Longueur_Acquisition;
             MesuresCh2[serie,Compteur]:= SomCh2/Longueur_Acquisition;
             //Saisiedupoint.caption:='Point No ' +inttostr(compteur+1);
             //memo1.text:=memo1.text+'Point '+IntToStr(compteur)+':   V1 = '+floattostrf(MesuresCh1[serie,Compteur],  ffFixed ,10 ,3 )+' V     V2 = '+floattostrf( MesuresCh2[serie,Compteur] ,  ffFixed ,10 ,3 )+' V' +#13#10  ;
        end
     else
        begin
              mesures:=0;
              




        
         //showmessage ('10 points de mesures');
         {
         compteurt[serie]:=compteur;
         Longueur_Acquisition := GetRecordLength();
         MesuresCh1[serie,Compteur]:= SomCh1/Longueur_Acquisition;
         MesuresCh2[serie,Compteur]:= SomCh2/Longueur_Acquisition;
         serie:=serie+1;
         compteur:=1;  }
        end;
         //Saisiedupoint.caption:= '1000 Max !';
end;



procedure TForm_Traceur_HS3.SerieMClick(Sender: TObject);

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
                      serieM.caption:= 'Maximum 10 Series ';
                      compteur:=0;
                      //memo1.text:=''  ;
                      //memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
                      //Saisiedupoint.caption:='Saisie du point';
                 end
             else
                 begin
                      serie:=serie+1 ;
                      serieM.caption:= 'Série No '+ inttostr(serie+1);
                      compteur:=0;
                      //memo1.text:=''  ;
                      //memo1.text:=memo1.text+'Série No ' + inttostr(serie) +#13#10  ;
                      //Saisiedupoint.caption:='Saisie du point';
                      
                 end;
        end;
end;


procedure TForm_Traceur_HS3.SeriedeMesuresoptionClick(Sender: TObject);
begin

     SerieM.visible:=true;
end;




procedure TForm_Traceur_HS3.CalManuClick(Sender: TObject);
begin
     CalibresAutomatiques2.Checked:=false;
     CalibresAuto:=0;
     CalManu.visible:=false;
     //Calibrech1scrollbar.Enabled:=true;      essais 1_21 qui marche pas
     //Calibrech2ScrollBar.Enabled:=true;
end;




procedure TForm_Traceur_HS3.CalibresAutomatiques2Click(Sender: TObject);
begin
     CalibresAutomatiques2.Checked:=true;
     CalibresAuto:=1;
     CalManu.visible:=true;
     //Calibrech1scrollbar.Enabled:=false;      essais 1_21 qui marche pas
     //Calibrech2ScrollBar.Enabled:=false;
end;

procedure TForm_Traceur_HS3.GraduationsCalibres1Click(Sender: TObject);
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

procedure TForm_Traceur_HS3.cheminRegresi1Click(Sender: TObject);
begin
     //form2.visible:=true;
end;

procedure TForm_Traceur_HS3.Calibres1Click(Sender: TObject);
begin
     
    { if form3.visible=false then
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
     form3.visible:=true;   }
end;


procedure TForm_Traceur_HS3.Calibrech1scrollbarChange(Sender: TObject);
begin
    if (Calibrech1scrollbar.position=1) and (CALIBCH1_20V.Checked=false) then CALIBCH1_20V.Checked:=true;
    if Calibrech1scrollbar.position=2 then CALIBCH1_8V.Checked:=true;
    if Calibrech1scrollbar.position=3 then CALIBCH1_4V.Checked:=true;
    if Calibrech1scrollbar.position=4 then CALIBCH1_2V.Checked:=true;
    if Calibrech1scrollbar.position=5 then CALIBCH1_08V.Checked:=true;
    if Calibrech1scrollbar.position=6 then CALIBCH1_04V.Checked:=true;
    if Calibrech1scrollbar.position=7 then CALIBCH1_02V.Checked:=true;

end;



procedure TForm_Traceur_HS3.Calibrech2ScrollBarChange(Sender: TObject);
begin
    if (Calibrech2scrollbar.position=1) and (CALIBreCH2_20V.Checked=false) then CalibreCH2_20V.Checked:=true;
    if Calibrech2scrollbar.position=2 then CalibreCH2_8V.Checked:=true;
    if Calibrech2scrollbar.position=3 then CalibreCH2_4V.Checked:=true;
    if Calibrech2scrollbar.position=4 then CalibreCH2_2V.Checked:=true;
    if Calibrech2scrollbar.position=5 then CalibreCH2_08V.Checked:=true;
    if Calibrech2scrollbar.position=6 then CalibreCH2_04V.Checked:=true;
    if Calibrech2scrollbar.position=7 then CalibreCH2_02V.Checked:=true;

end;

procedure TForm_Traceur_HS3.CALIBCH1_20VClick(Sender: TObject);
begin
   calibre := 20 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   Calibrech1scrollbar.position:=1;
   LabelCh11.caption:='5';
   LabelCh12.caption:='10';
   LabelCh13.caption:='15';
   LabelCh16.caption:='- 5';
   LabelCh15.caption:='-10';
   LabelCh14.caption:='-15';
   LabelCh1.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH2_20VClick(Sender: TObject);
begin
   calibre := 20 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 20V . Attention passage par adresse.
   Calibrech2scrollbar.position:=1;
   LabelCh21.caption:='5';
   LabelCh22.caption:='10';
   LabelCh23.caption:='15';
   LabelCh26.caption:='- 5';
   LabelCh25.caption:='-10';
   LabelCh24.caption:='-15';
   LabelCh2.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH1_8VClick(Sender: TObject);
begin
   calibre := 8 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 8V . Attention passage par adresse.
   Calibrech1scrollbar.position:=2;
   LabelCh11.caption:='2';
   LabelCh12.caption:='4';
   LabelCh13.caption:='6';
   LabelCh16.caption:='- 2';
   LabelCh15.caption:='-4';
   LabelCh14.caption:='-6';
   LabelCh1.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH2_8VClick(Sender: TObject);
begin
   calibre := 8 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 8V . Attention passage par adresse.
   Calibrech2scrollbar.position:=2;
   LabelCh21.caption:='2';
   LabelCh22.caption:='4';
   LabelCh23.caption:='6';
   LabelCh26.caption:='- 2';
   LabelCh25.caption:='-4';
   LabelCh24.caption:='-6';
   LabelCh2.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH1_4VClick(Sender: TObject);
begin
   calibre := 4 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 4V . Attention passage par adresse.
   Calibrech1scrollbar.position:=3;
   LabelCh11.caption:='1';
   LabelCh12.caption:='2';
   LabelCh13.caption:='3';
   LabelCh16.caption:='-1';
   LabelCh15.caption:='-2';
   LabelCh14.caption:='-3';
   LabelCh1.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH2_4VClick(Sender: TObject);
begin
   calibre := 4 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 4V . Attention passage par adresse.
   Calibrech2scrollbar.position:=3;
   LabelCh21.caption:='1';
   LabelCh22.caption:='2';
   LabelCh23.caption:='3';
   LabelCh26.caption:='-1';
   LabelCh25.caption:='-2';
   LabelCh24.caption:='-3';
   LabelCh2.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH1_2VClick(Sender: TObject);
begin
   calibre := 2 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 2V . Attention passage par adresse.
   Calibrech1scrollbar.position:=4;
   LabelCh11.caption:='0.5';
   LabelCh12.caption:='1';
   LabelCh13.caption:='1.5';
   LabelCh16.caption:='-0.5';
   LabelCh15.caption:='-1';
   LabelCh14.caption:='-1.5';
   LabelCh1.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH2_2VClick(Sender: TObject);
begin
   calibre := 2 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 2V . Attention passage par adresse.
   Calibrech2scrollbar.position:=4;
   LabelCh21.caption:='0.5';
   LabelCh22.caption:='1';
   LabelCh23.caption:='1.5';
   LabelCh26.caption:='-0.5';
   LabelCh25.caption:='-1';
   LabelCh24.caption:='-1.5';
   LabelCh2.caption:='V';
end;

procedure TForm_Traceur_HS3.CALIBCH1_08VClick(Sender: TObject);
begin
   calibre := 0.8 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 0.8V . Attention passage par adresse.
   Calibrech1scrollbar.position:=5;
   LabelCh11.caption:='200';
   LabelCh12.caption:='400';
   LabelCh13.caption:='600';
   LabelCh16.caption:='-200';
   LabelCh15.caption:='-400';
   LabelCh14.caption:='-600';
   LabelCh1.caption:='mV';
end;

procedure TForm_Traceur_HS3.CALIBCH2_08VClick(Sender: TObject);
begin
   calibre := 0.8 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 0.8V . Attention passage par adresse.
   Calibrech2scrollbar.position:=5;
   LabelCh21.caption:='200';
   LabelCh22.caption:='400';
   LabelCh23.caption:='600';
   LabelCh26.caption:='-200';
   LabelCh25.caption:='-400';
   LabelCh24.caption:='-600';
   LabelCh2.caption:='mV';
end;

procedure TForm_Traceur_HS3.CALIBCH1_04VClick(Sender: TObject);
begin
   calibre := 0.4 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 0.4V . Attention passage par adresse.
   Calibrech1scrollbar.position:=6;
   LabelCh11.caption:='100';
   LabelCh12.caption:='200';
   LabelCh13.caption:='300';
   LabelCh16.caption:='-100';
   LabelCh15.caption:='-200';
   LabelCh14.caption:='-300';
   LabelCh1.caption:='mV';
end;

procedure TForm_Traceur_HS3.CALIBCH2_04VClick(Sender: TObject);
begin
   calibre := 0.4 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 0.4V . Attention passage par adresse.
   Calibrech2scrollbar.position:=6;
   LabelCh21.caption:='100';
   LabelCh22.caption:='200';
   LabelCh23.caption:='300';
   LabelCh26.caption:='-100';
   LabelCh25.caption:='-200';
   LabelCh24.caption:='-300';
    LabelCh2.caption:='mV';
end;

procedure TForm_Traceur_HS3.CALIBCH1_02VClick(Sender: TObject);
begin
   calibre := 0.2 ;
   SetSensitivity ( lCh1 , @calibre ) ;  // Calibre voie 1 : 0.2V . Attention passage par adresse.
   Calibrech1scrollbar.position:=7;
   LabelCh11.caption:='50 ';
   LabelCh12.caption:='100 ';
   LabelCh13.caption:='150 ';
   LabelCh16.caption:='- 50 ';
   LabelCh15.caption:='-100 ';
   LabelCh14.caption:='-150 ';
    LabelCh1.caption:='mV';
end;

procedure TForm_Traceur_HS3.CALIBCH2_02VClick(Sender: TObject);
begin
   calibre := 0.2 ;
   SetSensitivity ( lCh2 , @calibre ) ;  // Calibre voie 1 : 0.2V . Attention passage par adresse.
   Calibrech2scrollbar.position:=7;
   LabelCh21.caption:='50';
   LabelCh22.caption:='100';
   LabelCh23.caption:='150 ';
   LabelCh26.caption:='- 50';
   LabelCh25.caption:='-100';
   LabelCh24.caption:='-150';
    LabelCh2.caption:='mV';
end;




procedure TForm_Traceur_HS3.Basedetemps1Click(Sender: TObject);
begin
     BDTBOX.Visible:=true;
     
end;

procedure TForm_Traceur_HS3.RadioButton7Click(Sender: TObject);
begin
     BDT:=1000;
     Timer1.Interval:=BDT;

end;

procedure TForm_Traceur_HS3.RadioButton8Click(Sender: TObject);
begin
     BDT:=5000;
     Timer1.Interval:=BDT;
end;

procedure TForm_Traceur_HS3.RadioButton9Click(Sender: TObject);
begin
     BDT:=10000;
     Timer1.Interval:=BDT;
end;

procedure TForm_Traceur_HS3.RadioButton10Click(Sender: TObject);
begin
     BDT:=20000;
     Timer1.Interval:=BDT;
end;

procedure TForm_Traceur_HS3.RadioButton11Click(Sender: TObject);
begin
     BDT:=40000;
     Timer1.Interval:=BDT;
end;

procedure TForm_Traceur_HS3.RadioButton12Click(Sender: TObject);
begin
     BDT:=60000;
     Timer1.Interval:=BDT;
end;

procedure TForm_Traceur_HS3.RadioButton13Click(Sender: TObject);
begin
     BDT:=100;
     Timer1.Interval:=BDT;
end;

procedure TForm_Traceur_HS3.RadioButton1Click(Sender: TObject);
begin
     BDT:=10;
     Timer1.Interval:=BDT;
end;




procedure TForm_Traceur_HS3.FormCreate(Sender: TObject);
begin
form_Traceur_HS3.Top:=0;
form_Traceur_HS3.Left:=0;

{$IFDEF Independant}   //GTI2 ou HS3


          StrPCopy( DLLSource, ExtractFilePath( Application.ExeName) +'HS3.dll'    ) ;
          DLLHandle := Loadlibrary(DLLSource);
          if DLLHandle = 0 then  showmessage('problème d''allocation mémoire lors du chargement de la DLL');
          RetrieveAllProcAddresses;
          InitInstrument ($308);   //valeur du HS3! !!!uniquement en morceaux détachés de CABALAB


   {$ENDIF}

end;

procedure TForm_Traceur_HS3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Timer1.enabled    := False;
button1.caption:='Acquisition';         //1_21
SpeedButtonRUNSTOP.Visible:=false;      //1_21
//Button1Click(Sender);
{$IFDEF Independant}     //GTI2 ou HS3
          Exitinstrument;
{$ENDIF}

{$IFDEF CABALABin}       //GTI2 ou HS3
          passif[4]:=true;
          Formcabalab.SpeedButtonGraph.down:=false;
          Formcabalab.GestionButtons(sender);
{$ENDIF}
//cabalab.De_BloquageBoutons;

end;



////////////////////////////////////////////////////////////////////////////////////1_21
procedure TForm_Traceur_HS3.SpeedButton1Click(Sender: TObject);
begin
{$IFDEF CABALABin}       //GTI2 ou HS3
FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
FormCabaLab.BringToFront;
{$ENDIF}
end;

procedure TForm_Traceur_HS3.SpeedButtonRUNSTOPClick(Sender: TObject);
begin
if SpeedButtonRUNSTOP.Down=true then
 begin

 Timer1.Enabled:=false;
 end
else
 begin
 
 Timer1.Enabled:=true;
 end;
end;


procedure TForm_Traceur_HS3.FormPaint(Sender: TObject);    //1_30 FM
begin
{$IFDEF CABALABin}
if unitcabalab.passif[2]= false then
      ButtonCabalabAutreAppli.Visible:=true
   else
      ButtonCabalabAutreAppli.Visible:=false;
{$ENDIF}
end;

procedure TForm_Traceur_HS3.ButtonCabalabAutreAppliClick(Sender: TObject);
begin
{$IFDEF CABALABin}
    formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
    formGBF.BringToFront;             //   1_30Fm
{$ENDIF}
end;

procedure TForm_Traceur_HS3.FormActivate(Sender: TObject);
begin
     form_Traceur_HS3.Repaint;       //1_30 pour activer l'apparition du boutton de liason GBF fait ds le onpaint
end;

procedure TForm_Traceur_HS3.PaintBox1Paint(Sender: TObject);
begin
if SpeedButtonRUNSTOP.Down=true then Affichage_voiesXY(PaintBox1);
end;

procedure TForm_Traceur_HS3.Apropos2Click(Sender: TObject);
begin
{$IFDEF CABALABin}
FormApropos.Visible := true ;
FormApropos.BringToFront;
{$ENDIF}
end;

end.
