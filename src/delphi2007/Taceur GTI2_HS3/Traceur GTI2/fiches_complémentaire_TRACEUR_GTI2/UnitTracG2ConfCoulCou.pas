unit UnitTracG2ConfCoulCou;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin;

type
  TFormConfigCouleurs = class(TForm)
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    PaintBox5: TPaintBox;
    PaintBox6: TPaintBox;
    Label6: TLabel;
    Label7: TLabel;
    SpinButton1: TSpinButton;
    Label8: TLabel;
    Label9: TLabel;
    ScrollBarLuminositeFondEcran: TScrollBar;
    Label10: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure ChangementDeCouleurs(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure ScrollBarLuminositeFondEcranChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormConfigCouleurs: TFormConfigCouleurs;
  TpaintboxCOULEURS : array [0..5] of Tpaintbox;
implementation

uses UnitTraceurGTI2;
{$R *.dfm}


procedure TFormConfigCouleurs.FormCreate(Sender: TObject);
begin
   FormConfigCouleurs.Top:=0;
   FormConfigCouleurs.Left:=0;
   TpaintboxCOULEURS[0]:=PaintBox1;
   TpaintboxCOULEURS[1]:=PaintBox2;
   TpaintboxCOULEURS[2]:=PaintBox3;
   TpaintboxCOULEURS[3]:=PaintBox4;
   TpaintboxCOULEURS[4]:=PaintBox5;
   TpaintboxCOULEURS[5]:=PaintBox6;

    Label8.Caption:=inttostr(UnitTraceurGTI2.congiguration.PenWidth);
     if UnitTraceurGTI2.congiguration.PenWidth=1 then
     Label9.Caption:='Pixel'
     else Label9.Caption:='Pixels'
end;





procedure TFormConfigCouleurs.ChangementDeCouleurs(Sender: TObject);
var i : integer;
begin
ColorDialog1.execute;
for i:=0 to 5 do
begin
    if sender=TpaintboxCOULEURS[i]then
    UnitTraceurGTI2.congiguration.couleurs[i] :=colordialog1.color;
end;
FormPaint(Sender);
end;




procedure TFormConfigCouleurs.FormPaint(Sender: TObject);
var i:integer;
begin

  for i:=0 to 5 do
  begin
  TpaintboxCOULEURS[i].Canvas.pen.Color := UnitTraceurGTI2.congiguration.couleurs[i];
  TpaintboxCOULEURS[i].Canvas.Brush.Color :=UnitTraceurGTI2.congiguration.couleurs[i];
  TpaintboxCOULEURS[i].Canvas.Rectangle(0, 0, TpaintboxCOULEURS[i].Width - 1, TpaintboxCOULEURS[i].Height - 1);
  end;

end;

procedure TFormConfigCouleurs.SpinButton1DownClick(Sender: TObject);
begin
     if (UnitTraceurGTI2.congiguration.PenWidth >1) then
     UnitTraceurGTI2.congiguration.PenWidth:=UnitTraceurGTI2.congiguration.PenWidth-1;

     Label8.Caption:=inttostr(UnitTraceurGTI2.congiguration.PenWidth);
     if UnitTraceurGTI2.congiguration.PenWidth=1 then
     Label9.Caption:='Pixel'
     else Label9.Caption:='Pixels'
end;

procedure TFormConfigCouleurs.SpinButton1UpClick(Sender: TObject);
begin
     if (UnitTraceurGTI2.congiguration.PenWidth <10) then
     UnitTraceurGTI2.congiguration.PenWidth:=UnitTraceurGTI2.congiguration.PenWidth+1;
     Label8.Caption:=inttostr(UnitTraceurGTI2.congiguration.PenWidth);
     if UnitTraceurGTI2.congiguration.PenWidth=1 then
     Label9.Caption:='Pixel'
     else Label9.Caption:='Pixels'
end;

procedure TFormConfigCouleurs.ScrollBarLuminositeFondEcranChange(
  Sender: TObject);
begin
    unitTraceurGTI2.congiguration.couleurs[0]:= ScrollBarLuminositeFondEcran.Position;
end;

end.
