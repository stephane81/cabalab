unit Unit_aide_FFT_frequence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFT_frequence = class(TForm)
    Image1: TImage;
    utilisation2: TEdit;
    Edit1: TEdit;
 
    procedure voirexempleclick(Sender: TObject);

    procedure utilisationclick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FFT_frequence: TFFT_frequence;

implementation

{$R *.dfm}


uses Unit_aide_FFT{,Unit_aide_FFT_abscisse}, Unit_aide_FFT_repliement;


procedure TFFT_frequence.utilisationclick(Sender: TObject);
begin
FFT_utilisation.Visible:=True;
FFT_utilisation.BringToFront;
FFT_frequence.Visible := False ;
end;
procedure TFFT_frequence.voirexempleclick(Sender: TObject);
begin
FFT_exemple_repliement.Visible:=True;
end;

end.
