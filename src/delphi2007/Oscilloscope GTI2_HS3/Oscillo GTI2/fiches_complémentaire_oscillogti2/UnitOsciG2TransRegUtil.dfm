object FormOscilloGTI2TransfertRegressiUtilisateur: TFormOscilloGTI2TransfertRegressiUtilisateur
  Left = 352
  Top = 219
  BorderIcons = [biSystemMenu]
  Caption = 'Transfert Regressi :'
  ClientHeight = 564
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 496
    Top = 0
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
  object PaintBoxECRAN1: TPaintBox
    Left = 328
    Top = 24
    Width = 456
    Height = 129
  end
  object PaintBoxECRAN2: TPaintBox
    Left = 328
    Top = 160
    Width = 456
    Height = 129
  end
  object PaintBoxECRAN3: TPaintBox
    Left = 328
    Top = 296
    Width = 456
    Height = 129
  end
  object PaintBoxECRAN4: TPaintBox
    Left = 328
    Top = 432
    Width = 456
    Height = 129
  end
  object GroupBoxINSTANTANE: TGroupBox
    Left = 8
    Top = 584
    Width = 313
    Height = 105
    Caption = 'Instantan'#233
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object LabelINST: TLabel
      Left = 176
      Top = 48
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
      Top = 64
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
      Top = 80
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
    object Label4: TLabel
      Left = 88
      Top = 32
      Width = 97
      Height = 17
      AutoSize = False
      Caption = 'haute r'#233'solution'
    end
    object Label5: TLabel
      Left = 208
      Top = 32
      Width = 97
      Height = 17
      AutoSize = False
      Caption = 'basse r'#233'solution'
    end
    object ScrollBarINST: TScrollBar
      Left = 88
      Top = 16
      Width = 217
      Height = 17
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 0
      OnChange = ScrollBarINSTChange
    end
    object ButtonTransfert: TButton
      Left = 8
      Top = 16
      Width = 73
      Height = 25
      Caption = 'TRANSFERT'
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
    Top = 8
    Width = 217
    Height = 553
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
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 1'
      TabOrder = 0
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton101: TRadioButton
        Left = 208
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
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
        Left = 288
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1001: TRadioButton
        Left = 328
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement1: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg2: TGroupBox
      Left = 8
      Top = 56
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 2'
      TabOrder = 1
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton102: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton252: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton502: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1002: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement2: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg5: TGroupBox
      Left = 8
      Top = 176
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 5'
      TabOrder = 2
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton105: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton255: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton505: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1005: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement5: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg3: TGroupBox
      Left = 8
      Top = 96
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 3'
      TabOrder = 3
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton103: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton253: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton503: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1003: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement3: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg4: TGroupBox
      Left = 8
      Top = 136
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 4'
      TabOrder = 4
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton104: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton254: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton504: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1004: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement4: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg6: TGroupBox
      Left = 8
      Top = 216
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 6'
      TabOrder = 5
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton106: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton256: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton506: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1006: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement6: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg7: TGroupBox
      Left = 8
      Top = 256
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 7'
      TabOrder = 6
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton107: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton257: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton507: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1007: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement7: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg8: TGroupBox
      Left = 8
      Top = 296
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 8'
      TabOrder = 7
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton108: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton258: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton508: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1008: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement8: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg9: TGroupBox
      Left = 8
      Top = 336
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 9'
      TabOrder = 8
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton109: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton259: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton509: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton1009: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement9: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object GroupBoxEnrg10: TGroupBox
      Left = 8
      Top = 376
      Width = 201
      Height = 41
      Caption = 'Enregistrement No 10'
      TabOrder = 9
      OnMouseMove = GroupBoxMultiMouseMove
      object RadioButton1010: TRadioButton
        Left = 200
        Top = 16
        Width = 49
        Height = 17
        Caption = '10%'
        TabOrder = 0
      end
      object RadioButton2510: TRadioButton
        Left = 240
        Top = 16
        Width = 49
        Height = 17
        Caption = '25%'
        TabOrder = 1
      end
      object RadioButton5010: TRadioButton
        Left = 280
        Top = 16
        Width = 49
        Height = 17
        Caption = '50%'
        TabOrder = 2
      end
      object RadioButton10010: TRadioButton
        Left = 320
        Top = 16
        Width = 49
        Height = 17
        Caption = '100%'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object CheckBoxEnregistrement10: TCheckBox
        Left = 8
        Top = 16
        Width = 185
        Height = 17
        Caption = 'Nb de points dispo. : 10000 pts'
        TabOrder = 4
        OnClick = DeblocageTransfertMULTI
      end
    end
    object ButtonMULTI: TButton
      Left = 7
      Top = 472
      Width = 201
      Height = 25
      Caption = 'Transfert Regressi MULTI-PAGES'
      Enabled = False
      TabOrder = 10
      OnClick = TRANSMulti
    end
  end
  object GroupBoxMonoPage: TGroupBox
    Left = 233
    Top = 8
    Width = 89
    Height = 552
    Caption = 'Mono-Page'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ButtonMONO: TButton
      Left = 8
      Top = 472
      Width = 73
      Height = 25
      Caption = 'Transfert'
      Enabled = False
      TabOrder = 0
      OnClick = ButtonMONOClick
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 32
      Width = 65
      Height = 17
      Caption = 'Enrg. 1'
      TabOrder = 1
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 72
      Width = 65
      Height = 17
      Caption = 'Enrg. 2'
      TabOrder = 2
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 112
      Width = 65
      Height = 17
      Caption = 'Enrg. 3'
      TabOrder = 3
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 152
      Width = 65
      Height = 17
      Caption = 'Enrg. 4'
      TabOrder = 4
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 192
      Width = 65
      Height = 17
      Caption = 'Enrg. 5'
      TabOrder = 5
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 232
      Width = 65
      Height = 17
      Caption = 'Enrg. 6'
      TabOrder = 6
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox7: TCheckBox
      Left = 8
      Top = 272
      Width = 65
      Height = 17
      Caption = 'Enrg. 7'
      TabOrder = 7
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox8: TCheckBox
      Left = 8
      Top = 312
      Width = 65
      Height = 17
      Caption = 'Enrg. 8'
      TabOrder = 8
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox9: TCheckBox
      Left = 8
      Top = 352
      Width = 57
      Height = 17
      Caption = 'Enrg. 9'
      TabOrder = 9
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object CheckBox10: TCheckBox
      Left = 8
      Top = 392
      Width = 65
      Height = 17
      Caption = 'Enrg. 10'
      TabOrder = 10
      Visible = False
      OnClick = DeblocageTransfertMONO
    end
    object RadioButton1: TRadioButton
      Left = 112
      Top = 320
      Width = 49
      Height = 17
      Caption = '10%'
      Checked = True
      TabOrder = 11
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 112
      Top = 344
      Width = 49
      Height = 17
      Caption = '25%'
      TabOrder = 12
    end
    object RadioButton3: TRadioButton
      Left = 112
      Top = 368
      Width = 49
      Height = 17
      Caption = '50%'
      TabOrder = 13
    end
    object RadioButton4: TRadioButton
      Left = 112
      Top = 392
      Width = 49
      Height = 17
      Caption = '100%'
      TabOrder = 14
    end
  end
end
