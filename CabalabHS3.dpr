program CabalabHS3;


{$DEFINE HS3}


uses
  Forms,
  windows,
  dialogs,
  dlldecl in 'DllDeclHS3\dlldecl.pas',
  UnitCabalab in 'HS3\UnitCabalab.pas' {FormCabaLab},
  UnitGBF in 'GBFpourCabaLab\UnitGBF.pas' {FormGBF},
  UnitBodePrincipal in 'Diagramme de Bode\UnitBodePrincipal.pas' {FormBodePrincipal},
  UnitBodeLinearite in 'Diagramme de Bode\UnitBodeLinearite.pas' {FormBodeLinearite},
  UnitBodeNbMesures in 'Diagramme de Bode\UnitBodeNbMesures.pas' {FormBodeNbMesures},
  UnitBodeOptionsSauvegarde in 'Diagramme de Bode\UnitBodeOptionsSauvegarde.pas' {FormBodeOptions},
  Unit_aide_Bode in 'Diagramme de Bode\Aide\Unit_aide_Bode.pas' {Bode_utilisation},
  Unit_aide_Bode_abscisse in 'Diagramme de Bode\Aide\Unit_aide_Bode_abscisse.pas' {Bode_abscisse},
  Unit_aide_Bode_logo in 'Diagramme de Bode\Aide\Unit_aide_Bode_logo.pas' {Bode_logo},
  Unit_aide_Bode_ordonnee in 'Diagramme de Bode\Aide\Unit_aide_Bode_ordonnee.pas' {Bode_ordonnee},
  Unit_aide_Bode_Commencer in 'Diagramme de Bode\Aide\Unit_aide_Bode_Commencer.pas' {Bode_Commencer},
  Unit_aide_Bode_stockage in 'Diagramme de Bode\Aide\Unit_aide_Bode_stockage.pas' {Bode_stockage},
  Unit_aide_Bode_transfert in 'Diagramme de Bode\Aide\Unit_aide_Bode_transfert.pas' {Bode_transfert},
  regressispecdecl in 'spectre_FFT\regressispecdecl.pas',
  Kaiserdecl in 'spectre_FFT\Kaiserdecl.pas',
  Unit_aide_FFT in 'spectre_FFT\Unit_aide_FFT.pas' {FFT_utilisation},
  Unit_aide_FFT_abscisse in 'spectre_FFT\Unit_aide_FFT_abscisse.pas' {FFT_abscisse},
  Unit_aide_FFT_accu in 'spectre_FFT\Unit_aide_FFT_accu.pas' {FFT_accu},
  Unit_aide_FFT_BdeT in 'spectre_FFT\Unit_aide_FFT_BdeT.pas' {FFT_BdeT},
  Unit_aide_FFT_logo in 'spectre_FFT\Unit_aide_FFT_logo.pas' {FFT_logo},
  Unit_aide_FFT_ordonnee in 'spectre_FFT\Unit_aide_FFT_ordonnee.pas' {FFT_ordonnee},
  Unit_aide_FFT_stop in 'spectre_FFT\Unit_aide_FFT_stop.pas' {FFT_stop},
  Unit_aide_FFT_transfert in 'spectre_FFT\Unit_aide_FFT_transfert.pas' {FFT_transfert},
  Unit_aide_FFT_trigger in 'spectre_FFT\Unit_aide_FFT_trigger.pas' {FFT_trigger},
  Unit_Base_de_Frequence in 'spectre_FFT\Unit_Base_de_Frequence.pas',
  Unit1CheminScilab in 'Unit Chemin Scilab\Unit1CheminScilab.pas' {Form1CheminScilab},
  UnitTransfertRegressi in 'Regressi\UnitTransfertRegressi.pas' {FormTransfertRegressi},
  Unitfantome in 'Cabalab-Fiches Supplementaires\Unitfantome.pas' {FormFantome},
  UnitAPropos in 'Cabalab-Fiches Supplementaires\UnitAPropos.pas' {FormAPropos},
  Unit1Mesures_XY_Montages in 'Mesures XY GTI2_HS3\images pour mesurescaba\Unit1Mesures_XY_Montages.pas' {FormMontagesXY},
  UnitBodeCouleurGraphes in 'Diagramme de Bode\UnitBodeCouleurGraphes.pas' {FormBodeCouleurGraphes},
  UnitTITvoiture in 'Petite Voiture\UnitTITvoiture.pas' {FormTitVoiture},
  UnitOscilloHS3 in 'Oscilloscope GTI2_HS3\Oscillo HS3\UnitOscilloHS3.pas' {OscilloCaba},
  UnitOscilloHS3NbEchPerso in 'Oscilloscope GTI2_HS3\Oscillo HS3\FICHES complement oscillo\UnitOscilloHS3NbEchPerso.pas' {FormEchantillons},
  UnitOscilloHS3optionsEnrg in 'Oscilloscope GTI2_HS3\Oscillo HS3\FICHES complement oscillo\UnitOscilloHS3optionsEnrg.pas' {Options},
  UnitOscilloHS3TransfertRegressi in 'Oscilloscope GTI2_HS3\Oscillo HS3\FICHES complement oscillo\UnitOscilloHS3TransfertRegressi.pas' {FormUTILISATEUR_RegressiTransfert},
  Unit1MesuresCaba_HS3 in 'Mesures XY GTI2_HS3\Mesures XY HS3\Unit1MesuresCaba_HS3.pas' {Form1MesuresCaba_HS3},
  Unit_Traceur_HS3 in 'Taceur GTI2_HS3\Traceur HS3\Unit_Traceur_HS3.pas' {Form_Traceur_HS3},
  spectrumFFT in 'spectre_FFT\spectrumFFT.pas' {Fenetre_Spectre},
  UnitSpectreCouleurGraphes in 'spectre_FFT\UnitSpectreCouleurGraphes.pas' {FormSpectreCouleurGraphes},
  Unit_aide_FFT_frequence in 'spectre_FFT\Unit_aide_FFT_frequence.pas' {FFT_frequence},
  Unit_aide_FFT_repliement in 'spectre_FFT\Unit_aide_FFT_repliement.pas' {FFT_exemple_repliement},
  Unit_GBF_AWG_AM in 'Unit_GBF_AWG_AM.pas' {Form_GBF_AWG_AM},
  ddeman in 'Regressi\ddeman.pas';

{$R *.res}

begin

SetLastError(NO_ERROR);

{$IFDEF GTI2}
   CreateMutex (nil, False, 'CabalabGTI2');
{$ENDIF}

{$IFDEF HS3}
   CreateMutex (nil, False, 'CabalabHS3');
{$ENDIF}
  

  if GetLastError = ERROR_ALREADY_EXISTS
    then
    begin
 showmessage('Impossible d''exécuter Cabalab : Cette application est déjà en cours d''exécution !');
   // CreateMessageDialog('Impossible d''exécuter Cabalab : Cette application est déjà en cours d''exécution !',
   //                  mtError	, mbOKCancel		);
   // showmodal
    Exit;
    end;
  Application.Initialize;
  Application.CreateForm(TFormCabaLab, FormCabaLab);
  Application.CreateForm(TFormGBF, FormGBF);
  Application.CreateForm(TFormBodeLinearite, FormBodeLinearite);
  Application.CreateForm(TFormBodeNbMesures, FormBodeNbMesures);
  Application.CreateForm(TFormBodeOptions, FormBodeOptions);
  Application.CreateForm(TFormBodePrincipal, FormBodePrincipal);
  Application.CreateForm(TFormAPropos, FormAPropos);
  Application.CreateForm(TFFT_utilisation, FFT_utilisation);
  Application.CreateForm(TFFT_abscisse, FFT_abscisse);
  Application.CreateForm(TFFT_accu, FFT_accu);
  Application.CreateForm(TFFT_BdeT, FFT_BdeT);
  Application.CreateForm(TFFT_logo, FFT_logo);
  Application.CreateForm(TFFT_ordonnee, FFT_ordonnee);
  Application.CreateForm(TFFT_stop, FFT_stop);
  Application.CreateForm(TFFT_transfert, FFT_transfert);
  Application.CreateForm(TFFT_trigger, FFT_trigger);
  Application.CreateForm(TBode_utilisation, Bode_utilisation);
  Application.CreateForm(TBode_abscisse, Bode_abscisse);
  Application.CreateForm(TBode_logo, Bode_logo);
  Application.CreateForm(TBode_ordonnee, Bode_ordonnee);
  Application.CreateForm(TBode_Commencer, Bode_Commencer);
  Application.CreateForm(TBode_Commencer, Bode_Commencer);
  Application.CreateForm(TBode_stockage, Bode_stockage);
  Application.CreateForm(TBode_stockage, Bode_stockage);
  Application.CreateForm(TBode_stockage, Bode_stockage);
  Application.CreateForm(TBode_transfert, Bode_transfert);
  Application.CreateForm(TBode_transfert, Bode_transfert);
  Application.CreateForm(TForm1CheminScilab, Form1CheminScilab);
  Application.CreateForm(TFormTransfertRegressi, FormTransfertRegressi);
  Application.CreateForm(TFormFantome, FormFantome);
  Application.CreateForm(TFormAPropos, FormAPropos);
  Application.CreateForm(TFormMontagesXY, FormMontagesXY);
  Application.CreateForm(TFormBodeCouleurGraphes, FormBodeCouleurGraphes);
  Application.CreateForm(TFormTitVoiture, FormTitVoiture);
  Application.CreateForm(TOscilloCaba, OscilloCaba);
  Application.CreateForm(TFormEchantillons, FormEchantillons);
  Application.CreateForm(TOptions, Options);
  Application.CreateForm(TFormUTILISATEUR_RegressiTransfert, FormUTILISATEUR_RegressiTransfert);
  Application.CreateForm(TForm1MesuresCaba_HS3, Form1MesuresCaba_HS3);
  Application.CreateForm(TForm_Traceur_HS3, Form_Traceur_HS3);
  Application.CreateForm(TFenetre_Spectre, Fenetre_Spectre);
  Application.CreateForm(TFenetre_Spectre, Fenetre_Spectre);
  Application.CreateForm(TFormSpectreCouleurGraphes, FormSpectreCouleurGraphes);
  Application.CreateForm(TFFT_frequence, FFT_frequence);
  Application.CreateForm(TFFT_exemple_repliement, FFT_exemple_repliement);
  Application.CreateForm(TForm_GBF_AWG_AM, Form_GBF_AWG_AM);
  Application.Run;
end.





