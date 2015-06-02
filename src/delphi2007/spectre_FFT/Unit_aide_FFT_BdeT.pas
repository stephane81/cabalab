unit Unit_aide_FFT_BdeT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFT_BdeT = class(TForm)
    Image1: TImage;
    utilisation3: TEdit;
    procedure utilisation3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FFT_BdeT: TFFT_BdeT;

implementation

uses Unit_aide_FFT;
{$R *.dfm}

procedure TFFT_BdeT.utilisation3Click(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_BdeT.Visible := False ;
end;

end.
