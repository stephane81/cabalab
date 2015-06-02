object Bode_stockage: TBode_stockage
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Bode Stockage'
  ClientHeight = 90
  ClientWidth = 452
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = -4
    Top = 0
    Width = 453
    Height = 33
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 
      '       Pour metttre en m'#233'moire la mesure, cliquer sur "Stocker c' +
      'e diagramme"  '
  end
  object Edit2: TEdit
    Left = -4
    Top = 24
    Width = 453
    Height = 65
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 
      '                              Il est possible de stocker jusqu'#224' ' +
      '10 diagrammes  '
  end
  object utilisation2: TEdit
    Left = 4
    Top = 61
    Width = 109
    Height = 29
    Cursor = crHandPoint
    AutoSelect = False
    BorderStyle = bsNone
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Text = '  >> Utilisation'
    OnClick = utilisationClick
  end
end
