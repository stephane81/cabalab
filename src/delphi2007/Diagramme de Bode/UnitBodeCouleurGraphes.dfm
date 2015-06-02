object FormBodeCouleurGraphes: TFormBodeCouleurGraphes
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
    Caption = 'Diagramme de Bode'
    TabOrder = 4
    object PaintBoxBodeFond: TPaintBox
      Left = 16
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clGreen
      ParentColor = False
      OnClick = PaintBoxBodeFondClick
    end
    object Label1: TLabel
      Left = 32
      Top = 76
      Width = 24
      Height = 13
      Caption = 'Fond'
    end
    object PaintBoxBodeGrille: TPaintBox
      Left = 81
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxBodeGrilleClick
    end
    object Grille: TLabel
      Left = 95
      Top = 76
      Width = 23
      Height = 13
      Caption = 'Grille'
    end
    object PaintBoxBodeGain: TPaintBox
      Left = 147
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxBodeGainClick
    end
    object Gain: TLabel
      Left = 164
      Top = 76
      Width = 21
      Height = 13
      Caption = 'Gain'
    end
    object PaintBoxBodePhase: TPaintBox
      Left = 219
      Top = 29
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxBodePhaseClick
    end
    object Phase: TLabel
      Left = 232
      Top = 76
      Width = 29
      Height = 13
      Caption = 'Phase'
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
    object PaintBoxVoiesEntree: TPaintBox
      Left = 147
      Top = 32
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxVoiesEntreeClick
    end
    object Entree: TLabel
      Left = 162
      Top = 79
      Width = 32
      Height = 13
      Caption = 'Entree'
    end
    object PaintBoxVoiesSortie: TPaintBox
      Left = 219
      Top = 32
      Width = 54
      Height = 41
      Align = alCustom
      Color = clBlack
      ParentColor = False
      OnClick = PaintBoxVoiesSortieClick
    end
    object Sortie: TLabel
      Left = 233
      Top = 79
      Width = 28
      Height = 13
      Caption = 'Sortie'
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
