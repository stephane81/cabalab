unit UnitBodeLinearite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,DllDecl;

type
  TFormBodeLinearite = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    BoutonRecommencer: TRadioButton;
    Boutonfinir: TRadioButton;
    Boutonneplustenircompte: TRadioButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  FormBodeLinearite: TFormBodeLinearite;

implementation

uses UnitBodePrincipal;

{$R *.DFM}

procedure TFormBodeLinearite.Button1Click(Sender: TObject);
begin
FormBodeLinearite.visible:=False;


   if BoutonRecommencer.checked then
   begin

   FormBodePrincipal.Regler;

   end;

   if BoutonFinir.checked then
   begin
   SetFuncGenOutputOn(0);
  {activer les boutons de réglage du géné }
    FormBodePrincipal.lin.enabled:=true;
    FormBodePrincipal.log.enabled:=true;
    FormBodePrincipal.SetFmin.enabled:=true;
    FormBodePrincipal.SetFmax.enabled:=true;
    FormBodePrincipal.SetGeneAmp.enabled:=true;
    FormBodePrincipal.SetGeneDCOffset.enabled:=true;

  {activer le bouton de nouveau balayage }
    FormBodePrincipal.boutondepart.visible:=true;
    FormBodePrincipal.boutonpause.visible:=false;
    // menus
    FormBodePrincipal.Nombresdepointsdurelev1 .enabled := True;
    FormBodePrincipal.Effacer                 .enabled := false;
    FormBodePrincipal.effacer5                .enabled := False;
    FormBodePrincipal.effacer10               .enabled := False;



   end;

   if Boutonneplustenircompte.checked then
   begin
   FormBodePrincipal.Balayage.linearites_prises_en_compte:=false;

   FormBodePrincipal.Balayer(FormBodePrincipal);

   end;
  

end;

end.
