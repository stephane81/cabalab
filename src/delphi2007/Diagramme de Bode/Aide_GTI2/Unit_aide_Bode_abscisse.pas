unit Unit_aide_Bode_abscisse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TBode_abscisse = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    utilisation2: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    procedure logoClick(Sender: TObject);
    procedure utilisationClick(Sender: TObject);
    procedure ordonneeClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Bode_abscisse: TBode_abscisse;

implementation

uses Unit_aide_Bode, Unit_aide_Bode_ordonnee, Unit_aide_Bode_logo;

{$R *.dfm}

procedure TBode_abscisse.logoClick(Sender: TObject);
begin
Bode_logo.Visible:=True;
Bode_logo.BringToFront;
Bode_abscisse.Visible := False ;
end;

procedure TBode_abscisse.ordonneeClick(Sender: TObject);
begin
Bode_ordonnee.Visible:=True;
Bode_ordonnee.BringToFront;
Bode_abscisse.Visible := False ;
end;

procedure TBode_abscisse.utilisationClick(Sender: TObject);
begin
Bode_utilisation.Visible:=True;
Bode_utilisation.BringToFront;
Bode_abscisse.Visible := False ;
end;

end.
