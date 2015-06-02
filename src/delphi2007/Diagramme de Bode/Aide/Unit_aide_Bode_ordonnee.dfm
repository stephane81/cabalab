object Bode_ordonnee: TBode_ordonnee
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Bode Options'
  ClientHeight = 217
  ClientWidth = 417
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
  object utilisation2: TEdit
    Left = 0
    Top = 191
    Width = 409
    Height = 29
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
    TabOrder = 0
    Text = '  >> Utilisation'
    OnClick = utilisationClick
  end
  object Edit1: TEdit
    Left = 0
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
    TabOrder = 1
    Text = 
      '      1_ Possibilit'#233' de choisir le nombre des fr'#233'quences : fixer' +
      ' un nomre sup'#233'rieur '#224'  2'
  end
  object Edit2: TEdit
    Left = 0
    Top = 95
    Width = 417
    Height = 23
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '      3_ Par d'#233'faut, la mesure se fait en auto-calibrage'
  end
  object Edit3: TEdit
    Left = 0
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
    TabOrder = 3
    Text = '      2_ Possibilit'#233' de choisir le mode de mesure du gain, '
  end
  object Edit4: TEdit
    Left = 0
    Top = 43
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
    TabOrder = 4
    Text = 
      '                                   *  soit '#224' partir de la valeur' +
      ' cr'#234'te '#224' cr'#234'te '
  end
  object Edit5: TEdit
    Left = 0
    Top = 64
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
    TabOrder = 5
    Text = 
      '                                   *  soit '#224' partir de la valeur' +
      ' efficace'
  end
  object Edit6: TEdit
    Left = 0
    Top = 120
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
    TabOrder = 6
    Text = 
      '      4_ Possibilit'#233' de recommencer une partie des derni'#233'res mes' +
      'ures'
  end
  object Edit7: TEdit
    Left = 0
    Top = 151
    Width = 417
    Height = 34
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 
      '   Pour recommencer l'#39'ensemble des mesures, utiliser la commande' +
      ' clavier "Ctrl + R"'
  end
end
