object FormEchantillons: TFormEchantillons
  Left = 2024
  Top = 497
  Width = 384
  Height = 101
  Caption = 'Choix du Nombre d'#39#233'chantillons'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 56
    Top = 48
    Width = 275
    Height = 14
    Caption = 'Le nombre maximum d'#39#233'chantillon est de 130972 !'
  end
  object EditNBRECH: TEdit
    Left = 16
    Top = 16
    Width = 201
    Height = 22
    TabOrder = 0
    Text = 'Nombres d'#39#233'chantillons'
    OnClick = NBRECHclick
  end
  object ButtonNBRECH: TButton
    Left = 272
    Top = 8
    Width = 89
    Height = 33
    Caption = 'Validation'
    TabOrder = 1
    OnClick = ButtonNBRECHClick
  end
end
