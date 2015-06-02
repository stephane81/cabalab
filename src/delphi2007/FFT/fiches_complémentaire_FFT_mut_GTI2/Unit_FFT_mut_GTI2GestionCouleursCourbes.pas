unit Unit_FFT_mut_GTI2GestionCouleursCourbes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin;

type
  TForm_FFT_mut_ConfigCouleursOscilloGTI2 = class(TForm)
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

    procedure FormCreate(Sender: TObject);
    procedure ChangementDeCouleurs(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form_FFT_mut_ConfigCouleursOscilloGTI2: TForm_FFT_mut_ConfigCouleursOscilloGTI2;
  TpaintboxCOULEURS : array [0..5] of Tpaintbox;
implementation

uses unit_FFT_mut_Gti2;
{$R *.dfm}


procedure TForm_FFT_mut_ConfigCouleursOscilloGTI2.FormCreate(Sender: TObject);
begin
   Form_FFT_mut_ConfigCouleursOscilloGTI2.Top:=0;
   Form_FFT_mut_ConfigCouleursOscilloGTI2.Left:=0;
   TpaintboxCOULEURS[0]:=PaintBox1;
   TpaintboxCOULEURS[1]:=PaintBox2;
   TpaintboxCOULEURS[2]:=PaintBox3;
   TpaintboxCOULEURS[3]:=PaintBox4;
   TpaintboxCOULEURS[4]:=PaintBox5;
   TpaintboxCOULEURS[5]:=PaintBox6;
end;





procedure TForm_FFT_mut_ConfigCouleursOscilloGTI2.ChangementDeCouleurs(Sender: TObject);
var i : integer;
begin
ColorDialog1.execute;
for i:=0 to 5 do
begin
    if sender=TpaintboxCOULEURS[i]then
    unit_FFT_mut_GTI2.congiguration.couleurs[i] :=colordialog1.color;
end;
FormPaint(Sender);
end;




procedure TForm_FFT_mut_ConfigCouleursOscilloGTI2.FormPaint(Sender: TObject);
var i:integer;
begin

  for i:=0 to 5 do
  begin
  TpaintboxCOULEURS[i].Canvas.pen.Color := unit_FFT_mut_GTI2.congiguration.couleurs[i];
  TpaintboxCOULEURS[i].Canvas.Brush.Color :=unit_FFT_mut_GTI2.congiguration.couleurs[i];
  TpaintboxCOULEURS[i].Canvas.Rectangle(0, 0, TpaintboxCOULEURS[i].Width - 1, TpaintboxCOULEURS[i].Height - 1);
  end;

end;

procedure TForm_FFT_mut_ConfigCouleursOscilloGTI2.SpinButton1DownClick(Sender: TObject);
begin
     if (unit_FFT_mut_GTI2.congiguration.PenWidth >1) then
     unit_FFT_mut_GTI2.congiguration.PenWidth:=unit_FFT_mut_GTI2.congiguration.PenWidth-1;

     Label8.Caption:=inttostr(unit_FFT_mut_GTI2.congiguration.PenWidth);
     if unit_FFT_mut_GTI2.congiguration.PenWidth=1 then
     Label9.Caption:='Pixel'
     else Label9.Caption:='Pixels'
end;

procedure TForm_FFT_mut_ConfigCouleursOscilloGTI2.SpinButton1UpClick(Sender: TObject);
begin
     if (unit_FFT_mut_GTI2.congiguration.PenWidth <10) then
     unit_FFT_mut_GTI2.congiguration.PenWidth:=unit_FFT_mut_GTI2.congiguration.PenWidth+1;
     Label8.Caption:=inttostr(unit_FFT_mut_GTI2.congiguration.PenWidth);
     if unit_FFT_mut_GTI2.congiguration.PenWidth=1 then
     Label9.Caption:='Pixel'
     else Label9.Caption:='Pixels'
end;

end.
