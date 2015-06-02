unit Unit_FFT_mut_GTI2TIMEOUT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  Tform_FFT_mut_TIMEOUT = class(TForm)
    TrackBarTIMEOUT: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure TrackBarTIMEOUTChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  form_FFT_mut_TIMEOUT: Tform_FFT_mut_TIMEOUT;


implementation

uses Unit_FFT_mut_GTI2;



{$R *.dfm}

procedure Tform_FFT_mut_TIMEOUT.TrackBarTIMEOUTChange(Sender: TObject);
begin
Label4.Caption:=floattostr(TrackBarTIMEOUT.Position);
Form_FFT_mut_GTI2.CompteurTIMEOUT:=TrackBarTIMEOUT.position;
end;

procedure Tform_FFT_mut_TIMEOUT.FormShow(Sender: TObject);
begin
Label4.Caption:=floattostr(TrackBarTIMEOUT.Position);
end;

end.
