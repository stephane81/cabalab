unit UnitBodeNbMesures;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormBodeNbMesures = class(TForm)
    Label1: TLabel;
    nb_pts_bode: TEdit;
    Button1: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  FormBodeNbMesures: TFormBodeNbMesures;

implementation

uses UnitBodePrincipal;

{$R *.DFM}

procedure TFormBodeNbMesures.Button1Click(Sender: TObject);
var ind : integer ;
begin
 try
  ind:=Strtoint(FormBodeNbMesures.nb_pts_bode.text)-1;
    if ind >1000 then
     begin
     showmessage('Maximum 1000 points ...');
     ind  := 999 ;
     end;
  FormBodePrincipal.Bode.indice_final:=ind;
  FormBodeNbMesures.visible := false;
  FormBodePrincipal.visible:= true;
  FormBodePrincipal.show;
 except
 showmessage('Erreur de syntaxe...');
 end;




end;

procedure TFormBodeNbMesures.Button3Click(Sender: TObject);
begin

FormBodeNbMesures.visible := false;
FormBodePrincipal.visible:= true;
FormBodePrincipal.show;

end;

end.
