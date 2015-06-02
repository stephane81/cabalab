unit Unit_aide_FFT_accu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFT_accu = class(TForm)
    utilisation2: TEdit;
    Image2: TImage;

    procedure utilisation2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FFT_accu: TFFT_accu;

implementation

{$R *.dfm}


uses Unit_aide_FFT;

procedure TFFT_accu.utilisation2Click(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_accu.Visible := False ;
end;

end.
