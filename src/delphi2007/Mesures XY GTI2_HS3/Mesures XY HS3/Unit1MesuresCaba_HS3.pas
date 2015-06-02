unit Unit1MesuresCaba_HS3;
{$DEFINE CABALABin}           //: fonctionne DANS CABALAB   !!!régler la valeur de : const  UmaxGBF  selon GTI2 ou HS3
//{$DEFINE Independant}           //: pour utiliser sans cabalab

{$IFDEF Independant}            //: dans cabalab les DEFINE sont fais par CABALABHS3 ou CABALABGTI2//
  {$DEFINE HS3}                  //    !!!!!!ET les fiches fréquences pour GTI2!!!!!!!!!!
{$ENDIF}                        //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dlldecl,
  ExtCtrls, StdCtrls, Menus, jpeg, Buttons, Spin;

type
  TForm1MesuresCaba_HS3 = class(TForm)
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
    ransfertpointsRegressi1: TMenuItem;
    Menu_NouveauFichier: TMenuItem;
    Menu_NouvellePage: TMenuItem;
    N1: TMenuItem;
    Quitter1: TMenuItem;


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
   

    procedure RegressiDDEClick(Sender: TObject);
    procedure Transfert_Regressi(NewFichier:boolean);

    procedure Quitter1Click(Sender: TObject);
    


    
  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

//const chemin_de_regressi  = 'C:\progra~1\regressi  et portable\Regressi.exe';
//const chemin_de_regressi  = 'D:\regressi2\Regressi.exe';
var
  Form1MesuresCaba_HS3: TForm1MesuresCaba_HS3;
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
  {$IFDEF Independant}
  DLLSource      : array[0..255] of char;
  {$ENDIF}

implementation

{$IFDEF CABALABin}
uses unitcabalab,Unit1Mesures_XY_Montages, UnitApropos,UnitTransfertRegressi,clipbrd,
  UnitGBF;
{$ENDIF}

{$IFDEF Independant}
uses {unitcabalab,}{regressispecdecl,}Unit1Mesures_XY_Montages{, UnitGBF,PrincipalOscilloCaba}{, UnitApropos},UnitTransfertRegressi,clipbrd;
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
//   end;

   // réglages voies défaut
   calibre := 20 ;
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

procedure TForm1MesuresCaba_HS3.Affichage_voiesXY(Sender: TPaintBox);
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
    Sender.Canvas.MoveTo( round(Sender.Width/2),0 );
    Sender.Canvas.LineTo(round(Sender.Width/2) , Sender.Height);





// Affichage VoiesXY

    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo(Curseur_abscisse ,Curseur_Ordonnee );

          SomCh1:=0 ;
          SomCh2:=0 ;
          for positiontableau := 1 to Longueur_Acquisition do
          begin
          SomCh1:=SomCh1 + Ch1DoubleArray[  positiontableau  ];
          SomCh2:=SomCh2 + Ch2DoubleArray[  positiontableau  ];
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


          










procedure TForm1MesuresCaba_HS3.Button1Click(Sender: TObject);
begin
     Initialisation;
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
     Timer1.enabled    := true;
     Initialisation;
end;



procedure TForm1MesuresCaba_HS3.Timer1Timer(Sender: TObject);
var
Longueur_Acquisition :extended;
Calibre1 , Calibre2 : Double;
begin
if (timer1.enabled) and (@timer1.OnTimer <> nil) then
  begin
      Timer1.enabled    := False;
      if StartMeasurement = E_NO_ERRORS then
      begin




     if mesures=1 then
     begin
          GetSensitivity( lCh1, @Calibre1);
          GetSensitivity( lCh2, @Calibre2);
          acquisition;
          Longueur_Acquisition := GetRecordLength();





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

end;
Timer1.enabled    := true;
end;


end;

procedure TForm1MesuresCaba_HS3.RegressiDDEClick(Sender: TObject);
begin
    //formDDE.visible:=true;
    //formDDE.BringToFront;
     if sender=Menu_NouveauFichier then
     begin
          Transfert_Regressi( true);
     end;
     if sender=Menu_NouvellePage then
     begin
          Transfert_Regressi( false);
     end;
     if sender=Button3 then
     begin
          Transfert_Regressi( false);
     end;
end;


procedure TForm1MesuresCaba_HS3.Transfert_Regressi(NewFichier:boolean);  //nouvelle procedure fichier/page
var
    ligne : string;
    inc,tabser:integer;
    stringTemp_X,stringTemp_Y : string;

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
        Add('Appareil utilisé : TiePie HS3');
        //if GTI2 then Add('Appareil utilisé : Orphy GTI2');
        Add('Mesure caba'); // 3ème = Titre de pagebegin

        //XY.ABSvoie XY.ORDvoie
        //if congiguration.Unipolaire[XY.ABSvoie]=true then stringTemp_X:='X_Y'+inttostr(XY.ABSvoie-1) else stringTemp_X:='X_YD'+inttostr(XY.ABSvoie-1);
        //if congiguration.Unipolaire[XY.ORDvoie]=true then stringTemp_Y:='Y_Y'+inttostr(XY.ORDvoie-1) else stringTemp_Y:='Y_YD'+inttostr(XY.ORDvoie-1);
        stringTemp_X:='X_CH1';
        stringTemp_Y:='Y_CH2';
        ligne := stringTemp_X + crTab + stringTemp_Y;
        Add(ligne);


        //ligne := 'X'+crTab+'Y';
        //Add(ligne);

        ligne := 'V'+crTab+'V';
        Add(ligne);

        for inc:=1 to Compteurt[tabser] do
        begin
            ligne:=floattostr(MesuresCh1[tabser,inc])+crTab+floattostr(MesuresCh2[tabser,inc]);
            Add(ligne);
        end;

        ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
        if NewFichier=true then   FormTransfertRegressi.Execute('ClIP|LOAD');
        if NewFichier=false then   FormTransfertRegressi.Execute('ClIP|ADD');
        // FormTransfertRegressi.Execute('ClIP|ADD');

        end;  {With FormTransfertRegressi.Donnees do}
        FormTransfertRegressi.Donnees.free;
     end;
end;


procedure TForm1MesuresCaba_HS3.Regressi1Click(Sender: TObject);      ////ancienne procédure

var chemin_windows         : array[0..255] of Char;
    chemin                 : shortstring;
    chemin_de_regressi     : shortstring;
    y1,z1                  : double;
    fichier                : textfile;
    fichier2                : textfile;
    bloc1                  : textfile;
    bloc2                  : textfile;
    inc                    : integer;
    chaine                 : shortstring;
    tabser:integer;
   // calibre1,calibre2    : double;

begin
  {

try
assignfile(fichier2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\cheminregcabalab.txt');
reset(fichier2);
readln(fichier2,chemin_de_regressi);
closefile(fichier2);
except
end;





   GetWindowsDirectory(@chemin_windows,255);
   chemin:=shortstring(chemin_windows)+'\temp\regtemp.rw3';
   assignfile(fichier,chemin);

   assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1MesuresCaba.txt');
   assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2MesuresCaba.txt');

   rewrite(fichier);


    for inc:=1 to 95 do                               ////cabalab 1_26
    writeln(fichier,RegressiBLOC1MesuresCaba[inc]);






    for tabser:=1 to serie do
    begin

         writeln(fichier,'£1 PAGE COMMENT');
         writeln(fichier,'page '+inttostr(tabser));
         writeln(fichier,'&' + inttostr(compteurt[tabser]) +' VALEUR VAR');


         for inc:=1 to Compteurt[tabser] do
             begin

                 y1:=MesuresCh1[tabser,inc];
                 z1:=MesuresCh2[tabser,inc];
               //  writeln(fichier,{x1,#9,}{y1,' ',z1);
   }{          end;



         for inc:=1 to 38 do                               ////cabalab 1_26
         writeln(fichier,RegressiBLOC2MesuresCaba[inc]);


    end;

    




   closefile(fichier);
   chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
   winexec(@chemin[1],SW_SHOWMAXIMIZED);
  }
end;


procedure TForm1MesuresCaba_HS3.SaisieDuPointClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.Calibrech1scrollbarChange(Sender: TObject);
begin
    if (Calibrech1scrollbar.position=1) and (CALIBCH1_20V.Checked=false) then CALIBCH1_20V.Checked:=true;
    if Calibrech1scrollbar.position=2 then CALIBCH1_8V.Checked:=true;
    if Calibrech1scrollbar.position=3 then CALIBCH1_4V.Checked:=true;
    if Calibrech1scrollbar.position=4 then CALIBCH1_2V.Checked:=true;
    if Calibrech1scrollbar.position=5 then CALIBCH1_08V.Checked:=true;
    if Calibrech1scrollbar.position=6 then CALIBCH1_04V.Checked:=true;
    if Calibrech1scrollbar.position=7 then CALIBCH1_02V.Checked:=true;

end;



procedure TForm1MesuresCaba_HS3.Calibrech2ScrollBarChange(Sender: TObject);
begin
    if (Calibrech2scrollbar.position=1) and (CALIBreCH2_20V.Checked=false) then CalibreCH2_20V.Checked:=true;
    if Calibrech2scrollbar.position=2 then CalibreCH2_8V.Checked:=true;
    if Calibrech2scrollbar.position=3 then CalibreCH2_4V.Checked:=true;
    if Calibrech2scrollbar.position=4 then CalibreCH2_2V.Checked:=true;
    if Calibrech2scrollbar.position=5 then CalibreCH2_08V.Checked:=true;
    if Calibrech2scrollbar.position=6 then CalibreCH2_04V.Checked:=true;
    if Calibrech2scrollbar.position=7 then CalibreCH2_02V.Checked:=true;

end;

procedure TForm1MesuresCaba_HS3.CALIBCH1_20VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_20VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH1_8VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_8VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH1_4VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_4VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH1_2VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_2VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH1_08VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_08VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH1_04VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_04VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH1_02VClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.CALIBCH2_02VClick(Sender: TObject);
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




procedure TForm1MesuresCaba_HS3.SerieMClick(Sender: TObject);

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


procedure TForm1MesuresCaba_HS3.SeriedeMesuresoptionClick(Sender: TObject);
begin

     SerieM.visible:=true;
     SpinButtonSERIEACTIVE.visible:=true;
end;




procedure TForm1MesuresCaba_HS3.CalManuClick(Sender: TObject);
begin
     CalibresAuto:=0;
     CalManu.visible:=false;
end;




procedure TForm1MesuresCaba_HS3.CalibresAutomatiques2Click(Sender: TObject);
begin
     CalibresAuto:=1;
     CalManu.visible:=true;
end;

procedure TForm1MesuresCaba_HS3.GraduationsCalibres1Click(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.cheminRegresi1Click(Sender: TObject);
begin
     //form2.visible:=true;
end;

procedure TForm1MesuresCaba_HS3.FormCreate(Sender: TObject);
begin


form1MesuresCaba_HS3.Top:=0;
form1MesuresCaba_HS3.Left:=0;
form1MesuresCaba_HS3.height:=768;
form1MesuresCaba_HS3.width:=1024;


 {$IFDEF Independant}   //GTI2 ou HS3
      {$IFDEF HS3}    // HS3

         // GTI2:=false;
         // HS3 :=true;

          StrPCopy( DLLSource, ExtractFilePath( Application.ExeName) +'HS3.dll'    ) ;
          DLLHandle := Loadlibrary(DLLSource);
          if DLLHandle = 0 then  showmessage('problème d''allocation mémoire lors du chargement de la DLL');
          RetrieveAllProcAddresses;
          InitInstrument ($308);   //valeur du HS3! !!!uniquement en morceaux détachés de CABALAB
      {$ENDIF}

   {$ENDIF}

end;

procedure TForm1MesuresCaba_HS3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
timer1.Enabled:=false;
      {$IFDEF Independant}     //GTI2 ou HS3
          Exitinstrument;
     {$ENDIF}

     {$IFDEF CABALABin}       //GTI2 ou HS3
          passif[3]:=true;
          Formcabalab.SpeedButtonMesures.down:=false;
          Formcabalab.GestionButtons(sender);
     {$ENDIF}

//cabalab.De_BloquageBoutons;
//cabalab.SpeedButtonMesures.down:=false;
end;




//////////////////////////////////////////////////////////////////////////////////////1_21
procedure TForm1MesuresCaba_HS3.SpeedButton1Click(Sender: TObject);
begin
{$IFDEF CABALABin}       //GTI2 ou HS3
        FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
        FormCabaLab.BringToFront;
{$ENDIF}
end;

procedure TForm1MesuresCaba_HS3.SpinButtonSERIEACTIVEUpClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.SpinButtonSERIEACTIVEDownClick(Sender: TObject);
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





procedure TForm1MesuresCaba_HS3.Montage1RsistancecapteurdecourantsurCH11Click(
  Sender: TObject);                                                             //cabala 1_28
begin

 formMontagesXY.top:=0;
 formMontagesXY.left:=0;
 formMontagesXY.Visible:=true;
 formMontagesXY.BringToFront;

 formMontagesXY.image1.visible:=false;
 formMontagesXY.image2.visible:=true;
end;

procedure TForm1MesuresCaba_HS3.Montage2RsistancecapteurdecourantsurCH11Click(         //cabala 1_28
  Sender: TObject);
begin
 formMontagesXY.top:=0;
 formMontagesXY.left:=0;
 formMontagesXY.Visible:=true;
 formMontagesXY.BringToFront;

 formMontagesXY.image1.visible:=true;
 formMontagesXY.image2.visible:=false;
end;



procedure TForm1MesuresCaba_HS3.InterfaceNormalClick(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.N5127681Click(Sender: TObject);
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

procedure TForm1MesuresCaba_HS3.FormPaint(Sender: TObject);       //1_30Fm
begin
{$IFDEF CABALABin}      //GTI2 ou HS3
   if unitcabalab.passif[2]= false then
      ButtonCabaLabAUTREAPPLI.Visible:=true
   else
      ButtonCabaLabAUTREAPPLI.Visible:=false;
{$ENDIF}
end;


procedure TForm1MesuresCaba_HS3.ButtonCabaLabAUTREAPPLIClick(Sender: TObject);
begin
{$IFDEF CABALABin}      //GTI2 ou HS3
  formGBF.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
  formGBF.BringToFront;             //   1_30Fm
  {$ENDIF}
end;

procedure TForm1MesuresCaba_HS3.FormActivate(Sender: TObject);
begin
{$IFDEF CABALABin}      //GTI2 ou HS3
 // FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
//  form1MesuresCaba_HS3.Repaint;       //1_30 pour activer l'apparition du boutton de liason GBF fait ds le onpaint
  {$ENDIF}
end;

procedure TForm1MesuresCaba_HS3.Apropos2Click(Sender: TObject);
begin
{$IFDEF CABALABin}      //GTI2 ou HS3
FormApropos.Visible := true ;
FormApropos.BringToFront;
{$ENDIF}
end;

procedure TForm1MesuresCaba_HS3.Quitter1Click(Sender: TObject);
begin
     {$IFDEF CabaLabin}
      timer1.Enabled:=false;

      passif[3]:=true;
      Formcabalab.SpeedButtonMesures.down:=false;
      Formcabalab.GestionButtons(sender);
      form1MesuresCaba_HS3.visible:=false;
     {$ENDIF}
end;



end.
