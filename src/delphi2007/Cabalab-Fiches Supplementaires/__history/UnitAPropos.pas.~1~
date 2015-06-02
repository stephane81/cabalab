unit UnitAPropos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;



type
  TFormAPropos = class(TForm)
    LabelTitre: TLabel;
    LabelVersion: TLabel;
    LabelDate: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormAPropos: TFormAPropos;

implementation

uses UnitCabalab;

{$R *.dfm}

procedure TFormAPropos.FormClick(Sender: TObject);
begin
FormApropos.Visible := false;
end;

procedure TFormAPropos.FormCreate(Sender: TObject);
{var      lptstrFilename :   LPTSTR ;
   dwHandle :DWORD ;
   dwLen :DWORD ;
  lpData : LPVOID  ;
begin
if GetFileVersionInfo(lptstrFilename, dwHandle,  dwLen, lpData );
  then
 showmessage('pas d''erreur')
 else
  showmessage('erreur');         }
begin

  if UnitCabalab.CabalabCube=true then
  LabelTitre.Caption := 'Cabalab Edition Supérieur'
  else
  LabelTitre.Caption := 'Cabalab Edition Lycée';

LabelDate.Caption := UnitCabalab.DateVersion;
LabelVersion.Caption := 'Version '+UnitCabalab.Version;
end;

end.
