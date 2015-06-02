unit Unit_aide_FFT_stop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFT_stop = class(TForm)
    Image1: TImage;
    utilisation2: TEdit;

    procedure utilisationclick(Sender: TObject)  ;

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
 FFT_stop: TFFT_stop;

implementation

{$R *.dfm}


uses Unit_aide_FFT{,Unit_aide_FFT_abscisse};




procedure TFFT_stop.utilisationclick(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_stop.Visible := False ;
end;


end.
