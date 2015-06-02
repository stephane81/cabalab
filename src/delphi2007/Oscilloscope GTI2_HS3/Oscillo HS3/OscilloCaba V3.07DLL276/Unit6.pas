unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dlldecl;






type
  TFormRegressiTransfert = class(TForm)
    GroupBoxINSTANTANE: TGroupBox;
    Label1: TLabel;
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
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBarINSTChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonTransfertClick(Sender: TObject);
    procedure TRANSMONO(Sender: TObject);
    procedure TRANSMulti(Sender: TObject);
    procedure DeblocageTransfertMONO(Sender: TObject);
    procedure DeblocageTransfertMULTI(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormRegressiTransfert: TFormRegressiTransfert;
  Cochages     : array[1..10] of TCheckBox;
  CochagesMONO : array[1..10] of TCheckBox;
  PourCent : array[1..10] of array[1..4] of TRadioButton;
implementation


uses  Principal;    //permet la liason avec les varaibles de principal
{$R *.dfm}

procedure TFormRegressiTransfert.FormCreate(Sender: TObject);
begin
    FormRegressiTransfert.Top:=0;
    FormRegressiTransfert.Left:=0;

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

procedure TFormRegressiTransfert.ScrollBarINSTChange(Sender: TObject);
begin
    //LabelINST.Caption:=floattostrf(100/(ScrollBarINST.position))+' %';
    LabelINST.Caption:=floattostrf(100/(ScrollBarINST.position),ffFixed,3,1)+' %' ;
    LabelINSTTRANS.Caption:='Nombre d'+''' echantillons à transférer : '+floattostr(round(GetRecordLength()/ScrollBarINST.position));
end;

procedure TFormRegressiTransfert.FormShow(Sender: TObject);
var
i:integer;
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

    if principal.courbes[1].Valide  = true then begin GroupBoxEnrg1.Visible:=true; CheckBoxEnregistrement1.caption:='Nb de points dispo. : '+floattostr(principal.courbes[1].long_ech) +' pts' end;
    if principal.courbes[2].Valide  = true then begin GroupBoxEnrg2.Visible:=true; CheckBoxEnregistrement2.caption:='Nb de points dispo. : '+floattostr(principal.courbes[2].long_ech) +' pts' end;
    if principal.courbes[3].Valide  = true then begin GroupBoxEnrg3.Visible:=true; CheckBoxEnregistrement3.caption:='Nb de points dispo. : '+floattostr(principal.courbes[3].long_ech) +' pts' end;
    if principal.courbes[4].Valide  = true then begin GroupBoxEnrg4.Visible:=true; CheckBoxEnregistrement4.caption:='Nb de points dispo. : '+floattostr(principal.courbes[4].long_ech) +' pts' end;
    if principal.courbes[5].Valide  = true then begin GroupBoxEnrg5.Visible:=true; CheckBoxEnregistrement5.caption:='Nb de points dispo. : '+floattostr(principal.courbes[5].long_ech) +' pts' end;
    if principal.courbes[6].Valide  = true then begin GroupBoxEnrg6.Visible:=true; CheckBoxEnregistrement6.caption:='Nb de points dispo. : '+floattostr(principal.courbes[6].long_ech) +' pts' end;
    if principal.courbes[7].Valide  = true then begin GroupBoxEnrg7.Visible:=true; CheckBoxEnregistrement7.caption:='Nb de points dispo. : '+floattostr(principal.courbes[7].long_ech) +' pts' end;
    if principal.courbes[8].Valide  = true then begin GroupBoxEnrg8.Visible:=true; CheckBoxEnregistrement8.caption:='Nb de points dispo. : '+floattostr(principal.courbes[8].long_ech) +' pts' end;
    if principal.courbes[9].Valide  = true then begin GroupBoxEnrg9.Visible:=true; CheckBoxEnregistrement9.caption:='Nb de points dispo. : '+floattostr(principal.courbes[9].long_ech) +' pts' end;
    if principal.courbes[10].Valide = true then begin GroupBoxEnrg10.Visible:=true; CheckBoxEnregistrement10.caption:='Nb de points dispo. : '+floattostr(principal.courbes[10].long_ech) +' pts' end;

    if principal.courbes[1].Valide  = true then begin  CheckBox1.Visible:=true end;
    if principal.courbes[2].Valide  = true then begin  CheckBox2.Visible:=true end;
    if principal.courbes[3].Valide  = true then begin  CheckBox3.Visible:=true end;
    if principal.courbes[4].Valide  = true then begin  CheckBox4.Visible:=true end;
    if principal.courbes[5].Valide  = true then begin  CheckBox5.Visible:=true end;
    if principal.courbes[6].Valide  = true then begin  CheckBox6.Visible:=true end;
    if principal.courbes[7].Valide  = true then begin  CheckBox7.Visible:=true end;
    if principal.courbes[8].Valide  = true then begin  CheckBox8.Visible:=true end;
    if principal.courbes[9].Valide  = true then begin  CheckBox9.Visible:=true end;
    if principal.courbes[10].Valide = true then begin  CheckBox10.Visible:=true end;



end;

procedure TFormRegressiTransfert.ButtonTransfertClick(Sender: TObject);
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
     NbrEchTrans           :integer;
     PasIncrement          :integer;
begin

try
assignfile(fichier2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\cheminregcabalab.txt');
reset(fichier2);
readln(fichier2,chemin_de_regressi);
closefile(fichier2);
except
end;

Recordlength:=GetRecordLength();
NbrEchTrans :=round(Recordlength/ScrollBarINST.position);      //le % est calculé a partir du pas d'ech choisie par la scrollbar
PasIncrement:=ScrollBarINST.position;
//showmessage(floattostr(NbrEchTrans ));        testes de programation!
//showmessage(floattostr(PasIncrement ));


freqR:=getSampleFrequency();

GetSensitivity( 1, @calibre1);
GetSensitivity( 2, @calibre2);

GetWindowsDirectory(@chemin_windows,255);
chemin:=shortstring(chemin_windows)+'\temp\regtemp.rw3';

assignfile(fichier,chemin);
rewrite(fichier);

assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2.txt');

reset(bloc1);
   while not (eof(bloc1)) do
         begin
              readln(bloc1,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc1);

writeln(fichier,'£1 PAGE COMMENT');
writeln(fichier,'Enregistrement Oscilloscope HS3 page 1');
writeln(fichier,'&' + inttostr(NbrEchTrans ) +' VALEUR VAR');

   for inc:=0 to NbrEchTrans-1 do
       begin
            t:=PasIncrement*inc/freqR;
            v1:=(Ch1DoubleArray [inc*PasIncrement]);
            v2:=(Ch2DoubleArray [inc*PasIncrement]);
            writeln(fichier,t,' ',v1,' ',v2);
       end;

reset(bloc2);
   while not (eof(bloc2)) do
         begin
              readln(bloc2,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc2);
closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;



procedure TFormRegressiTransfert.TRANSMONO(Sender: TObject);
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
    diviseur:integer;
begin



try
assignfile(fichier2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\cheminregcabalab.txt');
reset(fichier2);
readln(fichier2,chemin_de_regressi);
closefile(fichier2);
except
end;




GetWindowsDirectory(@chemin_windows,255);
chemin:=shortstring(chemin_windows)+'\temp\regtemptxt.txt';

assignfile(fichier,chemin);
rewrite(fichier);


writeln(fichier,'OscilloCaba MonoPage');

write(fichier,'t',#9);

inc:=0;
for j:=1 to nb_courbes_stockees do
begin
   if cochagesMONO[j].Checked=true then
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
end;
writeln(fichier);
write(fichier,'s',#9);

if RadioButton1.Checked=true then diviseur:=10;
if RadioButton2.Checked=true then diviseur:=4;
if RadioButton3.Checked=true then diviseur:=2;
if RadioButton4.Checked=true then diviseur:=1;


for j:=1 to inc do
begin
write(fichier,'V',#9,'V',#9);

end;

writeln(fichier);

     for inc:=0 to round(courbes[1].long_ech/diviseur)-1 do
         begin
              t:=diviseur*inc/courbes[1].freq_ech;
              write(fichier,t);
              for j:=1 to nb_courbes_stockees do
                  begin
                       if ( courbes[j].mode=Ch1 ) or ( courbes[j].mode=Chop)
                       then
                       begin
                       v1:=courbes[j].voie1[inc*diviseur];
                       write(fichier,#9,v1);
                       end;

                       if ( courbes[j].mode=Ch2 ) or ( courbes[j].mode=Chop)
                       then
                       begin
                       v2:=courbes[j].voie2[inc*diviseur];
                       write(fichier,#9,v2);
                       end;
                  end;
              writeln(fichier);
         end;


closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;



procedure TFormRegressiTransfert.TRANSMulti(Sender: TObject);
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
    diviseur               :integer;

begin

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
rewrite(fichier);

assignfile(bloc1,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC1.txt');
assignfile(bloc2,ExtractFilePath(Application.ExeName)+'\FichierPourRegressi\BLOC2.txt');

reset(bloc1);
   while not (eof(bloc1)) do
         begin
              readln(bloc1,chaine);
              writeln(fichier,chaine);
         end;
closefile(bloc1);

{écriture voies stockées }
 if nb_courbes_stockees<>0 then             ///!!!!modif?
 begin

         for j:=1 to nb_courbes_stockees do      ///!!!!modif?
             begin

                  if cochages[j].Checked=true then
                  begin
                  if Pourcent[j,1].Checked=true then diviseur:=10;
                  if Pourcent[j,2].Checked=true then diviseur:=4;
                  if Pourcent[j,3].Checked=true then diviseur:=2;
                  if Pourcent[j,4].Checked=true then diviseur:=1;

                  writeln(fichier,'£1 PAGE COMMENT');
                  writeln(fichier,courbes[j].nom);
                  writeln(fichier,'&' + inttostr(round(courbes[j].long_ech/diviseur)) +' VALEUR VAR');


                  for inc:=0 to round(courbes[j].long_ech/diviseur)-1 do
                      begin
                           t:=diviseur*inc/courbes[j].freq_ech;
                           if ( courbes[j].mode=Ch1 ) or ( courbes[j].mode=Chop)
                           then v1:=courbes[j].voie1[inc*diviseur]
                           else v1:=0;
                           if ( courbes[j].mode=Ch2 ) or ( courbes[j].mode=Chop)
                           then v2:=courbes[j].voie2[inc*diviseur]
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


             end;
  end;
closefile(fichier);
chemin:=chemin_de_regressi + ' ' + chemin + #0 ;
winexec(@chemin[1],SW_SHOWMAXIMIZED);
end;




procedure TFormRegressiTransfert.DeblocageTransfertMONO(Sender: TObject);
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

procedure TFormRegressiTransfert.DeblocageTransfertMULTI(Sender: TObject);
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

end.
