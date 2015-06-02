unit Unit_aide_Bode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TBode_utilisation = class(TForm)
    Edit2: TEdit;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;

  {  procedure stopChange(Sender: TObject);}

    procedure abscisseClick(Sender: TObject);
    procedure ordonneeClick(Sender: TObject);
    procedure frequenceClick(Sender: TObject);
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
  Bode_utilisation: TBode_utilisation;

implementation

uses Unit_aide_Bode_abscisse, Unit_aide_Bode_ordonnee, Unit_aide_Bode_logo,
  Unit_aide_Bode_Commencer, Unit_aide_Bode_stockage, Unit_aide_Bode_transfert;

{uses {Unit_aide_Bode_abscisse,Unit_aide_Bode_ordonnee, Unit_aide_Bode_BdeT, Unit_aide_Bode_trigger,
  Unit_aide_Bode_transfert,
  Unit_aide_Bode_frequence, Unit_aide_Bode_stop, Unit_aide_Bode_logo,
  Unit_aide_Bode_accu;    }

{$R *.dfm}


procedure TBode_utilisation.abscisseClick(Sender: TObject);
begin
Bode_abscisse.Visible:=True;
Bode_abscisse.BringToFront;
Bode_utilisation.Visible := False ;
end;

procedure TBode_utilisation.ordonneeClick(Sender: TObject);
begin
Bode_ordonnee.Visible:=True;
Bode_ordonnee.BringToFront;
Bode_utilisation.Visible := False ;
end;

procedure TBode_utilisation.frequenceClick(Sender: TObject);
begin
{Bode_frequence.Visible:=True;
Bode_frequence.BringToFront;
Bode_utilisation.Visible := False ;}
end;

procedure TBode_utilisation.stopClick(Sender: TObject);
begin
Bode_Commencer.Visible:=True;
Bode_Commencer.BringToFront;
Bode_utilisation.Visible := False ;
end;

procedure TBode_utilisation.logoClick(Sender: TObject);
begin
Bode_logo.Visible:=True;
Bode_logo.BringToFront;
Bode_utilisation.Visible := False ;
end;

procedure TBode_utilisation.AccuClick(Sender: TObject);
begin
Bode_stockage.Visible:=True;
Bode_stockage.BringToFront;
Bode_utilisation.Visible := False ;
end;

procedure TBode_utilisation.TransfertClick(Sender: TObject);
begin
Bode_Transfert.Visible:=True;
Bode_Transfert.BringToFront;
Bode_utilisation.Visible := False ;
end;


end.
