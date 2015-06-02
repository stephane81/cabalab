unit UnitTransfertRegressi;//Demodde;
{ Regressi Client pour recevoir les données de l'acquisition }
{!!!!!!!!   DdeMan   est dans les uses il faut donc l'ajouter au projet   !!!!!!!}
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Controls,
  Forms, Dialogs, StdCtrls, DdeMan, registry, clipbrd, graphics
  {demomain, constReg}; //importRegDll;

type
  TFormTransfertRegressi = class(TForm)
    ClientDDE: TDdeClientConv;
    ClientItem: TDdeClientItem;
    ServeurDDE: TDdeServerConv;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteMacro(Sender: TObject; Msg: TStrings);
  private
    //Donnees : TstringList;
    //procedure AjouteConstante;
    procedure AjouteOptions;
  public
      Donnees : TstringList;
      //procedure Execute(Ordre : string);    //ancienne version
      procedure Execute(Ordre : shortString);
      procedure EnvoieDonnees;
      const TemporisationEntreDeuxEnvoisDeDonneesVersRegressi = 250 ; // en ms
  end;

var
  FormTransfertRegressi: TFormTransfertRegressi;

implementation



{$R *.DFM}

const crTab = #9;
      SymbReg = '£';
      SymbReg2 = '&';

{
procedure TFormDDE.AjouteConstante;           //exemple
var valeurConst : extended;
begin with ConstanteDlg do begin
     if NomConstEdit.text='' then exit;
     try
        ValeurConst := StrToFloat(ValeurConstEdit.text);
        Donnees.Add('');
        Donnees.Add(NomConstEdit.text+crTab);
        Donnees.Add(UniteConstEdit.text+crTab);
        Donnees.Add(FloatToStrF(valeurConst,ffGeneral,5,2)+crTab);
     except
     end;
end end;
}
procedure TFormTransfertRegressi.AjouteOptions;         //exemple
begin
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
end;
//Ancienne version
{
procedure TFormDDE.Execute(Ordre : string);
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

//version modif avec semaphore suite rencontre micrelec juin 2007
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

//Utilisation :
//       if nouveauFichier
//            then Execute('CLIP|ADD')
//            else Execute('CLIP|LOAD');



procedure TFormTransfertRegressi.EnvoieDonnees;         //exemple
var i : integer;
    ligne : string;
    zero,coeff : single;
const
    Ndata = 1000;
begin
     Donnees := TstringList.create;
with Donnees do begin
     Clear;
     Add(Application.ExeName);
     Add('Démonstration communication');
     //Add(ConstanteDlg.EditComm.text); { commentaire de page }
     ligne := 'E'+crTab+'U';
     Add(ligne);
     ligne := 'W/m'+crTab+'V';
     Add(ligne);
     Coeff := random;
     Zero := random;
     for i := 0 to pred(Ndata) do begin
         ligne := FloatToStrF(i*0.01,ffGeneral,5,2)+crTab+
             FloatToStrF(i*coeff+zero,ffGeneral,5,2);
         Add(ligne);
     end;
     //AjouteConstante;
     ClipBoard.AsText := Donnees.text;
     {case FormMain.NewPageCB.itemIndex of
          0 : Execute('CLIP|LOAD');
          1 : Execute('ClIP|ADD');
     end;
     FormMain.NewPageCB.itemIndex := 1;}
     Execute('ClIP|ADD');
end;
     Donnees.free;
end;

procedure TFormTransfertRegressi.FormCreate(Sender: TObject);
var Ini : TRegIniFile;
begin
    Ini := TRegIniFile.create('Software\Regressi');
    ClientDDE.ServiceApplication := Ini.ReadString('Regressi','Path','c:\regwin\regressi.exe');
    Ini.Free;
end;

procedure TFormTransfertRegressi.ExecuteMacro(Sender: TObject; Msg: TStrings);
var Fonction,NomFichier : string;
    ArgStart,ArgEnd : byte;
begin
     if (Msg.Count = 1) then begin
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
           //FormMain.NewPageCB.itemIndex := 0;             //!!!!!!exemple
           //FormMain.setFocus;                             //!!!!!!exemple
           exit;
       end;
       except
            MessageDlg('Syntaxe Macro DDE : Fonction(Paramètre)', mtError, [mbOK], 0);
       end;
     end
     else MessageDlg('Un message à la fois SVP', mtError, [mbOk], 0);
end;


end.
