object FormOscilloGTI2: TFormOscilloGTI2
  Left = 444
  Top = 95
  Caption = 'CabaLab : Oscilloscope'
  ClientHeight = 849
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBoxECRAN: TPaintBox
    Left = 248
    Top = 16
    Width = 513
    Height = 513
  end
  object PaintBoxECRAN1: TPaintBox
    Left = 248
    Top = 16
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN2: TPaintBox
    Left = 248
    Top = 141
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN3: TPaintBox
    Left = 248
    Top = 272
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN4: TPaintBox
    Left = 248
    Top = 400
    Width = 512
    Height = 125
  end
  object LabelWARNING: TLabel
    Left = 248
    Top = 0
    Width = 241
    Height = 17
    Caption = 'Attention : Base de temps d'#233'calibr'#233'e'
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object PaintBoxXY: TPaintBox
    Left = 248
    Top = 288
    Width = 281
    Height = 217
  end
  object PaintBoxTRIGlevel: TPaintBox
    Left = 237
    Top = 16
    Width = 11
    Height = 513
  end
  object GroupBoxTrigger: TGroupBox
    Left = 0
    Top = 72
    Width = 217
    Height = 118
    Caption = 'D'#233'clenchement (Trigger)'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnClick = TriggerChange
    object RadioButtonTriggerCH2: TRadioButton
      Left = 63
      Top = 18
      Width = 48
      Height = 17
      Caption = 'Y1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = TriggerChange
    end
    object RadioButtonTriggerCH3: TRadioButton
      Left = 112
      Top = 18
      Width = 49
      Height = 17
      Caption = 'Y2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = TriggerChange
    end
    object RadioButtonTriggerCH4: TRadioButton
      Left = 167
      Top = 18
      Width = 43
      Height = 17
      Caption = 'Y3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = TriggerChange
    end
    object RadioButtonTriggerSANS: TRadioButton
      Left = 8
      Top = 35
      Width = 49
      Height = 17
      Caption = 'Sans'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = True
      OnClick = TriggerChange
    end
    object RadioButtonTriggerCH1: TRadioButton
      Left = 8
      Top = 18
      Width = 43
      Height = 17
      Caption = 'Y0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = TriggerChange
    end
    object GroupBoxFrontTrigger: TGroupBox
      Left = 8
      Top = 58
      Width = 99
      Height = 51
      Caption = 'Front'
      TabOrder = 5
      object RadioButtonFrontMontant: TRadioButton
        Left = 8
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Montant'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = TriggerChange
      end
      object RadioButtonFrontDescendant: TRadioButton
        Left = 8
        Top = 32
        Width = 89
        Height = 17
        Caption = 'Descendant'
        TabOrder = 1
        OnClick = TriggerChange
      end
    end
    object GroupBoxLEVEL: TGroupBox
      Left = 112
      Top = 58
      Width = 97
      Height = 51
      Caption = 'Niveau d'#233'cl.'
      TabOrder = 6
      DesignSize = (
        97
        51)
      object LabelLEVEL: TLabel
        Left = 8
        Top = 14
        Width = 64
        Height = 19
        Anchors = [akTop, akRight]
        Caption = '00.000 V'
        Font.Charset = ANSI_CHARSET
        Font.Color = clPurple
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button0LEVEL: TButton
        Left = 77
        Top = 8
        Width = 18
        Height = 20
        Caption = '0'
        TabOrder = 0
        OnClick = TriggerChange
      end
      object RadioButton1: TRadioButton
        Left = 8
        Top = 32
        Width = 86
        Height = 17
        Hint = 'Clignotte '#224' chaque d'#233'clenchement'
        Caption = 'D'#233'cl.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 3
        Top = 56
        Width = 90
        Height = 17
        Caption = 'NO Trig./Data'
        Checked = True
        TabOrder = 2
        TabStop = True
        Visible = False
      end
    end
    object CheckBoxPreTrig: TCheckBox
      Left = 111
      Top = 35
      Width = 65
      Height = 17
      Hint = 'Mode Pr'#233'-Trig'
      Caption = 'Pr'#233'Decl.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = TriggerChange
    end
  end
  object GroupBoxVOIES: TGroupBox
    Left = 0
    Top = 185
    Width = 217
    Height = 196
    Caption = 'VOIES'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnClick = YChange
    object GroupBoxVOIE1: TGroupBox
      Left = 8
      Top = 31
      Width = 97
      Height = 81
      Caption = 'Y0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object PaintBoxColor1: TPaintBox
        Left = 48
        Top = 8
        Width = 41
        Height = 9
      end
      object ComboBoxY1: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        Cursor = crHandPoint
        Hint = 'calibre de la voie 0'
        ItemsEx = <
          item
          end
          item
            Caption = '5 V/div'
          end
          item
            Caption = '2 V/div'
          end
          item
            Caption = '1 V/div'
          end
          item
            Caption = '500 mV/div'
          end
          item
            Caption = '200 mV/div'
          end
          item
            Caption = '100 mV/div'
          end
          item
            Caption = '50   mV/div'
          end
          item
            Caption = '20   mV/div'
          end
          item
            Caption = '10   mV/div'
          end>
        DragCursor = crDefault
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Sensibilit'#233
        OnClick = YChange
      end
      object RadioButtonY1SondeX1: TRadioButton
        Left = 8
        Top = 16
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY1SondeX10: TRadioButton
        Left = 48
        Top = 16
        Width = 41
        Height = 17
        Hint = 'utilisation d'#39'une sonde x10'
        Caption = 'x 10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = YChange
      end
      object CheckBoxINVCH1: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'INV.'
        TabOrder = 3
        OnClick = YChange
      end
      object Button0DECALCH1: TButton
        Left = 72
        Top = 56
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 4
        OnClick = YChange
      end
      object CheckBoxUniDiff1: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'DIFF.'
        TabOrder = 5
        Visible = False
        OnClick = UniDiffChange
      end
    end
    object GroupBoxVOIE3: TGroupBox
      Left = 8
      Top = 111
      Width = 97
      Height = 81
      Caption = 'Y2'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object PaintBoxColor3: TPaintBox
        Left = 48
        Top = 8
        Width = 41
        Height = 9
      end
      object ComboBoxY3: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        Cursor = crHandPoint
        Hint = 'calibre de la voie 2'
        ItemsEx = <
          item
          end
          item
            Caption = '5 V/div'
          end
          item
            Caption = '2 V/div'
          end
          item
            Caption = '1 V/div'
          end
          item
            Caption = '500 mV/div'
          end
          item
            Caption = '200 mV/div'
          end
          item
            Caption = '100 mV/div'
          end
          item
            Caption = '50   mV/div'
          end
          item
            Caption = '20   mV/div'
          end
          item
            Caption = '10   mV/div'
          end>
        DragCursor = crDefault
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Sensibilit'#233
        OnClick = YChange
      end
      object RadioButtonY3SondeX1: TRadioButton
        Left = 8
        Top = 16
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY3SondeX10: TRadioButton
        Left = 48
        Top = 16
        Width = 41
        Height = 17
        Hint = 'utilisation d'#39'une sonde x10'
        Caption = 'x 10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = YChange
      end
      object CheckBoxINVCH3: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'INV.'
        TabOrder = 3
        OnClick = YChange
      end
      object Button0DECALCH3: TButton
        Left = 72
        Top = 56
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 4
        OnClick = YChange
      end
      object CheckBoxUniDiff3: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'DIFF.'
        TabOrder = 5
        Visible = False
        OnClick = UniDiffChange
      end
    end
    object GroupBoxVOIE4: TGroupBox
      Left = 112
      Top = 111
      Width = 97
      Height = 81
      Caption = 'Y3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object PaintBoxColor4: TPaintBox
        Left = 48
        Top = 8
        Width = 41
        Height = 9
      end
      object ComboBoxY4: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        Cursor = crHandPoint
        Hint = 'calibre de la voie 3'
        ItemsEx = <
          item
          end
          item
            Caption = '5 V/div'
          end
          item
            Caption = '2 V/div'
          end
          item
            Caption = '1 V/div'
          end
          item
            Caption = '500 mV/div'
          end
          item
            Caption = '200 mV/div'
          end
          item
            Caption = '100 mV/div'
          end
          item
            Caption = '50   mV/div'
          end
          item
            Caption = '20   mV/div'
          end
          item
            Caption = '10   mV/div'
          end>
        DragCursor = crHandPoint
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Sensibilit'#233
        OnClick = YChange
      end
      object RadioButtonY4SondeX1: TRadioButton
        Left = 8
        Top = 16
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY4SondeX10: TRadioButton
        Left = 48
        Top = 16
        Width = 41
        Height = 17
        Hint = 'utilisation d'#39'une sonde x10'
        Caption = 'x 10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = YChange
      end
      object CheckBoxINVCH4: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'INV.'
        TabOrder = 3
        OnClick = YChange
      end
      object Button0DECALCH4: TButton
        Left = 72
        Top = 56
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 4
        OnClick = YChange
      end
      object CheckBoxUniDiff4: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'DIFF.'
        TabOrder = 5
        Visible = False
        OnClick = UniDiffChange
      end
    end
    object GroupBoxVOIE2: TGroupBox
      Left = 112
      Top = 31
      Width = 97
      Height = 81
      Caption = 'Y1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object PaintBoxColor2: TPaintBox
        Left = 48
        Top = 8
        Width = 41
        Height = 9
      end
      object ComboBoxY2: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        Cursor = crHandPoint
        Hint = 'calibre de la voie 1'
        ItemsEx = <
          item
          end
          item
            Caption = '5 V/div'
          end
          item
            Caption = '2 V/div'
          end
          item
            Caption = '1 V/div'
          end
          item
            Caption = '500 mV/div'
          end
          item
            Caption = '200 mV/div'
          end
          item
            Caption = '100 mV/div'
          end
          item
            Caption = '50   mV/div'
          end
          item
            Caption = '20   mV/div'
          end
          item
            Caption = '10   mV/div'
          end>
        DragCursor = crDefault
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Sensibilit'#233
        OnClick = YChange
      end
      object RadioButtonY2SondeX1: TRadioButton
        Left = 8
        Top = 16
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY2SondeX10: TRadioButton
        Left = 48
        Top = 16
        Width = 41
        Height = 17
        Hint = 'utilisation d'#39'une sonde x10'
        Caption = 'x 10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = YChange
      end
      object CheckBoxINVCH2: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'INV.'
        TabOrder = 3
        OnClick = YChange
      end
      object Button0DECALCH2: TButton
        Left = 72
        Top = 56
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 4
        OnClick = YChange
      end
      object CheckBoxUniDiff2: TCheckBox
        Left = 8
        Top = 56
        Width = 41
        Height = 17
        Caption = 'DIFF.'
        TabOrder = 5
        Visible = False
        OnClick = UniDiffChange
      end
    end
    object CheckBoxY1Visible: TCheckBox
      Left = 8
      Top = 12
      Width = 41
      Height = 17
      Caption = 'Y0'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 4
      OnClick = YChange
    end
    object CheckBoxY2Visible: TCheckBox
      Left = 48
      Top = 12
      Width = 41
      Height = 17
      Caption = 'Y1'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      OnClick = YChange
    end
    object CheckBoxY3Visible: TCheckBox
      Left = 88
      Top = 12
      Width = 41
      Height = 17
      Caption = 'Y2'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 6
      OnClick = YChange
    end
    object CheckBoxY4Visible: TCheckBox
      Left = 128
      Top = 12
      Width = 41
      Height = 17
      Caption = 'Y3'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
      OnClick = YChange
    end
    object CheckBoxXY: TCheckBox
      Left = 168
      Top = 12
      Width = 41
      Height = 17
      Caption = 'XY'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object GroupBoxBaseDeTemps_1: TGroupBox
    Left = 448
    Top = 651
    Width = 217
    Height = 121
    Caption = 'Base de temps'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    Visible = False
    object ScrollBarBDT_1: TScrollBar
      Left = 8
      Top = 16
      Width = 201
      Height = 17
      Max = 12
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 0
      OnChange = XChange
    end
    object RadioButtonBDT4_1: TRadioButton
      Left = 53
      Top = 40
      Width = 57
      Height = 17
      Caption = '100 '#181's'
      TabOrder = 1
      OnClick = XChange
    end
    object RadioButtonBDT5_1: TRadioButton
      Left = 53
      Top = 56
      Width = 57
      Height = 17
      Caption = '200 '#181's'
      TabOrder = 2
      OnClick = XChange
    end
    object RadioButtonBDT6_1: TRadioButton
      Left = 53
      Top = 72
      Width = 57
      Height = 17
      Caption = '500 '#181's'
      TabOrder = 3
      OnClick = XChange
    end
    object RadioButtonBDT7_1: TRadioButton
      Left = 109
      Top = 40
      Width = 49
      Height = 17
      Caption = '1 ms'
      TabOrder = 4
      OnClick = XChange
    end
    object RadioButtonBDT8_1: TRadioButton
      Left = 109
      Top = 56
      Width = 49
      Height = 17
      Caption = '2 ms'
      TabOrder = 5
      OnClick = XChange
    end
    object RadioButtonBDT9_1: TRadioButton
      Left = 109
      Top = 72
      Width = 49
      Height = 17
      Caption = '5 ms'
      TabOrder = 6
      OnClick = XChange
    end
    object RadioButtonBDT10_1: TRadioButton
      Left = 157
      Top = 40
      Width = 52
      Height = 17
      Caption = '10 ms'
      TabOrder = 7
      OnClick = XChange
    end
    object RadioButtonBDT11_1: TRadioButton
      Left = 157
      Top = 56
      Width = 52
      Height = 17
      Caption = '20 ms'
      TabOrder = 8
      OnClick = XChange
    end
    object RadioButtonBDT12_1: TRadioButton
      Left = 157
      Top = 72
      Width = 52
      Height = 17
      Caption = '50 ms'
      TabOrder = 9
      OnClick = XChange
    end
    object RadioButtonBDT1_1: TRadioButton
      Left = 3
      Top = 40
      Width = 49
      Height = 17
      Caption = '10 '#181's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = XChange
    end
    object RadioButtonBDT2_1: TRadioButton
      Left = 3
      Top = 56
      Width = 49
      Height = 17
      Caption = '20 '#181's'
      TabOrder = 11
      OnClick = XChange
    end
    object RadioButtonBDT3_1: TRadioButton
      Left = 3
      Top = 72
      Width = 49
      Height = 17
      Caption = '50 '#181's'
      TabOrder = 12
      OnClick = XChange
    end
    object ScrollBarDecalBDT_1: TScrollBar
      Left = 8
      Top = 96
      Width = 201
      Height = 17
      Max = 1000
      Min = 500
      PageSize = 0
      Position = 1000
      TabOrder = 13
      Visible = False
    end
  end
  object ScrollBarLevelTrigger: TScrollBar
    Left = 216
    Top = 0
    Width = 17
    Height = 504
    Hint = 'Niveau de d'#233'clenchement (Level Trigger)'
    BiDiMode = bdLeftToRight
    Kind = sbVertical
    Max = 4095
    Min = 1
    PageSize = 0
    ParentBiDiMode = False
    Position = 2048
    TabOrder = 3
    Visible = False
    OnChange = TriggerChange
  end
  object GroupBoxEnregistrement: TGroupBox
    Left = 446
    Top = 535
    Width = 217
    Height = 113
    Caption = 'Enregistrement'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    DesignSize = (
      217
      113)
    object PaintBoxA: TPaintBox
      Left = 9
      Top = 28
      Width = 136
      Height = 80
      Anchors = [akTop, akRight]
    end
    object LabelEnreg: TLabel
      Left = 8
      Top = 12
      Width = 3
      Height = 14
    end
    object ButtonCH1Enreg: TButton
      Left = 174
      Top = 10
      Width = 35
      Height = 17
      Caption = 'Y0'
      TabOrder = 0
      OnClick = ButtonEnregClick
    end
    object ButtonCH2Enreg: TButton
      Left = 174
      Top = 26
      Width = 35
      Height = 17
      Caption = 'Y1'
      TabOrder = 1
      OnClick = ButtonEnregClick
    end
    object ButtonCH3Enreg: TButton
      Left = 174
      Top = 42
      Width = 35
      Height = 17
      Caption = 'Y2'
      TabOrder = 2
      OnClick = ButtonEnregClick
    end
    object ButtonCH4Enreg: TButton
      Left = 174
      Top = 58
      Width = 35
      Height = 17
      Caption = 'Y3'
      TabOrder = 3
      OnClick = ButtonEnregClick
    end
    object ButtonDUALEnreg: TButton
      Left = 174
      Top = 74
      Width = 35
      Height = 17
      Caption = 'TOUT'
      TabOrder = 4
      OnClick = ButtonEnregClick
    end
    object ButtonSUPRenrg: TButton
      Left = 174
      Top = 93
      Width = 35
      Height = 17
      Caption = 'Supr.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = SuprimerEnregistrementClick
    end
    object ScrollBarEnregistrements: TScrollBar
      Left = 152
      Top = 8
      Width = 17
      Height = 103
      Kind = sbVertical
      Max = 10
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 6
      OnChange = ScrollBarEnregistrementsChange
    end
  end
  object ScrollBar0CH1: TScrollBar
    Left = 768
    Top = 16
    Width = 17
    Height = 121
    Hint = 'D'#233'calage du z'#233'ro de la voie 0'
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 5
  end
  object ScrollBar0CH2: TScrollBar
    Left = 768
    Top = 144
    Width = 17
    Height = 121
    Hint = 'D'#233'calage du z'#233'ro de la voie 1'
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 6
  end
  object ScrollBar0CH3: TScrollBar
    Left = 768
    Top = 272
    Width = 17
    Height = 121
    Hint = 'D'#233'calage du z'#233'ro de la voie 2'
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 7
  end
  object ScrollBar0CH4: TScrollBar
    Left = 768
    Top = 400
    Width = 17
    Height = 121
    Hint = 'D'#233'calage du z'#233'ro de la voie 3'
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 8
  end
  object PageControlMesures: TPageControl
    Left = 0
    Top = 504
    Width = 217
    Height = 113
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Visible = False
    object TabSheet1: TTabSheet
      Caption = 'Y0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object LabelVch1AC: TLabel
        Left = 0
        Top = 24
        Width = 87
        Height = 14
        Caption = '                             '
      end
      object LabelVch1ACDC: TLabel
        Left = 0
        Top = 40
        Width = 89
        Height = 33
        AutoSize = False
        WordWrap = True
      end
      object LabelVch1Max: TLabel
        Left = 112
        Top = 7
        Width = 84
        Height = 14
        Caption = '                            '
      end
      object LabelVch1Min: TLabel
        Left = 112
        Top = 23
        Width = 75
        Height = 14
        Caption = '                         '
      end
      object LabelTch1: TLabel
        Left = 112
        Top = 40
        Width = 72
        Height = 14
        Caption = '                        '
      end
      object LabelFch1: TLabel
        Left = 112
        Top = 56
        Width = 75
        Height = 14
        Caption = '                         '
      end
      object LabelVch1DC: TLabel
        Left = 0
        Top = 8
        Width = 57
        Height = 14
        Caption = '                   '
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Y1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object LabelVch2DC: TLabel
        Left = 0
        Top = 8
        Width = 72
        Height = 14
        Caption = 'LabelVch1DC'
      end
      object LabelVch2AC: TLabel
        Left = 0
        Top = 24
        Width = 73
        Height = 14
        Caption = 'LabelVch1AC'
      end
      object LabelVch2ACDC: TLabel
        Left = 0
        Top = 40
        Width = 89
        Height = 33
        AutoSize = False
        Caption = 'LabelVch1ACDC'
        WordWrap = True
      end
      object LabelVch2Max: TLabel
        Left = 112
        Top = 7
        Width = 79
        Height = 14
        Caption = 'LabelVch1Max'
      end
      object LabelVch2Min: TLabel
        Left = 112
        Top = 23
        Width = 77
        Height = 14
        Caption = 'LabelVch1Min'
      end
      object LabelTch2: TLabel
        Left = 112
        Top = 40
        Width = 56
        Height = 14
        Caption = 'LabelTch1'
      end
      object LabelFch2: TLabel
        Left = 112
        Top = 56
        Width = 55
        Height = 14
        Caption = 'LabelFch1'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Y2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ImageIndex = 2
      ParentFont = False
      object LabelVch3DC: TLabel
        Left = 0
        Top = 8
        Width = 72
        Height = 14
        Caption = 'LabelVch1DC'
      end
      object LabelVch3AC: TLabel
        Left = 0
        Top = 24
        Width = 73
        Height = 14
        Caption = 'LabelVch1AC'
      end
      object LabelVch3ACDC: TLabel
        Left = 0
        Top = 40
        Width = 89
        Height = 33
        AutoSize = False
        Caption = 'LabelVch1ACDC'
        WordWrap = True
      end
      object LabelVch3Max: TLabel
        Left = 112
        Top = 7
        Width = 79
        Height = 14
        Caption = 'LabelVch1Max'
      end
      object LabelVch3Min: TLabel
        Left = 112
        Top = 23
        Width = 77
        Height = 14
        Caption = 'LabelVch1Min'
      end
      object LabelTch3: TLabel
        Left = 112
        Top = 40
        Width = 56
        Height = 14
        Caption = 'LabelTch1'
      end
      object LabelFch3: TLabel
        Left = 112
        Top = 56
        Width = 55
        Height = 14
        Caption = 'LabelFch1'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Y3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ImageIndex = 3
      ParentFont = False
      object LabelVch4DC: TLabel
        Left = 0
        Top = 8
        Width = 72
        Height = 14
        Caption = 'LabelVch1DC'
      end
      object LabelVch4AC: TLabel
        Left = 0
        Top = 24
        Width = 73
        Height = 14
        Caption = 'LabelVch1AC'
      end
      object LabelVch4ACDC: TLabel
        Left = 0
        Top = 40
        Width = 89
        Height = 33
        AutoSize = False
        Caption = 'LabelVch1ACDC'
        WordWrap = True
      end
      object LabelVch4Max: TLabel
        Left = 112
        Top = 7
        Width = 79
        Height = 14
        Caption = 'LabelVch1Max'
      end
      object LabelVch4Min: TLabel
        Left = 112
        Top = 23
        Width = 77
        Height = 14
        Caption = 'LabelVch1Min'
      end
      object LabelTch4: TLabel
        Left = 112
        Top = 40
        Width = 56
        Height = 14
        Caption = 'LabelTch1'
      end
      object LabelFch4: TLabel
        Left = 112
        Top = 56
        Width = 55
        Height = 14
        Caption = 'LabelFch1'
      end
    end
  end
  object GroupBoxMONOCOUP: TGroupBox
    Left = 2
    Top = 662
    Width = 217
    Height = 113
    Caption = 'Mono Coup'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 158
      Height = 14
      Caption = 'R'#233'glage du temps d'#39'attente :'
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 152
      Height = 14
      Caption = 'Temps d'#39'attente (TimeOut) '
    end
    object Image1: TImage
      Left = 3
      Top = 16
      Width = 23
      Height = 25
      Picture.Data = {
        07544269746D6170A2010000424DA20100000000000076000000280000001700
        00001900000001000400000000002C0100000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFF000FFFFFFFFFF0FFFFFFFFFFF0FFFFFFFFFFF0FFFFFFFFF000
        00FFFFFFFFF0FFFFFFF00FF0FF00FFFFFFF0FFFFFF0FFFF0FFFF0FFFFFF0FFFF
        F0FFF00000FFF0FFFFF0FFFF0FFF0FF0FF0FFF0FFFF0FFF0FFF0FFF0FFF0FFF0
        FFF0FFF0FF0FFFF0FFFF0FF0FFF0FFF0FF0FF00000FF0FF0FFF0FF0FFF0FF090
        90FF0FFF0FF00F0FF0FF0999990FF0FF0F000000000000999000000000000F0F
        F0FF0999990FF0FF0F00FF0FFF0FF09090FF0FFF0FF0FFF0FF0FF00000FF0FF0
        FFF0FFF0FF0FFFF0FFFF0FF0FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFFF0FFF0FF0
        FF0FFF0FFFF0FFFFF0FFF00000FFF0FFFFF0FFFFFF0FFFF0FFFF0FFFFFF0FFFF
        FFF00FF0FF00FFFFFFF0FFFFFFFFF00000FFFFFFFFF0FFFFFFFFFFF0FFFFFFFF
        FFF0FFFFFFFFFF000FFFFFFFFFF0}
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 56
      Width = 201
      Height = 17
      Max = 3000
      Position = 5
      TabOrder = 0
    end
    object ButtonStartMonoCoup: TButton
      Left = 68
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Lancer'
      TabOrder = 1
      OnClick = MONOCOUP_START_Click
    end
    object ButtonStopMonoCoup: TButton
      Left = 192
      Top = 40
      Width = 19
      Height = 17
      Caption = 'Stop'
      TabOrder = 2
      Visible = False
      OnClick = MONOCOUP_STOP_Click
    end
    object ScrollBarTimeOutMonoCoup: TScrollBar
      Left = 8
      Top = 88
      Width = 201
      Height = 17
      Max = 10000
      PageSize = 0
      Position = 3000
      TabOrder = 3
    end
  end
  object GroupBoxBaseDeTemps_II: TGroupBox
    Left = 661
    Top = 527
    Width = 217
    Height = 121
    Caption = 'Echantillonnage'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Visible = False
    object Label_BDT_II_dt: TLabel
      Left = 8
      Top = 64
      Width = 71
      Height = 14
      Caption = 'P'#233'riode (dt) :'
    end
    object Label_BDT_II_T_total: TLabel
      Left = 8
      Top = 80
      Width = 73
      Height = 14
      Caption = 'Dur'#233'e acq.    :'
    end
    object Label_BDT_II_ECRAN: TLabel
      Left = 8
      Top = 96
      Width = 125
      Height = 14
      Caption = 'Ecran             :  xxx s/div'
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 14
      Caption = 'Fr'#233'quence :'
    end
    object Label4: TLabel
      Left = 91
      Top = 16
      Width = 78
      Height = 14
      Caption = 'Nb. de points :'
    end
    object ComboBoxEx_BDT_II_FREQ: TComboBoxEx
      Left = 8
      Top = 34
      Width = 81
      Height = 23
      ItemsEx = <
        item
          Caption = '    10 MHz'
        end
        item
          Caption = '      6 MHz'
        end
        item
          Caption = '   2,5 MHz'
        end
        item
          Caption = '      1 MHz'
        end
        item
          Caption = '   500 KHz'
        end
        item
          Caption = '   250 KHz'
        end
        item
          Caption = '   100 KHz'
        end
        item
          Caption = '     50 KHz'
        end
        item
          Caption = '     25 KHz'
        end
        item
          Caption = '     10 KHz'
        end
        item
          Caption = '      5 KHz'
        end
        item
          Caption = '   2.5 KHz'
        end
        item
          Caption = '      1 KHz'
        end
        item
          Caption = '   Autre ...'
        end
        item
        end>
      ItemHeight = 16
      TabOrder = 0
      Text = 'Fr'#233'quence'
      OnClick = XChange_II
    end
    object Edit_BDTII_NB_POINTS: TEdit
      Left = 96
      Top = 34
      Width = 81
      Height = 22
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 1
      Text = 'Nb. de Points'
      OnChange = XChange_II
      OnClick = XChange_II_NBdePOINTS_click
      OnKeyDown = Edit_BDTII_NB_POINTSKeyDown
    end
    object Button_BDT_II_VALIDATION: TButton
      Left = 151
      Top = 96
      Width = 57
      Height = 20
      Caption = 'VALIDER'
      TabOrder = 2
      Visible = False
      OnClick = XChange_II
    end
  end
  object GroupBoxBaseDeTemps: TGroupBox
    Left = 223
    Top = 535
    Width = 217
    Height = 121
    Caption = 'Base de temps'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    Visible = False
    object Label5: TLabel
      Left = 112
      Top = 40
      Width = 13
      Height = 14
      Caption = #181's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 192
      Top = 40
      Width = 18
      Height = 14
      Caption = 'ms'
    end
    object ScrollBarBDT: TScrollBar
      Left = 8
      Top = 16
      Width = 201
      Height = 17
      Max = 15
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 0
      OnChange = XChange
    end
    object RadioButtonBDT7: TRadioButton
      Left = 69
      Top = 40
      Width = 36
      Height = 17
      Caption = '100'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = XChange
    end
    object RadioButtonBDT8: TRadioButton
      Left = 69
      Top = 56
      Width = 36
      Height = 17
      Caption = '200'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = XChange
    end
    object RadioButtonBDT9: TRadioButton
      Left = 69
      Top = 72
      Width = 36
      Height = 17
      Caption = '500 '
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = XChange
    end
    object RadioButtonBDT10: TRadioButton
      Left = 130
      Top = 40
      Width = 28
      Height = 17
      Caption = '1 '
      TabOrder = 4
      OnClick = XChange
    end
    object RadioButtonBDT11: TRadioButton
      Left = 130
      Top = 56
      Width = 28
      Height = 17
      Caption = '2 '
      TabOrder = 5
      OnClick = XChange
    end
    object RadioButtonBDT12: TRadioButton
      Left = 130
      Top = 72
      Width = 28
      Height = 17
      Caption = '5 '
      TabOrder = 6
      OnClick = XChange
    end
    object RadioButtonBDT13: TRadioButton
      Left = 157
      Top = 40
      Width = 30
      Height = 17
      Caption = '10 '
      TabOrder = 7
      OnClick = XChange
    end
    object RadioButtonBDT14: TRadioButton
      Left = 157
      Top = 56
      Width = 36
      Height = 17
      Caption = '20 '
      TabOrder = 8
      OnClick = XChange
    end
    object RadioButtonBDT15: TRadioButton
      Left = 157
      Top = 72
      Width = 36
      Height = 17
      Caption = '50'
      TabOrder = 9
      OnClick = XChange
    end
    object RadioButtonBDT4: TRadioButton
      Left = 35
      Top = 40
      Width = 30
      Height = 17
      Caption = '10'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = XChange
    end
    object RadioButtonBDT5: TRadioButton
      Left = 35
      Top = 56
      Width = 30
      Height = 17
      Caption = '20'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = XChange
    end
    object RadioButtonBDT6: TRadioButton
      Left = 35
      Top = 72
      Width = 30
      Height = 17
      Caption = '50'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = XChange
    end
    object ScrollBarDecalBDT: TScrollBar
      Left = 8
      Top = 96
      Width = 201
      Height = 17
      Max = 1000
      Min = 500
      PageSize = 0
      Position = 1000
      TabOrder = 13
      Visible = False
    end
    object RadioButtonBDT1: TRadioButton
      Left = 8
      Top = 40
      Width = 25
      Height = 17
      Caption = '1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      OnClick = XChange
    end
    object RadioButtonBDT2: TRadioButton
      Left = 8
      Top = 56
      Width = 25
      Height = 17
      Caption = '2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      OnClick = XChange
    end
    object RadioButtonBDT3: TRadioButton
      Left = 8
      Top = 72
      Width = 25
      Height = 17
      Caption = '5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = XChange
    end
  end
  object GroupBoxBaseDeTemps_IV_FREQ_ECH: TGroupBox
    Left = 663
    Top = 649
    Width = 217
    Height = 113
    Caption = 'Fr'#233'quence d'#39#233'chantillonnage'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    Visible = False
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 49
      Height = 14
      Caption = 'D'#233'sir'#233'e :'
    end
    object Label8: TLabel
      Left = 8
      Top = 56
      Width = 64
      Height = 14
      Caption = 'Disponible :'
    end
    object Label9: TLabel
      Left = 200
      Top = 24
      Width = 13
      Height = 14
      Caption = 'Hz'
    end
    object Label10: TLabel
      Left = 200
      Top = 56
      Width = 13
      Height = 14
      Caption = 'Hz'
    end
    object ValideFregPossiblr: TButton
      Left = 112
      Top = 84
      Width = 57
      Height = 17
      Caption = 'VALIDER'
      TabOrder = 0
      OnClick = ValideFregPossiblrClick
    end
    object Edit1: TEdit
      Left = 80
      Top = 20
      Width = 113
      Height = 22
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 80
      Top = 52
      Width = 113
      Height = 22
      Enabled = False
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 73
    Caption = 'Panel1'
    TabOrder = 14
    object ToolBar3: TToolBar
      Left = 1
      Top = 1
      Width = 215
      Height = 35
      ButtonHeight = 31
      ButtonWidth = 30
      Caption = 'ToolBar3'
      Flat = False
      Images = ImageList2
      TabOrder = 0
      object ToolButton_cabalab: TToolButton
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Hint = 'Voir la fen'#234'tre CabaLab'
        Caption = 'ToolButton_cabalab'
        DragCursor = crDefault
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = BoxCabaLabClick
      end
      object ToolButton9: TToolButton
        Left = 30
        Top = 0
        Width = 2
        Caption = 'ToolButton9'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton_GBF: TToolButton
        Left = 32
        Top = 0
        Cursor = crHandPoint
        Hint = 'Voir le GBF de CabaLab'
        Caption = 'ToolButton_GBF'
        DragCursor = crDefault
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = BoxCabaLabClick
      end
      object ToolButton12: TToolButton
        Left = 62
        Top = 0
        Width = 2
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton13: TToolButton
        Left = 64
        Top = 0
        Cursor = crHandPoint
        Hint = 'S'#233'lectionner le mode Oscilloscope ou EXAO'
        Caption = 'ToolButton13'
        DragCursor = crDefault
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = Menu_BDT_II_Click
      end
      object ToolButton_ecran_1_4: TToolButton
        Left = 94
        Top = 0
        Cursor = crHandPoint
        Hint = 'S'#233'lectionner un ou plusieurs '#233'crans'
        Caption = 'ToolButton_ecran_1_4'
        DragCursor = crDefault
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = MenuECRANClick
      end
      object ToolButton_monocoup: TToolButton
        Left = 124
        Top = 0
        Cursor = crHandPoint
        Hint = 'Mode une seule mesure (MONO-COUP)'
        Caption = 'ToolButton_monocoup'
        DragCursor = crDefault
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = MenuOPTIONSClick
      end
      object ToolButton_boite_enregistrements: TToolButton
        Left = 154
        Top = 0
        Cursor = crHandPoint
        Hint = 'Boite d'#39'enregistrements'
        Caption = 'ToolButton_boite_enregistrements'
        DragCursor = crDefault
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = MenuOPTIONSClick
      end
      object ToolButton_Multimetre: TToolButton
        Left = 184
        Top = 0
        Cursor = crHandPoint
        Hint = 'Afficher les multim'#232'tres'
        Caption = 'ToolButton_Multimetre'
        DragCursor = crDefault
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = MenuOPTIONSClick
      end
    end
    object ToolBar4: TToolBar
      Left = 1
      Top = 36
      Width = 215
      Height = 35
      ButtonHeight = 31
      ButtonWidth = 30
      Caption = 'ToolBar3'
      Flat = False
      Images = ImageList1
      TabOrder = 1
      object ToolButton8: TToolButton
        Left = 0
        Top = 0
        Width = 2
        Caption = 'ToolButton9'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton_new_fichier: TToolButton
        Left = 2
        Top = 0
        Cursor = crHandPoint
        Hint = 'Nouveau fichier r'#233'gressi'
        Caption = 'ToolButton10'
        DragCursor = crCross
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = RegressiDDEClick
      end
      object ToolButton_Newpage: TToolButton
        Left = 32
        Top = 0
        Cursor = crHandPoint
        Hint = 'Nouvelle page r'#233'gressi '
        Caption = 'ToolButton11'
        DragCursor = crDefault
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = RegressiDDEClick
      end
      object ToolButton19: TToolButton
        Left = 62
        Top = 0
        Width = 2
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton_enrg_mutipage: TToolButton
        Left = 64
        Top = 0
        Cursor = crHandPoint
        Hint = 'Enregistrements multi-pages'
        Caption = 'ToolButton13'
        DragCursor = crDefault
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = ToolButton_enrg_mutipageClick
      end
      object ToolButton_enrg_monopage: TToolButton
        Left = 94
        Top = 0
        Cursor = crHandPoint
        Hint = 'Enregistrement mono-page'
        Caption = 'ToolButton14'
        DragCursor = crDefault
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = ToolButton_enrg_monopageClick
      end
      object ToolButton_regressi_utilisateur: TToolButton
        Left = 124
        Top = 0
        Cursor = crHandPoint
        Hint = 'Enregistrements -> r'#233'gressi utilisateur'
        Caption = 'ToolButton15'
        DragCursor = crCross
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = MenuRegUtilisateurClick
      end
      object ToolButton2: TToolButton
        Left = 154
        Top = 0
        Width = 2
        Caption = 'ToolButton2'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object ToolButtonrunstop: TToolButton
        Left = 156
        Top = 0
        Hint = 'Stopper/Reprendre l'#39'acquisition'
        Caption = 'ToolButtonrunstop'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = BoxCabaLabClick
      end
    end
  end
  object GroupBoxBaseDeTemps_III_CHOIX: TGroupBox
    Left = 225
    Top = 662
    Width = 217
    Height = 121
    Caption = 'Base de temps'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    object Button_BDT_OSCILLO: TButton
      Left = 40
      Top = 24
      Width = 137
      Height = 33
      Cursor = crHandPoint
      Hint = 'r'#233'glage de la base de temps de l'#39'oscilloscope'
      Caption = 'Oscilloscope'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button_BDT_OSCILLO_EXAO_Click
    end
    object Button_BDT_EXAO: TButton
      Left = 40
      Top = 72
      Width = 137
      Height = 33
      Cursor = crHandPoint
      Hint = 'r'#233'glage de la dur'#233'e d'#39'acquisition et du nombre d'#39#233'chantillons'
      Caption = 'EXAO'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button_BDT_OSCILLO_EXAO_Click
    end
  end
  object ButtonRunStop: TButton
    Left = 80
    Top = 422
    Width = 49
    Height = 27
    Cursor = crHandPoint
    Hint = 'D'#233'marrer/stropper l'#39'acquisition'
    Caption = 'Stop'
    DragCursor = crDefault
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Visible = False
    OnClick = BoxCabaLabClick
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 64
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      object Remiseazrodelaconfiguration1: TMenuItem
        Caption = 'R'#233'initialiser l'#39'oscilloscope'
        ShortCut = 16466
        OnClick = menuRESETconfigClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object RegressiDDE: TMenuItem
        Caption = 'Exporter vers R'#233'gressi : l'#39'instantan'#233
        OnClick = RegressiDDEClick
        object menu_TregressiInst_NEWfichier: TMenuItem
          Bitmap.Data = {
            8E060000424D8E06000000000000360400002800000017000000190000000100
            0800000000005802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F70000000000
            00000000000000000000000000000000F700F700FBFBFBFBFBFBFBFBFBFBFBFB
            FBFBFBFBFBFBFB00F700F700FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00
            F700F700FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00F700F700FBFBFBFB
            FBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00F700F700FBFBFBFBFBFBFBFBFBFBFBFB
            FBFBFBFBFBFBFB00F700F700FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00
            F700F700FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00F700F70000000000
            00000000000000000000000000000000F700F7F7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F700F7F7F7F7F7F700F7F7F7FEFEFEFEFEFEFEFEFEFEFEFE
            F7000000000000000000F7F7FEFEFEFEFEFEFEFEFEFEFEFEF700000000000000
            000000F7FEFEFEFEFEFEFEFEFEFEFEFEF7000000000000000000F7F7FEFE0000
            0000FEFE000000FEF7000000F7F7F7F700F7F7F7FEFEFE0000FEFE0000FEFEFE
            F7000000F7F7F7F7F7F7F7F7FEFEFE0000FEFE0000FEFEFEF7000000F7F7F7F7
            F7F7F7F7FEFEFE0000FE0000FEFEFEFEF7000000F7F7F7F7F7F7F7F7FEFEFE00
            0000000000FEFEFEF7000000F7F7F7F7F7F7F7F7FEFEFE0000FEFEFE0000FEFE
            F7000000F7F7F7F7F7F7F7F7FEFEFE0000FEFEFE0000FEFEF7000000F7F7F7F7
            F7F7F7F7FEFEFE0000FEFEFE0000FEFEF7000000F7F7F7F7F7F7F7F7FEFE0000
            0000000000FEFEFEF7000000F7F7F7F7F7F7F7F7FEFEFEFEFEFEFEFEFEFEFEFE
            F7000000F7F7F7F7F7F7F7F7FEFEFEFEFEFEFEFEFEFEFEFEF700F700F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F700}
          Caption = 'Nouveau Fichier'
          OnClick = RegressiDDEClick
        end
        object menu_TregressiInst_NEWpage: TMenuItem
          Bitmap.Data = {
            8E060000424D8E06000000000000360400002800000017000000190000000100
            0800000000005802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F700FB00FB00
            FB00FBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00F700FB00FB00FB00FBFBFBFBFBFB
            FBFBFBFBFBFBFBFBFB00F700FB00FB00FB000000000000000000000000000000
            0000F700FB00FB00FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00F700FB00FB00
            000000000000000000000000000000000000F700FB00FBFBFBFBFBFBFBFBFBFB
            FBFBFBFBFBFBFBFBFB00F700FB00000000000000000000000000000000000000
            0000F700FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB00F70000000000
            000000000000000000000000000000000000F7F7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F700F7F7F7F7F7F700F7F7F7FEFEFEFEFEFEFEFEFEFEFEFE
            F7000000000000000000F7F7FEFEFEFEFEFEFEFEFEFEFEFEF700000000000000
            000000F7FEFEFEFEFEFEFEFEFEFEFEFEF7000000000000000000F7F7FEFE0000
            0000FEFE000000FEF7000000F7F7F7F700F7F7F7FEFEFE0000FEFE0000FEFEFE
            F7000000F7F7F7F7F7F7F7F7FEFEFE0000FEFE0000FEFEFEF7000000F7F7F7F7
            F7F7F7F7FEFEFE0000FE0000FEFEFEFEF7000000F7F7F7F7F7F7F7F7FEFEFE00
            0000000000FEFEFEF7000000F7F7F7F7F7F7F7F7FEFEFE0000FEFEFE0000FEFE
            F7000000F7F7F7F7F7F7F7F7FEFEFE0000FEFEFE0000FEFEF7000000F7F7F7F7
            F7F7F7F7FEFEFE0000FEFEFE0000FEFEF7000000F7F7F7F7F7F7F7F7FEFE0000
            0000000000FEFEFEF7000000F7F7F7F7F7F7F7F7FEFEFEFEFEFEFEFEFEFEFEFE
            F7000000F7F7F7F7F7F7F7F7FEFEFEFEFEFEFEFEFEFEFEFEF700F700F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F700}
          Caption = 'Nouvelle page'
          OnClick = RegressiDDEClick
        end
      end
      object MenuRegUtilisateur: TMenuItem
        Caption = 'Exporter vers R'#233'gressi : les enregistrements'
        OnClick = MenuRegUtilisateurClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object ChargerSauverlaconfiguration1: TMenuItem
        Caption = 'Charger/Sauvegarder la configuration'
        object Charger1: TMenuItem
          Caption = 'Chargement rapide'
          OnClick = MenuChargerConfig
        end
        object MenuEnregConfig: TMenuItem
          Caption = 'Sauvegarde rapide'
          OnClick = MenuEnregistrerConfig
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object Chargement1: TMenuItem
          Caption = 'Charger...'
          OnClick = MenuChargerConfigFichier
        end
        object Enregistrement1: TMenuItem
          Caption = 'Sauvegarder...'
          OnClick = MenuEnregistrerConfigFichier
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Quitter1: TMenuItem
        Caption = 'Quitter'
        OnClick = Quitter1Click
      end
      object MenuInterfaceTaille: TMenuItem
        Caption = 'Taille :'
        Enabled = False
        Visible = False
        object ConfigOscilo800600: TMenuItem
          Caption = 'Compacte'
          RadioItem = True
          OnClick = MenuConfigOscilloClick
        end
        object ConfigOscilo1024768: TMenuItem
          Caption = 'Large'
          RadioItem = True
          OnClick = MenuConfigOscilloClick
        end
        object ConfigOscilo1280960: TMenuItem
          Caption = 'Etendue'
          RadioItem = True
          Visible = False
          OnClick = MenuConfigOscilloClick
        end
      end
      object RegressiBR2: TMenuItem
        Caption = 'Regressi BR2'
        Enabled = False
        Visible = False
        OnClick = Regressi2Click
      end
      object RegressiBR: TMenuItem
        Caption = 'Regressi BR'
        Enabled = False
        Visible = False
        OnClick = REGRESSIBR1Click
      end
    end
    object Config: TMenuItem
      Caption = 'Configuration des Voies'
      object Configurationdesvoies1: TMenuItem
        Caption = 'Unipolaire/Diff'#233'rentiel'
        GroupIndex = 11
        object ALLuni: TMenuItem
          Caption = 'Y 0123 Unipolaires'
          GroupIndex = 10
          RadioItem = True
          OnClick = UniDiffChange
        end
        object ALLdiff: TMenuItem
          Caption = 'Y 0123 Diff'#233'rentielles'
          GroupIndex = 10
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N11: TMenuItem
          Caption = '-'
          GroupIndex = 10
        end
        object UniY1: TMenuItem
          Caption = 'Y0 Unipolaire'
          GroupIndex = 11
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY1: TMenuItem
          Caption = 'Y0 Diff'#233'rentielle'
          GroupIndex = 11
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N1: TMenuItem
          Caption = '-'
          GroupIndex = 11
        end
        object UniY2: TMenuItem
          Caption = 'Y1 Unipolaire'
          GroupIndex = 12
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY2: TMenuItem
          Caption = 'Y1 Diff'#233'rentielle'
          GroupIndex = 12
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N2: TMenuItem
          Caption = '-'
          GroupIndex = 12
        end
        object UniY3: TMenuItem
          Caption = 'Y2 Unipolaire'
          GroupIndex = 13
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY3: TMenuItem
          Caption = 'Y2 Diff'#233'rentielle'
          GroupIndex = 13
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N3: TMenuItem
          Caption = '-'
          GroupIndex = 13
        end
        object UniY4: TMenuItem
          Caption = 'Y3 Unipolaire'
          GroupIndex = 14
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY4: TMenuItem
          Caption = 'Y3 Diff'#233'rentielle'
          GroupIndex = 14
          RadioItem = True
          OnClick = UniDiffChange
        end
        object MenuUniDiffFacade: TMenuItem
          Caption = 'S'#233'lection Uni. Diff. (DIFF.)'
          Enabled = False
          GroupIndex = 14
          Visible = False
        end
      end
      object N14: TMenuItem
        Caption = '-'
        GroupIndex = 11
      end
      object menuOptionVoies: TMenuItem
        Caption = 'Ajout d'#39'options en fa'#231'ade'
        GroupIndex = 11
        object menuOptionSondes: TMenuItem
          Caption = 'Sondes                   (X1 X10)'
          Visible = False
        end
        object menuOptionINV: TMenuItem
          Caption = 'Invertion                (INV.)'
          OnClick = UniDiffChange
        end
        object menuOptionUniDiffFacade: TMenuItem
          Caption = 'S'#233'lection Uni. Diff. (DIFF.)'
          OnClick = UniDiffChange
        end
      end
    end
    object BDT: TMenuItem
      Caption = 'Base de temps'
      object PrsentationOscilloscope1: TMenuItem
        Caption = 'Pr'#233'sentation Oscilloscope'
        RadioItem = True
        OnClick = Menu_BDT_II_Click
      end
      object menu_BDT_II: TMenuItem
        Caption = 'Pr'#233'sentation EXAO'
        RadioItem = True
        OnClick = Menu_BDT_II_Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object MenuDecalBDT: TMenuItem
        Caption = 'D'#233'calibrage de la base de temps'
        OnClick = MenuDecalBDTClick
      end
      object menutimeout: TMenuItem
        Caption = 
          'Temps d'#39'attente maximum de l'#39'occurence d'#39'un front de d'#233'clencheme' +
          'nt  (Time Out)'
        object menutimeout1: TMenuItem
          Caption = 'Rapide'
          RadioItem = True
          OnClick = MenuTimeOutClick
        end
        object menutimeout2: TMenuItem
          Caption = 'Moyen'
          RadioItem = True
          OnClick = MenuTimeOutClick
        end
        object menutimeout3: TMenuItem
          Caption = 'Lent'
          RadioItem = True
          OnClick = MenuTimeOutClick
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object menutimeout4: TMenuItem
          Caption = 'Utilisateur'
          RadioItem = True
          OnClick = MenuTimeOutClick
          object menuTIMEOUEUTILISATEURREGLAGE: TMenuItem
            Caption = 'R'#233'glage'
            OnClick = MenuTimeOutClick
          end
        end
      end
      object VitesseAqcuisition1: TMenuItem
        Caption = 'Vitesse de transfert du port USB'
        object VUlent: TMenuItem
          Caption = 'Rapide (pour USB2)'
          GroupIndex = 5
          RadioItem = True
          OnClick = XChange
        end
        object Vlent: TMenuItem
          Caption = 'Moyen'
          GroupIndex = 5
          RadioItem = True
          OnClick = XChange
        end
        object Vrapide: TMenuItem
          Caption = 'Lent    (pour USB1)'
          GroupIndex = 5
          RadioItem = True
          OnClick = XChange
        end
        object VUrapide: TMenuItem
          Caption = 'Ultra rapide (pourUSB1)'
          Enabled = False
          GroupIndex = 5
          RadioItem = True
          Visible = False
          OnClick = XChange
        end
      end
    end
    object Dclenchement1: TMenuItem
      Caption = 'D'#233'clenchement'
      object ModePrdclenchementPrTrig1: TMenuItem
        Caption = 'Mode Pr'#233'-D'#233'clenchement (Pr'#233'D'#233'cl.) '
        OnClick = TriggerChange
      end
      object menuHYST_PRE_TRIG: TMenuItem
        Caption = 'Hyst'#233'r'#233'sis de d'#233'clenchement en mode Pr'#233'D'#233'cl.'
        object menu_HYST_PRETRIG_10mV: TMenuItem
          Caption = '10 mV'
          GroupIndex = 6
          RadioItem = True
          OnClick = Menu_HYST_PRETRIG_Click
        end
        object menu_HYST_PRETRIG_20mV: TMenuItem
          Caption = '20 mV'
          GroupIndex = 6
          RadioItem = True
          OnClick = Menu_HYST_PRETRIG_Click
        end
        object menu_HYST_PRETRIG_50mV: TMenuItem
          Caption = '50 mV'
          Checked = True
          GroupIndex = 6
          RadioItem = True
          OnClick = Menu_HYST_PRETRIG_Click
        end
        object menu_HYST_PRETRIG_100mV: TMenuItem
          Caption = '100 mV'
          GroupIndex = 6
          RadioItem = True
          OnClick = Menu_HYST_PRETRIG_Click
        end
        object menu_HYST_PRETRIG_UTILISATEUR: TMenuItem
          Caption = 'R'#233'glage utilisateur'
          GroupIndex = 6
          Visible = False
        end
      end
    end
    object OptionEcran: TMenuItem
      Caption = 'Affichage'
      object Normal: TMenuItem
        Caption = 'Un seul '#233'cran'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object ecranPV: TMenuItem
        Caption = 'Un '#233'cran par voie'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object TempoET_XY: TMenuItem
        Caption = 'Temporel et XY'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MenuDecalZeros: TMenuItem
        Caption = 'D'#233'calage des z'#233'ros'
        GroupIndex = 11
        OnClick = MenuDECALAGEZEROClick
      end
      object N10: TMenuItem
        Caption = '-'
        Enabled = False
        GroupIndex = 11
        Visible = False
      end
      object MenuAcumul: TMenuItem
        Caption = 'Mode Accumulation'
        Enabled = False
        GroupIndex = 11
        Visible = False
        OnClick = MenuOPTIONSClick
      end
      object N12: TMenuItem
        Caption = '-'
        GroupIndex = 11
      end
      object menuCouleurs: TMenuItem
        Caption = 'Couleur et Epaisseur des courbes'
        GroupIndex = 11
        OnClick = MenuConfigCOULEURSClick
      end
    end
    object Options: TMenuItem
      Caption = 'Options'
      object menuMONOCOUP: TMenuItem
        Bitmap.Data = {
          A2010000424DA201000000000000760000002800000017000000190000000100
          0400000000002C01000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0FFFFFFFFFF0FFFFFFFFFFF0FFFFFFFFFFF0FFFFFFFFF00000FFFFFFFFF0FFFF
          FFF00FF0FF00FFFFFFF0FFFFFF0FFFF0FFFF0FFFFFF0FFFFF0FFF00000FFF0FF
          FFF0FFFF0FFF0FF0FF0FFF0FFFF0FFF0FFF0FFF0FFF0FFF0FFF0FFF0FF0FFFF0
          FFFF0FF0FFF0FFF0FF0FF00000FF0FF0FFF0FF0FFF0FF09090FF0FFF0FF00F0F
          F0FF0999990FF0FF0F000000000000999000000000000F0FF0FF0999990FF0FF
          0F00FF0FFF0FF09090FF0FFF0FF0FFF0FF0FF00000FF0FF0FFF0FFF0FF0FFFF0
          FFFF0FF0FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFFF0FFF0FF0FF0FFF0FFFF0FFFF
          F0FFF00000FFF0FFFFF0FFFFFF0FFFF0FFFF0FFFFFF0FFFFFFF00FF0FF00FFFF
          FFF0FFFFFFFFF00000FFFFFFFFF0FFFFFFFFFFF0FFFFFFFFFFF0FFFFFFFFFF00
          0FFFFFFFFFF0}
        Caption = 'MonoCoup'
        OnClick = MenuOPTIONSClick
      end
      object MULTI: TMenuItem
        Bitmap.Data = {
          8E060000424D8E06000000000000360400002800000017000000190000000100
          0800000000005802000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F7F700000000
          000000000000000000000000000000F7F700F700F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F700F70000F7F7F7F7F7F7F7F7F7F70000F7F7F7F7F7F7F7F7F7
          000000F7F7F7F7F7F7F7F7F700F7F700F7F7F7F7F7F7F7F7000000F7F7F7F7F7
          F7F7F700F7F700F700F7F7F7F7F7F7F7000000F7F7F7F7F7F7F7F700F700F7F7
          00F7F7F7F7F7F7F7000000F7F7F7F7F7F7F7F7F700F7F700F7F7F7F7F7F7F7F7
          000000F7F7F7F7F7F7F7F7F7F70000F7F7F7F7F7F7F7F7F7000000F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7000000F7F700000000F7F7F7F7F7F7F7
          F7F700000000F7F7000000F700373737370000000000000000003737373700F7
          000000F700373737373737373700373737373737373700F70000000037373737
          3737373700373737373737373737370000000000370037373737370037373737
          3737373737003700000000003737373737370037373737373737373737373700
          000000003737003737003737373737373737373700373700000000F700373737
          003737373737373737370037373700F7000000F7F70037373737003737373737
          003737373700F7F7000000F7F7F7000037373737003700373737370000F7F7F7
          000000F7F7F7F7F70000373737373737370000F7F7F7F7F7000000F7F7F7F7F7
          F7F700000000000000F7F7F7F7F7F7F70000F700F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F700F700F7F700000000000000000000000000000000000000F7
          F700F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F700F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F700}
        Caption = 'Multim'#232'tres'
        OnClick = MenuOPTIONSClick
      end
      object menuEnregistrement: TMenuItem
        Bitmap.Data = {
          76060000424D7606000000000000360400002800000017000000180000000100
          0800000000004002000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F7F701010101
          010101010101010101010101010101F7F700F7015E5E5E5E5E5E5E5E5E5E5E5E
          5E5E5E5E5E5E5E01F700F7015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01
          F700F7015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01F700F7015E5E5E5E
          5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01F700F7015E5E5E5E5E5E5E5E5E5E5E5E
          5E5E5E5E5E5E5E01F700F7015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01
          F700F7015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01F700F7015E5E5E5E
          5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01F700F7015E5E5E5E5E5E5E5E5E5E5E5E
          5E5E5E5E5E5E5E01F700F7015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E01
          F700F7F70101010101010101010101010101010101010101F700F7F7015E5E5E
          00FBFBFBFBFBFBFBFBFBFBFBFBFBFBFB0100F7F7F701015E5E00000000000000
          00000000000000000000F7F7F7F7F7015E5E00FBFBFBFBFBFBFBFBFBFBFBFBFB
          FB00F7F7F7F7F7F7015E5E000000000000000000000000000000F7F7F7F7F7F7
          F701015E00FBFBFBFBFBFBFBFBFBFBFBFB00F7F7F7F7F7F7F7F7F7015E000000
          00000000000000000000F7F7F7F7F7F7F7F7F7F701015E5E5E5E5E5E5E5E5E5E
          5E00F7F7F7F7F7F7F7F7F7F7F701010101010101010101010100F7F7F7F7F7F7
          F7F70101015E5E5E5E5E5E5E5E5E5E5E5E00F7F7F7F7F7F701015E5E5E5E5E5E
          5E5E5E5E5E5E5E5E5E00F7F7F70101015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
          5E00F701015E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E00}
        Caption = 'Boite d'#39'enregistrements'
        OnClick = MenuOPTIONSClick
      end
    end
    object MenuApropos: TMenuItem
      Caption = 'A propos'
      object Apropo: TMenuItem
        Caption = 'A propos ...'
        OnClick = ApropoClick
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 352
    Top = 64
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 584
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Configuration Cabalab Oscilloscope|*.CL3'
    Left = 464
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Configuration Cabalab Oscilloscope|*.CL3'
    Left = 504
    Top = 64
  end
  object ImageList1: TImageList
    Height = 25
    Width = 23
    Left = 576
    Top = 72
    Bitmap = {
      494C010107000C00040017001900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C000000320000000100200000000000E047
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000040C0200040C0200000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000040C0200040C0200040C0200040C0
      2000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000040C0200040C0200040C0200040C0200040C0200040C02000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040C0200040C0200040C0200040C0
      200040C0200040C0200040C02000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000040C0200040C0200040C0200040C0200040C0200040C0200040C0200040C0
      200040C020000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      00000000000000000000000000000000000040C0200040C0200040C0200040C0
      200040C0200040C0200040C0200040C0200040C0200040C0200040C020000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000040C0200040C0200040C0200040C0200040C0200040C0200040C0200040C0
      200040C0200040C0200040C0200040C0200040C0200000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000000000000000
      00000000000000000000000000000000000040C0200040C0200040C0200040C0
      200040C0200040C0200040C0200040C0200040C0200040C0200040C020000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000040C0200040C0200040C0200040C0200040C0200040C0200040C0200040C0
      200040C020000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      00000000000000000000000000000000000040C0200040C0200040C0200040C0
      200040C0200040C0200040C02000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000040C0200040C0200040C0200040C0200040C0200000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      00000000000000000000000000000000000040C0200040C0200040C020000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000040C020000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004020E0004020
      E0004020E0004020E0004020E000000000000000000000000000000000000000
      00004020E0004020E0004020E0004020E0004020E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004020E0004020E0004020E0004020E0004020E0000000
      0000000000000000000000000000000000004020E0004020E0004020E0004020
      E0004020E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00FF00FF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FF00
      FF0000FFFF00FF00FF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00FF00FF0000FFFF0000FFFF0000FFFF00FF00FF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00FF0000FFFF0000FFFF0000FFFF00FF00FF0000FFFF0000FF
      FF0000FF000000FFFF0000FFFF00FF00FF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FF00FF0000FF
      FF00FF00FF0000FFFF0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF
      FF00FF00FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00FF00FF0000FFFF0000FFFF0000FF000000FF
      FF0000FFFF0000FFFF0000FF000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FFFF0000FF
      FF0000FFFF0000FF000000FFFF0000FFFF000000FF0000FFFF0000FFFF0000FF
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFF000000
      FF0000FFFF000000FF0000FFFF0000FFFF0000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      000000FFFF0000FFFF000000FF0000FFFF0000FFFF0000FFFF000000FF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000FFFF0000FFFF0000FFFF000000FF0000FFFF0000FF
      FF00FF00000000FFFF0000FFFF000000FF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000FF0000FF
      FF000000FF0000FFFF0000FFFF00FF00000000FFFF00FF00000000FFFF0000FF
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF000000FF0000FFFF0000FFFF00FF00000000FF
      FF0000FFFF0000FFFF00FF00000000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000000000000000000000000000FFFF0000FFFF0000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00000000FFFF0000FF
      FF0000FFFF00FF00000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FF00
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      000000000000FFFF0000FFFF0000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FF00000000FFFF00FF00000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00FF00000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF00FF00
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000005C000000320000000100010000000000580200000000000000000000
      000000000000000000000000FFFFFF00800003FFFFFFFFFFF8000000800003FF
      FFFFFFFFF8000000800003FFFFFFFFFFF8000000800003FFFFFFC1F078000000
      800003EFFFFFC1F078000000800003E3FFFFC1F078000000800003E0FFFFC1F0
      78000000800003E03FFFC1F078000000800003E01FFFC1F078000000FFFFFFE0
      07FFC1F078000000FDC003E001FFC1F07800000000C003E0007FC1F078000000
      004003E0003FC1F07800000000C003E0007FC1F0780000003DC003E001FFC1F0
      780000003FC003E007FFC1F0780000003FC003E01FFFC1F0780000003FC003E0
      7FFFC1F0780000003FC003E1FFFFC1F0780000003FC003E7FFFFC1F078000000
      3FC003FFFFFFC1F0780000003FC003FFFFFFC1F0780000003FC003FFFFFFFFFF
      F80000003FC003FFFFFFFFFFF8000000BFFFFFFFFFFFFFFFF8000000800001FF
      8003FF0007FFFFF0800001FF8003FF0006080030800001FF8003FF0004999930
      800001FF8003FF00049999F0800001FF8003FF00049999F0800001FF8003FF00
      009019F0800001FF8003FF0007FDF9F0800001FF8003FF0007FD99F0800001FF
      8003FF0007FF91F0FFFFFFFF8003FF0007FFFFF0FDC003FB8003F70007EE0010
      00C00201800003000006001000400200800001000002001000C0020180000300
      000600103DC0027B8000F70001EE00103FC0027F8000FF0001FE00103FC0027F
      8000FF0001FE00103FC0027F8000FF0001FE00103FC0027FFFFCFFFFF9FE0010
      3FC0027FFFFCFFFFF9FE00103FC0027FFFFCFFFFF9FE00103FC0027FFFFCFFFF
      F9FE00103FC0027FFFFCFFFFF9FE00103FC0027FFFFCFFFFF9FE0010BFFFFF7F
      FFFEFFFFFDFFFFF000000000000000000000000000000000000000000000}
  end
  object ImageList2: TImageList
    Height = 25
    Width = 23
    Left = 632
    Top = 80
    Bitmap = {
      494C010107000C00040017001900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C000000320000000100200000000000E047
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000000000000000000000000000000000000000
      0000008000000080000000800000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000800000008000000000000000000000000000000000
      000000000000000000000000000000800000008000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000000000000000000000000000000000000000000000
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000008000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000000000000000000000
      0000000000000000000000000000000000000080000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF0000000000000000000000000000000000000000C0E00000C0
      E00000C0E00000C0E00000000000000000000000000000000000000000000000
      000000000000000000000000000000C0E00000C0E00000C0E00000C0E0000000
      0000000000000000000000000000000000000000000000000000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E0000000000000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E000000000000000000000000000000000000000
      0000000000000000000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E0000000000000C0E00000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E000000000000000000000000000000000000000000000000000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C0E0000000000000C0E00000C0E00000C0E00000C0E00000C0
      E0000000000000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E0000000000000C0E0000000000000000000000000000000
      0000000000000000000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E0000000000000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E000000000000000000000000000000000000000000000000000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000000
      0000000000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000FF000000FF000000FF000000000000000000
      00000000000000C0E00000C0E0000000000000C0E00000C0E0000000000000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E0000000000000C0E00000C0E0000000000000000000000000000000
      0000000000000000000000800000008000000080000000000000008000000000
      0000000000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000800000008000000000000000000000000000000000
      000000000000000000000000000000800000008000000000000000000000FF00
      0000FF000000FF0000000000000000000000000000000000000000C0E00000C0
      E00000C0E0000000000000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E0000000000000C0E00000C0E00000C0E0000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000800000000000000000000000000000000000000000
      0000000000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000C0E00000C0E00000C0E00000C0E0000000
      000000C0E00000C0E00000C0E00000C0E00000C0E0000000000000C0E00000C0
      E00000C0E00000C0E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000000
      0000000000000000000000000000000000000080000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C0E00000C0E00000C0E00000C0E0000000000000C0E0000000
      000000C0E00000C0E00000C0E00000C0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000800000000000000000000000000000000000000000
      0000008000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000000000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0FBFF00A4A0A000C0DCC00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C00000008000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0DCC000806060008060
      6000A4A0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00080606000806060008080800040606000F0FBFF00000000000000
      0000F0FBFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C00000008000000000000000000000000000000000000000
      000000000000F0FBFF00F0FBFF00000000008080800080606000806060008080
      8000808080008060600000000000F0FBFF000000FF00C0A0E000F0FBFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C000000080000000
      0000000000000000000000000000000000008060E0008080E000F0FBFF00C0C0
      C000406040008060600080606000808080008080800040604000C0C0C0000000
      0000F0FBFF000000FF004020E00080A0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C00000008000000000000000000000000000F0FBFF000000
      FF000000FF00F0FBFF0000000000C0A0C0004060600080606000806060008080
      80008080800080606000808060000000000000000000C0A0E0000000FF000000
      FF000000FF00F0FBFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C000000080000000
      000000000000000000008060E0000000FF004040E00000000000000000008080
      8000806060008060600080606000808080008080800080606000406060008080
      80000000000000000000C0A0E0000000FF000000FF004040E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C000000080000000000000000000000000008080E0000000
      FF004060E0000000000000000000806060008060600080606000806060008080
      800080808000806060008060600040606000A4A0A0000000000000000000C0A0
      E0000000FF004040E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C000000080000000
      000000000000000000008080E0000000FF0080A0E00000000000000000004040
      4000806060008060600080606000808080008080800080606000806060008060
      600040606000A4A0A0000000000000000000C0A0E0004020E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C000000080000000000000000000000000008080E0000000
      FF000000000000000000C0C0C000406060008060600080606000806060008080
      8000808080008080800080606000806060008060600040606000808080000000
      0000000000008080E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C000000080000000
      000000000000000000008060E0004040E0000000000000000000806060008060
      600080606000806060008060600080808000A4A0A00080606000A4A0A0008080
      800080606000806060004060600080808000F0FBFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      80000000800000008000000080000000000000000000000000008060E000F0FB
      FF0000000000C0C0C00080606000806060008060600040606000808080008080
      800080808000A4A0A000406060008080800080A0800080806000806060004060
      4000A4A0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080004060C0004060C0004060C0000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      8000000000000000000000000000F0FBFF00F0FBFF0080808000806060008060
      600080606000A4A0A00080806000806060008060600080606000A4A0A0008080
      80008060600080808000806060008060600040604000F0FBFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000000080004060C0004060C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0004040400080808000808080008080800080606000806060008060
      6000806060008060600080606000808080008080800040608000806060008060
      600080606000C0C0A00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C0004060C0000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000008060600080808000808080008080
      8000806060008060600080606000806060008060600080606000806060008060
      60008080600080808000808080008060600080606000A4A0A000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080004060C0004060C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A0
      A000808080008080600080606000806060008060600080606000806060008060
      6000806060008060600080606000806060004060600040604000806060008080
      8000808060008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000000080004060C0000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000C0C0C000806060004060600080606000806060008060
      6000806060008060600080606000806060008060600080808000A4A0A000C0C0
      C000C0C0C000A4A0A000C0C0A000A4A0A000A4A0A000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080004060
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0DC
      C000808080008060600040604000406040008060600080808000A4A0A000C0DC
      C0000000000000000000000000000000000000000000F0FBFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008000000080004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0000000000000000000000000000000000000000000C0DCC000C0C0C000C0C0
      C000C0C0C000F0FBFF000000000000000000000000000000000000000000C0A0
      E00080A0E000C0A0E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00F0FBFF0000000000F0FB
      FF0080A0E0000000FF000000FF000000FF008060E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C000000000000000000000000000000000000000000000000000000000000000
      0000F0FBFF004060E0000000FF000000FF000000FF000000FF004060E000F0FB
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008000000080004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0A0E0004040
      E0004020E00080A0E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000080004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      80004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C0004060C0004060C0004060C0004060
      C0004060C0004060C0004060C0004060C000424D3E000000000000003E000000
      280000005C000000320000000100010000000000580200000000000000000000
      000000000000000000000000FFFFFF008FFFC380000E31C40000000007FFC17F
      FFF4949E6000000007FFC0FFCFF8999E6000000007FFC0FFB7F8929660000000
      0701E0FF6BFA38C4600000000600FEFF5BFBFFFFE00000000600FEFFB7FBF9F0
      60000000047C42FFCFFBF1F04000000004FE40FFFFFBE3F0F8000000047F40C3
      FE1BC7F47800000007FFC080000BCFFE7800000007FFE080000BCFFE78000000
      07FFFE000003CFFE7800000007FFE0000003CFFE7800000007FFC0000003CFFE
      7800000005FC40000003C5FC7800000004FE4080000BE1F8F8000000047C42C0
      001BF1F1F800000006007EE0003BE1F3F800000006007EF800FBFFFFF8000000
      070160FE03FA12208800000007FFC17FFFF4FC492000000007FFC180000C1CE1
      2000000007FFC1FFFFFC98D9200000008FFFC3FFFFFE312388000000FFFFFFFF
      FF1FFF1FFFFFFFF0FFFFFFFFFF1FFFBFFE000030FFC7FFFFFF1FFE0FFC000010
      FF87FFFFFF07F9B3FC000010FF037FFFFF07F7BDFC000010F9021FFFFF1FEE0E
      FC000010F0010FFFFF03DDB77C000010C20183FFFF03BBBBBC000010C600C3FF
      FFFFB7BDBC000010C60063FE03FFB60DBC000010C60033FE01FF760DDC000010
      CC001BFE31FD6C06D4000010CC0007FE01FC000006000010C80007FE03FD6C06
      D6000000E00003FE31FF760DDF000000F00003FE01FFB60DBFC00000F00003FE
      03FFB7BDBFE00000E0000383FFFFBBBBBFF00000C0000301FFFFDDB77FFC0000
      E00FBE31FFFFEE0EFFFE0000F83E3E21FFFFF7BDFFFF0000FF207E3FFFFFF9B3
      FFF80000FF00FE31FFFFFE0FFFE00000FFC3FF01FFFFFFBFFF000000FFF7FF83
      FFFFFF1FFC00000000000000000000000000000000000000000000000000}
  end
end
