object FormSpectreCouleurGraphes: TFormSpectreCouleurGraphes
  Left = 0
  Top = 0
  Caption = 'Gestion des couleurs'
  ClientHeight = 325
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 71
    Width = 289
    Height = 98
    Caption = 'Spectre'
    TabOrder = 4
    object PaintBoxSpectreFond: TPaintBox
      Left = 16
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clGreen
      ParentColor = False
      OnClick = PaintBoxSpectreFondClick
    end
    object Label1: TLabel
      Left = 32
      Top = 76
      Width = 24
      Height = 13
      Caption = 'Fond'
    end
    object PaintBoxSpectreGrille: TPaintBox
      Left = 81
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxSpectreGrilleClick
    end
    object Grille: TLabel
      Left = 95
      Top = 76
      Width = 23
      Height = 13
      Caption = 'Grille'
    end
    object PaintBoxSpectreSpectre1: TPaintBox
      Left = 147
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxSpectre1Click
    end
    object Gain: TLabel
      Left = 150
      Top = 76
      Width = 46
      Height = 13
      Caption = 'Spectre 1'
    end
    object PaintBoxSpectreSpectre2: TPaintBox
      Left = 219
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxSpectre2Click
    end
    object Phase: TLabel
      Left = 222
      Top = 76
      Width = 46
      Height = 13
      Caption = 'Spectre 2'
    end
  end
  object ButtonValider: TButton
    Left = 171
    Top = 286
    Width = 57
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = ButtonValiderClick
  end
  object ButtonStandard: TButton
    Left = 17
    Top = 24
    Width = 63
    Height = 33
    Caption = 'Standard'
    TabOrder = 1
    OnClick = ButtonStandardClick
  end
  object ButtonImpressionNB: TButton
    Left = 86
    Top = 24
    Width = 123
    Height = 33
    Caption = 'Impression Noir&&Blanc'
    TabOrder = 2
    OnClick = ButtonImpressionNBClick
  end
  object ButtonImpressionCouleur: TButton
    Left = 215
    Top = 24
    Width = 105
    Height = 33
    Caption = 'Impression Couleur'
    TabOrder = 3
    OnClick = ButtonImpressionCouleurClick
  end
  object GroupBox2: TGroupBox
    Left = 23
    Top = 175
    Width = 289
    Height = 105
    Caption = 'Oscillogramme'
    TabOrder = 5
    object PaintBoxVoiesFond: TPaintBox
      Left = 16
      Top = 32
      Width = 54
      Height = 41
      Align = alCustom
      Color = clGreen
      ParentColor = False
      OnClick = PaintBoxVoiesFondClick
    end
    object Label2: TLabel
      Left = 32
      Top = 79
      Width = 24
      Height = 13
      Caption = 'Fond'
    end
    object PaintBoxVoiesGrille: TPaintBox
      Left = 81
      Top = 32
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxVoiesGrilleClick
    end
    object Label3: TLabel
      Left = 95
      Top = 79
      Width = 23
      Height = 13
      Caption = 'Grille'
    end
    object PaintBoxVoiesVoie1: TPaintBox
      Left = 147
      Top = 32
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxVoies1Click
    end
    object Entree: TLabel
      Left = 162
      Top = 79
      Width = 29
      Height = 13
      Caption = 'Voie 1'
    end
    object PaintBoxVoiesVoie2: TPaintBox
      Left = 219
      Top = 32
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxVoies2Click
    end
    object Sortie: TLabel
      Left = 233
      Top = 79
      Width = 29
      Height = 13
      Caption = 'Voie 2'
    end
  end
  object ButtonAnnuler: TButton
    Left = 83
    Top = 286
    Width = 75
    Height = 25
    Caption = 'Annuler'
    TabOrder = 6
    OnClick = ButtonAnnulerClick
  end
  object ColorDialog1: TColorDialog
    Left = 72
    Top = 328
  end
end
