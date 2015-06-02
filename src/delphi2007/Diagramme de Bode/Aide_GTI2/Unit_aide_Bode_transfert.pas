unit Unit_aide_Bode_transfert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TBode_transfert = class(TForm)
    Edit1: TEdit;
    utilisation2: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure utilisation2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Bode_transfert: TBode_transfert;

implementation

uses Unit_aide_Bode;

{$R *.dfm}

procedure TBode_transfert.utilisation2Click(Sender: TObject);
begin
Bode_utilisation.Visible:=True;
Bode_utilisation.BringToFront;
Bode_transfert.Visible := False ;
end;

end.
