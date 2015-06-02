unit UnitBodeOptionsSauvegarde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,DllDecl;

type
  TFormBodeOptions = class(TForm)
    Suppr: TButton;
    edit: TEdit;
    ColorDialog: TColorDialog;
    GroupBox1: TGroupBox;
    couleur1: TButton;
    GroupBox2: TGroupBox;
    couleur2: TButton;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    Button1: TButton;
    procedure SupprClick(Sender: TObject);
    procedure couleur1Click(Sender: TObject);
    procedure couleur2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  FormBodeOptions: TFormBodeOptions;

implementation

uses UnitBodePrincipal;

{$R *.DFM}

procedure TFormBodeOptions.SupprClick(Sender: TObject);

var i : integer ;
begin

   if formBodePrincipal.courbe_courante <> formBodePrincipal.nb_courbes_stockees then
      for i:= formBodePrincipal.courbe_courante to formBodePrincipal.nb_courbes_stockees - 1 do
          FormBodePrincipal.courbes[i] := FormBodePrincipal.courbes[i+1];

FormBodePrincipal.cochages[formBodePrincipal.nb_courbes_stockees].Visible  := False;
FormBodePrincipal.boutons [formBodePrincipal.nb_courbes_stockees].Visible  := False;
FormBodePrincipal.nb_courbes_stockees := formBodePrincipal.nb_courbes_stockees - 1 ;

FormBodeOptions.Visible:=False;
formBodePrincipal.visible:=True;



end;

procedure TFormBodeOptions.couleur1Click(Sender: TObject);
begin
ColorDialog.execute;
FormBodePrincipal.courbes[formBodePrincipal.courbe_courante].couleur1:=colordialog.color;
FormBodeOptions.visible:=true;
formshow(self);
end;


procedure TFormBodeOptions.couleur2Click(Sender: TObject);
begin

ColorDialog.execute;
FormBodePrincipal.courbes[formBodePrincipal.courbe_courante].couleur2:=colordialog.color;
FormBodeOptions.visible:=true;
formshow(self);
end;

procedure TFormBodeOptions.FormShow(Sender: TObject);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
     Longueur_Acquisition : dword;
    wIndex, wCurrentY : Word;
    rSens             : double;
const marge_hori =0;
      marge_vert = 0;
begin
formBodePrincipal.visible:=false;
edit.text := formBodePrincipal.courbes[formBodePrincipal.courbe_courante].nom ;



{affichage phase stockée}
   rSens:=3.24;         {échelle +pi/-pi}
   PaintBox2.Canvas.Pen.Color :=formBodePrincipal.courbes[formBodePrincipal.courbe_courante].couleur2 ;

   wCurrentY := Round(marge_vert + ((formBodePrincipal.courbes[formBodePrincipal.courbe_courante].phase[0] / -rSens) * ((PaintBox2.Height - 2 * marge_vert )/ 2 )) + (PaintBox2.Height - 2 * marge_vert) / 2);
  PaintBox2.Canvas.MoveTo(marge_hori, wCurrentY);

         for wIndex := 0 to FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert + ((FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].phase[wIndex] / -rSens) * ((PaintBox2.Height - 2 * marge_vert )/ 2 )) + (PaintBox2.Height - 2 * marge_vert) / 2);
         PaintBox2.Canvas.Pixels[marge_hori + round(wIndex*(PaintBox2.Width - 2 * marge_hori)/FormBodePrincipal.Bode.indice_final), wCurrentY] := clLime;
         end;
         for wIndex := 1 to FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert + ((FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].phase[wIndex] / -rSens) * ((PaintBox2.Height - 2 * marge_vert )/ 2 )) + (PaintBox2.Height - 2 * marge_vert) / 2);
            if ( (FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].Phase[wIndex]>-2) and  (FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].Phase[wIndex]<2)  ) or
               ( (FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].Phase[wIndex]>2)  and (FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].Phase[wIndex-1]>0) ) or
               ( (FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].Phase[wIndex]<-2) and (FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].Phase[wIndex-1]<0) )
            then
            PaintBox2.Canvas.LineTo(round( marge_hori + wIndex*(PaintBox2.Width- 2 * marge_hori)/FormBodePrincipal.Bode.indice_final), wCurrentY)
            else
            PaintBox2.Canvas.MoveTo(round(marge_hori + wIndex*(PaintBox2.Width- 2 * marge_hori)/FormBodePrincipal.Bode.indice_final), wCurrentY);
         end;
{affichage gain stocké }

 PaintBox1.Canvas.Pen.Color := FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].couleur1 ;
   rSens:=40;             {temporairement échelle +/- 40 dB }
   wCurrentY :=  Round(marge_vert +  (((FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].gain[0] + 20 ) / -rSens ) * ((PaintBox1.Height - 2 * marge_vert ) / 2)) + (PaintBox1.Height - 2 * marge_vert ) / 2);;
   PaintBox1.Canvas.MoveTo(marge_hori, wCurrentY);

         for wIndex := 0 to FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].indice_derniere_mesure do
         begin
         wCurrentY := Round(marge_vert +  (((FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].gain[wIndex] + 20 ) / -rSens ) * ((PaintBox1.Height - 2 * marge_vert ) / 2)) + (PaintBox1.Height - 2 * marge_vert ) / 2);
         PaintBox1.Canvas.LineTo(marge_hori + round(wIndex*(PaintBox1.Width- 2 * marge_hori)/FormBodePrincipal.Bode.indice_final), wCurrentY);
         end; { for }



//GetSensitivity( lCh1, @Calibre1);
//GetSensitivity( lCh2, @Calibre2);
//Longueur_Acquisition := GetRecordLength();

{affichage gain


   GroupBox1.visible := True;
   PaintBox1.Canvas.Brush.Color := clBlack;
   PaintBox1.Canvas.Rectangle(0, 0, PaintBox1.Width - 1, PaintBox1.Height - 1);
   PaintBox1.Canvas.Pen.Color :=FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].couleur1;
   PaintBox1.Canvas.MoveTo(0, Round(  FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].gain[ 0 ] * (PaintBox1.Height/2) / Calibre1 + (PaintBox1.Height/2) ));

             for Curseur_Abscisse := 1 to PaintBox1.Width - 1 do
             begin
             Curseur_Ordonnee := Round(  - FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].gain[ round( Curseur_Abscisse * Longueur_Acquisition / PaintBox1.Width ) ] * (PaintBox1.Height/2) / Calibre2 + (PaintBox1.Height/2) );
             PaintBox1.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
             end;




 {affichage phase
   GroupBox2.visible := True;
   PaintBox2.Canvas.Brush.Color := clBlack;
   PaintBox2.Canvas.Rectangle(0, 0, PaintBox2.Width - 1, PaintBox2.Height - 1);
   PaintBox2.Canvas.Pen.Color :=FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].couleur2;
   PaintBox2.Canvas.MoveTo(0, Round(  FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].phase[ 0 ] * (PaintBox2.Height/2) / Calibre2 + (PaintBox2.Height/2) ));

             for Curseur_Abscisse := 1 to PaintBox2.Width - 1 do
             begin
             Curseur_Ordonnee := Round(  - FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].phase[ round( Curseur_Abscisse * Longueur_Acquisition / PaintBox2.Width ) ] * (PaintBox1.Height/2) / Calibre2 + (PaintBox1.Height/2) );
             PaintBox2.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
             end;


   }


end;

procedure TFormBodeOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FormBodePrincipal.cochages[FormBodePrincipal.courbe_courante].caption := FormBodeOptions.edit.text ;
FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].nom := FormBodeOptions.edit.text ;

FormBodePrincipal.visible:= true;
end;


procedure TFormBodeOptions.Button1Click(Sender: TObject);
begin
FormBodePrincipal.cochages[FormBodePrincipal.courbe_courante].caption := FormBodeOptions.edit.text ;
FormBodePrincipal.courbes[FormBodePrincipal.courbe_courante].nom := FormBodeOptions.edit.text ;
FormBodePrincipal.visible:= true;
FormBodePrincipal.show;
FormBodeOptions.visible:=false;
end;

end.
