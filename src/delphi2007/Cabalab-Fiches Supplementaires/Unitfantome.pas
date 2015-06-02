unit Unitfantome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;


type
  TFormFantome = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

 
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormFantome: TFormFantome;

implementation

uses UnitCabalab;

{$R *.dfm}


procedure TFormFantome.FormCreate(Sender: TObject);
begin
//Image cabalab au milieu de l'écran
FormFantome.Left:=round ((Screen.Width/2) - 656/2 );
FormFantome.Top:=round ((Screen.Height/2) - 656/2 );
image1.Left:= 0;
image1.top:=0;
FormFantome.clientheight:=656;
FormFantome.clientwidth:=656;

end;

procedure TFormFantome.Image1Click(Sender: TObject);
begin
FormFantome.visible:= false;
FormCabalab.Visible:= true;
end;

procedure TFormFantome.Timer1Timer(Sender: TObject);
begin
FormFantome.visible:= false;
FormCabalab.Visible:= true;
Timer1.Enabled:=false;//1_34FM inutil de le laisser tourner....
end;




end.
