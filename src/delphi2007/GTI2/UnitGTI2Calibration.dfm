object FormGTI2Calibration: TFormGTI2Calibration
  Left = 0
  Top = 0
  Caption = 'FormGTI2Calibration'
  ClientHeight = 346
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormShow
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelInstructions: TLabel
    Left = 64
    Top = 40
    Width = 82
    Height = 13
    Caption = 'LabelInstructions'
  end
  object ButtonValidation: TButton
    Left = 256
    Top = 170
    Width = 153
    Height = 45
    Caption = 'Valider >>'
    TabOrder = 0
    OnClick = ButtonValidationClick
  end
  object ButtonPrecedent: TButton
    Left = 64
    Top = 170
    Width = 169
    Height = 45
    Caption = '<< Revenir '#224' l'#39#233'tape pr'#233'c'#233'dente'
    TabOrder = 1
    OnClick = ButtonPrecedentClick
  end
end
