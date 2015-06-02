unit Unit_aide_Bode_stockage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TBode_stockage = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    utilisation2: TEdit;
    procedure utilisationClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Bode_stockage: TBode_stockage;

implementation

uses Unit_aide_Bode;

{$R *.dfm}

procedure TBode_stockage.utilisationClick(Sender: TObject);
begin
Bode_utilisation.Visible:=True;
Bode_utilisation.BringToFront;
Bode_stockage.Visible := False ;
end;

end.
