object Formtimeout: TFormtimeout
  Left = 2258
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TIMEOUT'
  ClientHeight = 129
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 37
    Height = 14
    Caption = 'Rapide'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 32
    Width = 37
    Height = 14
    Caption = 'Moyen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 176
    Top = 32
    Width = 25
    Height = 14
    Caption = 'Lent'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 184
    Top = 96
    Width = 73
    Height = 29
    Caption = 'Label4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 451
    Height = 14
    Caption = 
      'TimeOut : temps d'#39'attente du syst'#232'me pour obtenir le d'#233'clencheme' +
      'nt du Trigger.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TrackBarTIMEOUT: TTrackBar
    Left = 8
    Top = 48
    Width = 449
    Height = 45
    Max = 50
    Position = 20
    TabOrder = 0
    OnChange = TrackBarTIMEOUTChange
  end
end
