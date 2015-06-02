unit Unit_aide_FFT_trigger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFFT_trigger = class(TForm)
    utilisation2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;

    procedure utilisationclick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
   FFT_trigger: TFFT_trigger;

implementation

{$R *.dfm}


uses Unit_aide_FFT{,Unit_aide_FFT_abscisse};





procedure TFFT_trigger.utilisationclick(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_trigger.Visible := False ;
end;

end.
