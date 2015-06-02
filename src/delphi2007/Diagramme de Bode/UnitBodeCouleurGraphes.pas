unit UnitBodeCouleurGraphes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormBodeCouleurGraphes = class(TForm)
    ButtonValider: TButton;
    ColorDialog1: TColorDialog;
    ButtonStandard: TButton;
    ButtonImpressionNB: TButton;
    ButtonImpressionCouleur: TButton;
    GroupBox1: TGroupBox;
    PaintBoxBodeFond: TPaintBox;
    Label1: TLabel;
    PaintBoxBodeGrille: TPaintBox;
    Grille: TLabel;
    PaintBoxBodeGain: TPaintBox;
    Gain: TLabel;
    PaintBoxBodePhase: TPaintBox;
    Phase: TLabel;
    GroupBox2: TGroupBox;
    PaintBoxVoiesFond: TPaintBox;
    Label2: TLabel;
    PaintBoxVoiesGrille: TPaintBox;
    Label3: TLabel;
    PaintBoxVoiesEntree: TPaintBox;
    Entree: TLabel;
    PaintBoxVoiesSortie: TPaintBox;
    Sortie: TLabel;
    ButtonAnnuler: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure ButtonAnnulerClick(Sender: TObject);
    procedure ButtonImpressionCouleurClick(Sender: TObject);
    procedure ButtonImpressionNBClick(Sender: TObject);
    procedure ButtonStandardClick(Sender: TObject);
    procedure ButtonValiderClick(Sender: TObject);
    procedure PaintBoxVoiesSortieClick(Sender: TObject);
    procedure PaintBoxVoiesEntreeClick(Sender: TObject);
    procedure PaintBoxVoiesGrilleClick(Sender: TObject);
    procedure PaintBoxVoiesFondClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBoxBodePhaseClick(Sender: TObject);
    procedure PaintBoxBodeGainClick(Sender: TObject);
    procedure PaintBoxBodeGrilleClick(Sender: TObject);
    procedure PaintBoxBodeFondClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

type ConfigurationCouleurs = record
  VoiesFond, VoiesGrille, VoiesEntree, VoiesSortie : Tcolor;
  BodeFond, BodeGrille, BodeGain, BodePhase : Tcolor;

end;

var
  FormBodeCouleurGraphes: TFormBodeCouleurGraphes;
  ConfigurationCouleursSiAnnuler : ConfigurationCouleurs;

implementation

uses UnitBodePrincipal;

{$R *.dfm}

//------------------------------------------------------------------

procedure TFormBodeCouleurGraphes.FormShow(Sender: TObject);
begin
//  Sauvegarde couleurs courantes pour si utilisateur appuiera sur Annuler
  ConfigurationCouleursSiAnnuler.BodeFond   := FormBodePrincipal.Bode.CouleurFond ;
  ConfigurationCouleursSiAnnuler.BodeGrille := FormBodePrincipal.Bode.CouleurGrille ;
  ConfigurationCouleursSiAnnuler.BodeGain   := FormBodePrincipal.Bode.CouleurGain ;
  ConfigurationCouleursSiAnnuler.BodePhase  := FormBodePrincipal.Bode.CouleurPhase ;

  ConfigurationCouleursSiAnnuler.VoiesFond   := FormBodePrincipal.Voies.CouleurFond ;
  ConfigurationCouleursSiAnnuler.VoiesGrille := FormBodePrincipal.Voies.CouleurGrille ;
  ConfigurationCouleursSiAnnuler.VoiesEntree := FormBodePrincipal.Voies.CouleurEntree ;
  ConfigurationCouleursSiAnnuler.VoiesSortie := FormBodePrincipal.Voies.CouleurSortie ;


end;

procedure TFormBodeCouleurGraphes.FormPaint(Sender: TObject);
begin
// Dessiner les bonnes couleurs dans les carrés
   PaintBoxBodeFond.Canvas.Brush.Color := FormBodePrincipal.Bode.CouleurFond ;
   PaintBoxBodeFond.Canvas.Rectangle(0, 0, PaintBoxBodeFond.Width - 1, PaintBoxBodeFond.Height - 1);
   PaintBoxBodeGrille.Canvas.Brush.Color := FormBodePrincipal.Bode.CouleurGrille ;
   PaintBoxBodeGrille.Canvas.Rectangle(0, 0, PaintBoxBodeGrille.Width - 1, PaintBoxBodeGrille.Height - 1);
   PaintBoxBodeGain.Canvas.Brush.Color := FormBodePrincipal.Bode.CouleurGain ;
   PaintBoxBodeGain.Canvas.Rectangle(0, 0, PaintBoxBodeGain.Width - 1, PaintBoxBodeGain.Height - 1);
   PaintBoxBodePhase.Canvas.Brush.Color := FormBodePrincipal.Bode.CouleurPhase ;
   PaintBoxBodePhase.Canvas.Rectangle(0, 0, PaintBoxBodePhase.Width - 1, PaintBoxBodePhase.Height - 1);

   PaintBoxVoiesFond.Canvas.Brush.Color := FormBodePrincipal.Voies.CouleurFond ;
   PaintBoxVoiesFond.Canvas.Rectangle(0, 0, PaintBoxVoiesFond.Width - 1, PaintBoxVoiesFond.Height - 1);
   PaintBoxVoiesGrille.Canvas.Brush.Color := FormBodePrincipal.Voies.CouleurGrille ;
   PaintBoxVoiesGrille.Canvas.Rectangle(0, 0, PaintBoxVoiesGrille.Width - 1, PaintBoxVoiesGrille.Height - 1);
   PaintBoxVoiesEntree.Canvas.Brush.Color := FormBodePrincipal.Voies.CouleurEntree ;
   PaintBoxVoiesEntree.Canvas.Rectangle(0, 0, PaintBoxVoiesEntree.Width - 1, PaintBoxVoiesEntree.Height - 1);
   PaintBoxVoiesSortie.Canvas.Brush.Color := FormBodePrincipal.Voies.CouleurSortie ;
   PaintBoxVoiesSortie.Canvas.Rectangle(0, 0, PaintBoxVoiesSortie.Width - 1, PaintBoxVoiesSortie.Height - 1);

end;

//--------------------------------------------------------------------

procedure TFormBodeCouleurGraphes.ButtonImpressionCouleurClick(Sender: TObject);
begin
  FormBodePrincipal.Voies.CouleurFond   := clWhite;
  FormBodePrincipal.Voies.CouleurGrille := clSilver ;
  FormBodePrincipal.Voies.CouleurEntree := clRed;
  FormBodePrincipal.Voies.CouleurSortie := clBlue;
  FormBodePrincipal.Bode.CouleurFond    := clWhite;
  FormBodePrincipal.Bode.CouleurGrille  := clSilver ;
  FormBodePrincipal.Bode.CouleurGain    := clRed;
  FormBodePrincipal.Bode.CouleurPhase   := clBlue;

  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;

end;

procedure TFormBodeCouleurGraphes.ButtonImpressionNBClick(Sender: TObject);
begin
  FormBodePrincipal.Voies.CouleurFond   := clWhite;
  FormBodePrincipal.Voies.CouleurGrille := clSilver ;
  FormBodePrincipal.Voies.CouleurEntree := clBlack;
  FormBodePrincipal.Voies.CouleurSortie := clBlack;
  FormBodePrincipal.Bode.CouleurFond    := clWhite;
  FormBodePrincipal.Bode.CouleurGrille  := clSilver ;
  FormBodePrincipal.Bode.CouleurGain    := clBlack;
  FormBodePrincipal.Bode.CouleurPhase   := clBlack;

  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.ButtonStandardClick(Sender: TObject);
begin
  FormBodePrincipal.Voies.CouleurFond   := clBlack;
  FormBodePrincipal.Voies.CouleurGrille := clSilver ;
  FormBodePrincipal.Voies.CouleurEntree := clAqua;
  FormBodePrincipal.Voies.CouleurSortie := clLime;
  FormBodePrincipal.Bode.CouleurFond    := clBlack;
  FormBodePrincipal.Bode.CouleurGrille  := clSilver ;
  FormBodePrincipal.Bode.CouleurGain    := clAqua;
  FormBodePrincipal.Bode.CouleurPhase   := clLime;

  FormBodeCouleurGraphes.Repaint ;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

//------------------------------------------------------------

procedure TFormBodeCouleurGraphes.PaintBoxBodeFondClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Bode.CouleurFond := ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxBodeGainClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Bode.CouleurGain := ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxBodeGrilleClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Bode.CouleurGrille := ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxBodePhaseClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Bode.CouleurPhase := ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxVoiesEntreeClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Voies.CouleurEntree:= ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxVoiesFondClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Voies.CouleurFond := ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxVoiesGrilleClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Voies.CouleurGrille:= ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

procedure TFormBodeCouleurGraphes.PaintBoxVoiesSortieClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    FormBodePrincipal.Voies.CouleurSortie:= ColorDialog1.Color ;
  FormBodeCouleurGraphes.Repaint;
  FormBodePrincipal.PaintBode.Repaint;
  FormBodePrincipal.PaintVoies.Repaint;
end;

//-----------------------------------------------------------------------

procedure TFormBodeCouleurGraphes.ButtonValiderClick(Sender: TObject);
begin
FormBodeCouleurGraphes.Visible := false ;
end;

procedure TFormBodeCouleurGraphes.ButtonAnnulerClick(Sender: TObject);
begin
  FormBodePrincipal.Bode.CouleurFond   := ConfigurationCouleursSiAnnuler.BodeFond ;
  FormBodePrincipal.Bode.CouleurGrille := ConfigurationCouleursSiAnnuler.BodeGrille ;
  FormBodePrincipal.Bode.CouleurGain   := ConfigurationCouleursSiAnnuler.BodeGain ;
  FormBodePrincipal.Bode.CouleurPhase  := ConfigurationCouleursSiAnnuler.BodePhase ;

  FormBodePrincipal.Voies.CouleurFond   := ConfigurationCouleursSiAnnuler.VoiesFond ;
  FormBodePrincipal.Voies.CouleurGrille := ConfigurationCouleursSiAnnuler.VoiesGrille ;
  FormBodePrincipal.Voies.CouleurEntree := ConfigurationCouleursSiAnnuler.VoiesEntree ;
  FormBodePrincipal.Voies.CouleurSortie := ConfigurationCouleursSiAnnuler.VoiesSortie ;

  FormBodeCouleurGraphes.Visible := false ;
  FormBodePrincipal.PaintBode.Repaint ;
  FormBodePrincipal.PaintVoies.Repaint;
end;


procedure TFormBodeCouleurGraphes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ButtonAnnulerClick(FormBodeCouleurGraphes);
end;

end.
