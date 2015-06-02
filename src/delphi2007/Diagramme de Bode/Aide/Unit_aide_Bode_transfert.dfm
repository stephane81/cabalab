object Bode_transfert: TBode_transfert
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Bode Transfert'
  ClientHeight = 132
  ClientWidth = 383
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
    Left = -2
    Top = 0
    Width = 459
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
      '       Pour transf'#233'rer les mesures stock'#233'es et la mesure courant' +
      'e,'
  end
  object utilisation2: TEdit
    Left = 8
    Top = 109
    Width = 445
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
    TabOrder = 1
    Text = '  >> Utilisation'
    OnClick = utilisation2Click
  end
  object Edit2: TEdit
    Left = 0
    Top = 22
    Width = 385
    Height = 33
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = 
      '   dans le menu "Edition", cliquer sur "Exporter dans Regressi" ' +
      ' .'
  end
  object Edit3: TEdit
    Left = 0
    Top = 54
    Width = 385
    Height = 33
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
      '     si Regressi ne s'#39'ouvre pas, v'#233'rifier le chemin dans le menu' +
      ' principal :'
  end
  object Edit4: TEdit
    Left = 0
    Top = 78
    Width = 385
    Height = 33
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '     menu "Tableur" et "Param'#233'trage de regressi":'
  end
end
