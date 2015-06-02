{*****************************************************************
			windll - description
			________________
begin		:             Mon Oct 1 09:01;53 CET2002
copyright	:	(C)2002 by S. EGLY, J. ESQUIEU, J. GUITTARD
email		:
******************************************************************}

{*****************************************************************
*                                                                                                                                *
*  This program is free software, you can redistribute it and/or modify it               *
*  under the terms of the GNU General Public License as publised by                 *
*  the Free Software Foundation; either version 2 of the License, or                       *
* (at your option) any later version.                                                                          *
*                                                                                                                                 *
******************************************************************}

unit UnitBodePrincipal;
                                         
interface

uses
  Printers, SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Math,

  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Spin, OleCtrls,
  UnitBodeLinearite, UnitBodeNbMesures, UnitBodeOptionsSauvegarde, DllDecl,UnitTransfertRegressi,clipbrd;

type TTableau = array[0..2000] of double;


type courbe = record
   VEeff : TTableau;
   VSeff : TTableau;
   gain  : TTableau;
   transmittance : TTableau;
   phase : TTableau;
   frequence : TTableau;
   indice_derniere_mesure : integer;
   //freq_max : double;
   //mode  : ( ch1 , ch2 , chop , XY);
   couleur1 : Tcolor;
   couleur2 : Tcolor;
   nom : string[255];
   end;


type

 (*
  * form declarations like buttons, labels displays and boxes
  *)
  TFormBodePrincipal = class(TForm)
    MainMenu1            : TMainMenu;
    Informatie1          : TMenuItem;
    GroupBoxGenerateur: TGroupBox;
    Fmin: TLabel;
    SetFmin: TEdit;
    Fmax: TLabel;
    SetFmax: TEdit;
    RadioGroupBalayage: TRadioGroup;
    lin: TRadioButton;
    log: TRadioButton;
    Amp: TLabel;
    SetGeneAmp: TEdit;
    Volt: TLabel;
    LabelDCOffset: TLabel;
    SetGeneDCOffset: TEdit;
    LabelUniteDCOffset: TLabel;
    PanelZoomVoies: TPanel;
    PaintZoomVoies: TPaintBox;
    PanelBode: TPanel;
    PaintBode: TPaintBox;
    BoutonPause: TSpeedButton;
    titre: TLabel;
    GroupBoxAffichageFreqCourante: TGroupBox;
    LabelFrequencecourante: TLabel;
    PanelVoies: TPanel;
    PaintVoies: TPaintBox;
    Rinitialiserleprogramme1: TMenuItem;
    BoutonDepart: TButton;
    ExporterdansRgressi1: TMenuItem;
    Stockage: TGroupBox;
    C1: TCheckBox;
    B1: TButton;
    Stock1: TButton;
    C2: TCheckBox;
    C3: TCheckBox;
    C4: TCheckBox;
    C5: TCheckBox;
    C6: TCheckBox;
    C7: TCheckBox;
    C8: TCheckBox;
    C9: TCheckBox;
    C10: TCheckBox;
    B2: TButton;
    B7: TButton;
    B10: TButton;
    B3: TButton;
    B4: TButton;
    B5: TButton;
    B6: TButton;
    B8: TButton;
    B9: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Affichage: TMenuItem;
    menucalibre: TMenuItem;
    ga: TMenuItem;
    ph: TMenuItem;
    ph_et_ga: TMenuItem;
    N1: TMenuItem;
    MenuOptions: TMenuItem;
    Nombresdepointsdurelev1: TMenuItem;
    menuAutocal: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Effacer: TMenuItem;
    Effacer10: TMenuItem;
    effacer5: TMenuItem;
    Calibres: TGroupBox;
    Calibre_voie1: TLabel;
    calibre_voie2: TLabel;
    SetCh1SensBox: TEdit;
    SpinSetSensCh1: TSpinButton;
    SetCh2SensBox: TEdit;
    SpinSetSensCh2: TSpinButton;
    Label3: TLabel;
    MenuTensionTRMS: TMenuItem;
    N4: TMenuItem;
    MenuTensionCrete: TMenuItem;
    ImageCabalab: TImage;
    Image2: TImage;
    Quitter1: TMenuItem;
    APropos: TMenuItem;
    N5: TMenuItem;
    Entreedufiltre: TMenuItem;
    N6: TMenuItem;
    EntreeCh1: TMenuItem;
    EntreeCh2: TMenuItem;
    Sortiedufiltre1: TMenuItem;
    SortieCh1: TMenuItem;
    SortieCh2: TMenuItem;
    EntreeCh1Diff: TMenuItem;
    EntreeCh2Diff: TMenuItem;
    EntreeCh3: TMenuItem;
    EntreeCh4: TMenuItem;
    EntreeCh3Diff: TMenuItem;
    EntreeCh4Diff: TMenuItem;
    SortieCh1Diff: TMenuItem;
    SortieCh4Diff: TMenuItem;
    SortieCh3Diff: TMenuItem;
    SortieCh2Diff: TMenuItem;
    SortieCh4: TMenuItem;
    SortieCh3: TMenuItem;
    N7: TMenuItem;
    PrintDialog1: TPrintDialog;
    Imprimer1: TMenuItem;
    N8: TMenuItem;
    GestiondesCouleurs1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure ImprimerClick(Sender: TObject);
    procedure Couleurs1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChoixVoieSortieClick(Sender: TObject);
    procedure ChoixVoieEntreeClick(Sender: TObject);


    function  ChoisirCalibre( TensionMesuree : real ) : real ;
    procedure FermetureBode(Sender: TObject);
    procedure FormClose                (Sender: TObject; var Action: TCloseAction); {closing program procedure}
    procedure Programmainformatie1Click(Sender: TObject);
    procedure AffichageVoies(Sender: TObject);
    procedure AffichageZoomVoies(Sender: TObject);
    procedure AffichageBode(Sender: TObject);
    function Tester_syntaxe:boolean;
    function Tester_syntaxe_sansmessage:boolean;
    procedure Balayer(Sender: TObject);
    procedure Regler;
    procedure Initialiser_Balayage;
    procedure MeasureButtonClick  (Sender: TObject); {procedure to start the measurement again after a stop}
    procedure FormCreate(Sender: TObject);

    procedure ReInit(Sender: TObject);
    procedure BoutonDepartClick(Sender: TObject);
    procedure APropos2Click(Sender: TObject);

    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure Stock1Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure B4Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure B6Click(Sender: TObject);
    procedure B7Click(Sender: TObject);
    procedure B8Click(Sender: TObject);
    procedure B9Click(Sender: TObject);
    procedure B10Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure PhaseGain(Sender: TObject);
    procedure menucalibreClick(Sender: TObject);
    procedure Nombresdepointsdurelev1Click(Sender: TObject);
    procedure menuAutocalClick(Sender: TObject);
    procedure EffacerClick(Sender: TObject);
    procedure SpinSetSensCh2UpClick(Sender: TObject);
    procedure SpinSetSensCh2DownClick(Sender: TObject);
    procedure SpinSetSensCh1DownClick(Sender: TObject);
    procedure SpinSetSensCh1UpClick(Sender: TObject);
    procedure MesureTension(Sender: TObject);
    procedure ImageCabalabClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Aide1Click(Sender: TObject);
    procedure Aide2Click(Sender: TObject);
    procedure Aide3Click(Sender: TObject);
    procedure Aide4Click(Sender: TObject);
    procedure Aide5Click(Sender: TObject);
    procedure Aide6Click(Sender: TObject);
    procedure Aide7Click(Sender: TObject);
    procedure TransfertRegressi(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }


  Generateur : record
     Fmin           : real;
     Fmax           : real;
     Amplitude      : real;
     DCOffset       : real;
     end;

  Balayage   : record
     Recordlength                  : word;
     PostSamples                   : word;
     frequence                     : TTableau;
     mode_balayage                 : boolean;
     mode_reglage                  : boolean;
     indice_courant                : integer;
     linearites_prises_en_compte   : boolean;
     pb_linearite                  : boolean;
     message_d_aide_jamais_affiche : boolean;
     calibre_voie1                 : double;
     calibre_voie2                 : double;

     end;

 Voies      : record
     voie1            : array[0..1000] of double;
     voie2            : array[0..1000] of double;
     calibre_voie1    : real;
     calibre_voie2    : real;
     duree_fenetre    : real;
     marge_hori       : integer;
     marge_vert       : integer;
     explication      : boolean;
     CouleurEntree     : Tcolor;
     CouleurSortie     : Tcolor;
     CouleurFond      : Tcolor;
     CouleurGrille    : Tcolor;
     end;   

                                             
  ZoomVoies  : record
     voie1            : array[0..500] of double;
     voie2            : array[0..500] of double;
     calibre_voie1    : real;
     calibre_voie2    : real;
     marge_hori       : integer;
     marge_vert       : integer;
     explication      : boolean;
     end;

  Bode      : record
     VEeff                    :TTableau;
     VSeff                    :TTableau;
     transmittance            :TTableau;
     gain                     : TTableau;
     phase                    : TTableau;
     indice_derniere_mesure   : integer;
     indice_final             : integer;
     affichage_gain           : Boolean;
     affichage_phase          : Boolean;
     affichage_calibre        : boolean;
     autocal                  : boolean;
     explication              : boolean;
     CouleurGain      : Tcolor;
     CouleurPhase     : Tcolor;
     CouleurFond      : Tcolor;
     CouleurGrille    : Tcolor;
     end;

    courbes  : array [1..10] of courbe;
    cochages : array [1..10] of TCheckBox;
    boutons  : array [1..10] of Tbutton;
    nb_courbes_stockees : integer;
    compteur_courbes_stockees : integer;
    courbe_courante : integer ;
    FermetureDemandee    : boolean;



end;




var FormBodePrincipal            : TFormBodePrincipal;
    PEntreeFiltreDoubleArray,
    PSortieFiltreDoubleArray     : PDArray ;


//const

//chemin_de_regressi  = 'C:\Progra~1\Regres~1\Regressi.exe';


implementation

uses unitcabalab, UnitAPropos, Unit_aide_Bode, Unit_aide_Bode_abscisse,
  Unit_aide_Bode_ordonnee, Unit_aide_Bode_logo, Unit_aide_Bode_Commencer,
  Unit_aide_Bode_stockage, Unit_aide_Bode_transfert, UnitBodeCouleurGraphes;

{$R *.DFM}


procedure Delay( wDelay : word );
{* DESCRIPTION
 *   Creates a delay in ms
 * INPUT
 *   wDelay   the requested delay in ms
 * OUTPUT
 *   -
 *}
var lStart : int64;
begin
  lStart := GetTickCount;
  while GetTickCount <= ( lStart + wDelay ) do
  begin
    Application.ProcessMessages;
  end; { while }
end; { Delay }

// Choix des voies

procedure TFormBodePrincipal.ChoixVoieEntreeClick(Sender: TObject);
begin
  if HS3 then
  begin
    if EntreeCh1.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch1DoubleArray ;
      PSortieFiltreDoubleArray := @Ch2DoubleArray ;
      SortieCh2.Checked := True ;
      SetTriggerSource(ltsCh1);
    end
    else
    begin
      PEntreeFiltreDoubleArray := @Ch2DoubleArray ;
      PSortieFiltreDoubleArray := @Ch1DoubleArray ;
      SortieCh1.Checked := True ;
      SetTriggerSource(ltsCh2);
    end;
  end; //HS3

  if GTI2 then
  begin
  // Fermeture des voies inutilisées pour gagner du temps sur le transfert USB
  //  on allume les voies utilisées ensuite
    SetCh1InputON(0);
    SetCh2InputON(0);
    SetCh3InputON(0);
    SetCh4InputON(0);
    if EntreeCh1.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch1DoubleArray ;
      SetCh1DiffON(0);
      SetCh1InputON(1);
      SetTriggerSource(ltsCh1);
    end;
    if EntreeCh1Diff.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch1DoubleArray ;
      SetCh1DiffON(1);
      SetCh1InputON(1);
      SetTriggerSource(ltsCh1);
    end;

    if EntreeCh2.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch2DoubleArray ;
      SetCh2DiffON(0);
      SetCh2InputON(1);
      SetTriggerSource(ltsCh2);
    end;
    if EntreeCh2Diff.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch2DoubleArray ;
      SetCh2DiffON(1);
      SetCh2InputON(1);
      SetTriggerSource(ltsCh2);
    end;

    if EntreeCh3.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch3DoubleArray ;
      SetCh3DiffON(0);
      SetCh3InputON(1);
      SetTriggerSource(ltsCh3);
    end;
    if EntreeCh3Diff.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch3DoubleArray ;
      SetCh3DiffON(1);
      SetCh3InputON(1);
      SetTriggerSource(ltsCh3);
    end;

    if EntreeCh4.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch4DoubleArray ;
      SetCh4DiffON(0);
      SetCh4InputON(1);
      SetTriggerSource(ltsCh4);
    end;
    if EntreeCh4Diff.Checked then
    begin
      PEntreeFiltreDoubleArray := @Ch4DoubleArray ;
      SetCh4DiffON(1);
      SetCh4InputON(1);
      SetTriggerSource(ltsCh4);
    end;

    // Allumage de la voie utilisée en sortie
    if (SortieCh1.checked) OR (SortieCh1Diff.checked) then
      SetCh1InputON(1);
    if (SortieCh2.checked) OR (SortieCh2Diff.checked) then
      SetCh2InputON(1);
    if (SortieCh3.checked) OR (SortieCh3Diff.checked) then
      SetCh3InputON(1);
    if (SortieCh4.checked) OR (SortieCh4Diff.checked) then
      SetCh4InputON(1);

  end;//GTI2
end;



procedure TFormBodePrincipal.ChoixVoieSortieClick(Sender: TObject);
begin
  if HS3 then
  begin
    if SortieCh1.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch1DoubleArray ;
      PEntreeFiltreDoubleArray := @Ch2DoubleArray ;
      EntreeCh2.Checked := True ;
    end
    else
    begin
      PSortieFiltreDoubleArray := @Ch2DoubleArray ;
      PEntreeFiltreDoubleArray := @Ch1DoubleArray ;
      EntreeCh1.Checked := True ;
    end;
  end; //HS3

  if GTI2 then
  begin
  // Fermeture des voies inutilisées pour gagner du temps sur le transfert USB
  //  on allume les voies utilisées ensuite
    SetCh1InputON(0);
    SetCh2InputON(0);
    SetCh3InputON(0);
    SetCh4InputON(0);
    if SortieCh1.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch1DoubleArray ;
      SetCh1DiffON(0);
      SetCh1InputON(1);
    end;
    if SortieCh1Diff.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch1DoubleArray ;
      SetCh1DiffON(1);
      SetCh1InputON(1);
    end;

    if SortieCh2.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch2DoubleArray ;
      SetCh2DiffON(0);
      SetCh2InputON(1);
    end;
    if SortieCh2Diff.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch2DoubleArray ;
      SetCh2DiffON(1);
      SetCh2InputON(1);
    end;

    if SortieCh3.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch3DoubleArray ;
      SetCh3DiffON(0);
      SetCh3InputON(1);
    end;
    if SortieCh3Diff.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch3DoubleArray ;
      SetCh3DiffON(1);
      SetCh3InputON(1);
    end;

    if SortieCh4.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch4DoubleArray ;
      SetCh4DiffON(0);
      SetCh4InputON(1);
    end;
    if SortieCh4Diff.Checked then
    begin
      PSortieFiltreDoubleArray := @Ch4DoubleArray ;
      SetCh4DiffON(1);
      SetCh4InputON(1);
    end;

    // Allumage de la voie utilisée en Entree
    if (EntreeCh1.checked) OR (EntreeCh1Diff.checked) then
      SetCh1InputON(1);
    if (EntreeCh2.checked) OR (EntreeCh2Diff.checked) then
      SetCh2InputON(1);
    if (EntreeCh3.checked) OR (EntreeCh3Diff.checked) then
      SetCh3InputON(1);
    if (EntreeCh4.checked) OR (EntreeCh4Diff.checked) then
      SetCh4InputON(1);

  end;//GTI2
end;




procedure TFormBodePrincipal.Couleurs1Click(Sender: TObject);
begin
FormBodeCouleurGraphes.visible := true ;
end;

function  TFormBodePrincipal.ChoisirCalibre( TensionMesuree : real ) : real ;
begin
  if HS3 then
  begin
    case round(1000*(TensionMesuree)) of
          0..180       : ChoisirCalibre:=0.2;
        181..360       : ChoisirCalibre:=0.4;
        361..720       : ChoisirCalibre:=0.8;
        721..1800      : ChoisirCalibre:=2;
       1801..3600      : ChoisirCalibre:=4;
       3601..7800      : ChoisirCalibre:=8;
     else
       ChoisirCalibre := 20;
     end;
  end;

    if GTI2 then
  begin
    case round(1000*(TensionMesuree)) of
          0..6000       : ChoisirCalibre:=7.5;
     else
       ChoisirCalibre := 15;
     end;
  end;
end;


procedure TFormBodePrincipal.FermetureBode(Sender: TObject);
begin
SetFuncGenOutputON(0); // éteindre GBF
passif[5]:=true;  // déclare Bode inactif
Formcabalab.SpeedButtonBode.down:=false; // relève le bouton bode de cabalab
Formcabalab.GestionButtons(sender);  // gère les boutons actifs et inactifs de cabalab
FormBodePrincipal.Visible := false;
end;

procedure TFormBodePrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
(*
 * To stop the program by al means like right corner button and "alt F4"
 * Free the library and the instrument resources
 *)
begin
FermetureDemandee := True ;

   if Balayage.mode_balayage // si le balayage est en cours
   then
   begin
   Balayage.mode_balayage := false;  // le balayage s'arretera a la fin de la frequence en cours
    // et le programme se fermera ... voir fin de la procédure Balayer
   end
   else
   begin
      if Balayage.mode_reglage  // si le programme est en mode réglage (pause sur une fréquence)
      then
      begin
      Balayage.mode_reglage := false;  // le balayage s'arretera a la fin de la frequence en cours
       // et le programme se fermera ... voir fin de la procédure Balayer
      end
      else
      begin     // si ni balayage ni réglage ne tournait :
      FermetureBode(FormBodePrincipal);
      end;
  end;



end; { TForm1.FormClose }

procedure TFormBodePrincipal.FormCreate(Sender: TObject);

begin
// au depart Entree Filtre = VOIR MENU etSortie Filtre = VOIR MENU


//ChoixVoieEntreeClick(FormBodePrincipal);
//ChoixVoieSortieClick(FormBodePrincipal);

FermetureDemandee := False;
BoutonPause.Visible := False;

BoutonDepart.Caption  := 'Commencer le balayage';
BoutonDepart.Visible  := True;
effacer   .enabled := False;
effacer5  .enabled := False;
effacer10 .enabled := False;
Calibres  .visible := False;

{ fenetres voies}
Voies.calibre_voie1 := 8 ;
Voies.calibre_voie2 := 8 ;
ZoomVoies.marge_hori:=20;
ZoomVoies.marge_vert:=20;
Voies.CouleurFond := clBlack;
Voies.CouleurGrille := clSilver ;
Voies.CouleurEntree := clAqua;
Voies.CouleurSortie := clLime;

ZoomVoies.calibre_voie1 := 20 ;
ZoomVoies.calibre_voie2 := 20 ;
ZoomVoies.explication := true;

Voies.explication := true;


Bode.indice_final           := 255  ;
Bode.indice_derniere_mesure := 0    ;
Bode.affichage_gain         := True ;
Bode.affichage_phase        := True ;
Bode.affichage_calibre      := False ;
Bode.autocal                := True ;
Bode.explication            := True ;

Bode.CouleurFond := clBlack;
Bode.CouleurGrille := clSilver ;
Bode.CouleurGain := clAqua;
Bode.CouleurPhase := clLime;


DecimalSeparator   :=   '.'  ;
FormBodePrincipal.Balayage.message_d_aide_jamais_affiche :=  true ;

// menus
Nombresdepointsdurelev1 .enabled := True;
ExporterdansRgressi1    .enabled := false;
Effacer                 .enabled := false;
effacer5                .enabled := False;
effacer10               .enabled := False;

if HS3 then
begin
// proposer seulement 2 voies
EntreeCh1Diff.Visible := false ;
EntreeCh2Diff.Visible := false ;
EntreeCh3Diff.Visible := false ;
EntreeCh4Diff.Visible := false ;
EntreeCh3.Visible     := false ;
EntreeCh4.Visible     := false ;
SortieCh1Diff.Visible := false ;
SortieCh2Diff.Visible := false ;
SortieCh3Diff.Visible := false ;
SortieCh4Diff.Visible := false ;
SortieCh3.Visible     := false ;
SortieCh4.Visible     := false ;

end;

if GTI2 then
begin
// Désactiver Offset
  LabelDCOffset.Visible := false ;
  LabelUniteDCOffset.Visible := false ;
  SetGeneDCOffset.Visible := false ;
end;



//  pour stockage des courbes
nb_courbes_stockees := 0;

  cochages[1]:=C1;
  cochages[2]:=C2;
  cochages[3]:=C3;
  cochages[4]:=C4;
  cochages[5]:=C5;
  cochages[6]:=C6;
  cochages[7]:=C7;
  cochages[8]:=C8;
  cochages[9]:=C9;
  cochages[10]:=C10;

  boutons[1]:=B1;
  boutons[2]:=B2;
  boutons[3]:=B3;
  boutons[4]:=B4;
  boutons[5]:=B5;
  boutons[6]:=B6;
  boutons[7]:=B7;
  boutons[8]:=B8;
  boutons[9]:=B9;
  boutons[10]:=B10;

end; { procedure TForm1.FormCreate }


procedure TFormBodePrincipal.BoutonDepartClick(Sender: TObject);
begin
    if Tester_syntaxe then
            begin
            {désactiver les réglages du géné et du balayage}
            lin.enabled:=false;
            log.enabled:=false;
            SetFmin.enabled:=false;
            SetFmax.enabled:=false;
            SetGeneAmp.enabled:=false;
            SetGeneDCOffset.enabled:=false;
            {Changement de bouton}
            BoutonDepart.Visible:=false;
            BoutonPause.Visible:=True;
            BoutonPause.Down:=False;
            BoutonPause.Caption := 'Suspendre'#13#10'le balayage';
            { Initialisation Balayage }
            Initialiser_Balayage;
            Balayer(FormBodePrincipal);
            end {then}
end;









procedure TFormBodePrincipal.Programmainformatie1Click(Sender: TObject);
begin

end; { TForm1.Programmainformatie1Click }





procedure TFormBodePrincipal.MeasureButtonClick (Sender:Tobject);

begin

 if BoutonPause.Down then
   begin
      if Tester_syntaxe then
        begin
          if Balayage.mode_reglage=true then
            begin
            {modification de la légende du bouton de lancement du balayage }
            BoutonPause.Caption := 'Suspendre'#13#10'le balayage';

            {désactiver les boutons de réglage du géné}
            SetGeneAmp.enabled:=false;
            SetGeneDCOffset.enabled:=false;

            Balayage.mode_reglage:=false;
            Balayer(FormBodePrincipal);
            end  {then}
          else
            begin
            {désactiver les boutons de réglage du géné}
            lin.enabled:=false;
            log.enabled:=false;
            SetFmin.enabled:=false;
            SetFmax.enabled:=false;
            SetGeneAmp.enabled:=false;
            SetGeneDCOffset.enabled:=false;

            {modification de la légende du bouton de lancement du balayage }
            BoutonPause.Caption := 'Suspendre'#13#10'le balayage';

            Balayer(FormBodePrincipal);
            end {else}
        end {if}
      else
        BoutonPause.down:=false;
   end {then}
 else
   begin
   {modification de la légende du bouton de lancement du balayage  }
   BoutonPause.Caption := 'Reprendre'#13#10'le balayage';

   Balayage.mode_balayage:=false;
   Regler;
   end; {else}

end; {procedure TForm1.MeasureButtonClick}


function TFormBodePrincipal.Tester_syntaxe:boolean;

begin
Tester_syntaxe:=true;

{ syntaxe Fmin }
     try
     Generateur.Fmin:=Strtofloat(SetFmin.text);
     except
     showmessage('Erreur de syntaxe de la fréquence min. Entrez la valeur sous la forme 1234,56');
     Tester_syntaxe:=false;
     end;

{ syntaxe  Fmax }
     try
     Generateur.Fmax:=Strtofloat(SetFmax.text);
     except
     showmessage('Erreur de syntaxe de la fréquence max. Entrez la valeur sous la forme 1234,56');
     Tester_syntaxe:=false;;
     end;

{ syntaxe Amplitude du générateur }
     try
     Generateur.Amplitude:=strtofloat(SetgeneAmp.text);
     except
     showmessage('Erreur de syntaxe de l''amplitude du générateur. Entrez la valeur sous la forme 1234,56');
     Tester_syntaxe:=false;
     end;

{ syntaxe Offset du générateur }
     try
     Generateur.DCOffset:=strtofloat(SetGeneDCOffset.text);
     except
     showmessage('Erreur de syntaxe de l''Offset du générateur. Entrez la valeur sous la forme 1234,56');
     Tester_syntaxe:=false;
     end;

{ Valeur Possible pour Fmin ? }
     if (Generateur.Fmin<0.01) or (Generateur.Fmin>2000000) then
     begin
     showmessage(' La fréquence Fmin doit être comprise entre 0,01 Hz et 2 MHz');
     Tester_syntaxe:=false;
     end;

{ Valeur Possible pour Fmax  ?}
     if (Generateur.Fmax<0.01) or (Generateur.Fmax>2000000) then
     begin
     showmessage(' La fréquence Fmax doit être comprise entre 0,01 Hz et 2 MHZ');
     Tester_syntaxe:=false;
     end;

{ Fmin < Fmax ?}
     if Generateur.Fmin>Generateur.Fmax then
     begin
     showmessage('La fréquence Fmax doit être plus grande que la fréquence Fmax !');
     Tester_syntaxe:=false;
     end;

{ Valeur Possible pour l'amplitude du générateur ? }
     if (Generateur.Amplitude<0) or (Generateur.Amplitude>12) then
     begin
     showmessage(' L''amplitude du générateur doit être comprise entre 0 et 12 V');
     Tester_syntaxe:=false;
     end {if}
     else
     begin
     { Valeur Possible pour l'offset du générateur  ?}
         if (Generateur.DCOffset-Generateur.Amplitude<-12) or (Generateur.DCOffset+Generateur.Amplitude>12) then
         begin
         showmessage(' Attention : avec les valeurs choisies pour l''amplitude et l''offset, le générateur va sortir de sa plage de fonctionnement (-12V,+12V) ');
         Tester_syntaxe:=false;
         end; {if}
     end; {else}

end; { function TForm1.Tester_syntaxe }


function TFormBodePrincipal.Tester_syntaxe_sansmessage:boolean;

begin
Tester_syntaxe_sansmessage:=true;
   if (SetgeneAmp.text<>'') and (SetGeneDCOffset.text<>'') then
   begin

   { syntaxe Amplitude du générateur }
      try
      Generateur.Amplitude:=strtofloat(SetgeneAmp.text);
      except
      Tester_syntaxe_sansmessage:=false;
      end;

   { syntaxe Offset du générateur }
      try
      Generateur.DCOffset:=strtofloat(SetGeneDCOffset.text);
      except
      Tester_syntaxe_sansmessage:=false;
      end;

  { Valeur Possible pour l'amplitude du générateur ? }
      if (Generateur.Amplitude<0) or (Generateur.Amplitude>12) then
      begin
      showmessage(' L''amplitude du générateur doit être comprise entre 0 et 12 V');
      SetgeneAmp.text:='';
      Tester_syntaxe_sansmessage:=false;
      end {if}
      else
      begin
      { Valeur Possible pour l'offset du générateur  ? }
         if (Generateur.DCOffset-Generateur.Amplitude<-12) or (Generateur.DCOffset+Generateur.Amplitude>12) then
         begin
         showmessage(' Attention : avec les valeurs choisies pour l''amplitude et l''offset, le générateur va sortir de sa plage de fonctionnement (-12V,+12V) ');
         SetGeneDCOffset.text:='';
         Tester_syntaxe_sansmessage:=false;
         end; {if}
      end; {else}
  end {then}
  else
  Tester_syntaxe_sansmessage:=false;

end; { function TForm1.Tester_syntaxe_sansmessage }


procedure TFormBodePrincipal.Initialiser_Balayage;

var  increment                           : real;
     i                                   : integer;
     calibre,calibre1                    : double;
begin


  {*******************************
  ************Réglages************
  ********************************}

{paramètres du générateur sauf la fréquence du signal émis}
   if SetFuncGenSignalType(0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de mettre le générateur en mode sinus');
   if SetFuncGenSymmetry(50)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de fixer la symétrie du signal du générateur à 50 %');

{paramètres de l'acquisition sauf la fréquence d'échantillonage }

// Source du trigger
ChoixVoieEntreeClick(FormBodePrincipal);
ChoixVoieSortieClick(FormBodePrincipal);

   if SetTriggerMode(ltkRising)<>E_NO_ERRORS then
   showmessage('Problème: Impossible d''activer le trigger sur un front montant');
   if SetTriggerLevel(1,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de régler le niveau du trigger à zéro volt');

//calibre
   calibre := ChoisirCalibre(Generateur.Amplitude);
   
calibre1:=calibre;
   if SetSensitivity(1,@calibre1)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de régler la sensibilité de la voie 1');
   if calibre<>calibre1 then
   showmessage('Problème: Impossible de régler la sensibilité désirée sur la voie 1, l''appareil a pris la valeur la plus proche possible de la requete');

{initialement le calibre de la voie 2 est le meme que celui de l'entrée }
calibre1:=calibre;
   if SetSensitivity(2,@calibre1)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de régler la sensibilité de la voie 2');
   if calibre<>calibre1 then
   showmessage('Problème: Impossible de régler la sensibilité désirée sur la voie 2, l''appareil a pris la valeur la plus proche possible de la requete');
ZoomVoies.calibre_voie1:=calibre;
ZoomVoies.calibre_voie2:=calibre;

// couplage AC DC
 if HS3
 then
 begin
   if SetCoupling(1,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de mettre la voie 1 en couplage AC');
   if SetCoupling(2,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de mettre la voie 2 en couplage AC');
 end;


{calcul et stockage des fréquences intermédiaires}
   for i:=0 to 2000 do
    Balayage.frequence[i]:=round(Generateur.Fmax);

   if (lin.checked)
   then
   begin
   increment:=(Generateur.Fmax-Generateur.Fmin)/Bode.indice_final;
      for i:=0 to Bode.indice_final do
      Balayage.frequence[i]:=round(Generateur.Fmin+increment*i);
   end  {if}
   else
   begin
   increment:=ln(Generateur.Fmax/Generateur.Fmin)/Bode.indice_final;
      for i:=0 to Bode.indice_final do
      Balayage.frequence[i]:=(exp(increment*i)*Generateur.Fmin);
   end;  {else}

{ enfin : Initialiser le balayage }

Balayage.mode_balayage:=True;
Balayage.indice_courant:=0;
Balayage.linearites_prises_en_compte:=true;
Balayage.pb_linearite:=false;
Balayage.mode_reglage:=false;


end; { procedure TForm1.Initialiser_Balayage }


procedure TFormBodePrincipal.Balayer;

var  Ch1MeanArray,Ch2MeanArray                   : array[0..5000] of double;
     Amin1,Amax1,Amin2,Amax2,Amoy1,Amoy2         : double;
///////var pour les calcul en RMS//////////////////////////////
     A1,AA1,A2,AA2,Aacdc1,Aacdc2,Aeff1,Aeff2     : double;
///////////////////////////////////////////////////////////////
     testlin1,testlin2                           : double;
     sign1,sign2                                 : shortint;
     SampleFreq                                  : dword;
     j,k,l,m,n,o,jmax                                 : integer;
     calibre,calibre1,calibre2                   : double;
     calibre_change_voie1, calibre_change_voie2  : boolean;
     moy                                         : double;
     repeat_var                                  : boolean;


begin
{--------------------------------------------------
                  initialisation
--------------------------------------------------}


// variables internes

Balayage . mode_balayage := True  ;
Balayage . pb_linearite  := False ;
Bode     . explication   := False ;

// fenetre
Nombresdepointsdurelev1 .enabled := False ;
ExporterdansRgressi1    .enabled := True  ;
FormBodePrincipal.BoutonPause.Caption := 'Suspendre'#13#10'la mesure';
FormBodePrincipal.BoutonPause.Down:=True;

//réglages du générateur
   if SetFuncGenAmplitude(Generateur.Amplitude)<>E_NO_ERRORS then
    showmessage('Problème: Impossible de fixer l''amplitude du générateur');
   if SetFuncGenDCOffset(Generateur.DCOffset)<>E_NO_ERRORS then
    showmessage('Problème: Impossible de fixer l''Offset du générateur');
   if SetFuncGenOutputOn(1)<>E_NO_ERRORS then
    showmessage('Problème: Impossible d''allumer le générateur');


 {************************************************
 *****************Boucle générale ****************
 **********répétée pour chaque fréquence**********
 ************************************************}


  REPEAT

{ Réglage de la fréquence du générateur et affichage }

   SetFuncGenFrequency(@Balayage.frequence[Balayage.indice_courant]);
   GetFuncGenFrequency(@Balayage.frequence[Balayage.indice_courant]);
      if round(Balayage.frequence[Balayage.indice_courant]) < 1000 then
       LabelFrequencecourante.caption:=floattostrF(Balayage.frequence[Balayage.indice_courant],ffGeneral,10,2)+ ' Hz'
      else
       LabelFrequencecourante.caption:=floattostrF(Balayage.frequence[Balayage.indice_courant]/1000,ffGeneral,10,2)+ ' kHz';

{ Réglage de la fréquence d'échantillonage d'acquisition et affichage }
   SampleFreq:=round( 1000 * Balayage.frequence[Balayage.indice_courant]); // calculée pour avoir 1000 points par période
      if SetSampleFrequency(@SampleFreq)<>E_NO_ERRORS then
       showmessage('Problème: Impossible de régler de la fréquence d''échantillonage');

   // correctif bug appareil au calibre 25 MHz
      if SampleFreq = 25000000 then
      begin
          if  Balayage.frequence[Balayage.indice_courant] < 45000 then
           SampleFreq := 12500000
          else
           SampleFreq:= 50000000;
       if SetSampleFrequency(@SampleFreq)<>E_NO_ERRORS then
       showmessage('Problème: Impossible de régler de la fréquence d''échantillonage');
       end;
   // fin du correctif

       Label2.caption:=floattostrF(SampleFreq/1000,ffGeneral,6,2)+ ' kHz';

{ Réglage de la durée d'échantillonage  }
   Balayage.RecordLength := trunc (2 * SampleFreq / Balayage.frequence[Balayage.indice_courant] )+1;   // calculée pour avoir 2 périodes
      if Balayage.RecordLength < 500 then
       Balayage.RecordLength := 500 ;
   Balayage.PostSamples := Balayage.RecordLength ;
// uniquement pour tiepie       // pour toujours avoir Recordlength > PostSamples dans l'instruction suivante
      if HS3 then
        if SetPostSamples(0)<>E_NO_ERRORS  then
         showmessage('Problème: impossible de fixer le nombre de postsamples');

      if SetRecordLength(Balayage.RecordLength)<>E_NO_ERRORS  then
       showmessage('Problème: impossible de fixer le nombre d''échantillons');
      if SetPostSamples(Balayage.PostSamples)<>E_NO_ERRORS  then
       showmessage('Problème: impossible de fixer le nombre de postsamples');
   //label3.Caption := (floattostr(Balayage.RecordLength) + ' ' + floattostr(Balayage.PostSamples) );

{ Réglage du time out sur 10 périodes au lieu de 1 seconde par défaut}

   if HS3 then
     SetTriggerTimeOut( round( 1000 * 10 / Balayage.frequence[Balayage.indice_courant]  ));
   if GTI2 then
   begin
     SetTriggerTimeOut(1000);
     //sleep(2000);
   end;

{ Mise à jour de la fenêtre }
   formBodePrincipal.repaint();


 // StartMeasurement(); StartMeasurement();


      if Bode.autocal then
       begin


{ ------------------------------------------------------
         Recalibrage automatique voies 1 et 2
                           et
                      Acquisition
------------------------------------------------------}

       calibre_change_voie1:=false;
       calibre_change_voie2:=false;

          repeat

           repeat_var:=true;

           // Acquisition

              Erreur := StartMeasurement(); // juste une temporisation de deux périodes
              Erreur := StartMeasurement();
              if ( Erreur = E_NO_ERRORS ) OR ( Erreur = E_NO_TRIGGER ) then    // mesure de deux périodes
               begin
               GetMeasurement( @Ch1Doublearray, @Ch2Doublearray );
                  if GetSensitivity(1,@calibre1)<>E_NO_ERRORS then
                   showmessage('Problème: Impossible de récupérer la sensibilité de la voie 1');
                  if GetSensitivity(2,@calibre2)<>E_NO_ERRORS then
                   showmessage('Problème: Impossible pour récupérer la sensibilité de la voie 2');

                  if  (calibre_change_voie1) or (calibre_change_voie2) then   // si ces 2 périodes sont les premières pour cette freq-> ne pas afficher car transitoire
                   begin
                   // affichage fenetre voies modulo 2 périodes
                   Voies.duree_fenetre:= 100/(exp(ln(10)*trunc( ln(100*Balayage.Frequence[Balayage.indice_courant]) / ln(10) )));
                      for j:=0 to ( paintVoies.width - 2 * Voies.marge_hori ) do
                       begin
                       Voies.voie1[j] := PEntreeFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                                         mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
                       Voies.voie2[j] := PSortieFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                                         mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
                       end;
                   Voies.calibre_voie1 := calibre1;
                   Voies.calibre_voie2 := calibre2;
                   Voies.explication   := false;
                   PaintVoies.Repaint;
                   // affichage fenetre zoom voies ( 1 période )
                      for j:=0 to ( PaintZoomVoies.width  - 2 * ZoomVoies.marge_hori ) do
                       begin
                       ZoomVoies.voie1[j] := PEntreeFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                              / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
                       ZoomVoies.voie2[j] := PSortieFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                              / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
                       end;
                   ZoomVoies.calibre_voie1 := calibre1;
                   ZoomVoies.calibre_voie2 := calibre2;
                   ZoomVoies.explication   := false;
                   PaintZoomVoies.Repaint;
                   end;
               end
               else // if StartMeasurement = E_NO_ERRORS
               showmessage('mesure impossible');

           // Calcul des maxi en valeur absolue voies 1 et 2 }
           Amin1:=PEntreeFiltreDoubleArray^[10];
           Amax1:=PEntreeFiltreDoubleArray^[10];
           Amin2:=PSortieFiltreDoubleArray^[10];
           Amax2:=PSortieFiltreDoubleArray^[10];
              for j:=10 to (Balayage.Recordlength-8) do
               begin
                   if PEntreeFiltreDoubleArray^[j]>Amax1 then
                    Amax1:=PEntreeFiltreDoubleArray^[j];
                   if PEntreeFiltreDoubleArray^[j]<Amin1 then
                    Amin1:=PEntreeFiltreDoubleArray^[j];
                   if PSortieFiltreDoubleArray^[j]>Amax2 then
                    Amax2:=PSortieFiltreDoubleArray^[j];
                   if PSortieFiltreDoubleArray^[j]<Amin2 then
                    Amin2:=PSortieFiltreDoubleArray^[j];
               end;  {for j:=10 to (Balayage.Recordlength-8}

           // Calcul du calibre correspondant pour la voie 1}

           calibre := ChoisirCalibre(max(abs(Amin1),abs(Amax1)));
              {case round(1000*(max(abs(Amin1),abs(Amax1)))) of
                  0..180       : calibre:=0.2;
                181..360       : calibre:=0.4;
                361..720       : calibre:=0.8;
                721..1800      : calibre:=2;
               1801..3600      : calibre:=4;
               3601..7200      : calibre:=8;
               7201..18000     : calibre:=20;
                  else           calibre:=80;   end;    }

       { est-il différent du calibre actuel ?
       si oui on change le calibre actuel et on recommence la boucle repeat
       sinon on continue le programme }

              if (calibre<>calibre1) and  ( (max(abs(Amin1),abs(Amax1))<0.85*calibre1) or (max(abs(Amin1),abs(Amax1))>0.95*calibre1) ) then
               begin
                  if SetSensitivity(1,@calibre)<>E_NO_ERRORS then
                  showmessage('Problème: Impossible de régler la sensibilité de la voie 1');
               repeat_var:=false;
               calibre_change_voie1:=true;
               end;

           // calcul du calibre correspondant pour la voie 2}
           calibre := ChoisirCalibre(max(abs(Amin2),abs(Amax2)));
              {
              case round(1000*(max(abs(Amin2),abs(Amax2)))) of
                  0..180       : calibre:=0.2;
                181..360       : calibre:=0.4;
                361..720       : calibre:=0.8;
                721..1800      : calibre:=2;
               1801..3600      : calibre:=4;
               3601..7200      : calibre:=8;
               7201..18000     : calibre:=20;
                  else           calibre:=80;  end;    }

       { est-il différent du calibre actuel ?
       si oui on change le calibre actuel et on recommence la boucle repeat
       sinon on continue le programme }

              if (calibre<>calibre2)  and  ( (max(abs(Amin2),abs(Amax2))<0.85*calibre2) or (max(abs(Amin2),abs(Amax2))>0.95*calibre2) )then
               begin
                  if SetSensitivity(2,@calibre)<>E_NO_ERRORS then
                   showmessage('Problème: Impossible de régler la sensibilité de la voie 2');
               repeat_var:=false;
               calibre_change_voie2:=true;
               end;
           Application.ProcessMessages;

          until (repeat_var) or not(Balayage.mode_balayage);

       // affichage à l'utilisateur du nouveau calibre
          if Bode.affichage_calibre then
           begin
              if calibre_change_voie1 then
                 if calibre_change_voie2 then
                  showmessage(#13#10'    Nouveau calibre Voie 1 : '+floattostr(calibre)+' V     '#13#10#13#10'    Nouveau calibre Voie 2 : '+floattostr(calibre)+' V     '#13#10)
                 else // if calibre_change_voie2
                  showmessage(#13#10'    Nouveau calibre Voie 1 : '+floattostr(calibre)+' V     '#13#10)
              else // if calibre_change_voie1
                 if calibre_change_voie2 then
                  showmessage(#13#10'    Nouveau calibre Voie 2 : '+floattostr(calibre)+' V     '#13#10);
           end; // if Bode.affichage_calibre
           
{ s'il n'y a pas eu de changements de calibres, il y a seulement eu 2 périodes mesurées ( transitoires) une nouvelle mesure s'impose}

              if not (calibre_change_voie1) and not(calibre_change_voie2) then
               begin
               // mesure de deux périodes
                  Erreur := StartMeasurement();
                  if ( Erreur = E_NO_ERRORS ) OR ( Erreur = E_NO_TRIGGER ) then    // mesure de deux périodes
                  GetMeasurement( @Ch1Doublearray, @Ch2Doublearray );

               // affichage fenetre voies modulo 2 périodes
               Voies.duree_fenetre:= 100/(exp(ln(10)*trunc( ln(100*Balayage.Frequence[Balayage.indice_courant]) / ln(10) )));
                  for j:=0 to ( paintVoies.width - 2 * Voies.marge_hori ) do
                   begin
                   Voies.voie1[j] := PEntreeFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                                     mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
                   Voies.voie2[j] := PSortieFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                                     mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
                   end;
               Voies.calibre_voie1 := calibre1;
               Voies.calibre_voie2 := calibre2;
               Voies.explication   := false;
               PaintVoies.Repaint;
               // affichage fenetre zoom voies ( 1 période )
                  for j:=0 to ( PaintZoomVoies.width  - 2 * ZoomVoies.marge_hori ) do
                   begin
                   ZoomVoies.voie1[j] := PEntreeFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                          / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
                  ZoomVoies.voie2[j] := PSortieFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                          / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
                   end;
               ZoomVoies.calibre_voie1 := calibre1;
               ZoomVoies.calibre_voie2 := calibre2;
               ZoomVoies.explication   := false;
               PaintZoomVoies.Repaint;

               end; // if not (calibre_change_voie1) and not(calibre_change_voie2)



       end //if Bode.autocal
      else //if Bode.autocal
       begin //if Bode.autocal

{ -----------------------------------------
     Recalibrage manuel voies 1 et 2
                   et
               Acquisition
-------------------------------------------}

       // Réglage calibre
       Application.ProcessMessages;
          if SetSensitivity(1,@balayage.calibre_voie1)<>E_NO_ERRORS then
           showmessage('Problème: Impossible de récupérer la sensibilité de la voie 1');
          if SetSensitivity(2,@balayage.calibre_voie2)<>E_NO_ERRORS then
           showmessage('Problème: Impossible pour récupérer la sensibilité de la voie 2');

       //  Acquisition
       StartMeasurement(); // juste une temporisation de deux périodes
        Erreur := StartMeasurement();
              if ( Erreur = E_NO_ERRORS ) OR ( Erreur = E_NO_TRIGGER ) then    // mesure de deux périodes
                 GetMeasurement( @Ch1Doublearray, @Ch2Doublearray );

       // affichage fenetre voies modulo 2 périodes
       Voies.duree_fenetre:= 100/(exp(ln(10)*trunc( ln(100*Balayage.Frequence[Balayage.indice_courant]) / ln(10) )));
            for j:=0 to ( paintVoies.width - 2 * Voies.marge_hori ) do
             begin
             Voies.voie1[j] := PEntreeFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                               mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
             Voies.voie2[j] := PSortieFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                               mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
             end;
         
         Voies.explication   := false;
         PaintVoies.Repaint;
         // affichage fenetre zoom voies ( 1 période )
            for j:=0 to ( PaintZoomVoies.width  - 2 * ZoomVoies.marge_hori ) do
             begin
             ZoomVoies.voie1[j] := PEntreeFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                    / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
            ZoomVoies.voie2[j] := PSortieFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                    / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
             end;
         ZoomVoies.calibre_voie1 := calibre1;
         ZoomVoies.calibre_voie2 := calibre2;
         ZoomVoies.explication   := false;
         PaintZoomVoies.Repaint;
         end; //if Bode.autocal


{-----------------------------------------------------------
                  Calcul du gain
                  et de la phase
                   et Affichage
-----------------------------------------------------------}

     //RQ : problème delissage trop fort dans les hautes fréquences (F.MERLE)
    // Lissage des voies 1 et 2
       for j:=16 to (Balayage.Recordlength-17) do
        begin
        moy:=0;
           for k:=-16 to 16 do
            moy:=moy+PEntreeFiltreDoubleArray^[j+k];
        Ch1meanarray[j]:= moy/33;
        end;  {for}
       for j:=16 to (Balayage.Recordlength-17) do
        begin
        moy:=0;
           for k:=-16 to 16 do
            moy:=moy+PSortieFiltreDoubleArray^[j+k];
        Ch2meanarray[j]:= moy/33;
        end; {for}

    // calcul des mini,maxi,moyennes voies 1 et 2 }
    Amin1:=Ch1meanarray[16];
    Amax1:=Ch1meanarray[16];
    Amin2:=Ch2meanarray[16];
    Amax2:=Ch2meanarray[16];
       for j:=16 to (Balayage.Recordlength-17) do
        begin
           if Ch1meanarray[j]>Amax1 then
            Amax1:=Ch1meanarray[j];
           if Ch1meanarray[j]<Amin1 then
            Amin1:=Ch1meanarray[j];
           if Ch2meanarray[j]>Amax2 then
            Amax2:=Ch2meanarray[j];
           if Ch2meanarray[j]<Amin2 then
            Amin2:=Ch2meanarray[j];
        end;  {for}
    Amoy1:=(Amax1+Amin1)/2;
    Amoy2:=(Amax2+Amin2)/2;


    // calcul du gain


 if MenuTensionTRMS.checked=false then
    begin
       if (Amax1=Amin1) or (Amax2=Amin2) then
        begin
       // showmessage('tensions mesurées trop faibles ... calculs impossibles');
        Bode.gain[Balayage.indice_courant] := -80 ;
        end
       else
        begin
        Bode.gain[Balayage.indice_courant]:=20*ln((Amax2-Amin2)/(Amax1-Amin1))/ln(10);
        Bode.transmittance[Balayage.indice_courant]:=((Amax2-Amin2)/(Amax1-Amin1));
        Bode.VEeff[Balayage.indice_courant]:=Amax1;
        Bode.VSeff[Balayage.indice_courant]:=Amax2;

        end;
    end;


 ///////////////////Calcul des valeurs efficaces AC vrai RMS////////////////////
 //                             Aeff1 et Aeff2                                //
 ///////////////////////////////////////////////////////////////////////////////

if MenuTensionTRMS.checked=true then
    begin
         A1  :=0;
         AA1 :=0;
         A2  :=0;
         AA2 :=0;

        // for j:=0 to Balayage.Recordlength do
       //  Samplefreq / Balayage.Frequence[Balayage.indice_courant]
         jmax:=round(Samplefreq / Balayage.Frequence[Balayage.indice_courant]);

           for j:=0 to round(Samplefreq / Balayage.Frequence[Balayage.indice_courant]) do
          begin
            A1:=A1+PEntreeFiltreDoubleArray^[j];
            A2:=A2+PSortieFiltreDoubleArray^[j];
            AA1:=AA1+(PEntreeFiltreDoubleArray^[j]*PEntreeFiltreDoubleArray^[j]);
            AA2:=AA2+(PSortieFiltreDoubleArray^[j]*PSortieFiltreDoubleArray^[j]);
          end;

          Amoy1:=A1/jmax;
          Amoy2:=A2/jmax;
          Aacdc1:=sqrt(AA1/jmax);
          Aacdc2:=sqrt(AA2/jmax);
          Aeff1:=sqrt(Aacdc1*Aacdc1 -  Amoy1*Amoy1);
          Aeff2:=sqrt(Aacdc2*Aacdc2 -  Amoy2*Amoy2);


    // calcul du gain avec aeff1 et aeff2
       if (Amax1=Amin1) or (Amax2=Amin2) then
        begin
     //   showmessage('tensions mesurées trop faibles ... calculs impossibles');
        Bode.gain[Balayage.indice_courant] := -80 ;
        end
       else
        begin
        Bode.gain[Balayage.indice_courant]:=20*ln((Aeff2)/(Aeff1))/ln(10);
        Bode.transmittance[Balayage.indice_courant]:=((Aeff2)/(Aeff1));
        Bode.VEeff[Balayage.indice_courant]:=Aeff1;
        Bode.VSeff[Balayage.indice_courant]:=Aeff2;
        end;
   end;


 //////////////////////////////////////////////////////////////////////////////////




    // calcul de la phase et détection de non linéarité
    j:=100;
    testlin1:=0;
    testlin2:=0;
       if (Ch1meanarray[100]-Amoy1)>0 then
        sign1:=1
       else
        sign1:=-1;
       repeat
        j:=j+1;
       until (((Ch1meanarray[j]-Amoy1)*sign1)<0) or (j>(Balayage.Recordlength-20)); {premier passage par zéro voie 1 : valeur l}
    l:=j;
    j:=j+5;
       repeat
        j:=j+1;
        testlin1:=testlin1+(Amoy1-Ch1meanarray[j])*sign1;
       until (((Ch1meanarray[j]-Amoy1)*sign1)>0) or (j>(Balayage.Recordlength-19)); {second passage par zéro voie 1 : valeur m}
    m:=j;
    j:=j+5;
       repeat
        j:=j+1;
        testlin1:=testlin1-(Amoy1-Ch1meanarray[j])*sign1;
       until (((Ch1meanarray[j]-Amoy1)*sign1)<0) or (j>(Balayage.Recordlength-18)); {troisième passage par zéro voie 1 : valeur j}
       if (Amax1=Amoy1) then
        Balayage.pb_linearite:=true
       else
        begin
        testlin1:=pi*testlin1/((Amax1-Amoy1)*(j-l)*2);
           if testlin1>1 then
            testlin1:=1/testlin1;
        // forme sinusoidale parfaite pour testlin1 = 1
           if testlin1 < 0.8  then
            Balayage.pb_linearite:=true;
        end;
    k:=100;
       if (Ch2meanarray[100]-Amoy2)>0 then
        sign2:=1
       else
        sign2:=-1;
       repeat
        k:=k+1;
       until (((Ch2meanarray[k]-Amoy2)*sign2)<0) or (k>(Balayage.Recordlength-20)); {premier passage par zéro voie 2 : valeur n }
    n:=k;
    k:=k+5;
       repeat
        k:=k+1;
        testlin2:=testlin2+(Amoy2-Ch2meanarray[k])*sign2;
       until (((Ch2meanarray[k]-Amoy2)*sign2)>0) or (k>(Balayage.Recordlength-19));  {second passage par zéro voie 2 : valeur o }
    o:=k;
    k:=k+5;
       repeat
        k:=k+1;
        testlin2:=testlin2-(Amoy2-Ch2meanarray[k])*sign2;
       until (((Ch2meanarray[k]-Amoy2)*sign2)<0) or (k>(Balayage.Recordlength-18));  {troisième passage par zéro voie 2 : valeur k}

       if (Amax2=Amoy2) then
        Balayage.pb_linearite:=true
       else
        begin
        testlin2:=pi*testlin2/((Amax2-Amoy2)*(k-n)*2);
           if testlin2>1 then
            testlin2:=1/testlin2;
        //forme sinusoidale parfaite pour testlin2 = 1
           if testlin2 < 0.8  then
            Balayage.pb_linearite:=true;
        end;

    Bode.phase[Balayage.indice_courant]:=-pi*(n-l)/(m-l);
       if sign1<>sign2 then
        Bode.phase[Balayage.indice_courant]:=Bode.phase[Balayage.indice_courant]+pi;
       if Bode.phase[Balayage.indice_courant]>pi then
           repeat
            Bode.phase[Balayage.indice_courant]:=Bode.phase[Balayage.indice_courant]-(2*pi);
           until Bode.phase[Balayage.indice_courant]<pi;
       if Bode.phase[Balayage.indice_courant]<-pi then
           repeat
            Bode.phase[Balayage.indice_courant]:=Bode.phase[Balayage.indice_courant]+(2*pi);
           until Bode.phase[Balayage.indice_courant]>-pi;
    //showmessage('sign1'+inttostr(sign1)+'sign2'+inttostr(sign2)+'changement de polarité voie 1 a l''échantillon :'+inttostr(j)+'voie 2 à l''échantillon'+inttostr(k)+'phase :'+floattoStr(Bode.phase[i]));



    //affichage diagramme de Bode
    Bode.indice_derniere_mesure:=Balayage.indice_courant;
    PaintBode.Repaint;

{-----------------------------------------------------------
                  fin de la boucle

            gestion
            de la non linéarité
            de l'incrémentation de la fréquence
            de la sortie de la boucle
-----------------------------------------------------------}

    // non linéarité
       if (Balayage.pb_linearite) and (Balayage.linearites_prises_en_compte) and (Balayage.mode_balayage) then
        begin
           if testlin1<0.8 then
              if testlin2<0.8 then
               FormBodeLinearite.Label1.caption:='Fréquence '+floattostrF(Balayage.frequence[Balayage.indice_courant],ffGeneral,4,2)+ ' Hz : Une non-linearité est apparue sur les deux voies'
              else
               FormBodeLinearite.Label1.caption:='Fréquence '+floattostrF(Balayage.frequence[Balayage.indice_courant],ffGeneral,4,2)+ ' Hz : Une non-linearité est apparue sur la voie 1'
           else
            FormBodeLinearite.Label1.caption:='Fréquence '+floattostrF(Balayage.frequence[Balayage.indice_courant],ffGeneral,4,2)+ ' Hz : Une non-linearité est apparue sur la voie 2';
            FormBodeLinearite.Visible := True;
        end
       // incrémentation de la fréquence
       else
        Balayage.indice_courant:=Balayage.indice_courant+1;

    // Actions si le balayage est terminé
       if (Balayage.indice_courant=Bode.indice_final+1) then
        begin
        SetFuncGenOutputOn(0);
        Balayage.mode_balayage:=false;
        //modification de la légende du bouton de lancement du balayage         BoutonPause.Visible:=False;
        BoutonDepart.visible:=True;
        // menus
        Nombresdepointsdurelev1 .enabled := True  ;
        Effacer                 .enabled := False ;
        effacer5                .enabled := False ;
        effacer10               .enabled := False ;
        //activer les  réglages du géné
        lin             .enabled := true  ;
        log             .enabled := true  ;
        SetFmin         .enabled := true  ;
        SetFmax         .enabled := true  ;
        SetGeneAmp      .enabled := true  ;
        SetGeneDCOffset .enabled := true  ;
        Effacer         .enabled := false ;
        effacer5        .enabled := False ;
        effacer10       .enabled := False ;
        FormBodePrincipal.Refresh;
        end;
    Application.ProcessMessages;

   until not(Balayage.mode_balayage) or ( Balayage.pb_linearite and Balayage.linearites_prises_en_compte);

   if FermetureDemandee then   // Si l'utilisateur a voulu fermer la fenetre:
   begin
   FermetureBode(FormBodePrincipal); // on peut fermer bode maintenant que le balayage est interompu

   // Gestion de la reprise possible de Bode après fermeture/réouverture
   //  Si Bode est relancé plus tard, le balayage ne reprend pas mais peut etre
   // repris en appuyant sur reprendre le balayage
      if Balayage.indice_courant < Bode.indice_final+1 then //si bode non terminé
      begin
      BoutonPause.Caption := 'Reprendre'#13#10'le balayage';
      BoutonPause.down:=false;  //autoriser la reprise du balayage
      end;
   end;





end; { TForm1.BoutonPauseClick }


procedure TFormBodePrincipal.Regler;
var  Amin1,Amax1,Amin2,Amax2,Amoy1              : double;
    j,k,l,m                                     : integer;
    sign1                                       : shortint;
    calibre,calibre1,calibre2                   : double;
    calibre_change_voie1, calibre_change_voie2  : boolean;
    moy                                         : double;
    repeat_var                                  : boolean;
    SampleFreq                                  : dword;

begin

{------------------------------------------
          Initialisation
-------------------------------------------}

// Paramètres internes
SampleFreq:=GetSampleFrequency();

// Fenetre
FormBodePrincipal.BoutonPause.Caption := 'Continuer'#13#10'le balayage';
FormBodePrincipal.BoutonPause.Down:=false;
SetGeneAmp      .enabled       := true ;
SetGeneDCOffset .enabled       := true ;
Balayage        .mode_reglage  := true ;

   if  Balayage.indice_courant > 1  then
    effacer   .enabled       := true ;
   if Balayage.indice_courant > 5  then
    effacer5 .enabled        := true ;
   if Balayage.indice_courant > 10  then
    effacer10 .enabled       := true ;

 {if (Form1.Balayage.message_d_aide_jamais_affiche) then
      begin
      showmessage('Vous pouvez modifier l''amplitude ou l''Offset du générateur, recommencer les mesures précédentes (menu Options), choisir entre autocalibration ou mode manuel (menu Options) avant de poursuivre le balayage.');
      Form1.Balayage.message_d_aide_jamais_affiche:=false;
      end; }

 {************************************************
 *****************Boucle générale ****************
 *****répétée jusqu'à sortie de l'utilisateur*****
 ************************************************}

   repeat

    // réglage du générateur
       if Tester_syntaxe_sansmessage  then
        begin
           if SetFuncGenAmplitude(Generateur.Amplitude)<>E_NO_ERRORS then
            showmessage('Problème: Impossible de fixer l''amplitude du générateur');
           if SetFuncGenDCOffset(Generateur.DCOffset)<>E_NO_ERRORS then
            showmessage('Problème: Impossible de fixer l''Offset du générateur');
           if SetFuncGenOutputON(1)<>E_NO_ERRORS then
            showmessage('Problème: Impossible d''allumer le générateur');
        end;


       if Bode.autocal then
        begin

{ ------------------------------------------------------
         Recalibrage automatique voies 1 et 2
                           et
                      Acquisition
------------------------------------------------------}
           repeat
            repeat_var:=true;

            // Acquisition
              Erreur := StartMeasurement();
              if ( Erreur = E_NO_ERRORS ) OR ( Erreur = E_NO_TRIGGER ) then    // mesure de deux périodes
               GetMeasurement( @Ch1Doublearray, @Ch2Doublearray );
              if GetSensitivity(1,@calibre1)<>E_NO_ERRORS then
               showmessage('Problème: Impossible de récupérer la sensibilité de la voie 1');
              if GetSensitivity(2,@calibre2)<>E_NO_ERRORS then
               showmessage('Problème: Impossible pour récupérer la sensibilité de la voie 2');

            // affichage fenetre voies modulo 2 périodes
            Voies.duree_fenetre:= 100/(exp(ln(10)*trunc( ln(100*Balayage.Frequence[Balayage.indice_courant]) / ln(10) )));
               for j:=0 to ( paintVoies.width - 2 * Voies.marge_hori ) do
                begin
                Voies.voie1[j] := PEntreeFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                                  mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
                Voies.voie2[j] := PSortieFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                                  mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
                end;
            Voies.calibre_voie1 := calibre1;
            Voies.calibre_voie2 := calibre2;
            Voies.explication   := false;
            PaintVoies.Repaint;
            // affichage fenetre zoom voies ( 1 période )
               for j:=0 to ( PaintZoomVoies.width  - 2 * ZoomVoies.marge_hori ) do
                begin
                ZoomVoies.voie1[j] := PEntreeFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                       / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
               ZoomVoies.voie2[j] := PSortieFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                       / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
                end;
            ZoomVoies.calibre_voie1 := calibre1;
            ZoomVoies.calibre_voie2 := calibre2;
            ZoomVoies.explication   := false;
            PaintZoomVoies.Repaint;

            //calcul des maxi en valeur absolue voies 1 et 2
            Amin1:=PEntreeFiltreDoubleArray^[10];
            Amax1:=PEntreeFiltreDoubleArray^[10];
            Amin2:=PSortieFiltreDoubleArray^[10];
            Amax2:=PSortieFiltreDoubleArray^[10];
               for j:=10 to (Balayage.Recordlength-10) do
                begin
                   if PEntreeFiltreDoubleArray^[j]>Amax1 then
                    Amax1:=PEntreeFiltreDoubleArray^[j];
                   if PEntreeFiltreDoubleArray^[j]<Amin1 then
                    Amin1:=PEntreeFiltreDoubleArray^[j];
                   if PSortieFiltreDoubleArray^[j]>Amax2 then
                    Amax2:=PSortieFiltreDoubleArray^[j];
                   if PSortieFiltreDoubleArray^[j]<Amin2 then
                    Amin2:=PSortieFiltreDoubleArray^[j];
                end;  {for}

            //calcul du calibre correspondant pour la voie 1}

            calibre := ChoisirCalibre(max(abs(Amin1),abs(Amax1)));
              {
               case round(1000*(max(abs(Amin1),abs(Amax1)))) of
                   0..180       : calibre:=0.2;
                 181..360       : calibre:=0.4;
                 361..720       : calibre:=0.8;
                 721..1800      : calibre:=2;
                1801..3600      : calibre:=4;
                3601..7200      : calibre:=8;
                7201..18000     : calibre:=20;
                   else           calibre:=80;  end;    }

      { est-il différent du calibre actuel ?
      si oui on change le calibre actuel et on recommence la boucle repeat
      sinon on continue le programme }

               if GetSensitivity(1,@calibre1)<>E_NO_ERRORS then
                showmessage('Problème: Impossible de récupérer la sensibilité de la voie 1');
               if (calibre<>calibre1) and  ( (max(abs(Amin1),abs(Amax1))<0.85*calibre1) or (max(abs(Amin1),abs(Amax1))>0.95*calibre1) ) then
                begin
                   if SetSensitivity(1,@calibre)<>E_NO_ERRORS then
                    showmessage('Problème: Impossible de régler la sensibilité de la voie 1');
                repeat_var:=false;
                end;

      { calcul du calibre correspondant}
      calibre := ChoisirCalibre(max(abs(Amin2),abs(Amax2)));
              {
               case round(1000*(max(abs(Amin2),abs(Amax2)))) of
                   0..180       : calibre:=0.2;
                 181..360       : calibre:=0.4;
                 361..720       : calibre:=0.8;
                 721..1800      : calibre:=2;
                1801..3600      : calibre:=4;
                3601..7200      : calibre:=8;
                7201..18000     : calibre:=20;
                   else           calibre:=80;  end;  }

      { est-il différent du calibre actuel ?
      si oui on change le calibre actuel et on recommence la boucle repeat
      sinon on continue le programme }

               if GetSensitivity(2,@calibre2)<>E_NO_ERRORS then
                showmessage('Problème: Impossible pour récupérer la sensibilité de la voie 2');
               if (calibre<>calibre2)  and  ( (max(abs(Amin2),abs(Amax2))<0.85*calibre2) or (max(abs(Amin2),abs(Amax2))>0.95*calibre2) )then
                begin
                   if SetSensitivity(2,@calibre)<>E_NO_ERRORS then
                    showmessage('Problème: Impossible de régler la sensibilité de la voie 2');
                repeat_var:=false;
                end;
            Application.ProcessMessages;

           until (repeat_var) or not (Balayage.mode_reglage);

        end // if Bode.autocal
       else // if Bode.autocal
        begin

{ -----------------------------------------
     Recalibrage manuel voies 1 et 2
                   et
               Acquisition
-------------------------------------------}

        // Réglage calibre
        Application.ProcessMessages;
         if SetSensitivity(1,@balayage.calibre_voie1)<>E_NO_ERRORS then
          showmessage('Problème: Impossible de récupérer la sensibilité de la voie 1');
         if SetSensitivity(2,@balayage.calibre_voie2)<>E_NO_ERRORS then
          showmessage('Problème: Impossible pour récupérer la sensibilité de la voie 2');

        // Acquisition
           Erreur := StartMeasurement();
              if ( Erreur = E_NO_ERRORS ) OR ( Erreur = E_NO_TRIGGER ) then    // mesure de deux périodes
               GetMeasurement( @Ch1Doublearray, @Ch2Doublearray );

        // affichage fenetre voies modulo 2 périodes
        Voies.duree_fenetre:= 100/(exp(ln(10)*trunc( ln(100*Balayage.Frequence[Balayage.indice_courant]) / ln(10) )));
           for j:=0 to ( paintVoies.width - 2 * Voies.marge_hori ) do
            begin
            Voies.voie1[j] := PEntreeFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                               mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
            Voies.voie2[j] := PSortieFiltreDoubleArray^ [  round ((  j * SampleFreq * Voies.duree_fenetre / ( PaintVoies.width - 2 * Voies.marge_hori )  ))
                               mod round ( 2 * SampleFreq / Balayage.Frequence[Balayage.indice_courant])  ] ;
            end;
        Voies.calibre_voie1 := calibre1;
        Voies.calibre_voie2 := calibre2;
        Voies.explication   := false;
        PaintVoies.Repaint;
        // affichage fenetre zoom voies ( 1 période )
           for j:=0 to ( PaintZoomVoies.width  - 2 * ZoomVoies.marge_hori ) do
            begin
            ZoomVoies.voie1[j] := PEntreeFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                   / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
           ZoomVoies.voie2[j] := PSortieFiltreDoubleArray^ [  round (( j * ( Samplefreq / Balayage.Frequence[Balayage.indice_courant] )
                                   / (PaintZoomVoies.width - 2 * ZoomVoies.marge_hori) ))  ] ;
            end;
        ZoomVoies.calibre_voie1 := calibre1;
        ZoomVoies.calibre_voie2 := calibre2;
        ZoomVoies.explication   := false;
        PaintZoomVoies.Repaint;

        end; // if Bode.autocal

    Application.ProcessMessages;
   until  not (Balayage.mode_reglage);

   if FermetureDemandee then   // Si l'utilisateur a voulu fermer la fenetre:
   begin
   FermetureBode(FormBodePrincipal); // on peut fermer bode maintenant que le balayage est interompu

   Balayage.mode_reglage := true; // si jamais l'utilisateur relance bode plus tard le mode reglage sera activé tout seul.

   end;


end; { procedure Tform1.Regler }


procedure TFormBodePrincipal.AffichageZoomVoies(Sender: TObject);

var inc1, inc2                                   : Word;
    scale                                        : double;


begin



{ effacage }

PaintZoomVoies.Canvas.Brush.Color := Voies.CouleurFond;
PaintZoomVoies.Canvas.Rectangle( 0 , 0 , PaintZoomVoies.Width - 1 , PaintZoomVoies.Height - 1 );

if ZoomVoies.explication then
begin
PaintZoomVoies.Canvas.Font.Color   := clWhite;
PaintZoomVoies.Canvas.TextOut(Round( PaintZoomVoies.Width/2 - Canvas.TextWidth('Zoom des voies 1 et 2')/2 ) , Round (PaintZoomVoies.Height/2-20- Canvas.TextHeight('Zoom des voies 1 et 2') /2),      'Zoom des voies 1 et 2');
PaintZoomVoies.Canvas.TextOut(Round( PaintZoomVoies.Width/2 - Canvas.TextWidth('sur une période')/2 ) , Round (PaintZoomVoies.Height/2- Canvas.TextHeight('Zoom des voies 1 et 2') /2),      'sur une période' );
PaintZoomVoies.Canvas.TextOut(Round( PaintZoomVoies.Width/2 - Canvas.TextWidth('pour vérifier leur allure')/2 ) , Round (PaintZoomVoies.Height/2+ 20 - Canvas.TextHeight('Zoom des voies 1 et 2') /2), 'pour vérifier leur allure' );
end
else
begin

PaintVoies.Canvas.Pen.Color   := clSilver;

{ cadre }
PaintZoomVoies.Canvas.Pen.Color := Voies.CouleurGrille;
PaintZoomVoies.Canvas.MoveTo(         ZoomVoies.marge_hori            ,       ZoomVoies.marge_vert            );
PaintZoomVoies.Canvas.LineTo(         ZoomVoies.marge_hori            ,PaintZoomVoies.Height-ZoomVoies.marge_vert );
PaintZoomVoies.Canvas.LineTo( PaintZoomVoies.Width - ZoomVoies.marge_hori ,PaintZoomVoies.Height-ZoomVoies.marge_vert );
PaintZoomVoies.Canvas.LineTo( PaintZoomVoies.Width - ZoomVoies.marge_hori ,       ZoomVoies.marge_vert            );
PaintZoomVoies.Canvas.LineTo(         ZoomVoies.marge_hori            ,       ZoomVoies.marge_vert            );

{ légendes }
PaintZoomVoies.Canvas.Font.Color := clSilver;
PaintZoomVoies.Canvas.TextOut( Round( PaintZoomVoies.Width/2 - Canvas.TextWidth('Zoom sur une période')/2 ) , round(( ZoomVoies.marge_vert - Canvas.TextHeight('Zoom sur une période') )/2) , 'Zoom sur une période');




{ graduations horizontales }

  for inc1:=1 to (PaintZoomvoies.width - 2 * ZoomVoies.marge_hori)  div 10 do
         for inc2:= 1 to 3 do
              PaintZoomVoies.Canvas.Pixels[round(ZoomVoies.marge_hori + inc1*(PaintZoomVoies.width - 2 * ZoomVoies.marge_hori)/(  (PaintZoomvoies.width - 2 * ZoomVoies.marge_hori)  div 10) )  , round( inc2 * (PaintZoomvoies.Height - 2 * ZoomVoies.marge_vert) div 4 + ZoomVoies.marge_vert)]:= clSilver ;


   

{ affichage voie 1 }
PaintZoomVoies.Canvas.Pen.Color := Voies.CouleurEntree;
scale := ZoomVoies.calibre_voie1;
inc2 :=  Round(ZoomVoies.marge_vert +  (((ZoomVoies.voie1[0]) / -scale ) * ((PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert ) / 2)) + (PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert ) / 2);
PaintZoomVoies.Canvas.MoveTo(ZoomVoies.marge_hori, inc2);


      for inc1 := 0 to ( PaintZoomVoies.width  - 2 * ZoomVoies.marge_hori ) do
      begin
      inc2 := Round( ZoomVoies.marge_vert +  (((ZoomVoies.voie1[inc1]) / -scale ) * ((PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert ) / 2)) + (PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert ) / 2);
      PaintZoomVoies.Canvas.LineTo(ZoomVoies.marge_hori + inc1, inc2);
      end; {for}

{ affichage voie 2 }

   scale := ZoomVoies.calibre_voie2;
   PaintZoomVoies.Canvas.Pen.Color := Voies.CouleurSortie;
   inc2 :=  Round(ZoomVoies.marge_vert +  (((ZoomVoies.voie2[0]) / -scale ) * ((PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert ) / 2)) + (PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert ) / 2);
   PaintZoomVoies.Canvas.MoveTo(ZoomVoies.marge_hori, inc2);
      for inc1 := 0 to PaintZoomVoies.width - 2 * ZoomVoies.marge_hori do
      begin
      inc2 := Round(ZoomVoies.marge_vert + ((ZoomVoies.voie2[inc1] / -scale) * ((PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert )/ 2 )) + (PaintZoomVoies.Height - 2 * ZoomVoies.marge_vert) / 2);
      PaintZoomVoies.Canvas.LineTo(ZoomVoies.marge_hori + inc1, inc2)
      end; {for}
  
end; {else}

end; {procedure AffichageZoomVoies}


procedure TFormBodePrincipal.AffichageVoies(Sender: TObject);

var     inc1, inc2                                   : Word;
        scale                                        : double;
        echelle_temp0, echelle_temp1, echelle_temp2,
        echelle_temp3, echelle_temp4                 : shortstring;
        labels                                       :array [0..5] of string;

begin
Voies.marge_hori:=50;
Voies.marge_vert:=30;

{ effacage }

PaintVoies.Canvas.Brush.Color := Voies.CouleurFond;
PaintVoies.Canvas.Rectangle( 0 , 0 , PaintVoies.Width - 1 , PaintVoies.Height - 1 );


if Voies.explication then
begin
PaintVoies.Canvas.Font.Color   := Voies.CouleurGrille ;
PaintVoies.Canvas.TextOut(Round( PaintVoies.Width/2 - Canvas.TextWidth('Affichage des voies 1 et 2 en fonction du temps')/2 ) , Round (PaintVoies.Height/2-20- Canvas.TextHeight('Affichage des voies 1 et 2 en fonction du temps') /2),   'Affichage des voies 1 et 2 en fonction du temps');
PaintVoies.Canvas.TextOut(Round( PaintVoies.Width/2 - Canvas.TextWidth('la voie 1 est reliée à l''entrée du filtre et à la sortie du générateur')/2 ) , Round (PaintVoies.Height/2- Canvas.TextHeight('la voie 1 est reliée à l''entrée du filtre') /2),      'la voie 1 est reliée à l''entrée du filtre et à la sortie du générateur' );
PaintVoies.Canvas.TextOut(Round( PaintVoies.Width/2 - Canvas.TextWidth('la voie 2 est reliée à la sortie du filtre')/2 ) , Round (PaintVoies.Height/2+ 20 - Canvas.TextHeight('la voie 2 est reliée à la sortie du filtre') /2), 'la voie 2 est reliée à la sortie du filtre' );
end
else
begin

{ cadre }
PaintVoies.Canvas.Pen.Color := Voies.CouleurGrille ;
PaintVoies.Canvas.MoveTo(         Voies.marge_hori            ,       Voies.marge_vert            );
PaintVoies.Canvas.LineTo(         Voies.marge_hori            ,PaintVoies.Height-Voies.marge_vert );
PaintVoies.Canvas.LineTo( PaintVoies.Width - Voies.marge_hori ,PaintVoies.Height-Voies.marge_vert );
PaintVoies.Canvas.LineTo( PaintVoies.Width - Voies.marge_hori ,       Voies.marge_vert            );
PaintVoies.Canvas.LineTo(         Voies.marge_hori            ,       Voies.marge_vert            );

{ graduations horizontales }

  for inc1:=1 to (Paintvoies.width - 2 * Voies.marge_hori)  div 10 do
         for inc2:= 1 to 3 do
              Paintvoies.Canvas.Pixels[round( Voies.marge_hori + inc1*(Paintvoies.width - 2 * Voies.marge_hori)/((Paintvoies.width - 2 * Voies.marge_hori)  div 10) )  , round( inc2 * (Paintvoies.Height - 2 * Voies.marge_vert) div 4 + Voies.marge_vert)]:= Voies.CouleurGrille ;

{ légendes }
PaintVoies.Canvas.Font.Color := Voies.CouleurEntree;
PaintVoies.Canvas.TextOut(Voies.marge_hori + 10 , round(( Voies.marge_vert - Canvas.TextHeight('Entrée du filtre : Voie 1') )/2) , 'Entrée du filtre : Voie 1');
PaintVoies.Canvas.Font.Color := Voies.CouleurSortie;
PaintVoies.Canvas.TextOut(PaintVoies.Width - Voies.marge_hori - Canvas.TextWidth('Phase en radians')- 10, round(( Voies.marge_vert - Canvas.TextHeight('Sortie du filtre : Voie 2') )/2) , 'Sortie du filtre : Voie 2');

{  légendes horizontales }

PaintVoies.Canvas.Font.Color := Voies.CouleurGrille ;
 case round( ln( Voies.duree_fenetre ) / ln( 10 ) ) of
    -6 : begin
           Labels[0] := '0 ns';Labels[1] := '250 ns';Labels[2] := '500 ns';Labels[3] := '750 ns';Labels[4] := '1 µs';
         end;
    -5 : begin
           Labels[0] := '0 µs';Labels[1] := '2,5 µs';Labels[2] := '5 µs';Labels[3] := '7,5 µs';Labels[4] := '10 µs';
         end;
    -4 : begin
           Labels[0] := '0 µs';Labels[1] := '25 µs';Labels[2] := '50 µs';Labels[3] := '75 µs';Labels[4] := '100 µs';
         end;
    -3 : begin
           Labels[0] := '0 µs';Labels[1] := '250 µs';Labels[2] := '500 µs';Labels[3] := '750 µs';Labels[4] := '1 ms';
         end;
    -2 : begin
           Labels[0] := '0 ms';Labels[1] := '2,5 ms';Labels[2] := '5 ms';Labels[3] := '7,5 ms';Labels[4] := '10 ms';
         end;
    -1 : begin
           Labels[0] := '0 ms';Labels[1] := '25 ms';Labels[2] := '50 ms';Labels[3] := '75 ms';Labels[4] := '100 ms';
         end;
     0 : begin
           Labels[0] := '0 ms';Labels[1] := '250 ms';Labels[2] := '500 ms';Labels[3] := '750 ms';Labels[4] := '1 s';
         end;
     1 : begin
           Labels[0] := '0 s';Labels[1] := '2,5 s';Labels[2] := '5 s';Labels[3] := '7,5 s';Labels[4] := '10 s';
         end;
     2 : begin
           Labels[0] := '0 s';Labels[1] := '25 s';Labels[2] := '50 s';Labels[3] := '75 s';Labels[4] := '100 s';
         end;
  end; { case }

  for inc1 := 0 to 4 do
  begin
    PaintVoies.Canvas.TextOut( round( Voies.marge_hori + inc1 * ( PaintVoies.Width - 2 * Voies.marge_hori ) / 4 - Canvas.TextWidth( Labels[inc1] ) / 2 ),
                               PaintVoies.Height - Voies.marge_vert + 5,
                               Labels[inc1]
                             );
  end; { for }
{  légendes }

  Labels[0] := '+' + FloatToStrF( Voies.calibre_voie1,     ffGeneral, 1, 0 ) + ' V ';
  Labels[1] := '+' + FloatToStrF( Voies.calibre_voie1 / 2, ffGeneral, 1, 0 ) + ' V ';
  Labels[2] := '0 V ';
  Labels[3] := '-' + FloatToStrF( Voies.calibre_voie1 / 2, ffGeneral, 1, 0 ) + ' V ';
  Labels[4] := '-' + FloatToStrF( Voies.calibre_voie1,     ffGeneral, 1, 0 ) + ' V ';

  PaintVoies.Canvas.Font.Color := Voies.CouleurEntree ;

  for inc1 := 0 to 4 do
  begin
    PaintVoies.Canvas.TextOut( Voies.marge_hori - Canvas.TextWidth( Labels[inc1] ) - 1,
                               round( Voies.marge_vert + inc1 * ( PaintVoies.Height - 2 * Voies.marge_vert ) / 4 - Canvas.TextHeight( Labels[inc1] ) / 2 ),
                               Labels[inc1]
                             );
  end;

  Labels[0] := ' +' + FloatToStrF( Voies.calibre_voie2,     ffGeneral, 1, 0 ) + ' V';
  Labels[1] := ' +' + FloatToStrF( Voies.calibre_voie2 / 2, ffGeneral, 1, 0 ) + ' V';
  Labels[2] := '  0 V';
  Labels[3] := ' -' + FloatToStrF( Voies.calibre_voie2 / 2, ffGeneral, 1, 0 ) + ' V';
  Labels[4] := ' -' + FloatToStrF( Voies.calibre_voie2,     ffGeneral, 1, 0 ) + ' V';

  PaintVoies.Canvas.Font.Color := Voies.CouleurSortie;

  for inc1 := 0 to 4 do
  begin
    PaintVoies.Canvas.TextOut( PaintVoies.width - Voies.marge_hori + 1,
                               round( Voies.marge_vert + inc1 * ( PaintVoies.Height - 2 * Voies.marge_vert ) / 4 - Canvas.TextHeight( Labels[inc1] ) / 2 ),
                               Labels[inc1]
                             );
  end;


{traits pointillés verticaux }


  for inc1:=1 to (Paintvoies.height - 2 * Voies.marge_vert)  div 10 do
         for inc2:= 1 to 3 do
              Paintvoies.Canvas.Pixels[ round( inc2 * (Paintvoies.width - 2 * Voies.marge_hori) div 4 + Voies.marge_hori) , round( Voies.marge_vert + inc1*(Paintvoies.height - 2 * Voies.marge_vert)/((Paintvoies.height - 2 * Voies.marge_vert)  div 10) ) ]:= Voies.CouleurGrille ;



{ affichage voie 1 }
PaintVoies.Canvas.Pen.Color := Voies.CouleurEntree ;
scale := Voies.calibre_voie1;
inc2 :=  Round(Voies.marge_vert +  (((Voies.voie1[0]) / -scale ) * ((PaintVoies.Height - 2 * Voies.marge_vert ) / 2)) + (PaintVoies.Height - 2 * Voies.marge_vert ) / 2);
PaintVoies.Canvas.MoveTo(Voies.marge_hori, inc2);

      for inc1 := 0 to (PaintVoies.width  - 2 * Voies.marge_hori ) do
      begin
      inc2 := Round( Voies.marge_vert +  (((Voies.voie1[inc1]) / -scale ) * ((PaintVoies.Height - 2 * Voies.marge_vert ) / 2)) + (PaintVoies.Height - 2 * Voies.marge_vert ) / 2);
      PaintVoies.Canvas.LineTo(Voies.marge_hori + inc1, inc2);
      end; {for}


{ affichage voie 2 }
   scale := Voies.calibre_voie2;
   PaintVoies.Canvas.Pen.Color := Voies.CouleurSortie;
   inc2 :=  Round(Voies.marge_vert +  (((Voies.voie2[0]) / -scale ) * ((PaintVoies.Height - 2 * Voies.marge_vert ) / 2)) + (PaintVoies.Height - 2 * Voies.marge_vert ) / 2);
   PaintVoies.Canvas.MoveTo(Voies.marge_hori, inc2);
      for inc1 := 0 to (PaintVoies.width - 2 * Voies.marge_hori ) do
      begin
      inc2 := Round(Voies.marge_vert + ((Voies.voie2[inc1] / -scale) * ((PaintVoies.Height - 2 * Voies.marge_vert )/ 2 )) + (PaintVoies.Height - 2 * Voies.marge_vert) / 2);
      PaintVoies.Canvas.LineTo(Voies.marge_hori + inc1, inc2)
      end; {for}



end; {else}

end; {procedure AffichageVoies}


procedure TFormBodePrincipal.AffichageBode(Sender: TObject);

var wIndex, wCurrentY : Word;
  //  rSens             : double;
    i                 : integer;
const marge_hori = 50 ;
      marge_vert = 30 ;
      decalage_gain = 20;          // temporairement échelle
      echelle_gain=60;             //    +40/- 60 dB
      echelle_phase=3.24;          //  échelle +pi/-pi

begin


{effacage}

   PaintBode.Canvas.Brush.Color := Bode.CouleurFond ;
   PaintBode.Canvas.Rectangle(0, 0, Paintbode.Width - 1, Paintbode.Height - 1);

{légende du graphique }
 if Bode.explication then
begin
PaintBode.Canvas.Font.Color   := Bode.CouleurGrille ;
PaintBode.Canvas.TextOut(Round( PaintBode.Width/2 - Canvas.TextWidth('Affichage du diagramme de Bode')/2 ) , Round (PaintBode.Height/2-20- Canvas.TextHeight('Affichage du diagramme de Bode') /2),   'Affichage du diagramme de Bode');
//PaintBode.Canvas.TextOut(Round( PaintBode.Width/2 - Canvas.TextWidth('au fur et à mesure des mesures')/2 ) , Round (PaintBode.Height/2- Canvas.TextHeight('la voie 1 est reliée à l''entrée du filtre') /2),      'la voie 1 est reliée à l''entrée du filtre' );
//PaintBode.Canvas.TextOut(Round( PaintVBode.Width/2 - Canvas.TextWidth('la voie 2 est reliée à la sortie du filtre')/2 ) , Round (PaintBode.Height/2+ 20 - Canvas.TextHeight('la voie 2 est reliée à la sortie du filtre') /2), 'la voie 2 est reliée à la sortie du filtre' );
end
else
begin

   {cadre}
   Paintbode.Canvas.Pen.Color := Bode.CouleurGrille ;
   Paintbode.Canvas.MoveTo(marge_hori,marge_vert);
   Paintbode.Canvas.lineto(marge_hori,Paintbode.Height-marge_vert);
   Paintbode.Canvas.lineto(Paintbode.Width - marge_hori,Paintbode.Height-marge_vert);
   Paintbode.Canvas.lineto(Paintbode.Width - marge_hori,marge_vert);
   Paintbode.Canvas.lineto(marge_hori,marge_vert);

   {légendes}
   Paintbode.Canvas.Font.Color := Bode.CouleurGain ;
   if (Bode.Affichage_gain) then
   Paintbode.Canvas.TextOut(marge_hori + 10 , round(( marge_vert - Canvas.TextHeight('Gain en décibels') )/2) , 'Gain en décibels');
   Paintbode.Canvas.Font.Color := Bode.CouleurPhase ;
    if (Bode.Affichage_phase) then
    Paintbode.Canvas.TextOut(Paintbode.Width - marge_hori - Canvas.TextWidth('Phase en radians')- 10, round(( marge_vert - Canvas.TextHeight('Phase en radians') )/2) , 'Phase en radians');

   {graduations horizontales}

  for wIndex:=1 to (Paintbode.width - 2 * marge_hori)  div 10 do
         for wCurrentY:= 1 to 5 do
              PaintBode.Canvas.Pixels[round( marge_hori + wIndex*(Paintbode.width - 2 * marge_hori)/((Paintbode.width - 2 * marge_hori)  div 10) )  , round( wCurrentY * (Paintbode.Height - 2 * marge_vert) div 6 + marge_vert)]:= Bode.CouleurGrille ;

  {labels ordonnée }
  if (Bode.Affichage_gain) then
   begin
   Paintbode.Canvas.Font.Color :=Bode.CouleurGain ;
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('40 dB')-5,round(marge_vert-Canvas.TextHeight('40 dB')/2),'40 dB');
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('20 dB')-5,round(marge_vert + (Paintbode.Height - 2 * marge_vert)/6 - Canvas.TextHeight('20 dB')/2),'20 dB');
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('0 dB')-5,round(marge_vert + 2*(Paintbode.Height - 2 * marge_vert)/6 - Canvas.TextHeight('0 dB')/2),'0 dB');
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('-20 dB')-5,round(marge_vert + 3*(Paintbode.Height - 2 * marge_vert)/6 - Canvas.TextHeight('-20 dB')/2),'-20 dB');
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('-40 dB')-5 ,round(marge_vert + 4*(Paintbode.Height - 2 * marge_vert)/6 - Canvas.TextHeight('-40 dB')/2),'-40 dB');
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('-60 dB')-5 ,round(marge_vert + 5*(Paintbode.Height - 2 * marge_vert)/6 - Canvas.TextHeight('-60 dB')/2),'-60 dB');
   Paintbode.Canvas.TextOut(marge_hori-Canvas.TextWidth('-80 dB')-5 ,round(marge_vert + 6*(Paintbode.Height - 2 * marge_vert)/6 - Canvas.TextHeight('-80 dB')/2),'-80 dB');
   end;
  if (Bode.Affichage_phase) then
   begin
   Paintbode.Canvas.Font.Color :=Bode.CouleurPhase;
   Paintbode.Canvas.TextOut(Paintbode.width - marge_hori+ 5 ,round(marge_vert-Canvas.TextHeight('pi')/2),'pi');
   Paintbode.Canvas.TextOut(Paintbode.width - marge_hori +5 ,round(marge_vert + (Paintbode.Height - 2 * marge_vert)/4 - Canvas.TextHeight('pi/2')/2),'pi/2');
   Paintbode.Canvas.TextOut(Paintbode.width - marge_hori +5 ,round(marge_vert + 2*(Paintbode.Height - 2 * marge_vert)/4 - Canvas.TextHeight('0')/2),'0');
   Paintbode.Canvas.TextOut(Paintbode.width - marge_hori +5 ,round(marge_vert + 3*(Paintbode.Height - 2 * marge_vert)/4 - Canvas.TextHeight('-pi/2')/2),'-pi/2');
   Paintbode.Canvas.TextOut(Paintbode.width - marge_hori +5 ,round(marge_vert + 4*(Paintbode.Height - 2 * marge_vert)/4 - Canvas.TextHeight('-pi')/2),'-pi');
   end;

   {labels et graduations abscisse :  1 Hz, 10 Hz, 100 Hz, 1kHz ... visibles}

   Paintbode.Canvas.Font.Color :=Bode.CouleurGrille;

   if (log.checked)
   then
   begin
try
      for wIndex:=trunc(ln(Balayage.frequence[0])/ln(10)+0.99) to trunc(ln(Balayage.frequence[Bode.indice_final])/ln(10)+0.01) do
      begin
         for wcurrentY:=1 to (Paintbode.Height- 2 * marge_vert) div 10  do
         begin
         Paintbode.Canvas.Pixels[round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) ),round(marge_vert + wcurrentY*(Paintbode.Height- 2 * marge_vert)/((Paintbode.Height- 2 * marge_vert) div 10))] := Bode.CouleurGrille;
         end;

         case round(wIndex) of
         -3 : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('1 mHz')/2),Paintbode.Height - marge_vert +5,'1 mHz');
         -2 : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('10 mHz')/2),Paintbode.Height - marge_vert +5,'10 mHz');
         -1 : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('100 mHz')/2),Paintbode.Height - marge_vert +5,'100 mHz');
         0  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('1 Hz')/2),Paintbode.Height - marge_vert +5,'1 Hz');
         1  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('10 Hz')/2),Paintbode.Height - marge_vert +5,'10 Hz');
         2  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('100 Hz')/2),Paintbode.Height - marge_vert +5,'100 Hz');
         3  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('1 kHz')/2),Paintbode.Height - marge_vert +5,'1 kHz');
         4  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('10 kHz')/2),Paintbode.Height - marge_vert +5,'10 kHz');
         5  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('100 kHz')/2),Paintbode.Height - marge_vert +5,'100 kHz');
         6  : Paintbode.Canvas.TextOut(round( marge_hori + (Paintbode.Width -2 * marge_hori) * (wIndex*ln(10)-ln(Balayage.frequence[0])) / (ln(Balayage.frequence[Bode.indice_final])-ln(Balayage.frequence[0])) -Canvas.TextWidth('1 MHz')/2),Paintbode.Height - marge_vert +5,'1 MHz');
         end;
      end;
except
end;
   end
   else
   begin

// A FAIRE !!!

   end;


// Affichage diagrammes stockés

   if nb_courbes_stockees <> 0 then
   begin
      for i :=1 to nb_courbes_stockees do
      begin

       if (cochages[i].checked) then
       begin

{         Paintbode.Canvas.Pen.Color :=courbes[i].couleur1;
         Paintbode.Canvas.MoveTo(0, Round(  courbes[i].gain[ 0 ] * (Paintbode.Height/2) / Calibre1 + (Paintbode.Height/2) ) + round (scrollbar1.position* PaintBode.Height/10) );

             for Curseur_Abscisse := 1 to min(Sender.Width - 1,round((Paintbode.Width-1)*Freq_ech_actuelle/courbes[i].freq_ech)) do
             begin
             Curseur_Ordonnee := Round(  - courbes[i].voie1[ round( (Curseur_Abscisse * Longueur_Acquisition / Sender.Width)*courbes[i].freq_ech/Freq_ech_actuelle ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
             Paintbode.Canvas.LineTo(round(Curseur_Abscisse), Curseur_Ordonnee + round (scrollbar1.position* Sender.Height/10));
             end;


          Paintbode.Canvas.Pen.Color :=courbes[i].couleur2;
          Paintbode.Canvas.MoveTo(0, Round(  courbes[i].voie2[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ) + round (scrollbar2.position* Sender.Height/10)  );
{affichage phase stockée}
if (Bode.Affichage_phase) then
begin

   Paintbode.Canvas.Pen.Color :=courbes[i].couleur2 ;

   wCurrentY := Round(marge_vert + ((courbes[i].phase[0] / -echelle_phase) * ((Paintbode.Height - 2 * marge_vert )/ 2 )) + (Paintbode.Height - 2 * marge_vert) / 2);
  Paintbode.Canvas.MoveTo(marge_hori, wCurrentY);

         for wIndex := 0 to courbes[i].indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert + ((courbes[i].phase[wIndex] / -echelle_phase) * ((Paintbode.Height - 2 * marge_vert )/ 2 )) + (Paintbode.Height - 2 * marge_vert) / 2);
         Paintbode.Canvas.Pixels[marge_hori + round(wIndex*(Paintbode.Width - 2 * marge_hori)/Bode.indice_final), wCurrentY] := clLime;
         end;
         for wIndex := 1 to courbes[i].indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert + ((courbes[i].phase[wIndex] / -echelle_phase) * ((Paintbode.Height - 2 * marge_vert )/ 2 )) + (Paintbode.Height - 2 * marge_vert) / 2);
            if ( (Bode.Phase[wIndex]>-2) and  (Bode.Phase[wIndex]<2)  ) or
               ( (Bode.Phase[wIndex]>2)  and (Bode.Phase[wIndex-1]>0) ) or
               ( (Bode.Phase[wIndex]<-2) and (Bode.Phase[wIndex-1]<0) )
            then
            Paintbode.Canvas.LineTo(round( marge_hori + wIndex*(Paintbode.Width- 2 * marge_hori)/Bode.indice_final), wCurrentY)
            else
            Paintbode.Canvas.MoveTo(round(marge_hori + wIndex*(Paintbode.Width- 2 * marge_hori)/Bode.indice_final), wCurrentY);
         end;

end;
{affichage gain stocké }
if (Bode.Affichage_gain) then
begin

 Paintbode.Canvas.Pen.Color := courbes[i].couleur1 ;

   wCurrentY :=  Round(marge_vert +  (((courbes[i].gain[0] + decalage_gain ) / -echelle_gain ) * ((Paintbode.Height - 2 * marge_vert ) / 2)) + (Paintbode.Height - 2 * marge_vert ) / 2);;
   Paintbode.Canvas.MoveTo(marge_hori, wCurrentY);

         for wIndex := 0 to courbes[i].indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert +  (((courbes[i].gain[wIndex] + decalage_gain ) / -echelle_gain ) * ((Paintbode.Height - 2 * marge_vert ) / 2)) + (Paintbode.Height - 2 * marge_vert ) / 2);
         Paintbode.Canvas.LineTo(marge_hori + round(wIndex*(Paintbode.Width- 2 * marge_hori)/Bode.indice_final), wCurrentY);
         end; { for }



       end; {then}
      end; {for }
  end;

end;

   {affichage phase courante}
if (Bode.Affichage_phase) then
begin
   Paintbode.Canvas.Pen.Color := Bode.CouleurPhase;
   wCurrentY := Round(marge_vert + ((Bode.phase[0] / -echelle_phase) * ((Paintbode.Height - 2 * marge_vert )/ 2 )) + (Paintbode.Height - 2 * marge_vert) / 2);
   Paintbode.Canvas.MoveTo(marge_hori, wCurrentY);

         for wIndex := 0 to Bode.indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert + ((Bode.phase[wIndex] / -echelle_phase) * ((Paintbode.Height - 2 * marge_vert )/ 2 )) + (Paintbode.Height - 2 * marge_vert) / 2);
         Paintbode.Canvas.Pixels[marge_hori + round(wIndex*(Paintbode.Width - 2 * marge_hori)/Bode.indice_final), wCurrentY] := Bode.CouleurPhase ;
         end;
         for wIndex := 1 to Bode.indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert + ((Bode.phase[wIndex] / -echelle_phase) * ((Paintbode.Height - 2 * marge_vert )/ 2 )) + (Paintbode.Height - 2 * marge_vert) / 2);
            if ( (Bode.Phase[wIndex]>-2) and  (Bode.Phase[wIndex]<2)  ) or
               ( (Bode.Phase[wIndex]>2)  and (Bode.Phase[wIndex-1]>0) ) or
               ( (Bode.Phase[wIndex]<-2) and (Bode.Phase[wIndex-1]<0) )
            then
            Paintbode.Canvas.LineTo(round( marge_hori + wIndex*(Paintbode.Width- 2 * marge_hori)/Bode.indice_final), wCurrentY)
            else
            Paintbode.Canvas.MoveTo(round(marge_hori + wIndex*(Paintbode.Width- 2 * marge_hori)/Bode.indice_final), wCurrentY);
         end;

end;
   {affichage gain courant }
if (Bode.Affichage_gain) then
begin

   Paintbode.Canvas.Pen.Color := Bode.CouleurGain ;
   wCurrentY :=  Round(marge_vert +  (((Bode.gain[0] + decalage_gain ) / - echelle_gain ) * ((Paintbode.Height - 2 * marge_vert ) / 2)) + (Paintbode.Height - 2 * marge_vert ) / 2);;
   Paintbode.Canvas.MoveTo(marge_hori, wCurrentY);

         for wIndex := 0 to Bode.indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert +  (((Bode.gain[wIndex] + decalage_gain ) / -echelle_gain ) * ((Paintbode.Height - 2 * marge_vert ) / 2)) + (Paintbode.Height - 2 * marge_vert ) / 2);
         Paintbode.Canvas.LineTo(marge_hori + round(wIndex*(Paintbode.Width- 2 * marge_hori)/Bode.indice_final), wCurrentY);
         end; { for }
end;
   end; {if}

end; { procedure TForm1.AffichageBode }







procedure TFormBodePrincipal.TransfertRegressi(Sender: TObject);
var i,j : integer;
    ligne : string;
const
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';

begin
  FormTransfertRegressi.Donnees := TstringList.create;
  With FormTransfertRegressi.Donnees do
  begin

// Transfert du diagramme en cours
    Clear;
    Add('Cabalab');
    if HS3 then Add('Appareil utilisé : TiePie HS3');
    if GTI2 then Add('Appareil utilisé : Orphy GTI2');
    Add('Diagramme de Bode'); // 3ème = Titre de page

    // Ajout Grandeurs
    ligne := 'f';
    ligne :=ligne +crTab+'G';
    ligne :=ligne +crTab+'phi';
///    ligne :=ligne +crTab+'Ve';
///    ligne :=ligne +crTab+'Vs';
    Add(ligne);

    // Ajout Unités
    ligne := 'Hz';
    ligne :=ligne +crTab+'dB';
    ligne :=ligne +crTab+'rad';
///    ligne :=ligne +crTab+'V';
///    ligne :=ligne +crTab+'V';
    Add(ligne);

    // Ajout Données
    for i:=0 to Bode.indice_derniere_mesure do
    begin
      ligne :=FloatToStr(Balayage.frequence[i]);
      ligne :=ligne +crTab+FloatToStr(Bode.gain[i]);
      ligne :=ligne +crTab+FloatToStr(Bode.phase[i]);
///      ligne :=ligne +crTab+FloatToStr(Bode.VeEff[i]);
///      ligne :=ligne +crTab+FloatToStr(Bode.VsEff[i]);
      Add(ligne);
    end;

    // Ajout Option echelle horizontale en log
    Add(symbReg2+'2 LOGX');
    Add('1');
    Add('1');

    ClipBoard.AsText := FormTransfertRegressi.Donnees.text;

    FormTransfertRegressi.Execute('CLIP|LOAD');   // charge les données en tant que nouveau fichier

// Transfert des diagramme stockés
    if (nb_courbes_stockees<>0) then
    begin
      for j:=1 to nb_courbes_stockees do
      begin
        sleep(FormTransfertRegressi.TemporisationEntreDeuxEnvoisDeDonneesVersRegressi); // sinon bug : manque des pages dans regressi
        Clear;
        Add('Cabalab');
        if HS3 then Add('Appareil utilisé : TiePie HS3');
        if GTI2 then Add('Appareil utilisé : Orphy GTI2');
        Add( courbes[j].nom );    // 3ème = Titre de page

         // Ajout Grandeurs
        ligne := 'f';
        ligne :=ligne +crTab+'G';
        ligne :=ligne +crTab+'phi';
///    ligne :=ligne +crTab+'Ve';
///    ligne :=ligne +crTab+'Vs';
        Add(ligne);

        // Ajout Unités
        ligne := 'Hz';
        ligne :=ligne +crTab+'dB';
        ligne :=ligne +crTab+'rad';
///    ligne :=ligne +crTab+'V';
///    ligne :=ligne +crTab+'V';
        Add(ligne);

        // Ajout Données

        for i:=0 to courbes[j].indice_derniere_mesure do
        begin
          ligne :=FloatToStr(courbes[j].frequence[i]);
          ligne :=ligne +crTab+FloatToStr(courbes[j].gain[i]);
          ligne :=ligne +crTab+FloatToStr(courbes[j].phase[i]);
    ///      ligne :=ligne +crTab+FloatToStr(courbes[j].VeEff[i]);
    ///      ligne :=ligne +crTab+FloatToStr(courbes[j].VsEff[i]);
          Add(ligne);
        end;

        // Ajout Option echelle horizontale en log
        Add(symbReg2+'2 LOGX');
        Add('1');
        Add('1');

        ClipBoard.AsText := FormTransfertRegressi.Donnees.text;

        FormTransfertRegressi.Execute('ClIP|ADD'); // charge les données en ajoutant une nouvelle page
      end;  // for j:=1 to nb_courbes_stockees do
    end; // if (nb_courbes_stockees<>0) then
  Free;
  end; //  With FormTransfertRegressi.Donnees do
end;

procedure TFormBodePrincipal.ReInit(Sender: TObject);
begin

// éteindre le géné
SetFuncGenOutputOn(0);

{modification de la légende du bouton de lancement du balayage  }
BoutonPause.Visible:=False;
BoutonDepart.visible:=True;

// activer les  réglages du géné
lin.enabled:=true;
log.enabled:=true;
SetFmin.enabled:=true;
SetFmax.enabled:=true;
SetGeneAmp.enabled:=true;
SetGeneDCOffset.enabled:=true;

// menus
Nombresdepointsdurelev1 .enabled := True;

ExporterdansRgressi1    .enabled := false;
Effacer                 .enabled := false;
effacer5                .enabled := False;
effacer10               .enabled := False;

// fenetres
FormBodeOptions   .visible := False ;
FormBodeLinearite .visible := False ;

// paramètres du programme
Balayage.linearites_prises_en_compte:=true;
Balayage.pb_linearite:=false;
Balayage.mode_balayage:=false;
Balayage.mode_reglage:=false;
Balayage.indice_courant:=0;
Bode.indice_derniere_mesure:=0;


LabelFrequencecourante.caption:='';
ZoomVoies.explication := true;
Voies.explication := true;

FormBodePrincipal.Repaint;
AffichageBode(paintbode);
AffichageVoies(PaintVoies);
AffichageZoomVoies(PaintZoomVoies);



end;



procedure TFormBodePrincipal.APropos2Click(Sender: TObject);
begin
FormApropos.Visible := true ;
FormApropos.BringToFront;
end;








procedure TFormBodePrincipal.Stock1Click(Sender: TObject);
begin

if ( nb_courbes_stockees < 10 ) then

  begin

   nb_courbes_stockees := nb_courbes_stockees + 1 ;
   compteur_courbes_stockees :=  compteur_courbes_stockees + 1 ;

{stockage de la courbe }
   courbes [nb_courbes_stockees].VEeff             := Bode.VEeff;
   courbes [nb_courbes_stockees].VSeff             := Bode.VSeff;
   courbes [nb_courbes_stockees].gain              := Bode.gain;
   courbes [nb_courbes_stockees].transmittance     := Bode.transmittance;
   courbes [nb_courbes_stockees].phase    := Bode.Phase;
   courbes [nb_courbes_stockees].frequence:= Balayage.frequence;
   courbes [nb_courbes_stockees].indice_derniere_mesure := Bode.indice_derniere_mesure;
   courbes [nb_courbes_stockees].couleur1 := clBlue;
   courbes [nb_courbes_stockees].couleur2 := clRed;
  // courbes [nb_courbes_stockees].freq_ech:= GetSampleFrequency;


  courbes [nb_courbes_stockees].nom  := 'diagramme' + inttostr( compteur_courbes_stockees ) ;


{Affichage du bouton}
   cochages[nb_courbes_stockees].Visible  := True;
   cochages[nb_courbes_stockees].Caption  := courbes [nb_courbes_stockees].nom ;
   cochages[nb_courbes_stockees].Checked  := True;
   boutons [nb_courbes_stockees].Visible  := True;
  
   end
else
   begin
   showmessage('Vous ne pouvez stocker plus de 10 courbes');
   end;

end;



procedure TFormBodePrincipal.B1Click(Sender: TObject);
begin
courbe_courante := 1;

FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B2Click(Sender: TObject);
begin
courbe_courante := 2;

FormBodeOptions.visible := true;
end;
procedure TFormBodePrincipal.B3Click(Sender: TObject);
begin
courbe_courante := 3;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B4Click(Sender: TObject);
begin
courbe_courante := 4;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B5Click(Sender: TObject);
begin
courbe_courante := 5;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B6Click(Sender: TObject);
begin
courbe_courante := 6;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B7Click(Sender: TObject);
begin
courbe_courante := 7;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B8Click(Sender: TObject);
begin
courbe_courante := 8;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B9Click(Sender: TObject);
begin
courbe_courante := 9;
FormBodeOptions.visible := true;
end;

procedure TFormBodePrincipal.B10Click(Sender: TObject);
begin
courbe_courante := 10;
FormBodeOptions.visible := true;
end;


procedure TFormBodePrincipal.C1Click(Sender: TObject);
begin
AffichageBode(PaintBode);
end;

procedure TFormBodePrincipal.PhaseGain(Sender: TObject);
begin
ph_et_ga.checked := false;
ph.checked       := false;
ga.checked       := false;

   if ( Sender = ph_et_ga ) then
   begin
   Bode.Affichage_Gain   := true;
   Bode.Affichage_Phase  := true;
   ph_et_ga.checked      := true;
   end
   else
      if ( Sender = ph ) then
      begin
      Bode.Affichage_Gain   := false;
      Bode.Affichage_Phase  := true;
      ph.checked            := true;
      end
      else
         if ( Sender = ga ) then
         begin
         Bode.Affichage_Gain   := true;
         Bode.Affichage_Phase  := false;
         ga.checked            := true;
         end;

AffichageBode(PaintBode);



end;

procedure TFormBodePrincipal.menucalibreClick(Sender: TObject);
begin
  if menucalibre.checked then
   begin
   menucalibre.checked    := False;
   Bode.affichage_calibre := False;
   end
  else
   begin
   menucalibre.checked    := True;
   Bode.affichage_calibre := True;
   end;


end;

procedure TFormBodePrincipal.Nombresdepointsdurelev1Click(Sender: TObject);
begin
FormBodeNbMesures.nb_pts_bode .Text:= inttostr(Bode.indice_final+1);
FormBodeNbMesures.visible:=true;


end;

procedure TFormBodePrincipal.menuAutocalClick(Sender: TObject);


begin
    if menuAutocal.checked then
   begin
   menuAutocal .checked := False ;
   Bode        .autocal := False ;
   Calibres    .Visible := True  ;
   GetSensitivity( lCh1, @Balayage.calibre_voie1);
   SetCh1SensBox.Text := FloatToStr( Balayage.calibre_voie1 ) + ' V';
   GetSensitivity( lCh2, @Balayage.calibre_voie2);
   SetCh2SensBox.Text := FloatToStr( Balayage.calibre_voie2 ) + ' V';
   end
  else
   begin
   menuAutocal .checked := True  ;
   Bode        .autocal := True  ;
   Calibres    .Visible := False ;
   end;

end;

procedure TFormBodePrincipal.EffacerClick(Sender: TObject);
var
    SampleFreq      : dword;
begin
   if (Sender=Effacer) then
      if Balayage.indice_courant <> 0  then
      begin
      Balayage .indice_courant := Balayage.indice_courant - 1 ;
               if Balayage.indice_courant <> 0 then
               Bode .indice_derniere_mesure   := Balayage.indice_courant - 1 ;


      end;
   if (Sender=Effacer5) then
      if Balayage.indice_courant > 5  then
      begin
      Balayage .indice_courant := Balayage.indice_courant - 5 ;
               if Balayage.indice_courant <> 0 then
               Bode .indice_derniere_mesure   := Balayage.indice_courant - 1
               else
               Bode .indice_derniere_mesure   := 0;


      end;
   if (Sender=Effacer10) then
      if Balayage.indice_courant > 10  then
      begin
      Balayage .indice_courant := Balayage.indice_courant - 10 ;
               if Balayage.indice_courant <> 0 then
               Bode .indice_derniere_mesure   := Balayage.indice_courant - 1
               else
               Bode .indice_derniere_mesure   := 0;


      end;

{réglage de la fréquence  du géné et   Affichage }
      SetFuncGenFrequency(@Balayage.frequence[Balayage.indice_courant]);

     if round(Balayage.frequence[Balayage.indice_courant]) < 1000 then
     LabelFrequencecourante.caption:=floattostrF(Balayage.frequence[Balayage.indice_courant],ffGeneral,4,2)+ ' Hz'
     else
     LabelFrequencecourante.caption:=floattostrF(Balayage.frequence[Balayage.indice_courant]/1000,ffGeneral,4,2)+ ' kHz';

   { Réglage de la fréquence d'échantillonage et affichage }
   SampleFreq:=round( (Balayage.Recordlength/2) * Balayage.frequence[Balayage.indice_courant]);
      if SetSampleFrequency(@SampleFreq)<>E_NO_ERRORS then
      showmessage('Problème: Impossible de régler la fréquence d''échantillonage');

   Label2.caption:=floattostrF(SampleFreq/1000,ffGeneral,4,2)+ ' kHz';

   formBodePrincipal.repaint();
  PaintBode.Repaint;

end;


procedure TFormBodePrincipal.SpinSetSensCh1UpClick(Sender: TObject);
begin

  if balayage.calibre_voie1-0.1 < 1e-5 then balayage.calibre_voie1 := 0.2 else
  if balayage.calibre_voie1-0.2 < 1e-5 then balayage.calibre_voie1 := 0.4 else
  if balayage.calibre_voie1-0.4 < 1e-5 then balayage.calibre_voie1 := 0.8 else
  if balayage.calibre_voie1-0.8 < 1e-5 then balayage.calibre_voie1 := 2   else
  if balayage.calibre_voie1-2   < 1e-5 then balayage.calibre_voie1 := 4   else
  if balayage.calibre_voie1-4   < 1e-5 then balayage.calibre_voie1 := 8   else
  if balayage.calibre_voie1-8   < 1e-5 then balayage.calibre_voie1 := 20  else
  if balayage.calibre_voie1-20  < 1e-5 then balayage.calibre_voie1 := 80;

SetCh1SensBox.Text := floattostr(balayage.calibre_voie1) + ' V';

end; { TForm1.SpinSetSensChUpClick }



procedure TFormBodePrincipal.SpinSetSensCh2DownClick(Sender: TObject);
begin

  if balayage.calibre_voie2-0.2 < 1e-5 then balayage.calibre_voie2 := 0.1 else
  if balayage.calibre_voie2-0.4 < 1e-5 then balayage.calibre_voie2 := 0.2 else
  if balayage.calibre_voie2-0.8 < 1e-5 then balayage.calibre_voie2 := 0.4 else
  if balayage.calibre_voie2-2   < 1e-5 then balayage.calibre_voie2 := 0.8 else
  if balayage.calibre_voie2-4   < 1e-5 then balayage.calibre_voie2 := 2   else
  if balayage.calibre_voie2-8   < 1e-5 then balayage.calibre_voie2 := 4   else
  if balayage.calibre_voie2-20  < 1e-5 then balayage.calibre_voie2 := 8   else
  if balayage.calibre_voie2-80  < 1e-5 then balayage.calibre_voie2 := 20;

SetCh2SensBox.Text := floattostr(balayage.calibre_voie2) + ' V';

end;



procedure TFormBodePrincipal.SpinSetSensCh1DownClick(Sender: TObject);
begin

  if balayage.calibre_voie1-0.2 < 1e-5 then balayage.calibre_voie1 := 0.1 else
  if balayage.calibre_voie1-0.4 < 1e-5 then balayage.calibre_voie1 := 0.2 else
  if balayage.calibre_voie1-0.8 < 1e-5 then balayage.calibre_voie1 := 0.4 else
  if balayage.calibre_voie1-2   < 1e-5 then balayage.calibre_voie1 := 0.8 else
  if balayage.calibre_voie1-4   < 1e-5 then balayage.calibre_voie1 := 2   else
  if balayage.calibre_voie1-8   < 1e-5 then balayage.calibre_voie1 := 4   else
  if balayage.calibre_voie1-20  < 1e-5 then balayage.calibre_voie1 := 8   else
  if balayage.calibre_voie1-80  < 1e-5 then balayage.calibre_voie1 := 20;

SetCh1SensBox.Text := floattostr(balayage.calibre_voie1) + ' V';

end;

procedure TFormBodePrincipal.SpinSetSensCh2UpClick(Sender: TObject);
begin

  if balayage.calibre_voie2-0.1 < 1e-5 then balayage.calibre_voie2 := 0.2 else
  if balayage.calibre_voie2-0.2 < 1e-5 then balayage.calibre_voie2 := 0.4 else
  if balayage.calibre_voie2-0.4 < 1e-5 then balayage.calibre_voie2 := 0.8 else
  if balayage.calibre_voie2-0.8 < 1e-5 then balayage.calibre_voie2 := 2   else
  if balayage.calibre_voie2-2   < 1e-5 then balayage.calibre_voie2 := 4   else
  if balayage.calibre_voie2-4   < 1e-5 then balayage.calibre_voie2 := 8   else
  if balayage.calibre_voie2-8   < 1e-5 then balayage.calibre_voie2 := 20  else
  if balayage.calibre_voie2-20  < 1e-5 then balayage.calibre_voie2 := 80;

SetCh2SensBox.Text := floattostr(balayage.calibre_voie2) + ' V';

end;




procedure TFormBodePrincipal.MesureTension(Sender: TObject);
begin
       if (sender = MenuTensionCrete) then
      begin
         MenuTensionCrete.checked:=true;
         MenuTensionTRMS.checked:=false;
      end;
      if (sender = MenuTensionTRMS) then
      begin
         MenuTensionCrete.checked:=false;
         MenuTensionTRMS.checked:=true;
      end;
end;

procedure TFormBodePrincipal.ImageCabalabClick(Sender: TObject);
begin
FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
FormCabaLab.BringToFront;
end;

procedure TFormBodePrincipal.FormResize(Sender: TObject);
begin
// partie inutile, régler plutot les anchors left/right ...
//PanelVoies.Width := FormBodePrincipal.Width - (1024 - 697) ;
//PanelVoies.Top   := FormBodePrincipal.Height - (780 - 523) ;
//PanelBode.Width  := FormBodePrincipal.Width - (1024 - 697) ;
//PanelBode.Height := FormBodePrincipal.Height - (780 - 443) ;


end;


procedure TFormBodePrincipal.FormShow(Sender: TObject);
begin

{paramètres du générateur sauf la fréquence du signal émis}
   if SetFuncGenSignalType(0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de mettre le générateur en mode sinus');
   if SetFuncGenSymmetry(50)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de fixer la symétrie du signal du générateur à 50 %');

{paramètres de l'acquisition sauf la fréquence d'échantillonage }

 if HS3
 then
 begin
   if SetMeasureMode(3)<>E_NO_ERRORS then
   showmessage('Problème: impossible de capturer les deux voies simultanément');
   if SetAutoRanging(1,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de désactiver l''autorange de la voie 1');
   if SetAutoRanging(2,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de désactiver l''autorange de la voie 2');
   if SetCoupling(1,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de mettre la voie 1 en couplage AC');
   if SetCoupling(2,0)<>E_NO_ERRORS then
   showmessage('Problème: Impossible de mettre la voie 2 en couplage AC');
 end;

ChoixVoieEntreeClick(FormBodePrincipal);
ChoixVoieSortieClick(FormBodePrincipal);
end;

procedure TFormBodePrincipal.Aide1Click(Sender: TObject);
begin
Bode_utilisation.Visible := true ;
Bode_utilisation.BringToFront;
end;

procedure TFormBodePrincipal.Aide2Click(Sender: TObject);
begin
Bode_abscisse.Visible := true ;
Bode_abscisse.BringToFront;
end;

procedure TFormBodePrincipal.Aide3Click(Sender: TObject);
begin
Bode_ordonnee.Visible := true ;
Bode_ordonnee.BringToFront;
end;

procedure TFormBodePrincipal.Aide4Click(Sender: TObject);
begin
Bode_Commencer.Visible := true ;
Bode_Commencer.BringToFront;
end;

procedure TFormBodePrincipal.Aide5Click(Sender: TObject);
begin
Bode_logo.Visible := true ;
Bode_logo.BringToFront;
end;

procedure TFormBodePrincipal.Aide6Click(Sender: TObject);
begin
Bode_stockage.Visible := true ;
Bode_stockage.BringToFront;
end;

procedure TFormBodePrincipal.Aide7Click(Sender: TObject);
begin
Bode_transfert.Visible := true ;
Bode_transfert.BringToFront;
end;

procedure TFormBodePrincipal.ImprimerClick(Sender: TObject);
var i,j : integer ;
begin
  showmessage('impression-en cours de developement');

if PrintDialog1.execute then
begin

  with printer do
  begin
    BeginDoc;
    for i := 0 to Pagewidth - 1 do
    begin
      for j := 0 to PageHeight - 1 do
      begin
        Canvas.Pixels[i,j] := PaintBode.Canvas.Pixels [
        round ( i * PageWidth  / PaintBode.Width  ) ,
        round ( j * PageHeight / PaintBode.Height ) ]
      end;
    end;
    EndDoc;
  end; // with

end; // if PrintDialog1.execute
end;
end.
