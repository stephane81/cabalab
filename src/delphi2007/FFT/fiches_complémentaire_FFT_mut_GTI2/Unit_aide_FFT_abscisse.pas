unit Unit_aide_FFT_abscisse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  StdCtrls{, Unit_aide_FFT};

type
  TFFT_abscisse = class(TForm)
    utilisation: TEdit;
    Image1: TImage;
    procedure utilisationClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
   FFT_abscisse: TFFT_abscisse;

implementation

uses Unit_aide_FFT;

{$R *.dfm}

procedure TFFT_abscisse.utilisationClick(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_abscisse.Visible := False ;
end;

end.
