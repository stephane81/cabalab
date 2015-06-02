object Bode_Commencer: TBode_Commencer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Bode Commencer'
  ClientHeight = 127
  ClientWidth = 399
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
  object Edit2: TEdit
    Left = -6
    Top = 0
    Width = 417
    Height = 25
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 
      '      1_ Pour d'#233'marrer la mesure, il suffit de cliquer sur "Comm' +
      'encer la mesure" '
  end
  object Edit1: TEdit
    Left = -6
    Top = 24
    Width = 417
    Height = 25
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 
      '      2_ Pour Stopper la mesure, il faut cliquer sur "Suspendre ' +
      'la mesure",  '
  end
  object Edit3: TEdit
    Left = -6
    Top = 48
    Width = 417
    Height = 25
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 
      '                   et si n'#233'cessaire modifier les niveaux de tens' +
      'ions'
  end
  object Edit4: TEdit
    Left = -4
    Top = 72
    Width = 417
    Height = 57
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 
      '      3_ Pour red'#233'marrer la mesure, il suffit de cliquer sur "Co' +
      'ntinuer le balayage" '
  end
  object utilisation2: TEdit
    Left = 24
    Top = 96
    Width = 105
    Height = 23
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
    TabOrder = 4
    Text = '  >> Utilisation'
    OnClick = utilisationClick
  end
end
