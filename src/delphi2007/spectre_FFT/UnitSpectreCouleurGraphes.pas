unit UnitSpectreCouleurGraphes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormSpectreCouleurGraphes = class(TForm)
    ButtonValider: TButton;
    ColorDialog1: TColorDialog;
    ButtonStandard: TButton;
    ButtonImpressionNB: TButton;
    ButtonImpressionCouleur: TButton;
    GroupBox1: TGroupBox;
    PaintBoxSpectreFond: TPaintBox;
    Label1: TLabel;
    PaintBoxSpectreGrille: TPaintBox;
    Grille: TLabel;
    PaintBoxSpectreSpectre1: TPaintBox;
    Gain: TLabel;
    PaintBoxSpectreSpectre2: TPaintBox;
    Phase: TLabel;
    GroupBox2: TGroupBox;
    PaintBoxVoiesFond: TPaintBox;
    Label2: TLabel;
    PaintBoxVoiesGrille: TPaintBox;
    Label3: TLabel;
    PaintBoxVoiesVoie1: TPaintBox;
    Entree: TLabel;
    PaintBoxVoiesVoie2: TPaintBox;
    Sortie: TLabel;
    ButtonAnnuler: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure ButtonAnnulerClick(Sender: TObject);
    procedure ButtonImpressionCouleurClick(Sender: TObject);
    procedure ButtonImpressionNBClick(Sender: TObject);
    procedure ButtonStandardClick(Sender: TObject);
    procedure ButtonValiderClick(Sender: TObject);
    procedure PaintBoxVoies2Click(Sender: TObject);
    procedure PaintBoxVoies1Click(Sender: TObject);
    procedure PaintBoxVoiesGrilleClick(Sender: TObject);
    procedure PaintBoxVoiesFondClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBoxSpectre2Click(Sender: TObject);
    procedure PaintBoxSpectre1Click(Sender: TObject);
    procedure PaintBoxSpectreGrilleClick(Sender: TObject);
    procedure PaintBoxSpectreFondClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

type ConfigurationCouleurs = record
  VoiesFond, VoiesGrille, Voies1, Voies2 : Tcolor;
  SpectreFond, SpectreGrille, Spectre1, Spectre2 : Tcolor;

end;

var
  FormSpectreCouleurGraphes: TFormSpectreCouleurGraphes;
  ConfigurationCouleursSiAnnuler : ConfigurationCouleurs;

implementation

uses SpectrumFFT;

{$R *.dfm}

//------------------------------------------------------------------

procedure TFormSpectreCouleurGraphes.FormShow(Sender: TObject);
begin
//  Sauvegarde couleurs courantes pour si utilisateur appuiera sur Annuler
  ConfigurationCouleursSiAnnuler.SpectreFond   := Fenetre_Spectre.Spectre.CouleurFond ;
  ConfigurationCouleursSiAnnuler.SpectreGrille := Fenetre_Spectre.Spectre.CouleurGrille ;
  ConfigurationCouleursSiAnnuler.Spectre1      := Fenetre_Spectre.Spectre.CouleurSpectre1 ;
  ConfigurationCouleursSiAnnuler.Spectre2      := Fenetre_Spectre.Spectre.CouleurSpectre2 ;

  ConfigurationCouleursSiAnnuler.VoiesFond   := Fenetre_Spectre.Voies.CouleurFond ;
  ConfigurationCouleursSiAnnuler.VoiesGrille := Fenetre_Spectre.Voies.CouleurGrille ;
  ConfigurationCouleursSiAnnuler.Voies1      := Fenetre_Spectre.Voies.CouleurVoie1 ;
  ConfigurationCouleursSiAnnuler.Voies2      := Fenetre_Spectre.Voies.CouleurVoie2 ;


end;

procedure TFormSpectreCouleurGraphes.FormPaint(Sender: TObject);
begin
// Dessiner les bonnes couleurs dans les carrés
   PaintBoxSpectreFond.Canvas.Brush.Color := Fenetre_Spectre.Spectre.CouleurFond ;
   PaintBoxSpectreFond.Canvas.Rectangle(0, 0, PaintBoxSpectreFond.Width - 1, PaintBoxSpectreFond.Height - 1);
   PaintBoxSpectreGrille.Canvas.Brush.Color := Fenetre_Spectre.Spectre.CouleurGrille ;
   PaintBoxSpectreGrille.Canvas.Rectangle(0, 0, PaintBoxSpectreGrille.Width - 1, PaintBoxSpectreGrille.Height - 1);
   PaintBoxSpectreSpectre1.Canvas.Brush.Color := Fenetre_Spectre.Spectre.CouleurSpectre1 ;
   PaintBoxSpectreSpectre1.Canvas.Rectangle(0, 0, PaintBoxSpectreSpectre1.Width - 1, PaintBoxSpectreSpectre1.Height - 1);
   PaintBoxSpectreSpectre2.Canvas.Brush.Color := Fenetre_Spectre.Spectre.CouleurSpectre2 ;
   PaintBoxSpectreSpectre2.Canvas.Rectangle(0, 0, PaintBoxSpectreSpectre2.Width - 1, PaintBoxSpectreSpectre2.Height - 1);

   PaintBoxVoiesFond.Canvas.Brush.Color := Fenetre_Spectre.Voies.CouleurFond ;
   PaintBoxVoiesFond.Canvas.Rectangle(0, 0, PaintBoxVoiesFond.Width - 1, PaintBoxVoiesFond.Height - 1);
   PaintBoxVoiesGrille.Canvas.Brush.Color := Fenetre_Spectre.Voies.CouleurGrille ;
   PaintBoxVoiesGrille.Canvas.Rectangle(0, 0, PaintBoxVoiesGrille.Width - 1, PaintBoxVoiesGrille.Height - 1);
   PaintBoxVoiesVoie1.Canvas.Brush.Color := Fenetre_Spectre.Voies.CouleurVoie1 ;
   PaintBoxVoiesVoie1.Canvas.Rectangle(0, 0, PaintBoxVoiesVoie1.Width - 1, PaintBoxVoiesVoie1.Height - 1);
   PaintBoxVoiesVoie2.Canvas.Brush.Color := Fenetre_Spectre.Voies.CouleurVoie2 ;
   PaintBoxVoiesVoie2.Canvas.Rectangle(0, 0, PaintBoxVoiesVoie2.Width - 1, PaintBoxVoiesVoie2.Height - 1);

end;

//--------------------------------------------------------------------

procedure TFormSpectreCouleurGraphes.ButtonImpressionCouleurClick(Sender: TObject);
begin
  Fenetre_Spectre.Voies.CouleurFond   := clWhite;
  Fenetre_Spectre.Voies.CouleurGrille := clSilver ;
  Fenetre_Spectre.Voies.CouleurVoie1 := clRed;
  Fenetre_Spectre.Voies.CouleurVoie2 := clBlue;
  Fenetre_Spectre.Spectre.CouleurFond    := clWhite;
  Fenetre_Spectre.Spectre.CouleurGrille  := clSilver ;
  Fenetre_Spectre.Spectre.CouleurSpectre1    := clRed;
  Fenetre_Spectre.Spectre.CouleurSpectre2   := clBlue;

//  SpectreCouleurGraphes.Repaint;
 // Fenetre_Spectre.PaintSpectres.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;

end;

procedure TFormSpectreCouleurGraphes.ButtonImpressionNBClick(Sender: TObject);
begin
  Fenetre_Spectre.Voies.CouleurFond   := clWhite;
  Fenetre_Spectre.Voies.CouleurGrille := clSilver ;
  Fenetre_Spectre.Voies.CouleurVoie1 := clBlack;
  Fenetre_Spectre.Voies.CouleurVoie2 := clBlack;
  Fenetre_Spectre.Spectre.CouleurFond    := clWhite;
  Fenetre_Spectre.Spectre.CouleurGrille  := clSilver ;
  Fenetre_Spectre.Spectre.CouleurSpectre1    := clBlack;
  Fenetre_Spectre.Spectre.CouleurSpectre2   := clBlack;

  FormSpectreCouleurGraphes.Repaint;
 // Fenetre_Spectre.PaintSpectres.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.ButtonStandardClick(Sender: TObject);
begin
  Fenetre_Spectre.Voies.CouleurFond   := clBlack;
  Fenetre_Spectre.Voies.CouleurGrille := clSilver ;
  Fenetre_Spectre.Voies.CouleurVoie1 := clYellow;
  Fenetre_Spectre.Voies.CouleurVoie2 := clLime;
  Fenetre_Spectre.Spectre.CouleurFond    := clBlack;
  Fenetre_Spectre.Spectre.CouleurGrille  := clSilver ;
  Fenetre_Spectre.Spectre.CouleurSpectre1    := clYellow;
  Fenetre_Spectre.Spectre.CouleurSpectre2   := clLime;

  FormSpectreCouleurGraphes.Repaint ;
//  Fenetre_Spectre.PaintSpectre.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;

//------------------------------------------------------------

procedure TFormSpectreCouleurGraphes.PaintBoxSpectreFondClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Spectre.CouleurFond := ColorDialog1.Color ;
  Fenetre_Spectre.shape4.Brush.Color:=ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
//  Fenetre_Spectre.PaintSpectre.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxSpectre1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Spectre.CouleurSpectre1 := ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
 // Fenetre_Spectre.PaintSpectre.Repaint;
//  Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxSpectreGrilleClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Spectre.CouleurGrille := ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
 // Fenetre_Spectre.PaintSpectre.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxSpectre2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Spectre.CouleurSpectre2 := ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
//  Fenetre_Spectre.PaintSpectre.Repaint;
//  Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxVoies1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Voies.CouleurVoie1:= ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
//  Fenetre_Spectre.PaintSpectre.Repaint;
//  Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxVoiesFondClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Voies.CouleurFond := ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
 // Fenetre_Spectre.PaintSpectre.Repaint;
  //Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxVoiesGrilleClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Fenetre_Spectre.Voies.CouleurGrille:= ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
//  Fenetre_Spectre.PaintSpectre.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;

procedure TFormSpectreCouleurGraphes.PaintBoxVoies2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
   Fenetre_Spectre.Voies.CouleurVoie2:= ColorDialog1.Color ;
  FormSpectreCouleurGraphes.Repaint;
//  Fenetre_Spectre.PaintSpectre.Repaint;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;

//-----------------------------------------------------------------------

procedure TFormSpectreCouleurGraphes.ButtonValiderClick(Sender: TObject);
begin
FormSpectreCouleurGraphes.Visible := false ;
//Fenetre_Spectre.ch1box.Font.color:=Fenetre_Spectre.Spectre.CouleurSpectre1;
Fenetre_Spectre.Spectre1Label.color:=Fenetre_Spectre.Spectre.CouleurFond;
//Fenetre_Spectre.ch2box.Font.color:=Fenetre_Spectre.Spectre.CouleurSpectre2;
Fenetre_Spectre.Spectre2Label.color:=Fenetre_Spectre.Spectre.CouleurFond;
Fenetre_Spectre.channel1Label.Font.color:=Fenetre_Spectre.Voies.CouleurVoie1 ;
Fenetre_Spectre.channel2Label.Font.color:=Fenetre_Spectre.Voies.CouleurVoie2 ;
Fenetre_Spectre.GetCh1OscSensBox.color:=Fenetre_Spectre.Voies.CouleurFond ;
Fenetre_Spectre.Getch2OscSensbox.color:=Fenetre_Spectre.Voies.CouleurFond ;
Fenetre_Spectre.GetCh1OscSensBox.Font.color:=Fenetre_Spectre.Voies.CouleurVoie1;
Fenetre_Spectre.Getch2OscSensbox.Font.color:=Fenetre_Spectre.Voies.CouleurVoie2 ;
Fenetre_Spectre.shapecalibre1.brush.color:=Fenetre_Spectre.Spectre.CouleurSpectre1;
Fenetre_Spectre.shapecalibre2.brush.color:=Fenetre_Spectre.Spectre.CouleurSpectre2;
 {      for i:=1 to 9 do
        for j:=1 to 39 do
          Fenetre_Spectre.Panel1.font.pitch[round((Fenetre_Spectre.display.Width*i)/10),
          round(Fenetre_Spectre.display.Height*j/40)]:= Fenetre_Spectre.Voies.CouleurGrille ; {lignes verticales}
  {  for i:=1 to 7 do
        for j:=1 to 49 do
          Fenetre_Spectre.Display.Canvas.Pixels[round((Fenetre_Spectre.display.Width*j)/50),
          round(Fenetre_Spectre.display.Height*i/8)]:= Fenetre_Spectre.Voies.CouleurGrille ; {lignes horizontales}
   { for j:=1 to 49 do
          Fenetre_Spectre.Display.Canvas.Pixels[round((Fenetre_Spectre.display.Width*j)/50+10),
          round(Fenetre_Spectre.display.Height/2)]:= Fenetre_Spectre.Voies.CouleurGrille ;     {ligne horizontale centrale}
    {      Fenetre_Spectre.Display.Canvas.Pen.Color := Fenetre_Spectre.Voies.CouleurGrille ;

      for i:=1 to 9 do
        for j:=1 to 24 do
          Fenetre_Spectre.PaintBox2.Canvas.Pixels[round((Fenetre_Spectre.PaintBox2.Width*i)/10),
          round(Fenetre_Spectre.PaintBox2.Height*j/25)]:= Fenetre_Spectre.Spectre.CouleurGrille ; {lignes verticales}

     { for i:=1 to 4 do
        for j:=1 to 59 do
          Fenetre_Spectre.PaintBox2.Canvas.Pixels[round((Fenetre_Spectre.PaintBox2.Width*j)/60),
          round(Fenetre_Spectre.PaintBox2.Height*i/5)]:= Fenetre_Spectre.Spectre.CouleurGrille ; {lignes horizontales}




end;

procedure TFormSpectreCouleurGraphes.ButtonAnnulerClick(Sender: TObject);
begin
  Fenetre_Spectre.Spectre.CouleurFond   := ConfigurationCouleursSiAnnuler.SpectreFond ;
  Fenetre_Spectre.Spectre.CouleurGrille := ConfigurationCouleursSiAnnuler.SpectreGrille ;
  Fenetre_Spectre.Spectre.CouleurSpectre1   := ConfigurationCouleursSiAnnuler.Spectre1 ;
  Fenetre_Spectre.Spectre.CouleurSpectre2  := ConfigurationCouleursSiAnnuler.Spectre2 ;

  Fenetre_Spectre.Voies.CouleurFond   := ConfigurationCouleursSiAnnuler.VoiesFond ;
  Fenetre_Spectre.Voies.CouleurGrille := ConfigurationCouleursSiAnnuler.VoiesGrille ;
  Fenetre_Spectre.Voies.CouleurVoie1 := ConfigurationCouleursSiAnnuler.Voies1 ;
  Fenetre_Spectre.Voies.CouleurVoie2 := ConfigurationCouleursSiAnnuler.Voies2 ;

  FormSpectreCouleurGraphes.Visible := false ;
//  Fenetre_Spectre.PaintSpectre.Repaint ;
 // Fenetre_Spectre.PaintVoies.Repaint;
end;


procedure TFormSpectreCouleurGraphes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ButtonAnnulerClick(FormSpectreCouleurGraphes);
end;

end.
