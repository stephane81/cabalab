unit Unit_aide_FFT_logo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFT_logo = class(TForm)
    utilisation2: TEdit;
    Image1: TImage;
    procedure utilisation2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FFT_logo: TFFT_logo;

implementation

uses Unit_aide_FFT;

{$R *.dfm}

procedure TFFT_logo.utilisation2Click(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_logo.Visible := False ;
end;

end.
