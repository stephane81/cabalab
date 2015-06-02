unit Unit_aide_FFT_ordonnee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFFT_ordonnee = class(TForm)
    Image3: TImage;
    utilisation2: TEdit;

    procedure utilisationclick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
   FFT_ordonnee: TFFT_ordonnee;

implementation

{$R *.dfm}


uses Unit_aide_FFT{,Unit_aide_FFT_abscisse};


procedure TFFT_ordonnee.utilisationclick(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_ordonnee.Visible := False ;
end;

end.
