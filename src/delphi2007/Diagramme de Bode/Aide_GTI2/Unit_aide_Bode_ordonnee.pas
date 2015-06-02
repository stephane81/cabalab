unit Unit_aide_Bode_ordonnee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TBode_ordonnee = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    utilisation2: TEdit;
    procedure utilisationClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Bode_ordonnee: TBode_ordonnee;

implementation

uses Unit_aide_Bode;

{$R *.dfm}

procedure TBode_ordonnee.utilisationClick(Sender: TObject);
begin
Bode_utilisation.Visible:=True;
Bode_utilisation.BringToFront;
Bode_ordonnee.Visible := False ;
end;

end.
