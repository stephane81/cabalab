object FormTraceurGTI2: TFormTraceurGTI2
  Left = 326
  Top = 110
  Caption = 'CabaLab : Traceur'
  ClientHeight = 699
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBoxECRAN: TPaintBox
    Left = 224
    Top = 16
    Width = 513
    Height = 233
  end
  object PaintBoxECRAN1: TPaintBox
    Left = 224
    Top = 16
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN2: TPaintBox
    Left = 224
    Top = 144
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN3: TPaintBox
    Left = 224
    Top = 272
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN4: TPaintBox
    Left = 224
    Top = 400
    Width = 512
    Height = 125
  end
  object PaintBoxTRACEUR: TPaintBox
    Left = 224
    Top = 272
    Width = 512
    Height = 201
  end
  object LabelRupturedeflux: TLabel
    Left = 285
    Top = 528
    Width = 359
    Height = 13
    Caption = 'Attention : Rupture du flux de donn'#233'es entre GTI2 et CabaLab '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object GroupBoxTrigger: TGroupBox
    Left = 792
    Top = 384
    Width = 217
    Height = 118
    Caption = 'Trigger'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnClick = TriggerChange
    object RadioButtonTriggerCH2: TRadioButton
      Left = 96
      Top = 8
      Width = 33
      Height = 17
      Caption = 'Y2'
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
      Left = 136
      Top = 8
      Width = 33
      Height = 17
      Caption = 'Y3'
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
      Left = 176
      Top = 8
      Width = 33
      Height = 17
      Caption = 'Y4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = TriggerChange
    end
    object RadioButtonTriggerSANS: TRadioButton
      Left = 8
      Top = 16
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
      Left = 56
      Top = 8
      Width = 33
      Height = 17
      Caption = 'Y1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = TriggerChange
    end
    object GroupBoxFrontTrigger: TGroupBox
      Left = 8
      Top = 32
      Width = 97
      Height = 51
      Caption = 'Front'
      TabOrder = 5
      object RadioButtonFrontMontant: TRadioButton
        Left = 8
        Top = 16
        Width = 65
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
        Width = 81
        Height = 17
        Caption = 'Descendant'
        TabOrder = 1
        OnClick = TriggerChange
      end
    end
    object GroupBoxLEVEL: TGroupBox
      Left = 112
      Top = 24
      Width = 97
      Height = 67
      Caption = 'Niveau d'#233'cl.'
      TabOrder = 6
      DesignSize = (
        97
        67)
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
        Left = 3
        Top = 32
        Width = 86
        Height = 17
        Caption = '      Trig./Data'
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 3
        Top = 48
        Width = 90
        Height = 17
        Caption = 'NO Trig./Data'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object ButtonRunStop: TButton
      Left = 112
      Top = 92
      Width = 97
      Height = 20
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BoxCabaLabClick
    end
  end
  object GroupBoxVOIES: TGroupBox
    Left = 0
    Top = 85
    Width = 217
    Height = 200
    Caption = 'VOIES'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
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
        ItemHeight = 16
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
        Caption = 'x 10'
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
        ItemHeight = 16
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
        Caption = 'x 10'
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
        ItemHeight = 16
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
        Caption = 'x 10'
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
        ItemHeight = 16
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
        Caption = 'x 10'
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
      Left = 16
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
      Left = 64
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
      Left = 120
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
      Left = 168
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
  end
  object GroupBoxEnregistrement: TGroupBox
    Left = 792
    Top = 256
    Width = 217
    Height = 121
    Caption = 'Enregistrement'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      217
      121)
    object PaintBoxA: TPaintBox
      Left = 9
      Top = 28
      Width = 136
      Height = 89
      Anchors = [akTop, akRight]
    end
    object ButtonCH1Enreg: TButton
      Left = 174
      Top = 10
      Width = 35
      Height = 17
      Caption = 'Y1'
      TabOrder = 0
      OnClick = ButtonEnregClick
    end
    object ButtonCH2Enreg: TButton
      Left = 174
      Top = 26
      Width = 35
      Height = 17
      Caption = 'Y2'
      TabOrder = 1
      OnClick = ButtonEnregClick
    end
    object ButtonCH3Enreg: TButton
      Left = 174
      Top = 42
      Width = 35
      Height = 17
      Caption = 'Y3'
      TabOrder = 2
      OnClick = ButtonEnregClick
    end
    object ButtonCH4Enreg: TButton
      Left = 174
      Top = 58
      Width = 35
      Height = 17
      Caption = 'Y4'
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
      Top = 96
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
      Height = 111
      Kind = sbVertical
      Max = 10
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 6
      OnChange = ScrollBarEnregistrementsChange
    end
    object CheckBoxA: TCheckBox
      Left = 8
      Top = 11
      Width = 137
      Height = 17
      Caption = 'CheckBoxA'
      TabOrder = 7
    end
  end
  object ScrollBar0CH1: TScrollBar
    Left = 768
    Top = 16
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 3
    OnChange = zerochange
  end
  object ScrollBar0CH2: TScrollBar
    Left = 768
    Top = 144
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 4
    OnChange = zerochange
  end
  object ScrollBar0CH3: TScrollBar
    Left = 768
    Top = 272
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 5
    OnChange = zerochange
  end
  object ScrollBar0CH4: TScrollBar
    Left = 768
    Top = 400
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 6
    OnChange = zerochange
  end
  object PageControlMesures: TPageControl
    Left = 792
    Top = 16
    Width = 217
    Height = 113
    ActivePage = TabSheet4
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Visible = False
    object TabSheet1: TTabSheet
      Caption = 'Y0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LabelVch1AC: TLabel
        Left = 0
        Top = 24
        Width = 73
        Height = 14
        Caption = 'LabelVch1AC'
      end
      object LabelVch1ACDC: TLabel
        Left = 0
        Top = 40
        Width = 89
        Height = 33
        AutoSize = False
        Caption = 'LabelVch1ACDC'
        WordWrap = True
      end
      object LabelVch1Max: TLabel
        Left = 112
        Top = 7
        Width = 79
        Height = 14
        Caption = 'LabelVch1Max'
      end
      object LabelVch1Min: TLabel
        Left = 112
        Top = 23
        Width = 77
        Height = 14
        Caption = 'LabelVch1Min'
      end
      object LabelTch1: TLabel
        Left = 112
        Top = 40
        Width = 56
        Height = 14
        Caption = 'LabelTch1'
      end
      object LabelFch1: TLabel
        Left = 112
        Top = 56
        Width = 55
        Height = 14
        Caption = 'LabelFch1'
      end
      object LabelVch1DC: TLabel
        Left = 0
        Top = 8
        Width = 72
        Height = 14
        Caption = 'LabelVch1DC'
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      Font.Color = clRed
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
  object GroupBoxTRACEUR: TGroupBox
    Left = 0
    Top = 0
    Width = 217
    Height = 85
    Caption = 'Gestion Traceur'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object Label4: TLabel
      Left = 176
      Top = 25
      Width = 36
      Height = 14
      Caption = 'Label4'
    end
    object ButtonRESET: TButton
      Left = 104
      Top = 24
      Width = 17
      Height = 17
      Hint = 'R'#233'initialisation de la liaison GTI2<->Cababab'
      Caption = 'R.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonRESETClick
    end
    object ButtonStartTraceur: TButton
      Left = 8
      Top = 12
      Width = 91
      Height = 30
      Cursor = crHandPoint
      Hint = 'D'#233'marrer/Stopper l'#39'acquisition'
      Caption = 'Marche'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonStartTraceurClick
    end
    object RadioButtonData: TRadioButton
      Left = 120
      Top = 24
      Width = 49
      Height = 17
      Caption = 'Flux :'
      TabOrder = 2
    end
    object ProgressBarUSBTrame: TProgressBar
      Left = 104
      Top = 12
      Width = 110
      Height = 10
      Max = 1000
      Position = 32
      Step = 1
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 8
      Top = 43
      Width = 193
      Height = 38
      Caption = 'Panel1'
      TabOrder = 4
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 191
        Height = 35
        ButtonHeight = 31
        ButtonWidth = 30
        Caption = 'ToolBar3'
        Flat = False
        Images = ImageList2
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Width = 2
          Caption = 'ToolButton9'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 2
          Top = 0
          Cursor = crHandPoint
          Hint = 'Voir la fen'#234'tre CabaLab'
          Caption = 'ToolButton10'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = BoxCabaLabClick
        end
        object ToolButton3: TToolButton
          Left = 32
          Top = 0
          Cursor = crHandPoint
          Hint = 'Voir le GBF de CabaLab'
          Caption = 'ToolButton11'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = BoxCabaLabClick
        end
        object ToolButton4: TToolButton
          Left = 62
          Top = 0
          Width = 3
          Caption = 'ToolButton12'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 65
          Top = 0
          Cursor = crHandPoint
          Hint = 'Nouveau fichier r'#233'gressi'
          Caption = 'ToolButton13'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = RegressiDDEClick
        end
        object ToolButton6: TToolButton
          Left = 95
          Top = 0
          Cursor = crHandPoint
          Hint = 'Nouvelle page r'#233'gressi '
          Caption = 'ToolButton14'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = RegressiDDEClick
        end
        object ToolButton25: TToolButton
          Left = 125
          Top = 0
          Width = 3
          Caption = 'ToolButton25'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton7: TToolButton
          Left = 128
          Top = 0
          Cursor = crHandPoint
          Hint = 'S'#233'lectionner un ou plusieurs '#233'crans'
          Caption = 'ToolButton15'
          ImageIndex = 4
          ParentShowHint = False
          ShowHint = True
          OnClick = MenuECRANClick
        end
        object ToolButton24: TToolButton
          Left = 158
          Top = 0
          Cursor = crHandPoint
          Hint = 'Afficher/cacher le flux de donn'#233'es '
          Caption = 'ToolButton16'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          OnClick = MenuECRANClick
        end
      end
    end
  end
  object GroupBoxLongEnrg: TGroupBox
    Left = 0
    Top = 284
    Width = 217
    Height = 241
    Caption = 'Enregistrement'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 14
      Caption = 'Dur'#233'e totale :'
    end
    object Label6: TLabel
      Left = 8
      Top = 44
      Width = 93
      Height = 14
      Caption = 'Portion affich'#233'e :'
    end
    object ComboBoxExLongEnrg: TComboBoxEx
      Left = 112
      Top = 12
      Width = 89
      Height = 23
      ItemsEx = <
        item
          Caption = '1 s'
        end
        item
          Caption = '2 s'
        end
        item
          Caption = '5 s'
        end
        item
          Caption = '10 s'
        end
        item
          Caption = '20 s'
        end
        item
          Caption = '50 s'
        end
        item
          Caption = '1 min'
        end
        item
          Caption = '2 min'
        end
        item
          Caption = '5 min'
        end
        item
          Caption = '10 min'
        end
        item
          Caption = '20 min'
        end
        item
          Caption = '50 min'
        end
        item
          Caption = '1 h'
        end
        item
          Caption = '2 h'
        end
        item
          Caption = '5 h'
        end
        item
          Caption = '12 h'
        end
        item
          Caption = '24 h'
        end
        item
          Caption = '2 Jours'
        end
        item
          Caption = '5 J'
        end>
      ItemHeight = 16
      TabOrder = 0
      Text = 'Long. Enrg.'
      OnClick = XChange
    end
    object ComboBoxExDurAff: TComboBoxEx
      Left = 112
      Top = 40
      Width = 89
      Height = 23
      ItemsEx = <
        item
          Caption = 'Horloge'
        end
        item
          Caption = 'Dur'#233'e total'
        end
        item
          Caption = '1 s'
        end
        item
          Caption = '2 s'
        end
        item
          Caption = '5 s'
        end
        item
          Caption = '10 s'
        end
        item
          Caption = '20 s'
        end
        item
          Caption = '50 s'
        end
        item
          Caption = '1 min'
        end
        item
          Caption = '2 min'
        end
        item
          Caption = '5 min'
        end
        item
          Caption = '10 min'
        end
        item
          Caption = '20 min'
        end
        item
          Caption = '50 min'
        end
        item
          Caption = '1 h'
        end
        item
          Caption = '2 h'
        end
        item
          Caption = '5 h'
        end
        item
          Caption = '12 h'
        end
        item
          Caption = '24 h'
        end
        item
          Caption = '2 J'
        end
        item
          Caption = '7 J'
        end>
      ItemHeight = 16
      TabOrder = 1
      Text = 'Dur'#233'e Aff.'
      OnClick = XChange
    end
    object ScrollBarExporation: TScrollBar
      Left = 8
      Top = 75
      Width = 201
      Height = 17
      Max = 1000
      PageSize = 0
      Position = 1000
      TabOrder = 2
      Visible = False
      OnChange = XChange
    end
    object CheckBoxExplorationEnregistrement: TCheckBox
      Left = 8
      Top = 56
      Width = 89
      Height = 17
      Caption = 'Exploration'
      TabOrder = 3
      OnClick = XChange
    end
    object GroupBoxBaseDeTemps: TGroupBox
      Left = 4
      Top = 96
      Width = 209
      Height = 97
      Caption = 'Intervalle entre 2 pts'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object ScrollBarBDT: TScrollBar
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Max = 15
        Min = 1
        PageSize = 0
        Position = 1
        TabOrder = 0
        OnChange = XChange
      end
      object RadioButtonBDT4: TRadioButton
        Left = 68
        Top = 40
        Width = 57
        Height = 17
        Caption = '100 ms'
        TabOrder = 1
        OnClick = XChange
      end
      object RadioButtonBDT5: TRadioButton
        Left = 68
        Top = 56
        Width = 57
        Height = 17
        Caption = '200 ms'
        TabOrder = 2
        OnClick = XChange
      end
      object RadioButtonBDT6: TRadioButton
        Left = 68
        Top = 72
        Width = 57
        Height = 17
        Caption = '500 ms'
        TabOrder = 3
        OnClick = XChange
      end
      object RadioButtonBDT7: TRadioButton
        Left = 128
        Top = 40
        Width = 36
        Height = 17
        Caption = '1 s'
        TabOrder = 4
        OnClick = XChange
      end
      object RadioButtonBDT8: TRadioButton
        Left = 128
        Top = 56
        Width = 36
        Height = 17
        Caption = '2 s'
        TabOrder = 5
        OnClick = XChange
      end
      object RadioButtonBDT9: TRadioButton
        Left = 128
        Top = 72
        Width = 36
        Height = 17
        Caption = '5 s'
        TabOrder = 6
        OnClick = XChange
      end
      object RadioButtonBDT10: TRadioButton
        Left = 163
        Top = 40
        Width = 44
        Height = 17
        Caption = '10 s'
        TabOrder = 7
        OnClick = XChange
      end
      object RadioButtonBDT11: TRadioButton
        Left = 163
        Top = 56
        Width = 44
        Height = 17
        Caption = '20 s'
        TabOrder = 8
        OnClick = XChange
      end
      object RadioButtonBDT12: TRadioButton
        Left = 163
        Top = 72
        Width = 44
        Height = 17
        Caption = '50 s'
        TabOrder = 9
        OnClick = XChange
      end
      object RadioButtonBDT1: TRadioButton
        Left = 32
        Top = 40
        Width = 33
        Height = 17
        Caption = '10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnClick = XChange
      end
      object RadioButtonBDT2: TRadioButton
        Left = 32
        Top = 56
        Width = 30
        Height = 17
        Caption = '20'
        TabOrder = 11
        OnClick = XChange
      end
      object RadioButtonBDT3: TRadioButton
        Left = 32
        Top = 72
        Width = 30
        Height = 17
        Caption = '50'
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
      object RadioButtonBDT13: TRadioButton
        Left = 3
        Top = 40
        Width = 30
        Height = 17
        Caption = '1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnClick = XChange
      end
      object RadioButtonBDT14: TRadioButton
        Left = 3
        Top = 56
        Width = 30
        Height = 17
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnClick = XChange
      end
      object RadioButtonBDT15: TRadioButton
        Left = 3
        Top = 72
        Width = 30
        Height = 17
        Caption = '5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        OnClick = XChange
      end
    end
    object GroupBoxTEMPS: TGroupBox
      Left = 4
      Top = 192
      Width = 209
      Height = 41
      Caption = 'Horloge d'#39'enregistrement'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object LabelHeur: TLabel
        Left = 5
        Top = 14
        Width = 39
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = '24 h'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelMinute: TLabel
        Left = 48
        Top = 14
        Width = 44
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = '60 m'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Labelsecondes: TLabel
        Left = 96
        Top = 14
        Width = 38
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = '60 s'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Labelmillisec: TLabel
        Left = 138
        Top = 14
        Width = 66
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = '999 ms'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelJour: TLabel
        Left = 180
        Top = 6
        Width = 21
        Height = 22
        Alignment = taRightJustify
        Caption = '7 j'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
  end
  object PanelExploDebut: TPanel
    Left = 224
    Top = 528
    Width = 121
    Height = 17
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Visible = False
    object LabelExploDebut_ms: TLabel
      Left = 80
      Top = 1
      Width = 39
      Height = 14
      Alignment = taRightJustify
      Caption = '999 ms'
    end
    object LabelExploDebut_s: TLabel
      Left = 55
      Top = 1
      Width = 22
      Height = 14
      Alignment = taRightJustify
      Caption = '60 s'
    end
    object LabelExploDebut_m: TLabel
      Left = 28
      Top = 1
      Width = 26
      Height = 14
      Alignment = taRightJustify
      Caption = '60 m'
    end
    object LabelExploDebut_h: TLabel
      Left = 5
      Top = 1
      Width = 22
      Height = 14
      Alignment = taRightJustify
      Caption = '24 h'
    end
  end
  object PanelExploFIN: TPanel
    Left = 640
    Top = 528
    Width = 121
    Height = 17
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Visible = False
    object LabelExploFIN_ms: TLabel
      Left = 80
      Top = 1
      Width = 39
      Height = 14
      Alignment = taRightJustify
      Caption = '999 ms'
    end
    object LabelExploFIN_s: TLabel
      Left = 55
      Top = 1
      Width = 22
      Height = 14
      Alignment = taRightJustify
      Caption = '60 s'
    end
    object LabelExploFIN_m: TLabel
      Left = 28
      Top = 1
      Width = 26
      Height = 14
      Alignment = taRightJustify
      Caption = '60 m'
    end
    object LabelExploFIN_h: TLabel
      Left = 5
      Top = 1
      Width = 22
      Height = 14
      Alignment = taRightJustify
      Caption = '24 h'
    end
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 64
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      object menuRESETconfig: TMenuItem
        Caption = 'R'#233'initialiser le Traceur'
        ShortCut = 16466
        OnClick = menuRESETconfigClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object MenuRegUtilisateur: TMenuItem
        Caption = 'Exporter vers R'#233'gressi'
        object menu_newfichier_REG: TMenuItem
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
        object menu_newpage_REG: TMenuItem
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
          Caption = 'Nouvelle Page'
          OnClick = RegressiDDEClick
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object MenuEnregChargConfig: TMenuItem
        Caption = 'Charger/Sauvegarder la configuration'
        object Charger1: TMenuItem
          Caption = 'Chargement rapide'
          OnClick = MenuChargerConfig
        end
        object MenuEnregConfig: TMenuItem
          Caption = 'Sauvegarde rapide'
          OnClick = MenuEnregistrerConfig
        end
        object N10: TMenuItem
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
      object N11: TMenuItem
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
          OnClick = MenuConfigOscilloClick
        end
      end
      object RegressiDDE: TMenuItem
        Caption = 'Transfert REGRESSI Instantan'#233
        Enabled = False
        Visible = False
        OnClick = RegressiDDEClick
      end
    end
    object Config: TMenuItem
      Caption = 'Configuration des Voies'
      object Cofigurationdesvoies1: TMenuItem
        Caption = 'Unipolaire/Diff'#233'rentiel'
        GroupIndex = 11
        object ALLuni: TMenuItem
          Caption = 'Y 0123 Unipolaires'
          GroupIndex = 7
          RadioItem = True
          OnClick = UniDiffChange
        end
        object ALLdiff: TMenuItem
          Caption = 'Y 0123 Diff'#233'rentielles'
          GroupIndex = 7
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N1: TMenuItem
          Caption = '-'
          GroupIndex = 7
        end
        object UniY1: TMenuItem
          Caption = 'Y0 Unipolaire'
          GroupIndex = 8
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY1: TMenuItem
          Caption = 'Y0 Diff'#233'rentielle'
          GroupIndex = 8
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N2: TMenuItem
          Caption = '-'
          GroupIndex = 8
        end
        object UniY2: TMenuItem
          Caption = 'Y1 Unipolaire'
          GroupIndex = 9
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY2: TMenuItem
          Caption = 'Y1 Diff'#233'rentielle'
          GroupIndex = 9
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N3: TMenuItem
          Caption = '-'
          GroupIndex = 9
        end
        object UniY3: TMenuItem
          Caption = 'Y2 Unipolaire'
          GroupIndex = 10
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY3: TMenuItem
          Caption = 'Y2 Diff'#233'rentielle'
          GroupIndex = 10
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N4: TMenuItem
          Caption = '-'
          GroupIndex = 10
        end
        object UniY4: TMenuItem
          Caption = 'Y3 Unipolaire'
          GroupIndex = 11
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY4: TMenuItem
          Caption = 'Y3 Diff'#233'rentielle'
          GroupIndex = 11
          RadioItem = True
          OnClick = UniDiffChange
        end
        object MenuUniDiffFacade_1: TMenuItem
          Caption = 'S'#233'lection du mode Unipolaire/Diff'#233'rentiel (DIFF.)'
          Checked = True
          Enabled = False
          GroupIndex = 11
          Visible = False
        end
      end
      object MenuDecalZeros: TMenuItem
        Caption = 'D'#233'calages des z'#233'ros'
        GroupIndex = 11
        OnClick = MenuDECALAGEZEROClick
      end
      object N14: TMenuItem
        Caption = '-'
        GroupIndex = 11
      end
      object MenuOptionVoies: TMenuItem
        Caption = 'Ajout d'#39'options en fa'#231'ade'
        GroupIndex = 11
        object MenuOptionSondes: TMenuItem
          Caption = 'Type de Sonde  (X1 X10)'
          OnClick = MenuOPTIONSClick
        end
        object MenuOptionInv: TMenuItem
          Caption = 'Inversion du signal (INV.)'
          OnClick = MenuOPTIONSClick
        end
        object MenuUniDiffFacade_2: TMenuItem
          Caption = 'S'#233'lection du mode Unipolaire/Diff'#233'rentiel (DIFF.)'
          Checked = True
          OnClick = MenuOPTIONSClick
        end
        object N15: TMenuItem
          Caption = '-'
          Enabled = False
          GroupIndex = 11
          Visible = False
        end
        object MenuOptionTOUTES: TMenuItem
          Caption = 'Toutes ces options'
          Enabled = False
          GroupIndex = 11
          Visible = False
          OnClick = MenuOPTIONSClick
        end
      end
    end
    object BDT: TMenuItem
      Caption = 'Base de temps'
      object menuBDTfreqEch: TMenuItem
        Caption = 'Fr'#233'quence d'#39#233'chantillonage GTI2'
        object menuBDTF100: TMenuItem
          Caption = '100 Hz   USB 1.1 et 2.0 '
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuBDTfreqEchClick
        end
        object menuBDTF500: TMenuItem
          Caption = '500 Hz   USB 2.0 ou USB 1.1 (si exp'#233'rience<3s)'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuBDTfreqEchClick
        end
        object menuBDTF1000: TMenuItem
          Caption = 
            '1000 Hz USB 2.0 (v'#233'rifier si : flux<100%) ou USB 1.1 (si exp'#233'rie' +
            'nce<3s)'
          GroupIndex = 1
          RadioItem = True
          OnClick = MenuBDTfreqEchClick
        end
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object MenuOptionEnregistrement: TMenuItem
        Caption = 'Ajout d'#39'options en fa'#231'ade'
        object MenuOptionDuAffEnrg: TMenuItem
          Caption = 'Affichage d'#39'une portion de l'#39'enregistrement'
          OnClick = MenuOPTIONSClick
        end
        object MenuOptionExploration: TMenuItem
          Caption = 'Exploration dans l'#39'enregistrement'
          OnClick = MenuOPTIONSClick
        end
      end
      object MenuDecalBDT: TMenuItem
        Caption = 'D'#233'calibrage de la base de temps'
        Enabled = False
        Visible = False
      end
      object VitesseAqcuisition1: TMenuItem
        Caption = 'Vitesse Aqcuisition'
        Enabled = False
        Visible = False
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
          GroupIndex = 5
          RadioItem = True
          OnClick = XChange
        end
      end
      object menutimeout: TMenuItem
        Caption = 'Time Out'
        Enabled = False
        Visible = False
        object menutimeout1: TMenuItem
          Caption = 'Rapide'
          RadioItem = True
        end
        object menutimeout2: TMenuItem
          Caption = 'Moyen'
          RadioItem = True
        end
        object menutimeout3: TMenuItem
          Caption = 'Lent'
          RadioItem = True
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object menutimeout4: TMenuItem
          Caption = 'Utilisateur'
          RadioItem = True
          object menuTIMEOUEUTILISATEURREGLAGE: TMenuItem
            Caption = 'R'#233'glage'
          end
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
        Caption = 'Un '#233'cran par Voie'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object Normalinterval: TMenuItem
        Caption = 'Un seul '#233'cran + Flux'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object ecranPVinterval: TMenuItem
        Caption = 'Un '#233'cran par Voie + Flux'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object menuCouleurs: TMenuItem
        Caption = 'Couleur et Epaisseur des courbes'
        GroupIndex = 11
        OnClick = MenuConfigCOULEURSClick
      end
      object TempoET_XY: TMenuItem
        Caption = 'Temporel et XY'
        Enabled = False
        GroupIndex = 11
        Visible = False
        OnClick = MenuECRANClick
      end
      object EcranTraceur: TMenuItem
        Caption = 'TRACEUR'
        Enabled = False
        GroupIndex = 11
        Visible = False
        OnClick = MenuECRANClick
      end
    end
    object MenuApropos: TMenuItem
      Caption = 'A propos'
      object Apropo: TMenuItem
        Caption = 'A propos ...'
        OnClick = ApropoClick
      end
    end
    object Options: TMenuItem
      Caption = 'Options'
      Enabled = False
      Visible = False
      object MenuOptionGestion: TMenuItem
        Caption = 'Gestion'
        Enabled = False
        Visible = False
        object MenuOptionVisualisationFLUX: TMenuItem
          Caption = 'Visualisation FLUX'
          OnClick = MenuOPTIONSClick
        end
      end
      object menuEnregistrement: TMenuItem
        Caption = 'Boite d'#39'enregistrements'
        Enabled = False
        Visible = False
        OnClick = MenuOPTIONSClick
      end
      object MULTI: TMenuItem
        Caption = 'Multim'#232'tres'
        Enabled = False
        Visible = False
        OnClick = MenuOPTIONSClick
      end
      object N7: TMenuItem
        Caption = '-'
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
  object ImageList2: TImageList
    Height = 25
    Width = 23
    Left = 264
    Top = 56
    Bitmap = {
      494C010106000C00040017001900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000FF000000FF0000000000000000000000C0C0C0000000FF00000000000000
      000000000000C0C0C0000000FF000000FF000000FF00C0C0C00000000000C0C0
      C0000000FF000000FF00C0C0C00000000000C0C0C0000000FF0000000000C0C0
      C0000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000C0C0C0000000FF00000000000000000000000000C0C0C0000000FF000000
      00000000000000000000C0C0C0000000FF0000000000C0C0C0000000FF000000
      0000000000000000FF00C0C0C0000000FF00C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0000000FF000000FF000000
      FF0000000000C0C0C0000000FF00000000000000000000000000C0C0C0000000
      FF0000000000000000000000FF000000000000000000C0C0C0000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000FF00000000000000000000000000C0C0C0000000FF000000
      00000000000000000000C0C0C0000000FF0000000000000000000000FF000000
      000000000000C0C0C000808080000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0000000FF000000FF000000
      FF0000000000C0C0C0000000FF00000000000000000000000000C0C0C0000000
      FF0000000000000000000000FF0000000000C0C0C0000000FF0000000000C0C0
      C0000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000800000008000000000000000000000000000000000
      000000000000000000000000000000800000008000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000008000000000000000000000FF000000FF000000FF000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000000000000000FF000000FF000000FF00000000000000
      FF00000000000000FF000000FF000000FF000000FF00000000000000FF000000
      00000000FF000000FF000000FF000000FF000000FF00000000000000FF000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000000
      0000000000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000FF000000FF000000FF000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000800000008000000000000000000000000000000000
      000000000000000000000000000000800000008000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000000000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
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
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0FBFF00A4A0A000C0DCC00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0DCC000806060008060
      6000A4A0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000FFFF000000000000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00080606000806060008080800040606000F0FBFF00000000000000
      0000F0FBFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0FBFF00F0FBFF00000000008080800080606000806060008080
      8000808080008060600000000000F0FBFF000000FF00C0A0E000F0FBFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000008060E0008080E000F0FBFF00C0C0
      C000406040008060600080606000808080008080800040604000C0C0C0000000
      0000F0FBFF000000FF004020E00080A0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0FBFF000000
      FF000000FF00F0FBFF0000000000C0A0C0004060600080606000806060008080
      80008080800080606000808060000000000000000000C0A0E0000000FF000000
      FF000000FF00F0FBFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000008060E0000000FF004040E00000000000000000008080
      8000806060008060600080606000808080008080800080606000406060008080
      80000000000000000000C0A0E0000000FF000000FF004040E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008080E0000000
      FF004060E0000000000000000000806060008060600080606000806060008080
      800080808000806060008060600040606000A4A0A0000000000000000000C0A0
      E0000000FF004040E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008080E0000000FF0080A0E00000000000000000004040
      4000806060008060600080606000808080008080800080606000806060008060
      600040606000A4A0A0000000000000000000C0A0E0004020E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000000000008080E0000000
      FF000000000000000000C0C0C000406060008060600080606000806060008080
      8000808080008080800080606000806060008060600040606000808080000000
      0000000000008080E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      000000000000000000008060E0004040E0000000000000000000806060008060
      600080606000806060008060600080808000A4A0A00080606000A4A0A0008080
      800080606000806060004060600080808000F0FBFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000000000008060E000F0FB
      FF0000000000C0C0C00080606000806060008060600040606000808080008080
      800080808000A4A0A000406060008080800080A0800080806000806060004060
      4000A4A0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000000000000000
      00000000000000000000FFFF0000FFFF0000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      000000000000FFFF0000FFFF0000000000000000000000000000FFFF00000000
      0000000000000000000000000000F0FBFF00F0FBFF0080808000806060008060
      600080606000A4A0A00080806000806060008060600080606000A4A0A0008080
      80008060600080808000806060008060600040604000F0FBFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000C0C0C0004040400080808000808080008080800080606000806060008060
      6000806060008060600080606000808080008080800040608000806060008060
      600080606000C0C0A00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000008060600080808000808080008080
      8000806060008060600080606000806060008060600080606000806060008060
      60008080600080808000808080008060600080606000A4A0A000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000A4A0
      A000808080008080600080606000806060008060600080606000806060008060
      6000806060008060600080606000806060004060600040604000806060008080
      8000808060008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      00000000000000000000C0C0C000806060004060600080606000806060008060
      6000806060008060600080606000806060008060600080808000A4A0A000C0C0
      C000C0C0C000A4A0A000C0C0A000A4A0A000A4A0A000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF000000000000000000000000000000000000C0DC
      C000808080008060600040604000406040008060600080808000A4A0A000C0DC
      C0000000000000000000000000000000000000000000F0FBFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF00000000
      00000000000000000000000000000000000000000000C0DCC000C0C0C000C0C0
      C000C0C0C000F0FBFF000000000000000000000000000000000000000000C0A0
      E00080A0E000C0A0E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00F0FBFF0000000000F0FB
      FF0080A0E0000000FF000000FF000000FF008060E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0FBFF004060E0000000FF000000FF000000FF000000FF004060E000F0FB
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0A0E0004040
      E0004020E00080A0E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF0000000000000000000000
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
      000000000000000000000000FFFFFF008FFFC3FFFFFC00000000000007FFC1FF
      FFFC00000000000007FFC138212400000000000007FFC139C984000000000000
      0701E109CD8C0000000000000600FF39CD8C0000000000000600FF09CD240000
      00000000047C43FFFFFC00000000000004FE41FFFFFC000000000000047F41EF
      DFDC00000000000007FFC1EFDFDC00000000000007FFE1EFDFDC000000000000
      07FFFFEFDFDC00000000000007FFE1E7CFCC00000000000007FFC02850500000
      0000000005FC41CF9F9C00000000000004FE41EFDFDC000000000000047C43EF
      DFDC00000000000006007FEFDFDC00000000000006007FEFDFDC000000000000
      070161EFDFDC00000000000007FFC1FFFFFC00000000000007FFC1FFFFFC0000
      0000000007FFC1FFFFFC0000000000008FFFC3FFFFFC000000000000FFFFFFFF
      FF1E00000C000000FFFFFFFFFF1E00000C000000FFC7FFFFFF1E00000C000000
      FF87FFFFFF0600000C000000FF037FFFFF0600000C000000F9021FFFFF1E0000
      0C000000F0010FFFFF0200000C000000C20183FFFF0200000C000000C600C3FF
      FFFE00000C000000C60063FE03FFFFFFFFFFFFF0C60033FE01FFF7000FEE0010
      CC001BFE31FC030008060010CC0007FE01FC010008020010C80007FE03FC0300
      08060010E00002FE31FCF70009EE0010F00003FE01FCFF0009FE0010F00003FE
      03FCFF0009FE0010E0000383FFFCFF0009FE0010C0000301FFFCFF0009FE0010
      E00FBF31FFFCFF0009FE0010F83E3F21FFFCFF0009FE0010FF207F3FFFFCFF00
      09FE0010FF00FF31FFFCFF0009FE0010FFC3FF01FFFCFF0009FE0010FFF7FF83
      FFFEFFFFFDFFFFF000000000000000000000000000000000000000000000}
  end
end
