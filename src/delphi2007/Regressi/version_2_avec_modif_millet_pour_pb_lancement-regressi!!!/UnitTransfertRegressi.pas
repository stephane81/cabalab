unit UnitTransfertRegressi;
{ Regressi Client pour recevoir les données de l'acquisition }

 { !!!!!!!!!   version modifier pour resoudre le pB de lancement de REGRESSI avec les nouvelles versions !!!!!!!!!}




interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Controls,
  Forms, Dialogs, StdCtrls, DdeMan, registry, clipbrd, graphics,
 { demomain,} {constReg,} ExtCtrls{, importRegDll},dlldecl;

type
  TFormTransfertRegressi = class(TForm)
    ClientDDE: TDdeClientConv;
    ClientItem: TDdeClientItem;
    ServeurDDE: TDdeServerConv;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteMacro(Sender: TObject; Msg: TStrings);



  private

    
  public
    Donnees : TstringList;
    //procedure Execute(Ordre : string);
    procedure Execute(Ordre :shortString );
    procedure AjouteConstante;

    const TemporisationEntreDeuxEnvoisDeDonneesVersRegressi = 250 ; // en ms

  end;

var
  FormTransfertRegressi: TFormTransfertRegressi;



implementation
{$R *.DFM}

const crTab = #9;
      SymbReg = '£';
      SymbReg2 = '&';


procedure TFormTransfertRegressi.AjouteConstante;
var valeurConst : extended;
begin
{
with ConstanteDlg do begin
     if NomConstEdit.text='' then exit;
     try
        ValeurConst := StrToFloat(ValeurConstEdit.text);
        Donnees.Add('');
        Donnees.Add(NomConstEdit.text+crTab);
        Donnees.Add(UniteConstEdit.text+crTab);
        Donnees.Add(FloatToStrF(valeurConst,ffGeneral,5,2)+crTab);
     except
     end;
end
}
end;


{
procedure TFormTransfertRegressi.Execute(Ordre : string);
var Buf: PChar;
begin
     ClientDDE.SetLink('Regressi','ServeurDDE');
     ClientItem.DDEItem := 'ServeurItem';
(*
Dans DDEman ou si vous le faites vous même ,le lancement de Regressi
doit se faire par
     if WinExec(xxx, SW_SHOWDEFAULT) >= 32 then
et non pas
   if WinExec(xxx, SW_SHOWMINNOACTIVE) >= 32 then
qui lance sous Windows 95 Regressi en pure tâche de fond uniquement
sur la barre de tâche et non restaurable.
*)
     if ClientDDE.OpenLink
        then begin
            Buf := StrAlloc(Succ(Length(Ordre)));
            if not ClientDDE.ExecuteMacro(StrPCopy(Buf,Ordre), false) then begin
               ShowMessage(Ordre+' non exécuté');
            end;
            StrDispose(Buf);
            ClientDDE.CloseLink
        end
        else ShowMessage('Impossible de lancer Regressi');
end;
 }
procedure TFormTransfertRegressi.Execute(Ordre : shortString);
var NomCourt : shortString;

Procedure lanceRegressi;
var hSemaphore : integer;
    CharVal: array[0..1024] of Char;
begin
   StrPCopy(CharVal, NomCourt);
   hSemaphore := CreateSemaphore(nil,0,1,CharVal);
   if (hSemaphore<>0) and
      (GetLastError = Error_Already_Exists) then exit;
   StrPCopy(CharVal, ClientDde.ServiceApplication);
   if WinExec(CharVal, SW_SHOWDEFAULT) >= 32 then sleep(2000);
end;

procedure Lance;
var Buf: PChar;
begin
      Buf := StrAlloc(Succ(Length(Ordre)));
      if not ClientDDE.ExecuteMacro(StrPCopy(Buf,Ordre), false) then
           ShowMessage(Ordre+' non exécuté');
      StrDispose(Buf);
      ClientDDE.closeLink;
end;

begin
     NomCourt := AnsiUpperCase(ExtractFileName(ClientDDE.ServiceApplication));
     NomCourt := ChangeFileExt(NomCourt,'');
     LanceRegressi;
     ClientDDE.SetLink(NomCourt,'ServeurDDE');
     ClientItem.DDEItem := 'ServeurItem';
     if ClientDDE.OpenLink
        then Lance
        else begin
        // OpenLik false efface les paramètres
             ClientDDE.SetLink(NomCourt,'ServeurDDE');
             ClientItem.DDEItem := 'ServeurItem';
             sleep(1000);
             if ClientDDE.OpenLink
                then Lance
                else ShowMessage('Impossible de lancer Regressi');
        end;
end;





procedure TFormTransfertRegressi.FormCreate(Sender: TObject);     //FM : va chercher le chemin de regressi ds  Software\Regressi
var Ini : TRegIniFile;
begin

    Ini := TRegIniFile.create('Software\Regressi');
    ClientDDE.ServiceApplication := Ini.ReadString('Regressi','Path','c:\regwin\regressi.exe');
    Ini.Free;
end;

procedure TFormTransfertRegressi.ExecuteMacro(Sender: TObject; Msg: TStrings);     //????????????????????????????
var Fonction,NomFichier : string;
    ArgStart,ArgEnd : byte;
begin
    { if (Msg.Count = 1) then begin
       try
       ArgStart := Pos('(',Msg[0]);
       ArgEnd := Pos(')',Msg[0]);
       if (ArgStart >= ArgEnd)
          then begin
             NomFichier := '';
             ArgStart := length(Msg[0])
          end
          else begin
             NomFichier := Copy(Msg[0], Succ(ArgStart), ArgEnd - Succ(ArgStart));
             dec(ArgStart);
          end;
       Fonction := Copy(Msg[0], 1, ArgStart);
       if CompareText('FOCUS',Fonction) = 0 then begin
           //ConstanteDlg.NewPageCB.itemIndex := 0;
           RadioGroupTypeDeTransfert.itemIndex:= 0;
           //FormMain.setFocus;                      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           exit;
       end;
       except
            MessageDlg('Syntaxe Macro DDE : Fonction(Paramètre)', mtError, [mbOK], 0);
       end;
     end
     else MessageDlg('Un message à la fois SVP', mtError, [mbOk], 0);

     }
end;




end.


// exemple de transfert
// il faut ajouter uses UnitTransfertRegressi,clipbrd;


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
    Add(ligne);

    // Ajout Unités
    ligne := 'Hz';
    ligne :=ligne +crTab+'dB';
    ligne :=ligne +crTab+'rad';
    Add(ligne);

    // Ajout Données
    for i:=0 to Bode.indice_derniere_mesure do
    begin
      ligne :=FloatToStr(Balayage.frequence[i]);
      ligne :=ligne +crTab+FloatToStr(Bode.gain[i]);
      ligne :=ligne +crTab+FloatToStr(Bode.phase[i]);
      Add(ligne);
    end;

    // Ajout Option echelle horizontale en log
    Add(symbReg2+'2 LOGX');
    Add('1');
    Add('1');

    ClipBoard.AsText := FormTransfertRegressi.Donnees.text;

    FormTransfertRegressi.Execute('CLIP|LOAD');   // charge les données en tant que nouveau fichier


// exemple d'ajout d'options

donnees.Add(symbReg2+'2 NOMX');
        donnees.Add('x1');
        donnees.Add('x2');
        donnees.Add(symbReg2+'2 NOMY');
        donnees.Add('y1');
        donnees.Add('y2');
        donnees.Add(symbReg2+'2 LOGY');
        donnees.Add('0'); // ord(false) linéaire
        donnees.Add('1'); // ord(true) ordonnée en log
        donnees.Add(symbReg2+'2 Decibel');
        donnees.Add('0'); // on ne change rien
        donnees.Add('1'); // ord(true) ordonnée en dB
        donnees.Add(symbReg2+'2 LOGX');
        donnees.Add('0'); // ord(false) linéaire
        donnees.Add('1'); // ord(true) abscisse en log
        donnees.Add(symbReg2+'2 Couleur');
        donnees.Add(intToStr(clBlack)); // ord(false) linéaire
        donnees.Add(intToStr(clRed)); // ord(true) abscisse en log
        donnees.Add(symbReg2+'1 GRILLE');
        donnees.Add('0'); // ord(false) pas de grille
        donnees.Add(symbReg2+'1 POLAIRE');
        donnees.Add('1'); // ord(true) en polaire
