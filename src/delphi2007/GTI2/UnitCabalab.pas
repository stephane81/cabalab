unit UnitCabalab;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls,dlldecl, jpeg, ExtCtrls, Menus ;
  
const CabalabCube = True;     // True = Cabalab3 // False = Cabalab
      Version = '2.02';
      DateVersion = '15 mars 2008';

const GTI2 = true ;
      HS3 = false ;

type
  TFormCabaLab = class(TForm)
    SpeedButtonOscillo: TSpeedButton;
    SpeedButtonMesures: TSpeedButton;
    SpeedButtonGraph: TSpeedButton;
    SpeedButtonBode: TSpeedButton;
    SpeedButtonFFT: TSpeedButton;
    SpeedButtonVoiture: TSpeedButton;
    SpeedButtonReglagesREGRESSI: TSpeedButton;
    LabelOscillo: TLabel;
    LabelMesures: TLabel;
    Label2: TLabel;
    LabelBodeTitre: TLabel;
    LabelFFTTitre: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButtonConnexion: TSpeedButton;
    LabelConnexion: TLabel;
    SpeedButtonGBF: TSpeedButton;
    LabelGBF: TLabel;
    Image2: TImage;
    ImageMicrelec: TImage;
    Image4: TImage;
    Image5: TImage;
    LabelBodeExplication: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LabelConnexion2: TLabel;
    LabelFFTExplication: TLabel;
    Label14: TLabel;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    ableur1: TMenuItem;
    Aide1: TMenuItem;
    Aproposde1: TMenuItem;
    Option1: TMenuItem;
    Comandeinfrarouge1: TMenuItem;
    TimerBoutonConnexion: TTimer;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MenuEtalonnagedelaGTI2: TMenuItem;
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonConnexionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonReglagesSCILABClick(Sender: TObject);

    procedure SpeedButtonMesuresClick(Sender: TObject);
    procedure BloquageBoutons;
    procedure De_BloquageBoutons;
    procedure De_BloquageBoutonsOscillo;
    procedure De_BloquageBoutonsGBF;
    procedure GestionButtons(Sender: TObject);

    procedure SpeedButtonGraphClick(Sender: TObject);
    procedure SpeedButtonOscilloClick(Sender: TObject);
    procedure SpeedButtonGBFClick(Sender: TObject);

    procedure SpeedButtonBodeClick(Sender: TObject);

    procedure SpeedButtonVoitureClick(Sender: TObject);
    procedure SpeedButtonFFTClick(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure Aproposde1Click(Sender: TObject);
    procedure Comandeinfrarouge1Click(Sender: TObject);
    procedure TimerBoutonConnexionTimer(Sender: TObject);
    procedure MenuEtalonnagedelaGTI2Click(Sender: TObject);

    

  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;


const
  NbApplis =7;  // Nombre d'applications et donc de boutons � g�rer
// Applications compatibles : True = Compatible , False = Imcompatible
  UtilAvec1Oscillo:array [1..NbApplis] of boolean = (true,true,false,false,false,false,true);
  UtilAvec2GBF    :array [1..NbApplis] of boolean = (true, true,true,true,false,true,false );
  UtilAvec3Carac  :array [1..NbApplis] of boolean = (false,true,true,false,false,false,false  );
  UtilAvec4trans  :array [1..NbApplis] of boolean = (false,true,false,true,false,false,false  );
  UtilAvec5Bode   :array [1..NbApplis] of boolean = (false,false,false,false,true,false,false  );
  UtilAvec6FFT    :array [1..NbApplis] of boolean = (false,true,false,false,false,true,true  );
  UtilAvec7Voit   :array [1..NbApplis] of boolean = (true,false,false,false,false,true,true  );
var
  FormCabaLab: TFormCabaLab;
  DLLSource      : array[0..255] of char;
  erreur         : longint;
  passif         : array[1..NbApplis] of boolean; // Contient l'�tat d'une application :
                    // True = appli qui ne tourne pas, False = Appli en train de tourner
  AppareilConnecteUSB : boolean ;   //true=oui false=non    //1_37 FM


implementation

uses    UnitGBF,
        UnitBodePrincipal,
        UnitTITvoiture,
        unit_FFT_mut_GTi2,
        UnitFantome,
        UnitAPropos,
        Unit1CheminScilab ,
        Unit1Mesures_XY_GTI2,
        UnitOscilloGTI2,
        UnitTraceurGTI2, UnitMouchard , UnitGTI2Calibration;
        //UnitTransfertRegressi;


{$R *.dfm}



Procedure InitialisationPassif;
var i:integer;
begin
for i:=1 to NbApplis do
passif[i]:=true;  // Au d�part, appareil non initialis�: tous les boutons inactifs
end;

procedure TFormCabaLab.FormCreate(Sender: TObject);
begin
Formcabalab.Left:=0; // racisme pour ceux qui ont le menu d�marrer a gauche :-)
Formcabalab.Top:=0;

//Formcabalab.clientheight:=656;
//Formcabalab.clientwidth:=656;
image4.Width:=656;

// ******* Gestion Cabalab/Cabalabcube
//if GTI2 then
//  SpeedButtonConnexion.Glyph.LoadFromFile('Images\GTI2Connexion.bmp');


  If CabalabCube = False Then
  begin
  // Ne pas afficher les boutons
  SpeedButtonFFT.Visible := False;
  SpeedButtonBode.Visible := False;
  LabelFFTTitre.Visible := False ;
  LabelFFTExplication.Visible := False ;
  LabelBodeTitre.Visible := False ;
  LabelBodeExplication.Visible := False ;
  // R�organisation du design
  SpeedButtonConnexion.Height := 73;
  LabelConnexion.Top := 155;
  LabelConnexion2.Top := 200;
  ImageMicrelec.Top := 242;
  FormCabalab.Height := 330;

  end;



InitialisationPassif; // Au d�part, appareil non initialis�: tous les boutons inactifs
BloquageBoutons; // aucun bouton d'appli accessible

AppareilConnecteUSB:=false;         //1_37 FM    a faire avant la proc�dure suivante !!!!!!!!!!!
SpeedButtonConnexionClick(Sender);   //1_21 FM  essais FM   a la place de :

end;

procedure TFormCabaLab.GestionButtons(Sender: TObject); // d�finit quels boutons sont accessibles
var i:integer;

mem:boolean;
begin
// Tous les boutons sont activ�s
FormCabaLab.SpeedButtonOscillo.Enabled:=true;
FormCabaLab.SpeedButtonGBF.Enabled:=true;
FormCabaLab.SpeedButtonMesures.Enabled:=true;
FormCabaLab.SpeedButtonGraph.Enabled:=true;

FormCabaLab.SpeedButtonBode.Enabled:=true;
FormCabaLab.SpeedButtonFFT.Enabled:=true;
FormCabaLab.SpeedButtonVoiture.Enabled:=true;
FormCabaLab.Comandeinfrarouge1.Enabled:=true;
for i:=1 to NbApplis do
begin
// Seulement certains boutons sont activ�s
  if UtilAvec1Oscillo[i]=false then // Si l'application n�i ne peut se lancer avec oscillo
      FormCabaLab.SpeedButtonOscillo.Enabled:=FormCabaLab.SpeedButtonOscillo.Enabled AND passif[i]; // et qu'elle est active alors bouton oscillo inactif.
  if UtilAvec2GBF[i]=false then
      FormCabaLab.SpeedButtonGBF.Enabled:=FormCabaLab.SpeedButtonGBF.Enabled AND passif[i];
  if UtilAvec3Carac[i]=false then
      FormCabaLab.SpeedButtonMesures.Enabled:=FormCabaLab.SpeedButtonMesures.Enabled AND passif[i];
  if UtilAvec4trans[i]=false then
      FormCabaLab.SpeedButtonGraph.Enabled:=FormCabaLab.SpeedButtonGraph.Enabled AND passif[i];
  if UtilAvec5Bode[i]=false then
      FormCabaLab.SpeedButtonBode.Enabled:=FormCabaLab.SpeedButtonBode.Enabled AND passif[i];
  if UtilAvec6FFT[i]=false then
      FormCabaLab.SpeedButtonFFT.Enabled:=FormCabaLab.SpeedButtonFFT.Enabled AND passif[i];
  if UtilAvec7Voit[i]=false then
      begin
      FormCabaLab.Comandeinfrarouge1.Enabled:=FormCabaLab.Comandeinfrarouge1.Enabled AND passif[i];
      FormCabaLab.SpeedButtonVoiture.Enabled:=FormCabaLab.SpeedButtonVoiture.Enabled AND passif[i];
      end;

end;


  mem:=true;
  for i:=1 to NbApplis do
  begin
      if passif[i]=false then mem := false;
  end;
  if mem=true then  FormCabaLab.WindowState := wsNormal;

end;


procedure TFormCabaLab.Label1Click(Sender: TObject);
begin
FormMouchard.visible := true ;
end;

procedure TFormCabaLab.MenuEtalonnagedelaGTI2Click(Sender: TObject);
begin
FormGTI2Calibration.Visible := True;
FormGTI2Calibration.FormCreate(FormGTI2Calibration);
end;

procedure TFormCabaLab.SpeedButtonConnexionClick(Sender: TObject);
begin

// Initialisation du module
erreur:=InitInstrument($308);
   if erreur <> E_NO_ERRORS then
   begin
   // Ecrire ici les actions en cas d'absence du module
   LabelConnexion2.Caption := 'V�rifier que l''appareil est bien allum� et reli� au port USB puis cliquer sur le bouton ci-dessus pour connecter l''interface Orphy GTI II � CabaLab3';
   SpeedButtonConnexion.Down:=false; // Active le bouton Tiepie
   AppareilConnecteUSB:=false;
   end
   else
   begin
   De_BloquageBoutons; // autorise les applis
   SpeedButtonConnexion.enabled:=false; //D�sactive le bouton tiepie
   LabelConnexion.Font.Color := clGreen ;
   LabelConnexion.Caption := 'Appareil Connect�';
   LabelConnexion2.Caption := '';//'L''interface Orphy GTI II est connect�e et fonctionne correctement.';

   TimerBoutonConnexion.Enabled:=true;
   AppareilConnecteUSB:=true;
   end;

end;

procedure TFormCabaLab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if messageDlg('Voulez-vous quitter Cabalab ?',mtWarning,  [mbYes,mbNo],0) = mrYes then

begin

   // OscilloCaba.visible:=false;      //////essai de corectif du bug fermeture de cabalab avec l'oscillo ouvert....
   // Form1MesuresCaba.visible:=false;
    //Form1Cabagraph.visible:=false;
    FormGBF.visible:=false;
    FormBodePrincipal.visible:=false;
    FormTitVoiture.visible:=false;       ///sa marche � premi�re vue.....
    Form_FFT_mut_GTI2.visible:=false;      // manque pas fft ? se SI!!! FM    1_21


// pour la suite : a ne faire que si tiepie a �t� initialis� ?? OUI  comme SA ! 1_21 FM
    if  AppareilConnecteUSB=true  then     //1_37 FM
     begin
      Action := caFree;
      if DLLHandle >= 32 then
       begin
       SetFuncGenOutputOn(0);     // �teindre le gen�   1_34FM correctif du bug : �teindre cabalab avec gbf allum� et gbf en fonctionnement qd mm
       Exitinstrument;
       end; { if }
       
      SetFuncGenOutputOn(0);
      Freelibrary(DLLHandle);
      NilAllProcAddresses;
    end;

formfantome.close;                                   //1_21 FM
end { if }
else
begin
    Action := caNone;

end; { else }
end;







procedure TFormCabaLab.BloquageBoutons;
begin
SpeedButtonOscillo.Enabled:=false;
SpeedButtonGBF.Enabled:=false;
SpeedButtonMesures.Enabled:=false;
SpeedButtonGraph.Enabled:=false;

SpeedButtonBode.Enabled:=false;
SpeedButtonFFT.Enabled:=false;
SpeedButtonVoiture.Enabled:=false;
Comandeinfrarouge1.Enabled:=false;
end;

procedure TFormCabaLab.De_BloquageBoutons;
begin
SpeedButtonOscillo.Enabled:=true;
SpeedButtonGBF.Enabled:=true;
SpeedButtonMesures.Enabled:=true;
SpeedButtonGraph.Enabled:=true;

SpeedButtonBode.Enabled:=true;
SpeedButtonFFT.Enabled:=true;
SpeedButtonVoiture.Enabled:=true;
Comandeinfrarouge1.Enabled:=true;
end;

procedure TFormCabaLab.De_BloquageBoutonsOscillo;
begin

if (SpeedButtonGBF.down=false) then
begin
SpeedButtonMesures.Enabled:=true;
SpeedButtonGraph.Enabled:=true;
SpeedButtonBode.Enabled:=true;
SpeedButtonFFT.Enabled:=true;
SpeedButtonVoiture.Enabled:=true;
Comandeinfrarouge1.Enabled:=true;
end;

end;

procedure TFormCabaLab.De_BloquageBoutonsGBF;
begin

if (SpeedButtonOscillo.down=false) then
begin
SpeedButtonMesures.Enabled:=true;
SpeedButtonGraph.Enabled:=true;
SpeedButtonBode.Enabled:=true;
SpeedButtonFFT.Enabled:=true;
SpeedButtonVoiture.Enabled:=true;
Comandeinfrarouge1.Enabled:=true;
end;

end;

procedure TFormCabaLab.SpeedButtonReglagesSCILABClick(Sender: TObject);
begin
form1cheminscilab.visible:=true;
end;


procedure TFormCabaLab.SpeedButtonOscilloClick(Sender: TObject);
begin
passif[1]:=false;
GestionButtons(sender);
//BloquageBoutons;
//SpeedButtonOscillo.Enabled:=true;
//SpeedButtonGBF.Enabled:=true;


SpeedButtonOscillo.down:=true;
if GTI2 then
begin
FormOscilloGTI2.visible:=true;
FormOscilloGTI2.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifi�e)
FormOscilloGTI2.BringToFront; // met la fenetre au premier plan
end
else
begin
//OscilloCaba.visible:=true;
//OscilloCaba.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifi�e)
//OscilloCaba.BringToFront; // met la fenetre au premier plan
end;


FormCabaLab.WindowState := wsMinimized;

end;

procedure TFormCabaLab.SpeedButtonGBFClick(Sender: TObject);
begin
//BloquageBoutons;

//SpeedButtonOscillo.Enabled:=true;
//SpeedButtonGBF.Enabled:=true;
//SpeedButtonMesures.Enabled:=true;
//SpeedButtonFFT.Enabled:=true;

passif[2]:=false;
GestionButtons(sender);

SpeedButtonGBF.down:=true;
FormGBF.visible:=true;
FormGBF.WindowState:=wsNormal;// met la fenetre en taille normale (au cas ou elle est iconifi�e)
FormGBF.BringToFront; // met la fenetre au premier plan

FormCabaLab.WindowState := wsMinimized;

end;
procedure TFormCabaLab.SpeedButtonMesuresClick(Sender: TObject);
begin
passif[3]:=false;
GestionButtons(sender);

SpeedButtonMesures.down:=true;
if GTI2 then
begin
//
Form1MesuresCaba_GTI2.visible:=true;
Form1MesuresCaba_GTI2.WindowState:=wsNormal;
Form1MesuresCaba_GTI2.BringToFront;
end
else
begin
//Form1MesuresCaba.visible:=true;
//Form1MesuresCaba.WindowState:=wsNormal;  // met la fenetre en taille normale (au cas ou elle est iconifi�e)
//Form1MesuresCaba.BringToFront; // met la fenetre au premier plan
end;
FormCabaLab.WindowState := wsMinimized;

end;

procedure TFormCabaLab.SpeedButtonGraphClick(Sender: TObject);
begin
//BloquageBoutons;
//SpeedButtonGraph.Enabled:=true;
//SpeedButtonGraph.down:=true;

passif[4]:=false;
GestionButtons(sender);

SpeedButtonGraph.down:=true;
if GTI2 then
begin
FormTraceurGTI2.visible:=true;
FormTraceurGTI2.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifi�e)
FormTraceurGTI2.BringToFront; // met la fenetre au premier plan
end
else
begin
//Form1Cabagraph.visible:=true;
//Form1Cabagraph.WindowState:=wsNormal;  // met la fenetre en taille normale (au cas ou elle est iconifi�e)
//Form1Cabagraph.BringToFront; // met la fenetre au premier plan
end;


FormCabaLab.WindowState := wsMinimized;

end;
procedure TFormCabaLab.SpeedButtonBodeClick(Sender: TObject);
begin
//BloquageBoutons;
//SpeedButtonBode.Enabled:=true;
//SpeedButtonBode.down:=true;

passif[5]:=false;
GestionButtons(sender);

FormBodePrincipal.visible:=true;
FormBodePrincipal.WindowState:=wsNormal ;    // met la fenetre en taille normale (au cas ou elle est iconifi�e)
FormBodePrincipal.BringToFront; // met la fenetre au premier plan

FormBodePrincipal.FermetureDemandee := False;

   if FormBodePrincipal.Balayage.mode_reglage then
   begin
   FormBodePrincipal.Regler;
   end;

FormCabaLab.WindowState := wsMinimized;//1_34FM

end;

procedure TFormCabaLab.SpeedButtonFFTClick(Sender: TObject);
begin
passif[6]:=false;
GestionButtons(sender);
//BloquageBoutons;
//SpeedButtonFFT.Enabled:=true;
//SpeedButtonGBF.Enabled:=true;
//SpeedButtonVoiture.Enabled:=true;
//Comandeinfrarouge1.Enabled:=true;

SpeedButtonFFT.down:=true;

Form_FFT_mut_GTI2.visible:=true;
Form_FFT_mut_GTI2.WindowState:=wsNormal;    // met la fenetre en taille normale (au cas ou elle est iconifi�e)
Form_FFT_mut_GTI2.BringToFront; // met la fenetre au premier plan

FormCabaLab.WindowState := wsMinimized;//1_34FM

end;


procedure TFormCabaLab.SpeedButtonVoitureClick(Sender: TObject);
begin
passif[7]:=false;
GestionButtons(sender);
//BloquageBoutons;
//SpeedButtonOscillo.Enabled:=true;
//SpeedButtonVoiture.Enabled:=true;
//Comandeinfrarouge1.Enabled:=true;
//SpeedButtonFFT.Enabled:=true;

SpeedButtonVoiture.down:=true;
Comandeinfrarouge1.Checked:=true;

FormTitVoiture.visible:=true;
FormTitVoiture.WindowState := wsNormal ;    // met la fenetre en taille normale (au cas ou elle est iconifi�e)
FormTitVoiture.BringToFront; // met la fenetre au premier plan

FormCabaLab.WindowState := wsMinimized;//1_34FM

end;




procedure TFormCabaLab.Quitter1Click(Sender: TObject);
begin
FormCabalab.Close;
end;

procedure TFormCabaLab.Aproposde1Click(Sender: TObject);
begin
FormApropos.Visible := true ;
end;

procedure TFormCabaLab.Comandeinfrarouge1Click(Sender: TObject);
begin

SpeedButtonVoitureClick(Sender)


  {if Comandeinfrarouge1.Checked=false then
    begin

    SpeedButtonVoiture.Top:=240;
    Label5.top:=216;
    Label8.top:=320;


    Comandeinfrarouge1.Checked:=true;
    SpeedButtonVoiture.Visible:=true;
    Label5.Visible:=true;
    Label8.Visible:=true;
    LabelConnexion.Visible:=false;
    LabelConnexion2.Visible:=false;
    end
  else
    begin
    Comandeinfrarouge1.Checked:=false;
    SpeedButtonVoiture.Visible:=false;
    Label5.Visible:=false;
    Label8.Visible:=false;
    LabelConnexion.Visible:=true;
    LabelConnexion2.Visible:=true;
    end;

               }

end;

procedure TFormCabaLab.TimerBoutonConnexionTimer(Sender: TObject);
begin

SpeedButtonConnexion.Visible:=false;
Image2.Top:=80;
Image2.Left:=224;
   if CabalabCube = False then
   begin
   LabelConnexion.Visible := False;
   LabelConnexion2.Top := 220;
   end;

TimerBoutonConnexion.Enabled:=false; //inutile de le laisser tourner
end;


end.
