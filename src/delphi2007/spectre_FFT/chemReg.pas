unit chemReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TCheminRegressi = class(TForm)
    OK: TButton;
    Annuler: TButton;
    label1: TLabel;
    Edit1: TEdit;
    procedure OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnnulerClick(Sender: TObject);
  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  CheminRegressi: TCheminRegressi;

implementation

uses spectrumFFT;

{$R *.DFM}


procedure TCheminRegressi.FormShow(Sender: TObject);

var chemin_de_Regressi     : shortstring;
    chemin                 : shortstring;
    fichier                : textfile;begin

  try
  assignfile(fichier,'c:\cheminreg.txt');
  reset(fichier);
  readln(fichier,chemin_de_regressi);
  closefile(fichier);
  Cheminregressi.edit1.text := chemin_de_regressi ;
  except
  end;

end;


procedure TCheminRegressi.OKClick(Sender: TObject);

var chemin_de_regressi     : shortstring;
    fichier                : textfile;

begin

assignfile(fichier,'c:\cheminreg.txt');
rewrite(fichier);
chemin_de_regressi :=  CheminRegressi.edit1.text;
writeln(fichier,chemin_de_regressi);
closefile(fichier);

CheminRegressi.visible := False;

end;

procedure TCheminRegressi.AnnulerClick(Sender: TObject);
begin
CheminRegressi.visible := False;
end;

end.
