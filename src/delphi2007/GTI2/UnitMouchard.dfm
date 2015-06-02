object FormMouchard: TFormMouchard
  Left = 0
  Top = 0
  Caption = 'Infos GTI2'
  ClientHeight = 456
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 70
    Height = 13
    Caption = 'Base de temps'
  end
  object LabelBaseDeTemps: TLabel
    Left = 84
    Top = 32
    Width = 92
    Height = 13
    Caption = 'LabelBaseDeTemps'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 206
    Height = 19
    Caption = 'Configuration Acquisition'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 45
    Width = 36
    Height = 13
    Caption = 'Reload '
  end
  object LabelReload: TLabel
    Left = 84
    Top = 45
    Width = 58
    Height = 13
    Caption = 'LabelReload'
  end
  object UnSurN: TLabel
    Left = 24
    Top = 64
    Width = 36
    Height = 13
    Caption = 'UnSurN'
  end
  object LabelUnSurN: TLabel
    Left = 84
    Top = 64
    Width = 61
    Height = 13
    Caption = 'LabelUnSurN'
  end
  object Label4: TLabel
    Left = 8
    Top = 96
    Width = 67
    Height = 39
    Caption = 'Compteur d'#39'acquisitions sans trigger : '
    WordWrap = True
  end
  object LabelCptNoTrig: TLabel
    Left = 96
    Top = 112
    Width = 73
    Height = 13
    Caption = 'LabelCptNoTrig'
    Visible = False
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 120
    Top = 160
  end
end
