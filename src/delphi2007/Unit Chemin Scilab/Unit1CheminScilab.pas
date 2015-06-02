unit Unit1CheminScilab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl;

type
  TForm1CheminScilab = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FilterComboBox1: TFilterComboBox;
    FileListBox1: TFileListBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure AnnulerClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { D�clarations priv�es}
  public
    { D�clarations publiques}
  end;

var
  Form1CheminScilab: TForm1CheminScilab;
  courant:string;
 // CheminScilab: Tform1;

implementation

uses unitcabalab;

{$R *.DFM}

procedure TForm1CheminScilab.FileListBox1DblClick(Sender: TObject);
begin
{validation par double click du nouvel executable ,avec le chemin, de scilab par  affichage(et "enregistrement")  dans l'edit}
    // showmessage(FileListBox1.filename);
     form1CheminScilab.edit1.text:=  FileListBox1.filename;

end;


procedure TForm1CheminScilab.FormShow(Sender: TObject);
var chemin_de_scilab     : shortstring;
    //chemin                 : shortstring;
    fichier                : textfile;
    begin

  try
  {lecture de l'actuel chemin de scilab enregistr� dans le fichier cheminregf}
  assignfile(fichier,ExtractFilePath(Application.ExeName)+'\FichierPourScilab\cheminscilcabalab.txt');
  reset(fichier);
  readln(fichier,chemin_de_scilab);
  closefile(fichier);
  {affichage du pr�c�dent dans l'�dit}
  Form1CheminScilab.edit1.text := chemin_de_scilab ;
   {enregistrement du "pointeur" du r�pertoire courant de l'application, var global de unit1}
  courant:= DirectoryListBox1.directory;
   {"pointage" courant sur le chemin lu dans le fichier cheminregf,on n'est donc plus au niveau de l'application!!!}
  FileListBox1.filename:= chemin_de_scilab;
  except
  end;


end;


procedure TForm1CheminScilab.OKClick(Sender: TObject);

var chemin_de_scilab     : shortstring;
    fichier                : textfile;

begin

  {retour du pointeur sur la position de l'application et donc des fichiers bloc et cheminregf!!!}
DirectoryListBox1.directory:= courant;

  {�criture du nouveau chemin de regressi ,lu dans edit1, dans le fichier cheminregf}
assignfile(fichier,ExtractFilePath(Application.ExeName)+'\FichierPourScilab\cheminscilCabalab.txt');
rewrite(fichier);
chemin_de_scilab :=  form1CheminScilab.edit1.text;
writeln(fichier,chemin_de_scilab);
closefile(fichier);

Form1CheminScilab.visible := False;
{Formcabalab.SpeedButtonReglagesSCILAB.down:=false;}
end;

procedure TForm1CheminScilab.AnnulerClick(Sender: TObject);
begin
 {retour du pointeur sur la position de l'application et donc des fichiers bloc et cheminregf}
DirectoryListBox1.directory:= courant;
form1CheminScilab.visible := False;
end;




procedure TForm1CheminScilab.Button3Click(Sender: TObject);
begin
    {affichage du pointeur sur la position de l'application et donc des fichiers bloc et cheminregf, mis dans la var couant au moment du lancement de unit1 }
   DirectoryListBox1.directory:= courant;
end;

procedure TForm1CheminScilab.FormCreate(Sender: TObject);
begin
      form1CheminScilab.Left:=0;
      form1CheminScilab.Top:=0;
     courant:=ExtractFilePath(Application.ExeName);
     DirectoryListBox1.directory:= courant;
end;

procedure TForm1CheminScilab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

{Formcabalab.SpeedButtonReglagesSCILAB.down:=false;}
end;

end.
