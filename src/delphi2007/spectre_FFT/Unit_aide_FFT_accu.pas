unit Unit_aide_FFT_accu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFT_accu = class(TForm)
    utilisation2: TEdit;
    Image2: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;

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
