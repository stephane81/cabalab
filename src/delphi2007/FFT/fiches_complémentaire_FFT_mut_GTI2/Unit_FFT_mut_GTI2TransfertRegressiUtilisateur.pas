unit Unit_FFT_mut_GTI2TransfertRegressiUtilisateur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dlldecl, ExtCtrls;






type
  TForm_FFT_mut_GTI2TransfertRegressiUtilisateur = class(TForm)
    GroupBoxINSTANTANE: TGroupBox;
    LabelINST: TLabel;
    ScrollBarINST: TScrollBar;
    LabelNBECH: TLabel;
    LabelINSTTRANS: TLabel;
    GroupBoxTransferEnregistrements: TGroupBox;
    GroupBoxEnrg1: TGroupBox;
    RadioButton251: TRadioButton;
    RadioButton501: TRadioButton;
    RadioButton1001: TRadioButton;
    CheckBoxEnregistrement1: TCheckBox;
    GroupBoxEnrg2: TGroupBox;
    RadioButton102: TRadioButton;
    RadioButton252: TRadioButton;
    RadioButton502: TRadioButton;
    RadioButton1002: TRadioButton;
    CheckBoxEnregistrement2: TCheckBox;
    GroupBoxEnrg5: TGroupBox;
    RadioButton105: TRadioButton;
    RadioButton255: TRadioButton;
    RadioButton505: TRadioButton;
    RadioButton1005: TRadioButton;
    CheckBoxEnregistrement5: TCheckBox;
    GroupBoxEnrg3: TGroupBox;
    RadioButton103: TRadioButton;
    RadioButton253: TRadioButton;
    RadioButton503: TRadioButton;
    RadioButton1003: TRadioButton;
    CheckBoxEnregistrement3: TCheckBox;
    GroupBoxEnrg4: TGroupBox;
    RadioButton104: TRadioButton;
    RadioButton254: TRadioButton;
    RadioButton504: TRadioButton;
    RadioButton1004: TRadioButton;
    CheckBoxEnregistrement4: TCheckBox;
    GroupBoxEnrg6: TGroupBox;
    RadioButton106: TRadioButton;
    RadioButton256: TRadioButton;
    RadioButton506: TRadioButton;
    RadioButton1006: TRadioButton;
    CheckBoxEnregistrement6: TCheckBox;
    GroupBoxEnrg7: TGroupBox;
    RadioButton107: TRadioButton;
    RadioButton257: TRadioButton;
    RadioButton507: TRadioButton;
    RadioButton1007: TRadioButton;
    CheckBoxEnregistrement7: TCheckBox;
    GroupBoxEnrg8: TGroupBox;
    RadioButton108: TRadioButton;
    RadioButton258: TRadioButton;
    RadioButton508: TRadioButton;
    RadioButton1008: TRadioButton;
    CheckBoxEnregistrement8: TCheckBox;
    GroupBoxEnrg9: TGroupBox;
    RadioButton109: TRadioButton;
    RadioButton259: TRadioButton;
    RadioButton509: TRadioButton;
    RadioButton1009: TRadioButton;
    CheckBoxEnregistrement9: TCheckBox;
    GroupBoxEnrg10: TGroupBox;
    RadioButton1010: TRadioButton;
    RadioButton2510: TRadioButton;
    RadioButton5010: TRadioButton;
    RadioButton10010: TRadioButton;
    CheckBoxEnregistrement10: TCheckBox;
    ButtonMULTI: TButton;
    RadioButton101: TRadioButton;
    GroupBoxMonoPage: TGroupBox;
    ButtonMONO: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    ButtonTransfert: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PaintBoxECRAN1: TPaintBox;
    PaintBoxECRAN2: TPaintBox;
    PaintBoxECRAN3: TPaintBox;
    PaintBoxECRAN4: TPaintBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBarINSTChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonTransfertClick(Sender: TObject);
    procedure TRANSMulti(Sender: TObject);
    procedure DeblocageTransfertMONO(Sender: TObject);
    procedure DeblocageTransfertMULTI(Sender: TObject);
    procedure GroupBoxMultiMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ResetEcranEnregistrement (sender: Tpaintbox);
    procedure affichageEnregistrement(Sender: Tpaintbox;CH:integer;NumEnrg:integer);
    procedure EcranNoir (sender: Tpaintbox);
    procedure ButtonMONOClick(Sender: TObject);
    procedure EnvoieDonneesGTI_Enreg_Multi(NoEnrg:integer;diviseur:integer;ALL,Ch1,Ch2,Ch3,Ch4:boolean);
    procedure EnvoieDonneesGTI_Enreg_Mono(diviseur:integer);
    procedure EnvoieDonneesGTI_div( diviseur:integer;ch1,ch2,ch3,ch4:boolean );

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form_FFT_mut_GTI2TransfertRegressiUtilisateur: TForm_FFT_mut_GTI2TransfertRegressiUtilisateur;
  Cochages     : array[1..10] of TCheckBox;
  CochagesMONO : array[1..10] of TCheckBox;
  PourCent     : array[1..10] of array[1..4] of TRadioButton;
  Tecrans      : array[1..4]  of Tpaintbox;
  TBoxMulti    : array[1..10] of TGroupBox;
implementation


uses  Unit_FFT_mut_GTI2{,regressispecdecl}{,Demodde},UnitTransfertRegressi,clipbrd;    //permet la liason avec les varaibles de principal
{$R *.dfm}

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
      Form_FFT_mut_GTI2.RetourDEMenuRegUtilisateurClick(Sender);
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.FormCreate(Sender: TObject);
begin
    Form_FFT_mut_GTI2TransfertRegressiUtilisateur.Top:=0;
    Form_FFT_mut_GTI2TransfertRegressiUtilisateur.Left:=0;

    Tecrans[1]:=PaintBoxECRAN1;
    Tecrans[2]:=PaintBoxECRAN2;
    Tecrans[3]:=PaintBoxECRAN3;
    Tecrans[4]:=PaintBoxECRAN4;

    TBoxMulti[1]:=GroupBoxEnrg1;
    TBoxMulti[2]:=GroupBoxEnrg2;
    TBoxMulti[3]:=GroupBoxEnrg3;
    TBoxMulti[4]:=GroupBoxEnrg4;
    TBoxMulti[5]:=GroupBoxEnrg5;
    TBoxMulti[6]:=GroupBoxEnrg6;
    TBoxMulti[7]:=GroupBoxEnrg7;
    TBoxMulti[8]:=GroupBoxEnrg8;
    TBoxMulti[9]:=GroupBoxEnrg9;
    TBoxMulti[10]:=GroupBoxEnrg10;

    Cochages[1]:=CheckBoxEnregistrement1;
    Cochages[2]:=CheckBoxEnregistrement2;
    Cochages[3]:=CheckBoxEnregistrement3;
    Cochages[4]:=CheckBoxEnregistrement4;
    Cochages[5]:=CheckBoxEnregistrement5;
    Cochages[6]:=CheckBoxEnregistrement6;
    Cochages[7]:=CheckBoxEnregistrement7;
    Cochages[8]:=CheckBoxEnregistrement8;
    Cochages[9]:=CheckBoxEnregistrement9;
    Cochages[10]:=CheckBoxEnregistrement10;

    CochagesMONO[1]:=CheckBox1;
    CochagesMONO[2]:=CheckBox2;
    CochagesMONO[3]:=CheckBox3;
    CochagesMONO[4]:=CheckBox4;
    CochagesMONO[5]:=CheckBox5;
    CochagesMONO[6]:=CheckBox6;
    CochagesMONO[7]:=CheckBox7;
    CochagesMONO[8]:=CheckBox8;
    CochagesMONO[9]:=CheckBox9;
    CochagesMONO[10]:=CheckBox10;

    PourCent[1,1]:=RadioButton101;
    PourCent[1,2]:=RadioButton251;
    PourCent[1,3]:=RadioButton501;
    PourCent[1,4]:=RadioButton1001;

    PourCent[2,1]:=RadioButton102;
    PourCent[2,2]:=RadioButton252;
    PourCent[2,3]:=RadioButton502;
    PourCent[2,4]:=RadioButton1002;

    PourCent[3,1]:=RadioButton103;
    PourCent[3,2]:=RadioButton253;
    PourCent[3,3]:=RadioButton503;
    PourCent[3,4]:=RadioButton1003;

    PourCent[4,1]:=RadioButton104;
    PourCent[4,2]:=RadioButton254;
    PourCent[4,3]:=RadioButton504;
    PourCent[4,4]:=RadioButton1004;

    PourCent[5,1]:=RadioButton105;
    PourCent[5,2]:=RadioButton255;
    PourCent[5,3]:=RadioButton505;
    PourCent[5,4]:=RadioButton1005;

    PourCent[6,1]:=RadioButton106;
    PourCent[6,2]:=RadioButton256;
    PourCent[6,3]:=RadioButton506;
    PourCent[6,4]:=RadioButton1006;

    PourCent[7,1]:=RadioButton107;
    PourCent[7,2]:=RadioButton257;
    PourCent[7,3]:=RadioButton507;
    PourCent[7,4]:=RadioButton1007;

    PourCent[8,1]:=RadioButton108;
    PourCent[8,2]:=RadioButton258;
    PourCent[8,3]:=RadioButton508;
    PourCent[8,4]:=RadioButton1008;

    PourCent[9,1]:=RadioButton109;
    PourCent[9,2]:=RadioButton259;
    PourCent[9,3]:=RadioButton509;
    PourCent[9,4]:=RadioButton1009;

    PourCent[10,1]:=RadioButton1010;
    PourCent[10,2]:=RadioButton2510;
    PourCent[10,3]:=RadioButton5010;
    PourCent[10,4]:=RadioButton10010;
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.ScrollBarINSTChange(Sender: TObject);
begin
    //LabelINST.Caption:=floattostrf(100/(ScrollBarINST.position))+' %';
    LabelINST.Caption:=floattostrf(100/(ScrollBarINST.position),ffFixed,3,1)+' %' ;
    LabelINSTTRANS.Caption:='Nombre d'+''' echantillons à transférer : '+floattostr(round(GetRecordLength()/ScrollBarINST.position));
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.FormShow(Sender: TObject);
//var
//i:integer;
begin
    LabelNBECH.Caption:= 'Nombre d'+''' echantillons disponibles : '+floattostr(GetRecordLength());
    LabelINSTTRANS.Caption:='Nombre d'+''' echantillons à transférer : '+floattostr(round(GetRecordLength()/ScrollBarINST.position));

    CheckBox1.Visible:=false;
    CheckBox2.Visible:=false;
    CheckBox3.Visible:=false;
    CheckBox4.Visible:=false;
    CheckBox5.Visible:=false;
    CheckBox6.Visible:=false;
    CheckBox7.Visible:=false;
    CheckBox8.Visible:=false;
    CheckBox9.Visible:=false;
    CheckBox10.Visible:=false;

    CheckBox1.checked:=false;
    CheckBox2.checked:=false;
    CheckBox3.checked:=false;
    CheckBox4.checked:=false;
    CheckBox5.checked:=false;
    CheckBox6.checked:=false;
    CheckBox7.checked:=false;
    CheckBox8.checked:=false;
    CheckBox9.checked:=false;
    CheckBox10.checked:=false;

    GroupBoxEnrg1.Visible:=false;
    GroupBoxEnrg2.Visible:=false;
    GroupBoxEnrg3.Visible:=false;
    GroupBoxEnrg4.Visible:=false;
    GroupBoxEnrg5.Visible:=false;
    GroupBoxEnrg6.Visible:=false;
    GroupBoxEnrg7.Visible:=false;
    GroupBoxEnrg8.Visible:=false;
    GroupBoxEnrg9.Visible:=false;
    GroupBoxEnrg10.Visible:=false;
    {
    GroupBoxEnrg1.enabled:=false;
    GroupBoxEnrg2.enabled:=false;
    GroupBoxEnrg3.enabled:=false;
    GroupBoxEnrg4.enabled:=false;
    GroupBoxEnrg5.enabled:=false;
    GroupBoxEnrg6.enabled:=false;
    GroupBoxEnrg7.enabled:=false;
    GroupBoxEnrg8.enabled:=false;
    GroupBoxEnrg9.enabled:=false;
    GroupBoxEnrg10.enabled:=false;
    }
    if Unit_FFT_mut_GTI2.courbes[1].Valide  = true then begin GroupBoxEnrg1.Visible:=true; CheckBoxEnregistrement1.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[1].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[2].Valide  = true then begin GroupBoxEnrg2.Visible:=true; CheckBoxEnregistrement2.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[2].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[3].Valide  = true then begin GroupBoxEnrg3.Visible:=true; CheckBoxEnregistrement3.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[3].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[4].Valide  = true then begin GroupBoxEnrg4.Visible:=true; CheckBoxEnregistrement4.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[4].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[5].Valide  = true then begin GroupBoxEnrg5.Visible:=true; CheckBoxEnregistrement5.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[5].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[6].Valide  = true then begin GroupBoxEnrg6.Visible:=true; CheckBoxEnregistrement6.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[6].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[7].Valide  = true then begin GroupBoxEnrg7.Visible:=true; CheckBoxEnregistrement7.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[7].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[8].Valide  = true then begin GroupBoxEnrg8.Visible:=true; CheckBoxEnregistrement8.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[8].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[9].Valide  = true then begin GroupBoxEnrg9.Visible:=true; CheckBoxEnregistrement9.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[9].long_ech) +' pts' end;
    if Unit_FFT_mut_GTI2.courbes[10].Valide = true then begin GroupBoxEnrg10.Visible:=true; CheckBoxEnregistrement10.caption:='Nb de points dispo. : '+floattostr(Unit_FFT_mut_GTI2.courbes[10].long_ech) +' pts' end;

    if Unit_FFT_mut_GTI2.courbes[1].Valide  = true then begin  CheckBox1.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[2].Valide  = true then begin  CheckBox2.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[3].Valide  = true then begin  CheckBox3.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[4].Valide  = true then begin  CheckBox4.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[5].Valide  = true then begin  CheckBox5.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[6].Valide  = true then begin  CheckBox6.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[7].Valide  = true then begin  CheckBox7.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[8].Valide  = true then begin  CheckBox8.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[9].Valide  = true then begin  CheckBox9.Visible:=true end;
    if Unit_FFT_mut_GTI2.courbes[10].Valide = true then begin  CheckBox10.Visible:=true end;
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.ButtonTransfertClick(Sender: TObject);
//var //chemin_windows         : array[0..255] of Char;
//    chemin                : shortstring;
  //  t,v1,v2               : double;
  //  fichier                : textfile;
 //   bloc1                  : textfile;
   // bloc2                  : textfile;

  //  fichier2                : textfile;

 //   inc ,j                   : integer;
//    calibre1,calibre2      : double;
 //   freqR                  : dword;
  //  Recordlength           : dword;
//    chaine                 : shortstring;
  //  chemin_de_regressi     : shortstring;
    // NbrEchTrans           :integer;
//     PasIncrement          :integer;
begin

EnvoieDonneesGTI_div(ScrollBarINST.position, congiguration.VoieVisible[1],
                                           congiguration.VoieVisible[2],
                                           congiguration.VoieVisible[3],
                                           congiguration.VoieVisible[4]);
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.EnvoieDonneesGTI_div( diviseur:integer;ch1,ch2,ch3,ch4:boolean );
var i : integer;
    ligne : string;
 //   BouLigne : string;
 //   zero,coeff : single;
 //   zero1,zero2,zero3,zero4: single;
 //   coeff1, coeff2, coeff3, coeff4: single;
    freq:dword;
    Recordlength:dword;
const
    Ndata = 32;
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';
begin
     FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin
          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Oscilloscope Instantané Utilisateur'); // 3ème = Titre de pagebegin
     ligne := 'f';
     if ch1 then ligne :=ligne +crTab+'Y1';
     if ch2 then ligne :=ligne +crTab+'Y2';
     if ch3 then ligne :=ligne +crTab+'Y3';
     if ch4 then ligne :=ligne +crTab+'Y4';
     Add(ligne);

     ligne := 'Hz';
     if ch1 then ligne :=ligne +crTab+'V';
     if ch2 then ligne :=ligne +crTab+'V';
     if ch3 then ligne :=ligne +crTab+'V';
     if ch4 then ligne :=ligne +crTab+'V';
     Add(ligne);
     //exemple avec données GTI2/HS3
     freq        :=GetSampleFrequency();
     Recordlength:=GetRecordLength();
     for i:=0 to (round(Recordlength/diviseur)-1) do
       begin
            ligne :=FloatToStr(i/freq);
                    if ch1 then ligne :=ligne +crTab+FloatToStr(Spectre1 [i*diviseur]);
                    if ch2 then ligne :=ligne +crTab+FloatToStr(Spectre2 [i*diviseur]);
                    if ch3 then ligne :=ligne +crTab+FloatToStr(Spectre3 [i*diviseur]);
                    if ch4 then ligne :=ligne +crTab+FloatToStr(Spectre4 [i*diviseur]);
            Add(ligne);
       end;

     ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.TRANSMulti(Sender: TObject);
var //chemin_windows         : array[0..255] of Char;
  //  chemin                : shortstring;
 //   t,v1,v2               : double;
 //   fichier                : textfile;
  //  bloc1                  : textfile;
  //  bloc2                  : textfile;

 //   fichier2                : textfile;

    j                   : integer;
//    calibre1,calibre2      : double;
 //   freqR                  : dword;
//    Recordlength           : dword;
 //   chaine                 : shortstring;
 //   chemin_de_regressi     : shortstring;
    diviseur               :integer;

begin
 if nb_courbes_stockees<>0 then
 begin

         for j:=1 to nb_courbes_stockees do
             begin
                  sleep(250);
                  if cochages[j].Checked=true then
                  begin
                  if Pourcent[j,1].Checked=true then diviseur:=10;
                  if Pourcent[j,2].Checked=true then diviseur:=4;
                  if Pourcent[j,3].Checked=true then diviseur:=2;
                  if Pourcent[j,4].Checked=true then diviseur:=1;
                  EnvoieDonneesGTI_Enreg_Multi({NoEnrg:integer}j,
                                              {diviseur:integer}diviseur,
                                              {ALL}true,
                                              {Ch1}courbes[j].Tmode[1],
                                              {Ch2}courbes[j].Tmode[2],
                                              {Ch3}courbes[j].Tmode[3],
                                              {Ch4}courbes[j].Tmode[4]);
                  end;
              end;
 end;

end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.EnvoieDonneesGTI_Enreg_Multi(NoEnrg:integer;diviseur:integer;ALL,Ch1,Ch2,Ch3,Ch4:boolean);
var i : integer;
    ligne : string;
   // BouLigne : string;
 //   freq:dword;
  //  Recordlength:dword;
const
    Ndata = 32;
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';
begin
     FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin


          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Oscilloscope Enregistrements Multi-Pages'); // 3ème = Titre de pagebegin

//k:=0;

     if ALL then
     begin
          ligne := 'f'+crTab+'Y1'+crTab+'Y2'+crTab+'Y3'+crTab+'Y4';
          Add(ligne);
          ligne := 'Hz'+crTab+'V'+crTab+'V'+crTab+'V'+crTab+'V';
          Add(ligne);
          for i:=0 to round(courbes[NoEnrg].long_ech/diviseur)-1 do
          begin
              ligne :=FloatToStr(diviseur*i/courbes[NoEnrg].freq_ech);
              ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie1 [i*diviseur]);
              ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie2 [i*diviseur]);
              ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie3 [i*diviseur]);
              ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie4 [i*diviseur]);
              Add(ligne);
          end;
      end
      else
      begin
          ligne := 'f';
          if ch1 then ligne :=ligne +crTab+'Y1';
          if ch2 then ligne :=ligne +crTab+'Y2';
          if ch3 then ligne :=ligne +crTab+'Y3';
          if ch4 then ligne :=ligne +crTab+'Y4';
          Add(ligne);
          ligne := 'Hz';
          if ch1 then ligne :=ligne +crTab+'V';
          if ch2 then ligne :=ligne +crTab+'V';
          if ch3 then ligne :=ligne +crTab+'V';
          if ch4 then ligne :=ligne +crTab+'V';
          Add(ligne);
          for i:=0 to round(courbes[NoEnrg].long_ech/diviseur)-1 do
          begin
               ligne :=FloatToStr(diviseur*i/courbes[NoEnrg].freq_ech);
               if ch1 then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie1[i*diviseur]);
               if ch2 then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie2[i*diviseur]);
               if ch3 then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie3[i*diviseur]);
               if ch4 then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie4[i*diviseur]);
               Add(ligne);
          end;

      end;

      sleep(250);
      ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;
{
 FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin
          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Traceur'); // 3ème = Titre de pagebegin

          ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;
}
end;


procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.ButtonMONOClick(Sender: TObject);
begin
     EnvoieDonneesGTI_Enreg_Mono(1);
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.EnvoieDonneesGTI_Enreg_Mono(diviseur:integer);
var i,k : integer;
    ligne : string;
    ligne2: string;
 //   BouLigne : string;
 //   freq:dword;
  //  Recordlength:dword;
    NoEnrg:integer;
const
    Ndata = 32;
    crTab = #9;
    SymbReg = '£';
    SymbReg2 = '&';
begin
     FormTransfertRegressi.Donnees := TstringList.create;
      With FormTransfertRegressi.Donnees do
      begin
          Clear;
          Add('Cabalab');
          if HS3 then Add('Appareil utilisé : TiePie HS3');
          if GTI2 then Add('Appareil utilisé : Orphy GTI2');
          Add('Oscilloscope Enregistrements Mono-Page'); // 3ème = Titre de pagebegin
     ligne := 't';
     ligne2:= 's';

     for NoEnrg:=1 to 10 do
     begin
          if cochagesMONO[NoEnrg].Checked=true then
          begin

              if courbes[NoEnrg].Tmode[0]=true then
              begin
                  ligne :=ligne+crTab+'Y1E'+inttostr(NoEnrg)+crTab+'Y2E'+inttostr(NoEnrg)+crTab+'Y3E'+inttostr(NoEnrg)+crTab+'Y4E'+inttostr(NoEnrg);
                  ligne2:=ligne2+crTab+'V'+crTab+'V'+crTab+'V'+crTab+'V';
              end
              else
              begin
                  if courbes[NoEnrg].Tmode[1] then ligne :=ligne +crTab+'Y1E'+inttostr(NoEnrg);
                  if courbes[NoEnrg].Tmode[2] then ligne :=ligne +crTab+'Y2E'+inttostr(NoEnrg);
                  if courbes[NoEnrg].Tmode[3] then ligne :=ligne +crTab+'Y3E'+inttostr(NoEnrg);
                  if courbes[NoEnrg].Tmode[4] then ligne :=ligne +crTab+'Y4E'+inttostr(NoEnrg);
                  ligne2:= ligne2+crTab+'V'
              end;
          end;
     end;
     Add(ligne);
     Add(ligne2);


     for NoEnrg:=1 to 10 do
     begin
          if cochagesMONO[NoEnrg].Checked=true then  k:=NoEnrg;
     end;


     for i:=0 to round(courbes[k].long_ech/diviseur)-1 do
     begin
          ligne :=FloatToStr(diviseur*i/courbes[k].freq_ech);
          for NoEnrg:=1 to 10 do
          begin
              if cochagesMONO[NoEnrg].Checked=true then
              begin
                  if courbes[NoEnrg].Tmode[0]=true then
                  begin
                      ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie1 [i*diviseur]);
                      ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie2 [i*diviseur]);
                      ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie3 [i*diviseur]);
                      ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie4 [i*diviseur]);
                  end
                  else
                  begin
                      if courbes[NoEnrg].Tmode[1] then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie1[i*diviseur]);
                      if courbes[NoEnrg].Tmode[2] then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie2[i*diviseur]);
                      if courbes[NoEnrg].Tmode[3] then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie3[i*diviseur]);
                      if courbes[NoEnrg].Tmode[4] then ligne :=ligne +crTab+FloatToStr(courbes[NoEnrg].voie4[i*diviseur]);
                  end;
               end;  {if cochagesMONO[NoEnrg].Checked=true}
          end;  {for NoEnrg:=1 to 10}
          Add(ligne);
     end;

      ClipBoard.AsText := FormTransfertRegressi.Donnees.text;
          FormTransfertRegressi.Execute('ClIP|ADD');

      end;
      FormTransfertRegressi.Donnees.free;
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.DeblocageTransfertMONO(Sender: TObject);
begin
     if (checkBox1.Checked=true)
     or (checkBox2.Checked=true)
     or (checkBox3.Checked=true)
     or (checkBox4.Checked=true)
     or (checkBox5.Checked=true)
     or (checkBox6.Checked=true)
     or (checkBox7.Checked=true)
     or (checkBox8.Checked=true)
     or (checkBox9.Checked=true)
     or (checkBox10.Checked=true)
     then
     ButtonMONO.Enabled:=true
     else
     ButtonMONO.Enabled:=false;
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.DeblocageTransfertMULTI(Sender: TObject);
begin

     if (cochages[1].Checked=true)
     or (cochages[2].Checked=true)
     or (cochages[3].Checked=true)
     or (cochages[4].Checked=true)
     or (cochages[5].Checked=true)
     or (cochages[6].Checked=true)
     or (cochages[7].Checked=true)
     or (cochages[8].Checked=true)
     or (cochages[9].Checked=true)
     or (cochages[10].Checked=true)
     then
     ButtonMulti.Enabled:=true
     else
     ButtonMulti.Enabled:=false;
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.GroupBoxMultiMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
i,j:integer;
begin

   for i:=1 to 4 do
   begin
       EcranNoir (Tecrans[i]);
   end;

   for i:=1 to 10 do
   begin
        if sender =TBoxMulti[i] then
        begin
            Label3.caption:='Enregistrement No : '+inttostr(i);
            for j:=1 to 4 do
            begin
                if (courbes [i].Tmode[j]=true) then
                begin
                    ResetEcranEnregistrement(Tecrans[j]);
                    affichageEnregistrement(Tecrans[j],j,i);
                end;
            end;
         end;
        {
        affichageEnregistrement(Tecrans[1];1);
        affichageEnregistrement(Tecrans[2];2);
        affichageEnregistrement(Tecrans[3];3);
        affichageEnregistrement(Tecrans[4];4);
        }
   end;
end;


procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.EcranNoir (sender: Tpaintbox);

begin
// effaçage
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.pen.Color := clblack;
    Sender.Canvas.Brush.Color := clblack;
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);
end;


procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.ResetEcranEnregistrement (sender: Tpaintbox);
var
X,Y,t:integer;
begin
// effaçage
{
    Sender.Canvas.Pen.Width :=1;
    Sender.Canvas.pen.Color := clblack;
    Sender.Canvas.Brush.Color := clblack;
    Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);
 }
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
    {
    if congiguration.DecalZeros=false then
    begin
    Sender.Canvas.Pen.Color := congiguration.couleurs[5];
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
    end;
    }
    Sender.Canvas.Pen.Color := clwhite;
    Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
    Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
end;

procedure TForm_FFT_mut_GTI2TransfertRegressiUtilisateur.affichageEnregistrement(Sender: Tpaintbox;CH:integer;NumEnrg:integer);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2, Calibre3 , Calibre4: Double;
    Longueur_Acquisition : dword;
//    x,y,t:integer ;
begin

Longueur_Acquisition := courbes [NumEnrg].long_ech;
Calibre1             := courbes [NumEnrg].calibCh1_ech;
Calibre2             := courbes [NumEnrg].calibCh2_ech;
Calibre3             := courbes [NumEnrg].calibCh3_ech;
Calibre4             := courbes [NumEnrg].calibCh4_ech;
// Affichage Voie 1
    //if (courbes [NumEnrg].mode=ch1) or (courbes [NumEnrg].mode=chop) then
if CH=1 then
  begin
    if (courbes [NumEnrg].Tmode[1]=true) then
    begin
    Sender.Canvas.Pen.Color := courbes [NumEnrg].couleur1;
    Sender.Canvas.MoveTo(0, Round(  {(invech1)*}courbes [NumEnrg].voie1[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          Curseur_Ordonnee := Round(  -{(invech1)*}courbes [NumEnrg].voie1[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;

    Sender.Canvas.Pen.Color := clWhite;
    end;
  end;
// Affichage Voie 2
   //  if (courbes [NumEnrg].mode=ch2) or (courbes [NumEnrg].mode=chop)then
if CH=2 then
  begin
     if (courbes [NumEnrg].Tmode[2]=true)  then
    begin
    Sender.Canvas.Pen.Color := courbes [NumEnrg].couleur2;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [NumEnrg].voie2[ 0 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) ));


          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [NumEnrg].voie2[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;
  end;
// Affichage Voie 3
    // if (courbes [NumEnrg].mode=ch3) or (courbes [NumEnrg].mode=chop)then
if CH=3 then
  begin
     if (courbes [NumEnrg].Tmode[3]=true)  then
    begin
    Sender.Canvas.Pen.Color := courbes [NumEnrg].couleur3;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [NumEnrg].voie3[ 0 ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) ));

          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [NumEnrg].voie3[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre3 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;
  end;
// Affichage Voie 4
   //  if (courbes [NumEnrg].mode=ch4) or (courbes [NumEnrg].mode=chop)then
if CH=4 then
  begin
    if (courbes [NumEnrg].Tmode[4]=true)  then
    begin
    Sender.Canvas.Pen.Color := courbes [NumEnrg].couleur4;
    Sender.Canvas.MoveTo(0, Round(  -{(invech2)*}courbes [NumEnrg].voie4[ 0 ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) ));

          for Curseur_Abscisse := 1 to Sender.Width - 1 do
          begin
          Curseur_Ordonnee := Round(  -{(invech2)*}courbes [NumEnrg].voie4[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre4 + (Sender.Height/2) );
          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    Sender.Canvas.Pen.Color := clWhite;
    end;
  end;

end;


end.
