object Form_FFT_mut_ConfigCouleursOscilloGTI2: TForm_FFT_mut_ConfigCouleursOscilloGTI2
  Left = 2237
  Top = 682
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configurations des couleurs '
  ClientHeight = 128
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 85
    Height = 14
    Caption = 'Fonds d'#39#233'crans'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 8
    Width = 41
    Height = 14
    Caption = 'Voie Y1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 200
    Top = 8
    Width = 41
    Height = 14
    Caption = 'Voie Y2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 256
    Top = 8
    Width = 41
    Height = 14
    Caption = 'Voie Y3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 312
    Top = 8
    Width = 41
    Height = 14
    Caption = 'Voie Y4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PaintBox1: TPaintBox
    Left = 8
    Top = 24
    Width = 89
    Height = 41
    OnClick = ChangementDeCouleurs
  end
  object PaintBox2: TPaintBox
    Left = 144
    Top = 24
    Width = 41
    Height = 41
    OnClick = ChangementDeCouleurs
  end
  object PaintBox3: TPaintBox
    Left = 200
    Top = 24
    Width = 41
    Height = 41
    OnClick = ChangementDeCouleurs
  end
  object PaintBox4: TPaintBox
    Left = 256
    Top = 24
    Width = 41
    Height = 41
    OnClick = ChangementDeCouleurs
  end
  object PaintBox5: TPaintBox
    Left = 303
    Top = 25
    Width = 41
    Height = 41
    OnClick = ChangementDeCouleurs
  end
  object PaintBox6: TPaintBox
    Left = 393
    Top = 28
    Width = 89
    Height = 41
    OnClick = ChangementDeCouleurs
  end
  object Label6: TLabel
    Left = 392
    Top = 8
    Width = 29
    Height = 14
    Caption = 'Grille'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 144
    Top = 72
    Width = 209
    Height = 14
    Caption = 'Epaisseur des courbes (Nb de pixels):'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 216
    Top = 96
    Width = 12
    Height = 24
    Caption = '1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 248
    Top = 96
    Width = 48
    Height = 24
    Caption = 'Pixel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpinButton1: TSpinButton
    Left = 176
    Top = 96
    Width = 20
    Height = 25
    DownGlyph.Data = {
      0E010000424D0E01000000000000360000002800000009000000060000000100
      200000000000D800000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000008080000080
      800000808000008080000080800000808000}
    TabOrder = 0
    UpGlyph.Data = {
      0E010000424D0E01000000000000360000002800000009000000060000000100
      200000000000D800000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000}
    OnDownClick = SpinButton1DownClick
    OnUpClick = SpinButton1UpClick
  end
  object ColorDialog1: TColorDialog
    Left = 104
    Top = 16
  end
end
