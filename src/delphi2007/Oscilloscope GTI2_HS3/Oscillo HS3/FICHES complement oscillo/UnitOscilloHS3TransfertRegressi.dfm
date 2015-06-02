object FormUTILISATEUR_RegressiTransfert: TFormUTILISATEUR_RegressiTransfert
  Left = 2165
  Top = 117
  Caption = 'Regressi Utilisateur'
  ClientHeight = 696
  ClientWidth = 425
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
  TextHeight = 16
  object Label2: TLabel
    Left = 207
    Top = 0
    Width = 125
    Height = 24
    Caption = 'INSTANTANE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 177
    Top = 177
    Width = 198
    Height = 24
    Caption = 'ENREGISTREMENTS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBoxINSTANTANE: TGroupBox
    Left = 10
    Top = 20
    Width = 513
    Height = 149
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 20
      Width = 80
      Height = 19
      Caption = 'Instantan'#233
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelINST: TLabel
      Left = 118
      Top = 20
      Width = 47
      Height = 19
      Caption = '100 %'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNBECH: TLabel
      Left = 20
      Top = 59
      Width = 275
      Height = 19
      Caption = 'Nombre d'#39'echantillons disponibles :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelINSTTRANS: TLabel
      Left = 20
      Top = 79
      Width = 273
      Height = 19
      Caption = 'Nombre d'#39'echantillons a transferer :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 177
      Top = 39
      Width = 100
      Height = 21
      AutoSize = False
      Caption = 'haute r'#233'solution'
    end
    object Label5: TLabel
      Left = 384
      Top = 39
      Width = 100
      Height = 21
      AutoSize = False
      Caption = 'basse r'#233'solution'
    end
    object ScrollBarINST: TScrollBar
      Left = 177
      Top = 20
      Width = 297
      Height = 21
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 0
      OnChange = ScrollBarINSTChange
    end
    object ButtonTransfert: TButton
      Left = 197
      Top = 104
      Width = 149
      Height = 31
      Caption = 'TRANSFERT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Transfert_instantane_Click
    end
  end
  object GroupBoxTransferEnregistrements: TGroupBox
    Left = 10
    Top = 197
    Width = 513
    Height = 562
    Caption = 'Multi-Pages'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object GroupBoxEnrg1: TGroupBox
      Left = 10
      Top = 20
      Width = 493
      Height = 50
      Caption = 'Enregistrement No 1'
      TabOrder = 0
      Visible = False
      object RadioButton101: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton251: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton501: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1001: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement1: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg2: TGroupBox
      Left = 10
      Top = 69
      Width = 493
      Height = 50
      Caption = 'Enregistrement No 2'
      TabOrder = 1
      Visible = False
      object RadioButton102: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton252: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton502: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1002: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement2: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg5: TGroupBox
      Left = 10
      Top = 217
      Width = 493
      Height = 50
      Caption = 'Enregistrement No 5'
      TabOrder = 2
      Visible = False
      object RadioButton105: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton255: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton505: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1005: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement5: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg3: TGroupBox
      Left = 10
      Top = 118
      Width = 493
      Height = 51
      Caption = 'Enregistrement No 3'
      TabOrder = 3
      Visible = False
      object RadioButton103: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton253: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton503: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1003: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement3: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg4: TGroupBox
      Left = 10
      Top = 167
      Width = 493
      Height = 51
      Caption = 'Enregistrement No 4'
      TabOrder = 4
      Visible = False
      object RadioButton104: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton254: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton504: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1004: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement4: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg6: TGroupBox
      Left = 10
      Top = 266
      Width = 493
      Height = 50
      Caption = 'Enregistrement No 6'
      TabOrder = 5
      Visible = False
      object RadioButton106: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton256: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton506: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1006: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement6: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg7: TGroupBox
      Left = 10
      Top = 315
      Width = 493
      Height = 51
      Caption = 'Enregistrement No 7'
      TabOrder = 6
      Visible = False
      object RadioButton107: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton257: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton507: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1007: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement7: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg8: TGroupBox
      Left = 10
      Top = 364
      Width = 493
      Height = 51
      Caption = 'Enregistrement No 8'
      TabOrder = 7
      Visible = False
      object RadioButton108: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton258: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton508: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1008: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement8: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg9: TGroupBox
      Left = 10
      Top = 414
      Width = 493
      Height = 50
      Caption = 'Enregistrement No 9'
      TabOrder = 8
      Visible = False
      object RadioButton109: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton259: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton509: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1009: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement9: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object GroupBoxEnrg10: TGroupBox
      Left = 10
      Top = 463
      Width = 493
      Height = 50
      Caption = 'Enregistrement No 10'
      TabOrder = 9
      Visible = False
      object RadioButton1010: TRadioButton
        Left = 246
        Top = 20
        Width = 60
        Height = 21
        Caption = '10%'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2510: TRadioButton
        Left = 305
        Top = 20
        Width = 61
        Height = 21
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton5010: TRadioButton
        Left = 364
        Top = 20
        Width = 61
        Height = 21
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton10010: TRadioButton
        Left = 423
        Top = 20
        Width = 61
        Height = 21
        Caption = '100%'
        TabOrder = 3
      end
      object CheckBoxEnregistrement10: TCheckBox
        Left = 10
        Top = 20
        Width = 237
        Height = 21
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
      end
    end
    object ButtonMULTI: TButton
      Left = 108
      Top = 522
      Width = 297
      Height = 31
      Caption = 'Transfer Regressi MULTI-PAGES'
      Enabled = False
      TabOrder = 10
      OnClick = Utilisateur_TRANSMulti
    end
  end
  object GroupBoxMonoPage: TGroupBox
    Left = 10
    Top = 758
    Width = 513
    Height = 139
    Caption = 'Mono-Page'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ButtonMONO: TButton
      Left = 108
      Top = 98
      Width = 297
      Height = 31
      Caption = 'Transfer Regressi MONO-PAGE'
      Enabled = False
      TabOrder = 0
      OnClick = UTILISATEUR_RegressiMONOClick
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Enrg. 1'
      TabOrder = 1
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox2: TCheckBox
      Left = 108
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Enrg. 2'
      TabOrder = 2
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox3: TCheckBox
      Left = 217
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Enrg. 3'
      TabOrder = 3
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox4: TCheckBox
      Left = 325
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Enrg. 4'
      TabOrder = 4
      Visible = False
    end
    object CheckBox5: TCheckBox
      Left = 423
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Enrg. 5'
      TabOrder = 5
      Visible = False
    end
    object CheckBox6: TCheckBox
      Left = 10
      Top = 49
      Width = 80
      Height = 21
      Caption = 'Enrg. 6'
      TabOrder = 6
      Visible = False
    end
    object CheckBox7: TCheckBox
      Left = 108
      Top = 49
      Width = 80
      Height = 21
      Caption = 'Enrg. 7'
      TabOrder = 7
      Visible = False
    end
    object CheckBox8: TCheckBox
      Left = 217
      Top = 49
      Width = 80
      Height = 21
      Caption = 'Enrg. 8'
      TabOrder = 8
      Visible = False
    end
    object CheckBox9: TCheckBox
      Left = 325
      Top = 49
      Width = 70
      Height = 21
      Caption = 'Enrg. 9'
      TabOrder = 9
      Visible = False
    end
    object CheckBox10: TCheckBox
      Left = 423
      Top = 49
      Width = 80
      Height = 21
      Caption = 'Enrg. 10'
      TabOrder = 10
      Visible = False
    end
    object RadioButton1: TRadioButton
      Left = 79
      Top = 79
      Width = 60
      Height = 21
      Caption = '10%'
      Checked = True
      TabOrder = 11
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 187
      Top = 79
      Width = 60
      Height = 21
      Caption = '25%'
      TabOrder = 12
    end
    object RadioButton3: TRadioButton
      Left = 295
      Top = 79
      Width = 61
      Height = 21
      Caption = '50%'
      TabOrder = 13
    end
    object RadioButton4: TRadioButton
      Left = 404
      Top = 79
      Width = 60
      Height = 21
      Caption = '100%'
      TabOrder = 14
    end
  end
end
