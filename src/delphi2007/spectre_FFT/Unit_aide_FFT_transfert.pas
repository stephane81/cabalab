unit Unit_aide_FFT_transfert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFFT_transfert = class(TForm)
    utilisation2: TEdit;
    Image2: TImage;

    procedure utilisationclick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
   FFT_transfert: TFFT_transfert;

implementation

{$R *.dfm}


uses Unit_aide_FFT{,Unit_aide_FFT_abscisse};


procedure TFFT_transfert.utilisationclick(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_transfert.Visible := False ;
end;

end.
