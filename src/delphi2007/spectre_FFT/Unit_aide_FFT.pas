unit Unit_aide_FFT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFFT_utilisation = class(TForm)
    Image1: TImage;
    abscisse: TEdit;
    ordonnee: TEdit;
    BdeT: TEdit;
    Trigger: TEdit;
    Edit2: TEdit;
    stop: TEdit;
    logo: TEdit;
    Accu: TEdit;
    transfert: TEdit;
  {  procedure stopChange(Sender: TObject);}

    procedure abscisseClick(Sender: TObject);
    procedure ordonneeClick(Sender: TObject);
    procedure frequenceClick(Sender: TObject);
    procedure BdeTClick(Sender: TObject);
    procedure TriggerClick(Sender: TObject);
    procedure stopClick(Sender: TObject);
    procedure logoClick(Sender: TObject);
    procedure AccuClick(Sender: TObject);
    procedure TransfertClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FFT_utilisation: TFFT_utilisation;

implementation

uses Unit_aide_FFT_abscisse,Unit_aide_FFT_ordonnee, Unit_aide_FFT_BdeT, Unit_aide_FFT_trigger,
  Unit_aide_FFT_transfert{,Unit_aide_FFT_stop,Unit_aide_FFT_Accu,Unit_aide_FFT_logo},
  Unit_aide_FFT_frequence, Unit_aide_FFT_stop, Unit_aide_FFT_logo,
  Unit_aide_FFT_accu;

{$R *.dfm}


procedure TFFT_utilisation.abscisseClick(Sender: TObject);
begin
FFT_abscisse.Visible:=True;
FFT_abscisse.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.ordonneeClick(Sender: TObject);
begin
FFT_ordonnee.Visible:=True;
FFT_ordonnee.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.frequenceClick(Sender: TObject);
begin
FFT_frequence.Visible:=True;
FFT_frequence.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.BdeTClick(Sender: TObject);
begin
FFT_BdeT.Visible:=True;
FFT_BdeT.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.TriggerClick(Sender: TObject);
begin
FFT_Trigger.Visible:=True;
FFT_Trigger.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.stopClick(Sender: TObject);
begin
FFT_stop.Visible:=True;
FFT_stop.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.logoClick(Sender: TObject);
begin
FFT_logo.Visible:=True;
FFT_logo.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.AccuClick(Sender: TObject);
begin
FFT_Accu.Visible:=True;
FFT_Accu.BringToFront;
FFT_utilisation.Visible := False ;
end;

procedure TFFT_utilisation.TransfertClick(Sender: TObject);
begin
FFT_Transfert.Visible:=True;
FFT_Transfert.BringToFront;
FFT_utilisation.Visible := False ;
end;


end.
