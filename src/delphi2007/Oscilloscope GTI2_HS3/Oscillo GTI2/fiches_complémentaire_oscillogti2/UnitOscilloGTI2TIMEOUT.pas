unit UnitOscilloGTI2TIMEOUT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFormtimeout = class(TForm)
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
  Formtimeout: TFormtimeout;


implementation

uses UnitOscilloGTI2;



{$R *.dfm}

procedure TFormtimeout.TrackBarTIMEOUTChange(Sender: TObject);
begin
Label4.Caption:=floattostr(TrackBarTIMEOUT.Position);
FormOscilloGTI2.CompteurTIMEOUT:=TrackBarTIMEOUT.position;
end;

procedure TFormtimeout.FormShow(Sender: TObject);
begin
Label4.Caption:=floattostr(TrackBarTIMEOUT.Position);
end;

end.
