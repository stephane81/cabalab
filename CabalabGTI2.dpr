program CabalabGTI2;

{$DEFINE GTI2}



uses
  Forms,
  windows,
  dialogs,
  UnitCabalab in 'GTI2\UnitCabalab.pas' {FormCabaLab},
  UnitBodePrincipal in 'Diagramme de Bode\UnitBodePrincipal.pas' {FormBodePrincipal},
  UnitBodeLinearite in 'Diagramme de Bode\UnitBodeLinearite.pas' {FormBodeLinearite},
  UnitBodeNbMesures in 'Diagramme de Bode\UnitBodeNbMesures.pas' {FormBodeNbMesures},
  UnitBodeOptionsSauvegarde in 'Diagramme de Bode\UnitBodeOptionsSauvegarde.pas' {FormBodeOptions},
  regressispecdecl in 'FFT\fiches_complémentaire_FFT_mut_GTI2\regressispecdecl.pas',
  Kaiserdecl in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Kaiserdecl.pas',
  Unit_aide_FFT in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT.pas' {FFT_utilisation},
  Unit_aide_FFT_abscisse in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_abscisse.pas' {FFT_abscisse},
  Unit_aide_FFT_accu in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_accu.pas' {FFT_accu},
  Unit_aide_FFT_BdeT in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_BdeT.pas' {FFT_BdeT},
  Unit_aide_FFT_frequence in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_frequence.pas' {FFT_frequence},
  Unit_aide_FFT_logo in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_logo.pas' {FFT_logo},
  Unit_aide_FFT_ordonnee in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_ordonnee.pas' {FFT_ordonnee},
  Unit_aide_FFT_stop in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_stop.pas' {FFT_stop},
  Unit_aide_FFT_transfert in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_transfert.pas' {FFT_transfert},
  Unit1CheminScilab in 'Unit Chemin Scilab\Unit1CheminScilab.pas' {Form1CheminScilab},
  UnitfrequencesGBF in 'DLLDeclGTI2\UnitfrequencesGBF.pas',
  UnitFrequencesGBFfichier in 'DLLDeclGTI2\UnitFrequencesGBFfichier.pas',
  UnitFrequencesAcqu in 'DLLDeclGTI2\UnitFrequencesAcqu.pas',
  UnitAPropos in 'Cabalab-Fiches Supplementaires\UnitAPropos.pas' {FormAPropos},
  Unitfantome in 'Cabalab-Fiches Supplementaires\Unitfantome.pas' {FormFantome},
  Unit1Mesures_XY_GTI2 in 'Mesures XY GTI2_HS3\Mesures XY GTI2\Unit1Mesures_XY_GTI2.pas' {Form1MesuresCaba_GTI2},
  Unit1Mesures_XY_Montages in 'Mesures XY GTI2_HS3\images pour mesurescaba\Unit1Mesures_XY_Montages.pas' {FormMontagesXY},
  UnitOscilloGTI2 in 'Oscilloscope GTI2_HS3\Oscillo GTI2\UnitOscilloGTI2.pas' {FormOscilloGTI2},
  UnitOscilloGTI2TIMEOUT in 'Oscilloscope GTI2_HS3\Oscillo GTI2\fiches_complémentaire_oscillogti2\UnitOscilloGTI2TIMEOUT.pas' {Formtimeout},
  UnitTraceurGTI2 in 'Taceur GTI2_HS3\Traceur GTI2\UnitTraceurGTI2.pas' {FormTraceurGTI2},
  UnitGBF in 'GBFpourCabaLab\UnitGBF.pas' {FormGBF},
  UnitTITvoiture in 'Petite Voiture\UnitTITvoiture.pas' {FormTitVoiture},
  UnitBodeCouleurGraphes in 'Diagramme de Bode\UnitBodeCouleurGraphes.pas' {FormBodeCouleurGraphes},
  UnitMouchard in 'GTI2\UnitMouchard.pas' {FormMouchard},
  Unit_FFT_mut_GTI2GestionCouleursCourbes in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_FFT_mut_GTI2GestionCouleursCourbes.pas' {Form_FFT_mut_ConfigCouleursOscilloGTI2},
  Unit_FFT_mut_GTI2TIMEOUT in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_FFT_mut_GTI2TIMEOUT.pas' {form_FFT_mut_TIMEOUT},
  Unit_FFT_mut_GTI2TransfertRegressiUtilisateur in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_FFT_mut_GTI2TransfertRegressiUtilisateur.pas' {Form_FFT_mut_GTI2TransfertRegressiUtilisateur},
  Unit_Base_de_Frequence in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_Base_de_Frequence.pas',
  UnitTransfertRegressi in 'Regressi\UnitTransfertRegressi.pas' {FormTransfertRegressi},
  dlldecl in 'DLLDeclGTI2\dlldecl.PAS',
  UnitOsciG2GestCoulCou in 'Oscilloscope GTI2_HS3\Oscillo GTI2\fiches_complémentaire_oscillogti2\UnitOsciG2GestCoulCou.pas' {FormConfigCouleursOscilloGTI2},
  UnitOsciG2TransRegUtil in 'Oscilloscope GTI2_HS3\Oscillo GTI2\fiches_complémentaire_oscillogti2\UnitOsciG2TransRegUtil.pas' {FormOscilloGTI2TransfertRegressiUtilisateur},
  UnitTracG2ConfCoulCou in 'Taceur GTI2_HS3\Traceur GTI2\fiches_complémentaire_TRACEUR_GTI2\UnitTracG2ConfCoulCou.pas' {FormConfigCouleurs},
  Unit_aide_FFT_repliement in 'FFT\fiches_complémentaire_FFT_mut_GTI2\Unit_aide_FFT_repliement.pas' {FFT_exemple_repliement},
  Unit_FFT_mut_GTI2 in 'FFT\Unit_FFT_mut_GTI2.pas' {Form_FFT_mut_GTI2},
  Unit_aide_Bode in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode.pas' {Bode_utilisation},
  Unit_aide_Bode_abscisse in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode_abscisse.pas' {Bode_abscisse},
  Unit_aide_Bode_Commencer in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode_Commencer.pas' {Bode_Commencer},
  Unit_aide_Bode_logo in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode_logo.pas' {Bode_logo},
  Unit_aide_Bode_ordonnee in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode_ordonnee.pas' {Bode_ordonnee},
  Unit_aide_Bode_stockage in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode_stockage.pas' {Bode_stockage},
  Unit_aide_Bode_transfert in 'Diagramme de Bode\Aide_GTI2\Unit_aide_Bode_transfert.pas' {Bode_transfert},
  UnitOsciG2GestClCBLEU in 'FFT\fiches_complémentaire_FFT_mut_GTI2\UnitOsciG2GestClCBLEU.pas' {FormConfigCouleursFFTGTI2BLEU},
  ddeman in 'Regressi\ddeman.pas',
  spectrumFFT in 'spectre_FFT\spectrumFFT.pas' {Fenetre_Spectre},
  Unit_aide_FFT_trigger in 'spectre_FFT\Unit_aide_FFT_trigger.pas' {FFT_trigger},
  UnitSpectreCouleurGraphes in 'spectre_FFT\UnitSpectreCouleurGraphes.pas' {FormSpectreCouleurGraphes},
  UnitGTI2Calibration in 'GTI2\UnitGTI2Calibration.pas' {FormGTI2Calibration};

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
  Application.CreateForm(TFormBodeLinearite, FormBodeLinearite);
  Application.CreateForm(TFormBodeNbMesures, FormBodeNbMesures);
  Application.CreateForm(TFormBodeOptions, FormBodeOptions);
  Application.CreateForm(TFormBodePrincipal, FormBodePrincipal);
  Application.CreateForm(TFormAPropos, FormAPropos);
  Application.CreateForm(TFFT_utilisation, FFT_utilisation);
  Application.CreateForm(TFFT_abscisse, FFT_abscisse);
  Application.CreateForm(TFFT_accu, FFT_accu);
  Application.CreateForm(TFFT_BdeT, FFT_BdeT);
  Application.CreateForm(TFFT_frequence, FFT_frequence);
  Application.CreateForm(TFFT_logo, FFT_logo);
  Application.CreateForm(TFFT_ordonnee, FFT_ordonnee);
  Application.CreateForm(TFFT_stop, FFT_stop);
  Application.CreateForm(TFFT_transfert, FFT_transfert);
  Application.CreateForm(TBode_Commencer, Bode_Commencer);
  Application.CreateForm(TBode_stockage, Bode_stockage);
  Application.CreateForm(TBode_stockage, Bode_stockage);
  Application.CreateForm(TBode_transfert, Bode_transfert);
  Application.CreateForm(TForm1CheminScilab, Form1CheminScilab);
  Application.CreateForm(TFormAPropos, FormAPropos);
  Application.CreateForm(TFormFantome, FormFantome);
  Application.CreateForm(TForm1MesuresCaba_GTI2, Form1MesuresCaba_GTI2);
  Application.CreateForm(TFormMontagesXY, FormMontagesXY);
  Application.CreateForm(TFormOscilloGTI2, FormOscilloGTI2);
  Application.CreateForm(TFormtimeout, Formtimeout);
  Application.CreateForm(TFormOscilloGTI2TransfertRegressiUtilisateur, FormOscilloGTI2TransfertRegressiUtilisateur);
  Application.CreateForm(TFormTraceurGTI2, FormTraceurGTI2);
  Application.CreateForm(TFormGBF, FormGBF);
  Application.CreateForm(TFormTitVoiture, FormTitVoiture);
  Application.CreateForm(TFormBodeCouleurGraphes, FormBodeCouleurGraphes);
  Application.CreateForm(TFormMouchard, FormMouchard);
  Application.CreateForm(TForm_FFT_mut_ConfigCouleursOscilloGTI2, Form_FFT_mut_ConfigCouleursOscilloGTI2);
  Application.CreateForm(TForm_FFT_mut_GTI2TransfertRegressiUtilisateur, Form_FFT_mut_GTI2TransfertRegressiUtilisateur);
  Application.CreateForm(TFormTransfertRegressi, FormTransfertRegressi);
  Application.CreateForm(TFormConfigCouleursOscilloGTI2, FormConfigCouleursOscilloGTI2);
  Application.CreateForm(TFormOscilloGTI2TransfertRegressiUtilisateur, FormOscilloGTI2TransfertRegressiUtilisateur);
  Application.CreateForm(TFormConfigCouleurs, FormConfigCouleurs);
  Application.CreateForm(TFFT_exemple_repliement, FFT_exemple_repliement);
  Application.CreateForm(TForm_FFT_mut_GTI2, Form_FFT_mut_GTI2);
  Application.CreateForm(TBode_utilisation, Bode_utilisation);
  Application.CreateForm(TBode_abscisse, Bode_abscisse);
  Application.CreateForm(TBode_Commencer, Bode_Commencer);
  Application.CreateForm(TBode_logo, Bode_logo);
  Application.CreateForm(TBode_ordonnee, Bode_ordonnee);
  Application.CreateForm(TBode_stockage, Bode_stockage);
  Application.CreateForm(TBode_transfert, Bode_transfert);
  Application.CreateForm(TFormConfigCouleursFFTGTI2BLEU, FormConfigCouleursFFTGTI2BLEU);
  Application.CreateForm(TFenetre_Spectre, Fenetre_Spectre);
  Application.CreateForm(TFFT_trigger, FFT_trigger);
  Application.CreateForm(TFormSpectreCouleurGraphes, FormSpectreCouleurGraphes);
  Application.CreateForm(TFormGTI2Calibration, FormGTI2Calibration);
  Application.Run;
end.

{$DEFINE GTI2}
      //  {$DEFINE HS3}




