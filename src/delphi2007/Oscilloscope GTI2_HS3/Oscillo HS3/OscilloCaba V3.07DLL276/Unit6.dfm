object FormRegressiTransfert: TFormRegressiTransfert
  Left = 1913
  Top = -1
  Width = 441
  Height = 788
  Caption = 'Regressi Utilisateur'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 168
    Top = 8
    Width = 104
    Height = 19
    Caption = 'INSTANTANE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 152
    Width = 163
    Height = 19
    Caption = 'ENREGISTREMENTS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBoxINSTANTANE: TGroupBox
    Left = 8
    Top = 24
    Width = 417
    Height = 121
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 66
      Height = 16
      Caption = 'Instantan'#233
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelINST: TLabel
      Left = 96
      Top = 16
      Width = 35
      Height = 16
      Caption = '100 %'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNBECH: TLabel
      Left = 16
      Top = 40
      Width = 226
      Height = 16
      Caption = 'Nombre d'#39'echantillons disponibles :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelINSTTRANS: TLabel
      Left = 16
      Top = 56
      Width = 227
      Height = 16
      Caption = 'Nombre d'#39'echantillons a transferer :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ScrollBarINST: TScrollBar
      Left = 144
      Top = 16
      Width = 241
      Height = 17
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 0
      OnChange = ScrollBarINSTChange
    end
    object ButtonTransfert: TButton
      Left = 160
      Top = 80
      Width = 121
      Height = 25
      Caption = 'TRANSFER'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonTransfertClick
    end
  end
  object GroupBoxTransferEnregistrements: TGroupBox
    Left = 8
    Top = 168
    Width = 417
    Height = 457
    Caption = 'Multi-Pages'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object GroupBoxEnrg1: TGroupBox
      Left = 8
      Top = 16
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 1'
      TabOrder = 0
      Visible = False
      object RadioButton101: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton251: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton501: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1001: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement1: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg2: TGroupBox
      Left = 8
      Top = 56
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 2'
      TabOrder = 1
      Visible = False
      object RadioButton102: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton252: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton502: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1002: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement2: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg5: TGroupBox
      Left = 8
      Top = 176
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 5'
      TabOrder = 2
      Visible = False
      object RadioButton105: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton255: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton505: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1005: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement5: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg3: TGroupBox
      Left = 8
      Top = 96
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 3'
      TabOrder = 3
      Visible = False
      object RadioButton103: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton253: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton503: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1003: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement3: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg4: TGroupBox
      Left = 8
      Top = 136
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 4'
      TabOrder = 4
      Visible = False
      object RadioButton104: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton254: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton504: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1004: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement4: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg6: TGroupBox
      Left = 8
      Top = 216
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 6'
      TabOrder = 5
      Visible = False
      object RadioButton106: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton256: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton506: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1006: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement6: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg7: TGroupBox
      Left = 8
      Top = 256
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 7'
      TabOrder = 6
      Visible = False
      object RadioButton107: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton257: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton507: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1007: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement7: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg8: TGroupBox
      Left = 8
      Top = 296
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 8'
      TabOrder = 7
      Visible = False
      object RadioButton108: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton258: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton508: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1008: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement8: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg9: TGroupBox
      Left = 8
      Top = 336
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 9'
      TabOrder = 8
      Visible = False
      object RadioButton109: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton259: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton509: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1009: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement9: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg10: TGroupBox
      Left = 8
      Top = 376
      Width = 401
      Height = 41
      Caption = 'Enregistrement No 10'
      TabOrder = 9
      Visible = False
      object RadioButton1010: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2510: TRadioButton
        Left = 248
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton5010: TRadioButton
        Left = 296
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton10010: TRadioButton
        Left = 344
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement10: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object ButtonMULTI: TButton
      Left = 88
      Top = 424
      Width = 241
      Height = 25
      Caption = 'Transfer Regressi MULTI-PAGES'
      Enabled = False
      TabOrder = 10
      OnClick = TRANSMulti
    end
  end
  object GroupBoxMonoPage: TGroupBox
    Left = 8
    Top = 624
    Width = 417
    Height = 129
    Caption = 'Mono-Page'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ButtonMONO: TButton
      Left = 88
      Top = 88
      Width = 241
      Height = 25
      Caption = 'Transfer Regressi MONO-PAGE'
      Enabled = False
      TabOrder = 0
      OnClick = TRANSMONO
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Enrg. 1'
      TabOrder = 1
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox2: TCheckBox
      Left = 88
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Enrg. 2'
      TabOrder = 2
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox3: TCheckBox
      Left = 176
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Enrg. 3'
      TabOrder = 3
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox4: TCheckBox
      Left = 264
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Enrg. 4'
      TabOrder = 4
      Visible = False
    end
    object CheckBox5: TCheckBox
      Left = 344
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Enrg. 5'
      TabOrder = 5
      Visible = False
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Enrg. 6'
      TabOrder = 6
      Visible = False
    end
    object CheckBox7: TCheckBox
      Left = 88
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Enrg. 7'
      TabOrder = 7
      Visible = False
    end
    object CheckBox8: TCheckBox
      Left = 176
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Enrg. 8'
      TabOrder = 8
      Visible = False
    end
    object CheckBox9: TCheckBox
      Left = 264
      Top = 40
      Width = 57
      Height = 17
      Caption = 'Enrg. 9'
      TabOrder = 9
      Visible = False
    end
    object CheckBox10: TCheckBox
      Left = 344
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Enrg. 10'
      TabOrder = 10
      Visible = False
    end
    object RadioButton1: TRadioButton
      Left = 64
      Top = 64
      Width = 49
      Height = 17
      Caption = '10%'
      Checked = True
      TabOrder = 11
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 152
      Top = 64
      Width = 49
      Height = 17
      Caption = '25%'
      TabOrder = 12
    end
    object RadioButton3: TRadioButton
      Left = 240
      Top = 64
      Width = 49
      Height = 17
      Caption = '50%'
      TabOrder = 13
    end
    object RadioButton4: TRadioButton
      Left = 328
      Top = 64
      Width = 49
      Height = 17
      Caption = '100%'
      TabOrder = 14
    end
  end
end
