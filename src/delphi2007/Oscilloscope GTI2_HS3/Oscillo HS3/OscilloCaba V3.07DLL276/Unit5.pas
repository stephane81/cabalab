unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dlldecl;

type
  TFormEchantillons = class(TForm)
    EditNBRECH: TEdit;
    ButtonNBRECH: TButton;
    Label1: TLabel;
    procedure NBRECHclick(Sender: TObject);
    procedure ButtonNBRECHClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormEchantillons: TFormEchantillons;

implementation

{$R *.dfm}

procedure TFormEchantillons.NBRECHclick(Sender: TObject);
begin
     EditNBRECH.Text:='';
end;

procedure TFormEchantillons.ButtonNBRECHClick(Sender: TObject);
var
NBRECH:integer;
syntaxe:boolean;
begin

     syntaxe:=true;
     try
     NBRECH:=round(StrToFloat(EditNBRECH.Text));
     except
     showmessage('Erreur de syntaxe');
     Syntaxe:=false
     end;

     if (syntaxe=true) and (NBRECH<130973) and (NBRECH>0) then
     begin
     SetMeasureMode ( 3 ) ; //Mesure sur les 2 voies
     SetRecordLength ( NBRECH ) ;  // enregistrer sur NBech échantillons
     SetPostSamples ( NBRECH ) ;   // à mettre égal au nombre d'échantillons (!) sinon voir doc
     SetRecordLength ( NBRECH ) ;
     FormEchantillons.Visible:=false;
     end
     else EditNBRECH.Text:='Valeur impossible!';

end;

procedure TFormEchantillons.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    Resize:=false;
end;

procedure TFormEchantillons.FormCreate(Sender: TObject);
begin
   FormEchantillons.Top:=0;
   FormEchantillons.Left:=0;
end;

end.
