unit UnitMouchard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,dlldecl;

type
  TFormMouchard = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    LabelBaseDeTemps: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelReload: TLabel;
    UnSurN: TLabel;
    LabelUnSurN: TLabel;
    Label4: TLabel;
    LabelCptNoTrig: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Déclarations privées }
  public
var compteurNoTrig : integer ;    { Déclarations publiques }
  end;

var
  FormMouchard: TFormMouchard;


implementation

{$R *.dfm}

procedure TFormMouchard.FormCreate(Sender: TObject);
begin
compteurNoTrig := compteurNoTrig +1 ;
end;



procedure TFormMouchard.Timer1Timer(Sender: TObject);
begin

case DataAcq.config.BasedeTemps of
  0 :  LabelBaseDeTemps.caption := ' 6 Mhz';
  1 :  LabelBaseDeTemps.caption := ' 2 Mhz';
  2 :  LabelBaseDeTemps.caption := '10 Mhz';
end;


LabelReload.Caption := IntTostr( DataAcq.config.Reload) ;

LabelUnSurN.Caption := IntTostr( DataAcq.config.UnSurN) ;

LabelCptNoTrig.Caption := IntTostr( compteurNoTrig );

end;

end.
