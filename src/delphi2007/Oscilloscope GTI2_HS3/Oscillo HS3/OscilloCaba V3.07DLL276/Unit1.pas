unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FileCtrl, StdCtrls;

type
  TForm1 = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FilterComboBox1: TFilterComboBox;
    FileListBox1: TFileListBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure AnnulerClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  Form1: TForm1;
  courant:string;
 // CheminRegressi: Tform1;

implementation

uses Principal;

{$R *.DFM}

procedure TForm1.FileListBox1DblClick(Sender: TObject);
begin
{validation par double click du nouvel executable ,avec le chemin, de regressi par  affichage(et "enregistrement")  dans l'edit}
    // showmessage(FileListBox1.filename);
     form1.edit1.text:=  FileListBox1.filename;

end;






procedure TForm1.FormShow(Sender: TObject);
var chemin_de_regressi     : shortstring;
    //chemin                 : shortstring;
    fichier                : textfile;begin

  try
  {lecture de l'actuel chemin de regressi enregistré dans le fichier cheminregf}
  assignfile(fichier,'cheminregf.txt');
  reset(fichier);
  readln(fichier,chemin_de_regressi);
  closefile(fichier);
  {affichage du précédent dans l'édit}
  Form1.edit1.text := chemin_de_regressi ;
   {enregistrement du "pointeur" du répertoire courant de l'application, var global de unit1}
  courant:= DirectoryListBox1.directory;
   {"pointage" courant sur le chemin lu dans le fichier cheminregf,on n'est donc plus au niveau de l'application!!!}
  FileListBox1.filename:= chemin_de_regressi;
  except
  end;


end;


procedure TForm1.OKClick(Sender: TObject);

var chemin_de_regressi     : shortstring;
    fichier                : textfile;

begin

  {retour du pointeur sur la position de l'application et donc des fichiers bloc et cheminregf!!!}
DirectoryListBox1.directory:= courant;

  {écriture du nouveau chemin de regressi ,lu dans edit1, dans le fichier cheminregf}
assignfile(fichier,'cheminregf.txt');
rewrite(fichier);
chemin_de_regressi :=  form1.edit1.text;
writeln(fichier,chemin_de_regressi);
closefile(fichier);

Form1.visible := False;                                                                       
end;

procedure TForm1.AnnulerClick(Sender: TObject);
begin
 {retour du pointeur sur la position de l'application et donc des fichiers bloc et cheminregf}
DirectoryListBox1.directory:= courant;
form1.visible := False;
end;




procedure TForm1.Button3Click(Sender: TObject);
begin
    {affichage du pointeur sur la position de l'application et donc des fichiers bloc et cheminregf, mis dans la var couant au moment du lancement de unit1 }
   DirectoryListBox1.directory:= courant;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      form1.Left:=0;
      form1.Top:=0;
     courant:=ExtractFilePath(Application.ExeName);
     DirectoryListBox1.directory:= courant;
end;

end.
