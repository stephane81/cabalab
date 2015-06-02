unit UnitTitVoiture;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls , dlldecl,
  ExtCtrls,math, jpeg, Menus;

type
  TFormTitVoiture = class(TForm)
    Label1: TLabel;
    BoutonGauche: TButton;
    BoutonAvant: TButton;
    BoutonAvantGauche: TButton;
    BoutonDroite: TButton;
    BoutonArriere: TButton;
    BoutonKlaxon: TButton;
    BoutonAlarme: TButton;
    BoutonAvantDroite: TButton;
    BoutonArriereDroite: TButton;
    BoutonArriereGauche: TButton;
    Button19: TButton;
    Edit3avg: TEdit;
    Edit2avg: TEdit;
    Edit1avg: TEdit;
    Edit3g: TEdit;
    Edit2g: TEdit;
    Edit1g: TEdit;
    Edit3arg: TEdit;
    Edit2arg: TEdit;
    Edit1arg: TEdit;
    Edit3al: TEdit;
    Edit2al: TEdit;
    Edit1al: TEdit;
    Edit3av: TEdit;
    Edit2av: TEdit;
    Edit1av: TEdit;
    Edit3ar: TEdit;
    Edit2ar: TEdit;
    Edit1ar: TEdit;
    Edit3dm: TEdit;
    Edit2dm: TEdit;
    Edit1dm: TEdit;
    Edit3avd: TEdit;
    Edit2avd: TEdit;
    Edit1avd: TEdit;
    Edit3d: TEdit;
    Edit2d: TEdit;
    Edit1d: TEdit;
    Edit3ard: TEdit;
    Edit2ard: TEdit;
    Edit1ard: TEdit;
    Edit3k: TEdit;
    Edit2k: TEdit;
    Edit1k: TEdit;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    ContrleparClavier1: TMenuItem;
    Apropos1: TMenuItem;
    Apropos2: TMenuItem;

    procedure FormCreate(Sender: TObject);

    procedure AfficheBonsCodes(Sender: TObject);

    procedure DemarrerEmission(Sender: TObject);
    procedure ArreterEmission(Sender: TObject);


    procedure DemarrerEmissionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ArreterEmissionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure ControleparClavier(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure Apropos2Click(Sender: TObject);
    

   

  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  FormTitVoiture: TFormTitVoiture;
  frequence:double;
  Vs:array[0..131071] of word;
  j:integer;
  Tstart,Tbit0,Tbit1,Th,Tbit,Tstop:double;
  conv1,conv2,conv3:string;
  bin:array[0..9] of integer;
implementation

uses UnitCabalab,UnitApropos;

//uses principal;

{$R *.DFM}




procedure TFormTitVoiture.FormCreate(Sender: TObject);
begin
  FormTitVoiture.Left:=250;
   FormTitVoiture.Top:=100;
   //VideoPlayer1.Filename:=ExtractFilePath(Application.ExeName)+'Untitled1.avi';
   //VideoPlayer1.Play;
   //Animate1.Visible:=false;
{

   // image1.Visible:=False;
    // animate2.Visible:=true;
     {
     VideoPlayer1.Filename:=ExtractFilePath(Application.ExeName)+'Untitled1.avi';
     VideoPlayer1.DeviceType:=dtAutoSelect;
     videoPlayer1.Open;
     VideoPlayer1.Play;


   //label3.Visible:=false;
   //Animate2.Visible:=false;  }
end;


procedure TFormTitVoiture.AfficheBonsCodes(Sender: TObject);
begin
     Edit3av.Text:='1';
     Edit2av.Text:='F';
     Edit1av.Text:='0';
     Edit3avd.Text:='1';
     Edit2avd.Text:='B';
     Edit1avd.Text:='2';
     Edit3avg.Text:='1';
     Edit2avg.Text:='7';
     Edit1avg.Text:='4';
     Edit3ar.Text:='2';
     Edit2ar.Text:='E';
     Edit1ar.Text:='8';
     Edit3ard.Text:='2';
     Edit2ard.Text:='A';
     Edit1ard.Text:='A';
     Edit3arg.Text:='2';
     Edit2arg.Text:='6';
     Edit1arg.Text:='C';
     Edit3d.Text:='3';
     Edit2d.Text:='A';
     Edit1d.Text:='2';
     Edit3g.Text:='3';
     Edit2g.Text:='6';
     Edit1g.Text:='4';
     Edit3al.Text:='0';
     Edit2al.Text:='D';
     Edit1al.Text:='9';
     Edit3dm.Text:='3';
     Edit2dm.Text:='C';
     Edit1dm.Text:='1';
     Edit3k.Text:='3';
     Edit2k.Text:='0';
     Edit1k.Text:='7';
end;


procedure ConvertionHexaBinaire;
begin
    if conv1='0' then  begin bin[3]:=0;bin[2]:=0;bin[1]:=0;bin[0]:=0; end;
    if conv1='1' then  begin bin[3]:=0;bin[2]:=0;bin[1]:=0;bin[0]:=1; end;
    if conv1='2' then  begin bin[3]:=0;bin[2]:=0;bin[1]:=1;bin[0]:=0; end;
    if conv1='3' then  begin bin[3]:=0;bin[2]:=0;bin[1]:=1;bin[0]:=1; end;
    if conv1='4' then  begin bin[3]:=0;bin[2]:=1;bin[1]:=0;bin[0]:=0; end;
    if conv1='5' then  begin bin[3]:=0;bin[2]:=1;bin[1]:=0;bin[0]:=1; end;
    if conv1='6' then  begin bin[3]:=0;bin[2]:=1;bin[1]:=1;bin[0]:=0; end;
    if conv1='7' then  begin bin[3]:=0;bin[2]:=1;bin[1]:=1;bin[0]:=1; end;
    if conv1='8' then  begin bin[3]:=1;bin[2]:=0;bin[1]:=0;bin[0]:=0; end;
    if conv1='9' then  begin bin[3]:=1;bin[2]:=0;bin[1]:=0;bin[0]:=1; end;
    if conv1='A' then  begin bin[3]:=1;bin[2]:=0;bin[1]:=1;bin[0]:=0; end;
    if conv1='B' then  begin bin[3]:=1;bin[2]:=0;bin[1]:=1;bin[0]:=1; end;
    if conv1='C' then  begin bin[3]:=1;bin[2]:=1;bin[1]:=0;bin[0]:=0; end;
    if conv1='D' then  begin bin[3]:=1;bin[2]:=1;bin[1]:=0;bin[0]:=1; end;
    if conv1='E' then  begin bin[3]:=1;bin[2]:=1;bin[1]:=1;bin[0]:=0; end;
    if conv1='F' then  begin bin[3]:=1;bin[2]:=1;bin[1]:=1;bin[0]:=1; end;

    if conv2='0' then  begin bin[7]:=0;bin[6]:=0;bin[5]:=0;bin[4]:=0; end;
    if conv2='1' then  begin bin[7]:=0;bin[6]:=0;bin[5]:=0;bin[4]:=1; end;
    if conv2='2' then  begin bin[7]:=0;bin[6]:=0;bin[5]:=1;bin[4]:=0; end;
    if conv2='3' then  begin bin[7]:=0;bin[6]:=0;bin[5]:=1;bin[4]:=1; end;
    if conv2='4' then  begin bin[7]:=0;bin[6]:=1;bin[5]:=0;bin[4]:=0; end;
    if conv2='5' then  begin bin[7]:=0;bin[6]:=1;bin[5]:=0;bin[4]:=1; end;
    if conv2='6' then  begin bin[7]:=0;bin[6]:=1;bin[5]:=1;bin[4]:=0; end;
    if conv2='7' then  begin bin[7]:=0;bin[6]:=1;bin[5]:=1;bin[4]:=1; end;
    if conv2='8' then  begin bin[7]:=1;bin[6]:=0;bin[5]:=0;bin[4]:=0; end;
    if conv2='9' then  begin bin[7]:=1;bin[6]:=0;bin[5]:=0;bin[4]:=1; end;
    if conv2='A' then  begin bin[7]:=1;bin[6]:=0;bin[5]:=1;bin[4]:=0; end;
    if conv2='B' then  begin bin[7]:=1;bin[6]:=0;bin[5]:=1;bin[4]:=1; end;
    if conv2='D' then  begin bin[7]:=1;bin[6]:=1;bin[5]:=0;bin[4]:=1; end;
    if conv2='E' then  begin bin[7]:=1;bin[6]:=1;bin[5]:=1;bin[4]:=0; end;
    if conv2='F' then  begin bin[7]:=1;bin[6]:=1;bin[5]:=1;bin[4]:=1; end;

    if conv3='0' then  begin bin[9]:=0;bin[8]:=0; end;
    if conv3='1' then  begin bin[9]:=0;bin[8]:=1; end;
    if conv3='2' then  begin bin[9]:=1;bin[8]:=0; end;
    if conv3='3' then  begin bin[9]:=1;bin[8]:=1; end;
    if conv3='4' then  begin bin[9]:=0;bin[8]:=0; end;
    if conv3='5' then  begin bin[9]:=0;bin[8]:=1; end;
    if conv3='6' then  begin bin[9]:=1;bin[8]:=0; end;
    if conv3='7' then  begin bin[9]:=1;bin[8]:=1; end;
    if conv3='8' then  begin bin[9]:=0;bin[8]:=0; end;
    if conv3='9' then  begin bin[9]:=0;bin[8]:=1; end;
    if conv3='A' then  begin bin[9]:=1;bin[8]:=0; end;
    if conv3='B' then  begin bin[9]:=1;bin[8]:=1; end;
    if conv3='C' then  begin bin[9]:=0;bin[8]:=0; end;
    if conv3='D' then  begin bin[9]:=0;bin[8]:=1; end;
    if conv3='E' then  begin bin[9]:=1;bin[8]:=0; end;
    if conv3='F' then  begin bin[9]:=1;bin[8]:=1; end;
end;


procedure bitstart;
var
i:integer;
begin
  for i:=j to j+round(Tstart*frequence) do
    VS[i]:=1;

  j:= j+round(Tstart*frequence)+1 ;
end;


procedure bitstop;
var
i:integer;
begin
  for i:=j to j+round(Tstop*frequence) do
    VS[i]:=0;

  j:= j+round(Tstop*frequence)+1 ;
end;



procedure bit0;
var
i:integer;
begin
  for i:=j to j+round((Tbit-Tbit0)*frequence) do
    Vs[i]:=0;
  for i:=j+round((Tbit-Tbit0)*frequence) to j+round(Tbit*frequence) do
    Vs[i]:=1;

  j:= j+round(Tbit*frequence)+1 ;
end;

procedure bit1;
var
i:integer;
begin
  for i:=j to j+round((Tbit-Tbit1)*frequence) do
    Vs[i]:=0;
  for i:=j+round((Tbit-Tbit1)*frequence) to j+round(Tbit*frequence) do
    Vs[i]:=1;

  j:= j+round(Tbit*frequence)+1 ;
end;


procedure ConstructionTrame;
begin
    bitstart;
    if bin[9]=0 then bit0 else bit1;
    if bin[8]=0 then bit0 else bit1;
    if bin[7]=0 then bit0 else bit1;
    if bin[6]=0 then bit0 else bit1;
    if bin[5]=0 then bit0 else bit1;
    if bin[4]=0 then bit0 else bit1;
    if bin[3]=0 then bit0 else bit1;
    if bin[2]=0 then bit0 else bit1;
    if bin[1]=0 then bit0 else bit1;
    if bin[0]=0 then bit0 else bit1;
    bitstop;
end;


procedure TFormTitVoiture.DemarrerEmission(Sender: TObject);
var
NombreEchantillons : dword;

erreur:word;
nbp,index:integer;
wamp1:array[0..131071] of word;
begin

// Données transmission
  Tstart:=0.004;
  Tstop:=0.016;
  Tbit0:=0.00082;
  Tbit1:=0.00156;
  Tbit:=0.0021;
  j:=0;  //init compteur
  if HS3 then
  begin
    NombreEchantillons:=131072;
    Frequence:=156250;
  end;
  if GTI2 then
  begin
    NombreEchantillons:=16000;
    Frequence:=72000;
  end;


// Récupération Code Hexadéximal
  if Sender=BoutonGauche then
  begin
    conv1:=edit1g.Text;
    conv2:=edit2g.Text;
    conv3:=edit3g.Text;
  end;

  if Sender=BoutonAvantGauche then
  begin
    conv1:=edit1avg.Text;
    conv2:=edit2avg.Text;
    conv3:=edit3avg.Text;
  end;

  if Sender=BoutonArriereGauche then
  begin
    conv1:=edit1arg.Text;
    conv2:=edit2arg.Text;
    conv3:=edit3arg.Text;
  end;

  if Sender=BoutonDroite then
  begin
    conv1:=edit1d.Text;
    conv2:=edit2d.Text;
    conv3:=edit3d.Text;
  end;

  if Sender=BoutonAvantDroite then
  begin
    conv1:=edit1avd.Text;
    conv2:=edit2avd.Text;
    conv3:=edit3avd.Text;
  end;

  if Sender=BoutonArriereDroite then
  begin
    conv1:=edit1ard.Text;
    conv2:=edit2ard.Text;
    conv3:=edit3ard.Text;
  end;

  if Sender=BoutonAvant then
  begin
    conv1:=edit1av.Text;
    conv2:=edit2av.Text;
    conv3:=edit3av.Text;
  end;

  if Sender=BoutonArriere then
  begin
    conv1:=edit1ar.Text;
    conv2:=edit2ar.Text;
    conv3:=edit3ar.Text;
  end;

  if Sender=BoutonKlaxon then
  begin
    conv1:=edit1k.Text;
    conv2:=edit2k.Text;
    conv3:=edit3k.Text;
  end;

  if Sender=BoutonAlarme then
  begin
    conv1:=edit1al.Text;
    conv2:=edit2al.Text;
    conv3:=edit3al.Text;
  end;

// --------
  ConvertionHexaBinaire;
// --------

  for nbp := 0 to 15 do
  begin
    ConstructionTrame;
  end;

// Remplissage tableau TiePie
  if HS3 then
  begin

    for index:=0 to NombreEchantillons - 1 do
      begin
        if sin(index*(2*pi*36000/(Frequence)))>0 then
          wamp1[index]:=1
        else
          wamp1[index]:=0;
     end;
     for j:=0 to NombreEchantillons - 1 do
       begin
         FuncGenArray[j] := 32767 + Vs[j]*32767*wamp1[j];
       end;
  end;
  if GTI2 then
  begin

    for index:=0 to NombreEchantillons - 1 do
      begin
        if ( index/2 = round (index/2) ) then     // si index pair ou impair
          wamp1[index]:=1
        else
          wamp1[index]:=0;   // fréquence relevée à l'oscillo : 35,97 kHz
     end;
     for j:=0 to NombreEchantillons - 1 do
       begin
         FuncGenArray[j] := 32767 + Vs[j]*32767*wamp1[j];
       end;
  end;



    // StartMeasurement();
    //  SetFuncGenOutputOn ( 1 ) ;
     erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));
    erreur:=fillfuncgenmemory(NombreEchantillons,   @FuncGenArray);
   // showmessage(floattostr(erreur));
    erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));
    //frequence:=156250;
   erreur:=SetFuncGenFrequency ( @frequence );
   // showmessage(floattostr(erreur));
    SetFuncGenSymmetry ( 50 );

     SetFuncGenAmplitude (10);
      SetFuncGenOutputOn ( 1 ) ;

end;


procedure TFormTitVoiture.ArreterEmission(Sender: TObject);
begin
  SetFuncGenOutputON(0);
end;


procedure TFormTitVoiture.DemarrerEmissionMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DemarrerEmission(Sender);
end;


procedure TFormTitVoiture.ArreterEmissionMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    ArreterEmission(Sender);
end;


procedure TFormTitVoiture.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ContrleparClavier1.checked=true then
    SetFuncGenOutputOn ( 0);
end;


procedure TFormTitVoiture.FormKeyPress(Sender: TObject; var Key: Char);
var
 state:word ;
begin
  if ContrleparClavier1.checked=true then
  begin
    GetFuncGenOutputOn(@state);
    if state=0 then
    begin
      if key='8'	 then  DemarrerEmission(BoutonAvant);
      if key='2'	 then  DemarrerEmission(BoutonArriere);
      if key='9'	 then  DemarrerEmission(BoutonAvantDroite);
      if key='7'	 then  DemarrerEmission(BoutonAvantGauche);
      if key='3'	 then  DemarrerEmission(BoutonArriereDroite);
      if key='1'	 then  DemarrerEmission(BoutonArriereGauche);
      if key='4'	 then  DemarrerEmission(BoutonGauche);
      if key='6'	 then  DemarrerEmission(BoutonDroite);
      if key='0'	 then  DemarrerEmission(BoutonAlarme);
      if key='5'	 then  DemarrerEmission(BoutonKlaxon);
    end;
  end;
end;


procedure TFormTitVoiture.ControleparClavier(Sender: TObject);
begin
  if ContrleparClavier1.checked=false then
  begin
    ContrleparClavier1.checked:=true;
  end
  else
  begin
  ContrleparClavier1.checked:=false;
  end;
end;


procedure TFormTitVoiture.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  passif[7]:=true;
  Formcabalab.SpeedButtonVoiture.down:=false;
  Formcabalab.Comandeinfrarouge1.Checked:=false;
  Formcabalab.Comandeinfrarouge1.Enabled:=false;
  Formcabalab.GestionButtons(sender);
end;


procedure TFormTitVoiture.Image1Click(Sender: TObject);
begin
  FormCabaLab.WindowState := wsNormal ; // met la fenetre en taille normale (au cas ou elle est iconifiée) 1_34FM
  FormCabaLab.BringToFront;
end;


procedure TFormTitVoiture.Apropos2Click(Sender: TObject);
begin
  FormApropos.Visible := true ;
  FormApropos.BringToFront;
end;


end.
