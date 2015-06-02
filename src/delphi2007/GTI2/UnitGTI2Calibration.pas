unit UnitGTI2Calibration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dlldecl, Inifiles;

type
  TFormGTI2Calibration = class(TForm)
    ButtonValidation: TButton;
    LabelInstructions: TLabel;
    ButtonPrecedent: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonValidationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonPrecedentClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormGTI2Calibration: TFormGTI2Calibration;
  NumeroEtape : shortint;
  TchXDoubleArray : array [1..4]of darray;  //tableau des tableaux de données
  MoyenneArray : array[1..4] of double;

implementation

{$R *.dfm}


procedure TFormGTI2Calibration.ButtonPrecedentClick(Sender: TObject);
begin
   if NumeroEtape > 1 then
   NumeroEtape := NumeroEtape - 1;
   FormGTI2Calibration.Refresh;
end;

procedure TFormGTI2Calibration.ButtonValidationClick(Sender: TObject);
var freq : double ;
erreur : word ;
  i,j: Integer;
  Ini: TIniFile;
  FrequenceEch: dword     ;
  LongEnregistrement: dword  ;
  Sensibilite15 :double;
  Sensibilite75 :double;

begin
   case NumeroEtape of
//1 etalonnage unipolaire
//2 etalonnage differentiel
//3 etalonnage GBF
//else Sauvegarde fichier

   1 :  // etalonnage unipolaire
      begin
      //SE Paramètres Acquisition

         for i := 1 to 4 do
         begin
         Acq.Correction_Amplitude_Unipolaire [i] := 0 ;
         Acq.Correction_Amplitude_Differentielle[i] := 0 ;
         end;

      SetTriggerSource( ltsNoTrig );
      SetTriggerMode ( ltkFalling );
      SetCh1InputOn(1);
      SetCh2InputOn(1);
      SetCh3InputOn(1);
      SetCh4InputOn(1);
      SetCh1DiffOn(0);
      SetCh2DiffOn(0);
      SetCh3DiffOn(0);
      SetCh4DiffOn(0);
      Sensibilite15 :=15;
      Sensibilite75 :=7.5;
      SetSensitivity ( 1, @Sensibilite75 );
      SetSensitivity ( 2, @Sensibilite75 );
      SetSensitivity ( 3, @Sensibilite75 );
      SetSensitivity ( 4, @Sensibilite75 );
      FrequenceEch:=     1000;
      LongEnregistrement:=500;
      SetRecordLength    (LongEnregistrement ) ;
      SetSampleFrequency (@FrequenceEch) ;

      //SE Acquisition et Calcul Défaut offset (=valeur moyenne) pour les 4 voies
      erreur := ADC_Abort;      if erreur <> E_NO_ERRORS then showmessage('erreur ADC_Abort');

      erreur := StartMeasurementFrancois;
         if erreur = E_NO_ERRORS then
         begin
         erreur := GetMeasurementFrancois( @Ch1DoubleArray , @Ch2DoubleArray );
            if erreur = E_NO_ERRORS then // si pas d'erreur
            begin
            TchXDoubleArray[1]:=Ch1DoubleArray;
            TchXDoubleArray[2]:=Ch2DoubleArray;
            TchXDoubleArray[3]:=Ch3DoubleArray;
            TchXDoubleArray[4]:=Ch4DoubleArray;
               for i := 1 to 4 do
               begin
               Acq.Correction_Amplitude_Unipolaire[i] := 0 ;
                  for j := 0 to Acq.recordlength - 1 do
                  begin
                  Acq.Correction_Amplitude_Unipolaire[i] := Acq.Correction_Amplitude_Unipolaire[i] + TchXDoubleArray[i][j] ;
                  end;
               Acq.Correction_Amplitude_Unipolaire[i] := - Acq.Correction_Amplitude_Unipolaire[i] / Acq.recordlength ;
               end;
            NumeroEtape := 2;
            erreur := ADC_Abort;      if erreur <> E_NO_ERRORS then showmessage('erreur ADC_Abort');
            end // if erreur
            else showmessage('erreur getmeasurement');
         end // if erreur
         else  showmessage('erreur startmeasurment');
      FormGTI2Calibration.Repaint;
      end; // 1 :


   2 :  // étalonnage différentiel
      begin
      //SE Paramètres Acquisition
      SetTriggerSource( ltsNoTrig );
      SetTriggerMode ( ltkFalling );
      SetCh1InputOn(1);
      SetCh2InputOn(1);
      SetCh3InputOn(1);
      SetCh4InputOn(1);
      SetCh1DiffOn(0);
      SetCh2DiffOn(0);
      SetCh3DiffOn(0);
      SetCh4DiffOn(0);
      Sensibilite15 :=15;
      Sensibilite75 :=7.5;
      SetSensitivity ( 1, @Sensibilite75 );
      SetSensitivity ( 2, @Sensibilite75 );
      SetSensitivity ( 3, @Sensibilite75 );
      SetSensitivity ( 4, @Sensibilite75 );
      FrequenceEch:=     1000;
      LongEnregistrement:=500;
      SetRecordLength    (LongEnregistrement ) ;
      SetSampleFrequency (@FrequenceEch) ;

      //SE Acquisition et Calcul Défaut offset (=valeur moyenne) pour les 4 voies
      erreur := ADC_Abort;      if erreur <> E_NO_ERRORS then showmessage('erreur ADC_Abort');

      erreur := StartMeasurementFrancois;
         if erreur = E_NO_ERRORS then
         begin
         erreur := GetMeasurementFrancois( @Ch1DoubleArray , @Ch2DoubleArray );
            if erreur = E_NO_ERRORS then // si pas d'erreur
            begin
            TchXDoubleArray[1]:=Ch1DoubleArray;
            TchXDoubleArray[2]:=Ch2DoubleArray;
            TchXDoubleArray[3]:=Ch3DoubleArray;
            TchXDoubleArray[4]:=Ch4DoubleArray;
               for i := 1 to 4 do
               begin
               Acq.Correction_Amplitude_Differentielle[i] := 0 ;
                  for j := 0 to Acq.recordlength - 1 do
                  begin
                  Acq.Correction_Amplitude_Differentielle[i] := Acq.Correction_Amplitude_Differentielle[i] + TchXDoubleArray[i][j] ;
                  end;
               Acq.Correction_Amplitude_Differentielle[i] := - Acq.Correction_Amplitude_Differentielle[i] / Acq.recordlength ;
               end;
            NumeroEtape := 3;
            erreur := ADC_Abort;      if erreur <> E_NO_ERRORS then showmessage('erreur ADC_Abort');
            end // if erreur
            else showmessage('erreur getmeasurement');
         end // if erreur
         else  showmessage('erreur startmeasurment');
      FormGTI2Calibration.Repaint;
      end; // 2 :

      else // case
      begin // Sauvegarde fichier


 // Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  Ini := TIniFile.Create( ExtractFilePath(Application.ExeName)+ 'EtalonnageGTI2.INI'  );
  try
     for i := 1 to 4 do
     begin
     Ini.WriteFloat( 'GTINumeroXXX', 'CorrectionVoie'+inttostr(i)+'Unipolaire'   , Acq.Correction_Amplitude_Unipolaire[i]);
     Ini.WriteFloat( 'GTINumeroXXX', 'CorrectionVoie'+inttostr(i)+'Differentiel'   , Acq.Correction_Amplitude_Differentielle[i]);

     end;

  finally
    Ini.Free;
  end; //try

  FormGTI2Calibration.Visible := false;
      end; // case else

   end; //case
end;

procedure TFormGTI2Calibration.FormCreate(Sender: TObject);
begin
NumeroEtape := 1;

end;

procedure TFormGTI2Calibration.FormShow(Sender: TObject);
begin
   case NumeroEtape of
   1 :
      begin
      LabelInstructions.Caption := 'Etape 1 : Relier les voies unipolaires à la masse comme sur la photo';

      end;
   2 :
      begin
      LabelInstructions.Caption := 'Etape 2 : Relier les voies différentielles à la masse comme sur la photo';

      end;
   else
      begin
      LabelInstructions.Caption := 'Cliquez maintenant sur Valider pour enregistrer les résultats et terminer l''étallonage';

      end;


   end;
end;

end.
