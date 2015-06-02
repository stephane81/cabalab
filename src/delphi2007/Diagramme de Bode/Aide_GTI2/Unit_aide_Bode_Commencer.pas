unit Unit_aide_Bode_Commencer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TBode_Commencer = class(TForm)
    Edit2: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    utilisation2: TEdit;
    procedure utilisationClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Bode_Commencer: TBode_Commencer;

implementation

uses Unit_aide_Bode;

{$R *.dfm}

procedure TBode_Commencer.utilisationClick(Sender: TObject);
begin
Bode_utilisation.Visible:=True;
Bode_utilisation.BringToFront;
Bode_Commencer.Visible := False ;
end;

end.
