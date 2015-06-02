unit Unit_aide_Bode_logo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TBode_logo = class(TForm)
    utilisation2: TEdit;
    Edit1: TEdit;
    Image2: TImage;
    Edit2: TEdit;
    procedure utilisationClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Bode_logo: TBode_logo;

implementation

uses Unit_aide_Bode;

{$R *.dfm}


procedure TBode_logo.utilisationClick(Sender: TObject);
begin
Bode_utilisation.Visible:=True;
Bode_utilisation.BringToFront;
Bode_logo.Visible := False ;
end;

end.
