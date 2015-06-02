object Form_FFT_mut_GTI2: TForm_FFT_mut_GTI2
  Left = 2090
  Top = 82
  Caption = 'CabaLab : Analyseur de Spectre'
  ClientHeight = 589
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBoxECRAN: TPaintBox
    Left = 248
    Top = 17
    Width = 513
    Height = 513
  end
  object PaintBoxECRAN1: TPaintBox
    Left = 250
    Top = 14
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN2: TPaintBox
    Left = 248
    Top = 145
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN3: TPaintBox
    Left = 248
    Top = 273
    Width = 512
    Height = 125
  end
  object PaintBoxECRAN4: TPaintBox
    Left = 248
    Top = 401
    Width = 512
    Height = 125
  end
  object PaintBoxXY: TPaintBox
    Left = 248
    Top = 276
    Width = 281
    Height = 217
  end
  object PaintBoxTRIGlevel: TPaintBox
    Left = 237
    Top = 17
    Width = 10
    Height = 513
  end
  object LabelFreq1: TLabel
    Left = 280
    Top = 1
    Width = 38
    Height = 14
    Alignment = taCenter
    Caption = '2,5 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreqInit: TLabel
    Left = 248
    Top = 1
    Width = 6
    Height = 14
    Caption = '0'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreqEnd: TLabel
    Left = 728
    Top = 1
    Width = 35
    Height = 14
    Alignment = taCenter
    Caption = '25 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq2: TLabel
    Left = 339
    Top = 1
    Width = 29
    Height = 14
    Alignment = taCenter
    Caption = '5 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq3: TLabel
    Left = 382
    Top = 1
    Width = 38
    Height = 14
    Alignment = taCenter
    Caption = '7,5 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq4: TLabel
    Left = 426
    Top = 1
    Width = 35
    Height = 14
    Alignment = taCenter
    Caption = '10 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq5: TLabel
    Left = 467
    Top = 1
    Width = 44
    Height = 14
    Alignment = taCenter
    Caption = '12,5 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq6: TLabel
    Left = 517
    Top = 1
    Width = 35
    Height = 14
    Alignment = taCenter
    Caption = '15 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq7: TLabel
    Left = 558
    Top = 1
    Width = 44
    Height = 14
    Alignment = taCenter
    Caption = '17,5 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq8: TLabel
    Left = 616
    Top = 1
    Width = 35
    Height = 14
    Alignment = taCenter
    Caption = '20 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelFreq9: TLabel
    Left = 678
    Top = 1
    Width = 44
    Height = 14
    Alignment = taCenter
    Caption = '22,5 kHz'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Labelacquisition: TLabel
    Left = 480
    Top = 1
    Width = 64
    Height = 13
    Caption = 'Accumulation'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Visible = False
  end
  object LabelWARNING2: TLabel
    Left = 248
    Top = 531
    Width = 264
    Height = 17
    Caption = ' Attention : Signal 1 Hors Limites ! '
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
  object LabelWARNING1: TLabel
    Left = 248
    Top = 531
    Width = 264
    Height = 17
    Caption = ' Attention : Signal 0 Hors Limites ! '
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
  object LabelWARNING3: TLabel
    Left = 248
    Top = 531
    Width = 264
    Height = 17
    Caption = ' Attention : Signal 2 Hors Limites ! '
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
  object LabelWARNING4: TLabel
    Left = 248
    Top = 531
    Width = 264
    Height = 17
    Caption = ' Attention : Signal 3 Hors Limites ! '
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
  object GroupBoxTrigger: TGroupBox
    Left = 3
    Top = 377
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
      Left = 182
      Top = 11
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
      Left = 62
      Top = 13
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
      Left = 9
      Top = 35
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
    object CheckBoxPreTrig: TCheckBox
      Left = 67
      Top = 29
      Width = 48
      Height = 17
      Hint = 'Mode Pr'#233'-Trig'
      Caption = 'Pr'#233'.T.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = TriggerChange
    end
  end
  object GroupBoxVOIES: TGroupBox
    Left = 2
    Top = 33
    Width = 218
    Height = 300
    Caption = 'Voies'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = YChange
    object GroupBoxVOIE1: TGroupBox
      Left = 7
      Top = 36
      Width = 96
      Height = 130
      Caption = 'Y0'
      Color = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object ComboBoxY1: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        ItemsEx = <
          item
            Caption = '5 V/div PE'
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
        Left = 6
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY1SondeX10: TRadioButton
        Left = 53
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 10'
        TabOrder = 2
        OnClick = YChange
      end
      object Button0DECALCH1: TButton
        Left = 27
        Top = 3
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 3
        OnClick = YChange
      end
      object GroupboxVOIE1new: TGroupBox
        Left = 0
        Top = 13
        Width = 97
        Height = 98
        Hint = 'r'#233'glage du calibre de la voie 1'
        Color = clHighlightText
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object Label6: TLabel
          Left = 3
          Top = 85
          Width = 21
          Height = 14
          Caption = 'min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 71
          Top = 85
          Width = 23
          Height = 14
          Caption = 'max'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shapecalibre1: TShape
          Left = 26
          Top = 17
          Width = 50
          Height = 50
          Brush.Color = clFuchsia
          Pen.Style = psClear
          Shape = stCircle
        end
        object Shape1: TShape
          Left = 42
          Top = 63
          Width = 8
          Height = 8
          Brush.Color = clGray
          Pen.Style = psClear
          Shape = stCircle
        end
        object GetCh1SensBox: TLabel
          Left = 29
          Top = 42
          Width = 31
          Height = 11
          Caption = '1 V/div'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object sensibilite13: TRadioButton
          Left = 10
          Top = 26
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,5 V/div'
          TabOrder = 0
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite14: TRadioButton
          Left = 3
          Top = 40
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,2 V/div'
          TabOrder = 1
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite150: TRadioButton
          Left = 32
          Top = 73
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,1 V/div'
          TabOrder = 2
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite16: TRadioButton
          Left = 3
          Top = 57
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '50 mV/div'
          TabOrder = 3
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite17: TRadioButton
          Left = 32
          Top = 15
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '20 mV/div'
          Color = clHighlightText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite18: TRadioButton
          Left = 54
          Top = 3
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '10 mV/div'
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite12: TRadioButton
          Left = 82
          Top = 15
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '1 V/div'
          TabOrder = 6
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object sensibilite10: TRadioButton
          Left = 85
          Top = 34
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '5 V/div'
          DragCursor = crHandPoint
          TabOrder = 7
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
        object Edit3: TEdit
          Left = 35
          Top = 96
          Width = 56
          Height = 16
          Hint = 'affichage du calibre'
          BorderStyle = bsNone
          Color = clBtnHighlight
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = '20 dB/div'
        end
        object sensibilite11: TRadioButton
          Left = 63
          Top = 50
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '2 V/div'
          TabOrder = 9
          OnClick = calibre1Change
          OnDblClick = calibre1Change
        end
      end
    end
    object GroupBoxVOIE3: TGroupBox
      Left = 7
      Top = 166
      Width = 96
      Height = 130
      Caption = 'Y2'
      Color = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object ComboBoxY3: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        ItemsEx = <
          item
            Caption = '5 V/div PE'
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
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        Text = 'Sensibilit'#233
        OnClick = YChange
      end
      object RadioButtonY3SondeX1: TRadioButton
        Left = 3
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clOlive
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY3SondeX10: TRadioButton
        Left = 51
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clOlive
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = YChange
      end
      object Button0DECALCH3: TButton
        Left = 33
        Top = 5
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 3
        OnClick = YChange
      end
      object GroupboxVOIE3new: TGroupBox
        Left = 0
        Top = 13
        Width = 97
        Height = 98
        Hint = 'r'#233'glage du calibre de la voie 1'
        Color = clHighlightText
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object Label31: TLabel
          Left = 3
          Top = 85
          Width = 21
          Height = 14
          Caption = 'min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 72
          Top = 85
          Width = 23
          Height = 14
          Caption = 'max'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shapecalibre3: TShape
          Left = 25
          Top = 17
          Width = 50
          Height = 50
          Brush.Color = clYellow
          Pen.Style = psClear
          Shape = stCircle
        end
        object Shape3: TShape
          Left = 42
          Top = 63
          Width = 8
          Height = 8
          Brush.Color = clGray
          Pen.Style = psClear
          Shape = stCircle
        end
        object GetCh3SensBox: TLabel
          Left = 29
          Top = 42
          Width = 31
          Height = 11
          Caption = '1 V/div'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object sensibilite34: TRadioButton
          Left = 10
          Top = 26
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,2 V/div'
          TabOrder = 0
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite32: TRadioButton
          Left = 3
          Top = 40
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '1 V/div'
          TabOrder = 1
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite33: TRadioButton
          Left = 30
          Top = 73
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,5 V/div'
          TabOrder = 2
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite31: TRadioButton
          Left = 3
          Top = 57
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '2 V/div'
          TabOrder = 3
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite36: TRadioButton
          Left = 32
          Top = 15
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '50 mV/div'
          Color = clHighlightText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite37: TRadioButton
          Left = 54
          Top = 3
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '20 mV/div'
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite38: TRadioButton
          Left = 82
          Top = 15
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '10 mV/div'
          TabOrder = 6
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object sensibilite30: TRadioButton
          Left = 84
          Top = 30
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '5 V/div'
          DragCursor = crHandPoint
          TabOrder = 7
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
        object GetCh3SensBoxdB: TEdit
          Left = 35
          Top = 96
          Width = 56
          Height = 16
          Hint = 'affichage du calibre'
          BorderStyle = bsNone
          Color = clBtnHighlight
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = '20 dB/div'
        end
        object sensibilite35: TRadioButton
          Left = 63
          Top = 50
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,1 V/div'
          TabOrder = 9
          OnClick = calibre3Change
          OnDblClick = calibre3Change
        end
      end
    end
    object GroupBoxVOIE4: TGroupBox
      Left = 113
      Top = 166
      Width = 97
      Height = 130
      Caption = 'Y3'
      Color = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object ComboBoxY4: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        ItemsEx = <
          item
            Caption = '5 V/div PE'
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
        Left = 3
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY4SondeX10: TRadioButton
        Left = 50
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 10'
        TabOrder = 2
        OnClick = YChange
      end
      object Button0DECALCH4: TButton
        Left = 26
        Top = 6
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 3
        OnClick = YChange
      end
      object GroupboxVOIE4new: TGroupBox
        Left = 0
        Top = 13
        Width = 97
        Height = 98
        Hint = 'r'#233'glage du calibre de la voie 1'
        Color = clHighlightText
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object Label1: TLabel
          Left = 3
          Top = 85
          Width = 21
          Height = 14
          Caption = 'min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 72
          Top = 85
          Width = 23
          Height = 14
          Caption = 'max'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shapecalibre4: TShape
          Left = 26
          Top = 17
          Width = 50
          Height = 50
          Brush.Color = clRed
          Pen.Style = psClear
          Shape = stCircle
        end
        object Shape4: TShape
          Left = 42
          Top = 63
          Width = 8
          Height = 8
          Brush.Color = clGray
          Pen.Style = psClear
          Shape = stCircle
        end
        object GetCh4SensBox: TLabel
          Left = 29
          Top = 42
          Width = 31
          Height = 11
          Caption = '1 V/div'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object sensibilite43: TRadioButton
          Left = 5
          Top = 26
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,5 V/div'
          TabOrder = 0
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite44: TRadioButton
          Left = 5
          Top = 3
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,2 V/div'
          TabOrder = 1
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite45: TRadioButton
          Left = 26
          Top = 12
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,1 V/div'
          TabOrder = 2
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite46: TRadioButton
          Left = 32
          Top = 3
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '50 mV/div'
          TabOrder = 3
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite47: TRadioButton
          Left = 48
          Top = -1
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '20 mV/div'
          Color = clHighlightText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite48: TRadioButton
          Left = 61
          Top = 3
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '10 mV/div'
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite42: TRadioButton
          Left = 82
          Top = 15
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '1 V/div'
          TabOrder = 6
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object sensibilite40: TRadioButton
          Left = 9
          Top = 63
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '5 V/div'
          DragCursor = crHandPoint
          TabOrder = 7
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
        object Edit2: TEdit
          Left = 35
          Top = 96
          Width = 56
          Height = 16
          Hint = 'affichage du calibre'
          BorderStyle = bsNone
          Color = clBtnHighlight
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = '20 dB/div'
        end
        object sensibilite41: TRadioButton
          Left = 7
          Top = 49
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '2 V/div'
          TabOrder = 9
          OnClick = calibre4Change
          OnDblClick = calibre4Change
        end
      end
    end
    object GroupBoxVOIE2: TGroupBox
      Left = 113
      Top = 36
      Width = 97
      Height = 130
      Caption = 'Y1'
      Color = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      object ComboBoxY2: TComboBoxEx
        Left = 8
        Top = 32
        Width = 81
        Height = 23
        ItemsEx = <
          item
            Caption = '5 V/div PE'
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
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        Text = 'Sensibilit'#233
        OnClick = YChange
      end
      object RadioButtonY2SondeX1: TRadioButton
        Left = 6
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 1'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = YChange
      end
      object RadioButtonY2SondeX10: TRadioButton
        Left = 53
        Top = 111
        Width = 41
        Height = 17
        Caption = 'x 10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = YChange
      end
      object Button0DECALCH2: TButton
        Left = 34
        Top = 3
        Width = 15
        Height = 15
        Caption = '0'
        TabOrder = 3
        OnClick = YChange
      end
      object GroupboxVOIE2new: TGroupBox
        Left = 0
        Top = 13
        Width = 97
        Height = 98
        Hint = 'r'#233'glage du calibre de la voie 1'
        Color = clHighlightText
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object Label8: TLabel
          Left = 3
          Top = 85
          Width = 21
          Height = 14
          Caption = 'min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 71
          Top = 85
          Width = 23
          Height = 14
          Caption = 'max'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shapecalibre2: TShape
          Left = 26
          Top = 17
          Width = 50
          Height = 50
          Brush.Color = clLime
          Pen.Style = psClear
          Shape = stCircle
        end
        object Shape2: TShape
          Left = 40
          Top = 40
          Width = 8
          Height = 8
          Brush.Color = clGray
          Pen.Style = psClear
          Shape = stCircle
        end
        object GetCh2SensBox: TLabel
          Left = 29
          Top = 42
          Width = 31
          Height = 11
          Caption = '1 V/div'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object sensibilite22: TRadioButton
          Left = 10
          Top = 26
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '1 V/div'
          TabOrder = 0
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite23: TRadioButton
          Left = 3
          Top = 40
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,5 V/div'
          TabOrder = 1
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite24: TRadioButton
          Left = 32
          Top = 73
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,2 V/div'
          TabOrder = 2
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite25: TRadioButton
          Left = 3
          Top = 57
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '0,1 V/div'
          TabOrder = 3
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite26: TRadioButton
          Left = 33
          Top = 17
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '50 mV/div'
          Color = clHighlightText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite27: TRadioButton
          Left = 55
          Top = 3
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '20 mV/div'
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite28: TRadioButton
          Left = 82
          Top = 15
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '10 mV/div'
          TabOrder = 6
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object sensibilite21: TRadioButton
          Left = 84
          Top = 30
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '2 V/div'
          DragCursor = crHandPoint
          TabOrder = 7
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
        object Edit5: TEdit
          Left = 35
          Top = 96
          Width = 56
          Height = 16
          Hint = 'affichage du calibre'
          BorderStyle = bsNone
          Color = clBtnHighlight
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = '20 dB/div'
        end
        object sensibilite20: TRadioButton
          Left = 63
          Top = 50
          Width = 15
          Height = 17
          Cursor = crHandPoint
          Hint = '5 V/div'
          TabOrder = 9
          OnClick = calibre2Change
          OnDblClick = calibre2Change
        end
      end
    end
    object CheckBoxY1Visible: TCheckBox
      Left = 8
      Top = 15
      Width = 42
      Height = 19
      Caption = 'Y0'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 4
      OnClick = YChange
    end
    object CheckBoxY2Visible: TCheckBox
      Left = 61
      Top = 15
      Width = 41
      Height = 17
      Caption = 'Y1'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      OnClick = YChange
    end
    object CheckBoxY3Visible: TCheckBox
      Left = 114
      Top = 15
      Width = 41
      Height = 17
      Caption = 'Y2'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 6
      OnClick = YChange
    end
    object CheckBoxY4Visible: TCheckBox
      Left = 167
      Top = 15
      Width = 40
      Height = 17
      Caption = 'Y3'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
      OnClick = YChange
    end
    object CheckBoxXY: TCheckBox
      Left = 170
      Top = 3
      Width = 41
      Height = 21
      Caption = 'XY'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Visible = False
      OnClick = Button1Click
    end
  end
  object GroupBoxBaseDeTemps: TGroupBox
    Left = 2
    Top = 332
    Width = 218
    Height = 216
    Caption = 'Base de fr'#233'quence'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ScrollBarBDT: TScrollBar
      Left = 8
      Top = 16
      Width = 201
      Height = 17
      DragCursor = crMultiDrag
      Max = 12
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 0
      OnChange = XChange
    end
    object GroupBox3: TGroupBox
      Left = 139
      Top = 39
      Width = 67
      Height = 131
      Hint = 'choix du nombre d'#39#233'chantillons'
      Caption = 'r'#233'solution'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object Label10: TLabel
        Left = -58
        Top = 40
        Width = 15
        Height = 17
        Caption = '   '
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
      object Label11: TLabel
        Left = 37
        Top = 109
        Width = 21
        Height = 14
        Caption = 'min'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 37
        Top = 12
        Width = 23
        Height = 14
        Caption = 'max'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Recordlengthbox: TEdit
        Left = 3
        Top = 112
        Width = 32
        Height = 20
        Hint = 'nombre d'#39#233'chantillons'
        BorderStyle = bsNone
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        Text = ' 1024'
      end
      object TrackBar1: TTrackBar
        Left = 3
        Top = 18
        Width = 28
        Height = 97
        Cursor = crHandPoint
        Hint = 'choix du nombre d'#39#233'chantillons'
        Max = 3
        Orientation = trVertical
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = TrackBar1Change
      end
      object ProgressBar2: TProgressBar
        Left = 37
        Top = 28
        Width = 16
        Height = 77
        Max = 3
        Orientation = pbVertical
        ParentShowHint = False
        Step = 1
        ShowHint = False
        TabOrder = 2
      end
    end
    object Groupplageanalyse: TGroupBox
      Left = 6
      Top = 39
      Width = 130
      Height = 130
      Hint = 'r'#233'glage de la plage d'#39'analyse'
      Caption = 'plage de fr'#233'quence'
      Color = clHighlightText
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      DesignSize = (
        130
        130)
      object Label12: TLabel
        Left = 18
        Top = 114
        Width = 21
        Height = 14
        Caption = 'min'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 96
        Top = 114
        Width = 23
        Height = 14
        Caption = 'max'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label14: TLabel
        Left = 48
        Top = 36
        Width = 33
        Height = 14
        Caption = ' plage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object SetFreqLabel: TLabel
        Left = 42
        Top = 76
        Width = 52
        Height = 14
        Caption = 'd'#39'analyse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Shapefreq: TShape
        Left = 30
        Top = 32
        Width = 75
        Height = 75
        Brush.Color = clSilver
        ParentShowHint = False
        Pen.Style = psInsideFrame
        Shape = stCircle
        ShowHint = True
      end
      object Shapefreq0: TShape
        Left = 29
        Top = 79
        Width = 8
        Height = 10
        Brush.Color = clBlack
        Pen.Style = psClear
        Shape = stCircle
        OnMouseEnter = calibre1Change
      end
      object RadioButtonBDT9: TRadioButton
        Left = 6
        Top = 50
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 10 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = XChange
      end
      object RadioButtonBDT11: TRadioButton
        Left = 3
        Top = 71
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 2,5 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = XChange
      end
      object RadioButtonBDT10: TRadioButton
        Left = 4
        Top = 56
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 5 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = XChange
      end
      object RadioButtonBDT12: TRadioButton
        Left = 3
        Top = 91
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 1 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = XChange
      end
      object RadioButtonBDT8: TRadioButton
        Left = 24
        Top = 29
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 25 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = XChange
      end
      object RadioButtonBDT7: TRadioButton
        Left = 48
        Top = 12
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 50 kHz'
        Color = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = XChange
      end
      object RadioButtonBDT6: TRadioButton
        Left = 69
        Top = 15
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 100 kHz'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TabStop = True
        OnClick = XChange
      end
      object RadioButtonBDT5: TRadioButton
        Left = 85
        Top = 15
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 250 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = XChange
      end
      object RadioButtonBDT4: TRadioButton
        Left = 106
        Top = 35
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 500 kHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = XChange
      end
      object RadioButtonBDT3: TRadioButton
        Left = 106
        Top = 56
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 1 MHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = XChange
      end
      object RadioButtonBDT2: TRadioButton
        Left = 109
        Top = 73
        Width = 20
        Height = 17
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 2,5 MHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = XChange
      end
      object RadioButtonBDT1: TRadioButton
        Left = 106
        Top = 84
        Width = 15
        Height = 15
        Cursor = crHandPoint
        Hint = 'de 0 '#224' 5 MHz'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = XChange
      end
      object GetFreqPerDiv: TEdit
        Left = 38
        Top = 60
        Width = 58
        Height = 16
        Anchors = [akTop]
        BorderStyle = bsNone
        Color = clBtnHighlight
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 12
      end
    end
  end
  object ScrollBarLevelTrigger: TScrollBar
    Left = 225
    Top = 19
    Width = 17
    Height = 417
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
    Left = 8
    Top = 553
    Width = 217
    Height = 121
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
      Left = 9
      Top = 19
      Width = 137
      Height = 17
      Caption = 'CheckBoxA'
      TabOrder = 7
    end
  end
  object ScrollBar0CH1: TScrollBar
    Left = 768
    Top = 17
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 5
  end
  object ScrollBar0CH2: TScrollBar
    Left = 768
    Top = 145
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 6
  end
  object ScrollBar0CH3: TScrollBar
    Left = 768
    Top = 273
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 7
  end
  object ScrollBar0CH4: TScrollBar
    Left = 768
    Top = 401
    Width = 17
    Height = 121
    Kind = sbVertical
    Max = 1000
    PageSize = 0
    Position = 500
    TabOrder = 8
  end
  object GetSampleFreqEdit: TEdit
    Left = 253
    Top = 283
    Width = 51
    Height = 16
    Hint = 'base de temps'
    BorderStyle = bsNone
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
    Text = 'x'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 220
    Height = 33
    Caption = 'Panel1'
    TabOrder = 10
    object ToolBar3: TToolBar
      Left = 1
      Top = 1
      Width = 218
      Height = 67
      ButtonHeight = 32
      ButtonWidth = 30
      Caption = 'ToolBar3'
      Flat = False
      TabOrder = 0
      object SpeedButtonCabalab: TImage
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'menu cabalab'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D617042080000424D420800000000000042000000280000002000
          000020000000010010000300000000080000120B0000120B0000000000000000
          0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7F9C73DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FBD77744EEF395A6BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7F5A6BEF398C2DFF7F534ADE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7F3967AD31AD31AD31FF7FEF39185FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7F9C73CE35AD31AE35AD31FF7FF03DEF39DE7BFF7FDE7FF77ED67EFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD7F5A7FFF7F
          FF7F734A8D2DAE35AE35AD31FF7FAE358C2DD75A9C7F5A7F5A7F637C4A7D5A7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FB57E4A7D187F7B7F
          7B77CE35AD31AE35AE35AE35FF7FAE35AE35AE395A77FF7FFF7FD67E007C217C
          CE7D9C7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A7F4A7D007C947EFF7FFF7F
          D6628D2DAE35AE35AE35AE35FF7FAE35AE358D2D944EFF7FFF7FFF7FCE7D007C
          007C847C527EFF7FFF7FFF7FFF7FFF7FFF7F737E217C007CA57CFF7FFF7FFF7F
          94528D2DAE35AE35AE35AE35FF7FAE35AE35AD31AD315A6BFF7FFF7FFF7F8C7D
          007C007C007CE77C187FFF7FFF7FFF7FFF7FAD7D007C007CAD7DFF7FFF7FFF7F
          31468D31AE35AE35AE35AE35FF7FAE35AE35AE35AD31EF39BD77FF7FFF7FFF7F
          CE7D007C007C007CCE7DFF7FFF7FFF7FFF7FCE7D007C007C947EFF7FFF7FDE7B
          EF39AD31AE35AE35AE35AE35FF7FAE35AD31AE35AE358D313246DE7BFF7FFF7F
          FF7F317E007C007CEF7DFF7FFF7FFF7FFF7FCE7D007C007C397FFF7FFF7F7B6F
          AD31AD31AE35AE35AE35AE35FF7FAE35AE35AE35AE35AE358D2D534ADE7BFF7F
          FF7FFF7F527E007CEF7DFF7FFF7FFF7FFF7FCE7D007C847CDE7FFF7FFF7FF85E
          8D2DAE35AE35AE35AE35AE35FF7FAE35AE35AE35AE35AE35AE358D2D3246DE7B
          FF7FFF7FFF7F6B7DAD7DFF7FFF7FFF7FFF7FCE7D007C6B7DFF7FFF7FFF7F734A
          8D31AE35AE35AE35AE35AE35FF7FAE35AE35AE35AD31AE35AE35AE358D2D103E
          9C73FF7FFF7F5A7F107EFF7FFF7FFF7FFF7FCE7D007CD67EFF7FFF7FBD77CE35
          AD31AE35AE35AE35AE35AE35FF7FAE35AE35AE35AE35AE35AE35AE35AE358D31
          CF397B6FFF7F5A7F397FFF7FFF7FFF7FFF7FAD7D637CDE7FFF7FFF7FF75E8D2D
          AE35AE35AE35AE35AE35AE35FF7FAE35AE35AE35AE35AE35AE35AE35AE35AE35
          8D31CE35F76EBD7FFF7FFF7FFF7FFF7FFF7FAD7D527EFF7FFF7FDE7BF03DAD31
          AE35AE35AE35AE35AE35FF7FAE35FF7FFF7FAE35AE35AE35AE35AE35AD31AE35
          AE358D31F03DDE77FF7FFF7FFF7FFF7FFF7F5A7F5A7FBD7FFF7FF75E8D2DAE35
          AE35AD31AE35FF7FFF7FAE35AE35AE35AE35FF7FFF7FAE35AE35AE35AE35AE35
          AD35AE358C2DB656FF7FFF7FFF7FFF7FFF7FFF7FDE7F7B7F5A77EF39AD31AD31
          AD31AE35FF7FFF7FAE35AE35AE35AE35AE35AE35AE35FF7FFF7FAE35AE35AE35
          AD31AE35AD31EF39DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F74528D2DAD31AE35
          FF7FFF7FAE35AE35AE35AE35AE35AE35AE35AE35AE35AE35AE35FF7FFF7FAE35
          AE35AE31AD31AD317B6FFF7FFF7FFF7FFF7FFF7FFF7F7B6FAD31AE35AE35FF7F
          FF7FAE35AE35AE35AE35AE35AE35AE35AE35AE35AE35AD31AD31AE35AE35FF7F
          FF7FAE35AE358D311863FF7FFF7FFF7FFF7FFF7FDE7B1042CF39FF7FFF7FAE35
          AD31AE35AE35AE35AE35AE35AE35AE35AE35AE35AE35AE35AE35AD31AE35AE35
          AE35FF7FFF7FAE35F75AFF7FFF7FFF7FFF7FFF7FF75E1142FF7FFF7FAE35AE35
          AE35AE35AE35AE35AE35AE35AE35AE35AD31AD31AD31AD318D318D31AD318C2D
          CE3531463142FF7FD65AFF7FFF7FFF7FFF7F9C731142CE35AD31AD31AE35AE35
          AE35AE35AE35AE35AE35AD318D318D2DAD31CE35EF3D11423146324610463142
          1142F03D314232461863FF7FFF7FFF7FFF7FBD73734EAD318D2DAD31AE35AE35
          AE35AE35AD318D318D2DAE355246F75E7B6BBD77DE7BFF7FFF7FFF7F5A7FFF7F
          FF7FDE7BBD779C73FF7FFF7FFF7FFF7FFF7FFF7FFF7F7B6F534ACE358D318D2D
          8D2D8D31AE353146F75E9C73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD773967F75E
          F75E19673977FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD7F7B7F187FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7F9C7FFF7FFF7FFF7FFF7FFF7F5A7F317E4A7DA57C217C847CB57EFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FDE7FD67E5A7F9C7F187F107EC67C007C007C007C007C8C7D7B7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7F187F297D217C007C007C007C007C007C087D187FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7F737E847C007C007C847C737EFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FBD7F107EEF7DBD7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        ShowHint = True
        OnClick = BoxCabaLabClick
      end
      object ToolButton1: TToolButton
        Left = 32
        Top = 0
        Width = 2
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object Image5: TImage
        Left = 34
        Top = 0
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'arr'#234't de la mesure'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          0000B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DB
          B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7
          DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9
          D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DB
          B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7
          DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9
          D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DB
          B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7
          DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9
          D7DBBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DD
          BCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9
          DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBC
          D9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DD
          BCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9
          DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBC
          D9DDBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDF
          BFDBDF0000EC0000FF0000FF0000ECBFDBDF0000FF0000FF0000EC2025ECBFDB
          DFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBF
          DBDFC3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0
          C3DDE00000FF0000EC0000EC0000FFC3DDE00000EC0000EC0000FF2025ECC3DD
          E0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3
          DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0
          C3DDE00000FF0000EC0000EC0000FFC3DDE00000EC0000EC0000FF2025ECC3DD
          E0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3
          DDE0C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4
          C9E1E40000FF7E85F53535FF0000FFC9E1E47E85F53535FF0000FF2025ECC9E1
          E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9
          E1E4CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5
          CDE3E50000FF7E85F53535FF0000FFCDE3E57E85F53535FF0000FF2025ECCDE3
          E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CD
          E3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5
          CDE3E50000FF7E85F53535FF0000FFCDE3E57E85F53535FF0000FF2025ECCDE3
          E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CD
          E3E5D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7
          D0E4E70000FF7E85F53535FF0000FFD0E4E77E85F53535FF0000FF2025ECD0E4
          E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0
          E4E7D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9
          D3E6E90000FF7E85F53535FF0000FFD3E6E97E85F53535FF0000FF2025ECD3E6
          E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3
          E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9
          D3E6E90000FF7E85F53535FF0000FFD3E6E97E85F53535FF0000FF2025ECD3E6
          E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3
          E6E9D7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EA
          D7E8EA0000FF7E85F53535FF0000FFD7E8EA7E85F53535FF0000FF2025ECD7E8
          EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7
          E8EADAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAEC
          DAEAEC0000FF7E85F53535FF0000FFDAEAEC7E85F53535FF0000FF2025ECDAEA
          ECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDA
          EAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAEC
          DAEAEC0000FF7E85F53535FF0000FFDAEAEC7E85F53535FF0000FF2025ECDAEA
          ECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDA
          EAECDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEE
          DDECEE0000FF7E85F53535FF0000FFDDECEE7E85F53535FF0000FF2025ECDDEC
          EEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDD
          ECEEE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEF
          E1EEEF0000FF7E85F53535FF0000FFE1EEEF7E85F53535FF0000FF2025ECE1EE
          EFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1
          EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEF
          E1EEEF0000FF7E85F53535FF0000FFE1EEEF7E85F53535FF0000FF2025ECE1EE
          EFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1
          EEEFE4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1
          E4F0F10000FF7E85F53535FF0000FFE4F0F17E85F53535FF0000FF2025ECE4F0
          F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4
          F0F1E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3
          E7F1F30000FF7E85F53535FF0000FFE7F1F37E85F53535FF0000FF2025ECE7F1
          F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7
          F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3
          E7F1F30000FF7E85F53535FF0000FFE7F1F37E85F53535FF0000FF2025ECE7F1
          F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7
          F1F3EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4
          EBF3F40000FF7E85F53535FF0000FFEBF3F47E85F53535FF0000FF2025ECEBF3
          F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EB
          F3F4F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8
          F1F7F80000EC0000FF0000FF0000ECF1F7F80000FF0000FF0000EC2025ECF1F7
          F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1
          F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8
          F1F7F80000EC0000FF0000FF0000ECF1F7F80000FF0000FF0000EC2025ECF1F7
          F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1
          F7F8F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9
          F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9
          F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5
          F9F9F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFB
          F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FB
          FBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8
          FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFB
          F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FB
          FBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8
          FBFBFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFD
          FBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFD
          FDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFB
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        ShowHint = True
        OnClick = Image5Click
      end
      object Image6: TImage
        Left = 66
        Top = 0
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'reprise de la mesure'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          0000B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DB
          B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7
          DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9
          D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DB
          B9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7
          DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9D7DBB9
          D7DBBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBFDBDFBFDBDFBFDBDF
          BFDBDFBFDBDFBFDBDFBFDBDFBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9
          DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBCD9DDBC
          D9DDBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDF
          000000BFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDB
          DFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBF
          DBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFC3DDE0C3DDE0C3DDE0
          000000000000C3DDE0C3DDE0BFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDB
          DFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBFDBDFBF
          DBDFC3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0
          003500003500000000C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DD
          E0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3DDE0C3
          DDE0C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2
          00350000DF0000FF00000000000000C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DF
          E2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6
          DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2
          00350000DF0000FF00003500003500000000C6DFE2C6DFE2C6DFE2C6DFE2C6DF
          E2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6DFE2C6
          DFE2C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4
          00350000DF0000DF0000BF2A00FF00003500000000C9E1E4C9E1E4C9E1E4C9E1
          E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9E1E4C9
          E1E4CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5
          00350000DF0000DF0000DF0000BF2A00BF2A00FF00000000003500CDE3E5CDE3
          E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CD
          E3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5CDE3E5
          00350000DF0000DF0000DF0000BF2A00BF2A00FF00003500000000000000CDE3
          E5CDE3E5D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7CDE3E5CDE3E5CDE3E5CDE3E5CD
          E3E5D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7D0E4E7
          00350000DF0000FF0900DF0000DF0000DF0000DF0000BF2A00FF000000000000
          00D0E4E7D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D0E4E7D0E4E7D0E4E7D0E4E7D0
          E4E7D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9
          00350000FF2A00DF0000FF0900DF0000DF0000DF0000DF0000FF0000FF0000FF
          00000000D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3
          E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9
          00350000FF2A00DF0000FF0900DF0000DF0000DF0000DF0000FF0000FF0000FF
          00003500000000D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3E6E9D3
          E6E9D7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EA
          00350055FF0000FF2A00DF0000FF0900FF0900FF0900DF0000DF0000FF0000FF
          0000FF0000FF00000000D7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7E8EAD7
          E8EADAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAEC
          00350055FFAA00FF0900FF2A00DF0000DF0000DF0000FF0900DF0000DF00007F
          00003500000000DAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDA
          EAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAEC
          00350055FFAA00FF0900FF2A00DF0000DF0000DF0000FF0900DF0000DF00007F
          00000000DAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDAEAECDA
          EAECDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEEDDECEE
          00350055FFAA00FF0900FF0900FF2A00FF2A00FF2A00DF0055FFAA00FF000000
          00DDECEEDAEAECDAEAECDAEAECDAEAECDAEAECDDECEEDDECEEDDECEEDDECEEDD
          ECEEE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEF
          003500AAFF2A00FF0900FF0900FF0900FF0900FF0900FF2A003500000000E1EE
          EFE1EEEFDDECEEDDECEEDDECEEDDECEEDDECEEE1EEEFE1EEEFE1EEEFE1EEEFE1
          EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEF
          003500AAFF2A00FF0900FF0900FF0900FF0900FF0900FF2A000000003500E1EE
          EFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1EEEFE1
          EEEFE4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1
          003500AAFF2A00FF0900FF09AAFF2AAAFF2A00FF00000000E4F0F1E4F0F1E4F0
          F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4F0F1E4
          F0F1E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3
          003500AAFFAA00FF09AAFF2A007F0000FF00003500000000E7F1F3E7F1F3E7F1
          F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7
          F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3
          003500AAFFAA00FF09AAFF2A007F0000FF00000000E7F1F3E7F1F3E7F1F3E7F1
          F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7F1F3E7
          F1F3EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4
          003500AAFFAAAAFFAA00FF00003500000000EBF3F4EBF3F4EBF3F4EBF3F4EBF3
          F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EBF3F4EB
          F3F4EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6
          00350000FF0000FF00003500000000EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5
          F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EE
          F5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6
          00350000FF0000FF00000000EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5
          F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EEF5F6EE
          F5F6F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8
          003500003500000000F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7
          F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1F7F8F1
          F7F8F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9
          000000000000F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9
          F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5
          F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9
          F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9
          F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5F9F9F5
          F9F9F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFB
          F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FB
          FBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF8
          FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        ShowHint = True
        Transparent = True
        Visible = False
        OnClick = Image6Click
      end
      object ToolButton9: TToolButton
        Left = 98
        Top = 0
        Width = 2
        Caption = 'ToolButton9'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton12: TToolButton
        Left = 100
        Top = 0
        Width = 2
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object Image2: TImage
        Left = 102
        Top = 0
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = ' 1 '#233'cran par voie ou 1 '#233'cran pour toutes les voies s'#233'lectionn'#233'es'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF0000
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF0000
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF0000
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFF000000000000000000000000000000000000000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFF808080FFFFFF808080FFFFFF808080FFFFFF808080FFFFFF00FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF00FFFFFFFFFFFF
          FFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF00FFFFFFFFFF00
          0000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF00FFFFFFFFFF00
          0000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFF00
          0000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFF808080FFFFFF808080FFFFFF808080FFFFFF808080FFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFFFF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00
          0000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00
          0000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00
          0000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00
          0000000000FFFFFF000000000000000000000000000000000000000000000000
          000000FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF0000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF0000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFF00
          00FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF0000FFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFF00
          00FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF0000FFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF0000FFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF00
          0000}
        ShowHint = True
        OnClick = MenuiconeECRANClick
      end
      object Image3: TImage
        Left = 134
        Top = 0
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'temporel et fr'#233'quentiel'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF00
          0000000000FFFFFF0000000000FF0000FF000000000000000000000000000000
          0000000000000000000000FF0000FF0000000000000000000000000000FF0000
          FF0000000000000000000000000000000000000000FF0000FF000000FFFFFF00
          0000000000FFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF4080FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFFFFF00
          0000FFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF00FF00
          00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000}
        ShowHint = True
        OnClick = Menuicone2ECRANClick
      end
      object ToolButton2: TToolButton
        Left = 166
        Top = 0
        Width = 2
        Caption = 'ToolButton2'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton_new_fichier: TImage
        Left = 168
        Top = 0
        Width = 33
        Height = 32
        Cursor = crHandPoint
        Hint = 'transfert vers regressi, nouveau fichier'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170B60C0000424DB60C00000000000036000000280000002100
          0000200000000100180000000000800C00000000000000000000000000000000
          0000000000FFFFFFE3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0
          E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EF
          F0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3F0F0FF
          FFFF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00000000000000FFFFFFD2D2D2DBDCDBFEFEFEC9C9C9E1E1E1FF
          FFFFC7C7C7E0E0E0FFFFFFF4F4F4CCCCCCE5E5E5FFFFFFF5F5F5CECECEDDDDDD
          FFFFFFECECECCECECEE9E9E9FFFFFFECECECD1D1D1E7E7E7F1F1F1D1D1D1EFEF
          EFEDEDEDD1CFCFFFFFFF00000000000000FFFFFFA1A1A13A363AFFFFFF828182
          5A5A5AF8F8F87E7E7E4B4B4BFFFFFFEEEEEEA6A6A6383838F1F1F1FDFDFD7474
          74363636FFFFFFE7E7E7858585545454FFFFFFF1F1F1606060494949FFFFFF56
          5656606060FDFDFD6C6B6BFFFFFF00000000FFFFFFFFFFFFF5F1F5B0B4B02C98
          2CFDF5FFC3C4C4FCFBFBDBDCDCB9BBBBFFFFFFFCFDFDEEEEEEADB1B1FAFCFCFF
          FFFFD6D9D9B0B2B2FFFFFFFCFEFEDCDEDEBABABAFFFFFFFFFFFFCACDCDB5B7B7
          FFFFFFC5C7C7BEBEBEFFFFFFD2D1D0FFFFFFDAECF000FFFFFFFFFFFFEBE7EBD2
          E2D3006E00DE879AFEF0F0FFFFFFFFFFFFFFFBFBFFF8F8FFFFFFFFFFFFFFF7F7
          FFFAFAFFFFFFFFF8F8FFFFFFFFF8F8FFF8F8FFFEFEFFFFFFFFFBFBFFF6F6FFFF
          FFFFFFFFFFF4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5E8EB00FFFFFFFFFFFF
          A4A0A41F191C0B8F00FFBFD6FFFFFFFFFFFFFFDFDFFF4848FF6A6AFFF1F1FFFB
          FBFF2323FF9292FFE7E7FF4242FF4848FF2C2CFF2828FF3D3DFFFFFFFFBDBDFF
          3434FF2D2DFF3636FF4040FFACACFFFFFFFFFFFFFFFFFFFFFFFFD4E7EA000000
          00FFFFFFFCFCF9CCC6E30000CB2A7E1292585AFFFFFFFFD3D3FF0000FF2F30FF
          FDFEFFFFFFFF0000FF5A5AFFDADAFF0000FF2E2EFFEAEAFFD7D7FFDCDCFFADAD
          FF0000FF4545FFE2E2FFBDBDFF0000FF8B8BFFFFFFFFFFFFFFFFFFFFFFFF0000
          0000000000FFFFFFD4D4D1DCDDDFBFBCF1005C007008018F3639FFEFEEFF0102
          FF080AFF4043FF4244FF1619FFDADAFFE1E1FF0000FF3B3BFFFFFFFFFAFAFFFF
          FFFFA0A0FF0000FF6969FFBCBCFF2626FF0000FF9292FFFFFFFFFFFFFFFFFFFF
          FFFF00000000000000FFFFFFA9A9A9292725F8FFF6005100872D27D5B0B5FFE0
          E0FF0005FF2700FFB500FFBC00FF0006FF8D8DFFDEDEFF0000FF0B0BFF2323FF
          7474FFFFFFFFA1A1FF0000FF6060FFE5E5FFBBBBFFCACAFFE8E8FFFFFFFFFFFF
          FFFFFFFFFFFF00000000000000FFFFFFE9E9E9B3B0B2E9F6EB077105CDCDB3FF
          FFFFFFD6D6FF0006FF3600FFF700FFFF00FF0000FF6767FFDFDFFF0000FF2E2E
          FFBDBDFFC6C6FFFFFFFFABABFF0000FF5454FFFFFFFFDDDDFF3C3CFFAFAFFFFF
          FFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFD5D5D5FFFFFFE6E4FF0000AD
          396B4590382DFFFFFFFF0000FF0000FF0000FF0000FF0005FFD2D2FFC8C8FF00
          00FF0000FF1212FF0000FF1818FFFFFFFF6C6CFF0000FF0000FF0000FF1313FF
          DBDBFFFFFFFFFFFFFFFFFFFFFFFFD4E7EB00FFFFFFFFFFFFACACAC030303FFFF
          FFE7FFDA2E6C195E0000862326F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFEAEAEAC2
          C2C2FFFFFFCCF0D1316C207C1411F4E0E2FEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFF
          CCCCCCD6D6D6FFFFFFC5E3C5479940ECD7D5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          00FFFFFFACACAC151515FBFBF6D5CEFF1E2FAA006915FFFFFFFFFFFFFAF6F6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          0000000000FFFFFFFDFDFDF5F5F5FFFFFFFFFFFFBCD9BE007F00EBE4FFD19C97
          902A29E4CDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00000000000000FFFFFFB8B8B89E9E9EFEFEFEFFFFFFC2E6BB0784002300
          FA5E00127A00009E4644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00000000FFFFFFFFFFFFBCBCBC4B4B4BF8F8F8FFFFFFBCDDBB00
          8000D6CAFF452AA67B2243E7CECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD4E7EB00FFFFFFFFFFFFFFFFFFF8F8F8FFFFFFFFFFFF
          AED7AE006700FFFFFF9F9EFF1213F6F8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFD4E7EB00FFFFFFFFFFFFA7A7A7828282FEFE
          FEFFFFFFFFFFFFFFFFFF004800FFFFF4E2E1FF2118DAC0C7FFD1D0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF6EEEFBE8C8D620000EBD4D4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFC3C3C351
          5151F7F7F7FFFFFFFFFFFFFFFFFF027404F4F1EDCB867E61063614009E686FFF
          9B9AFF9798FFC3C6FFFFFFFFFFFFFFE3BCAE9A3B2B7F0100C9A194FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7E2D4EDCFC0FFFFFFFFFFFF00000000000000FFFFFF
          F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006D01F5DDE18E13157700009A3B
          21DCE9FF2E32FF171FFE3627D2CBD0FFB4B3FFC0C8FFA795D3611950BEC3FFBA
          BFFFBBBFFFB4B4FFB4B3FFC1CBFF9270AB733E7DDDE6FFFFFFFF000000000000
          00FFFFFFB8B8B88C8C8CFFFFFFFFFFFFFFFFFFFFFFFF308A31C3E9C5EBC9D0AF
          7172FCF1EDFFFFFFF1E9F0DEA68E53001D1419BB3F47FF3635FF373AFF3436F1
          3F45FF2820E01E0DCE4047FF3C42FF271ED81300B50500B4656BCBFFFFFF0000
          0000000000FFFFFFB2B2B21A1A1AF3F3F3FFFFFFFFFFFFFFFFFFCFE9CF258125
          FFFFFFFFFFFFFFFFFFFFFFFFCE97957209087800009B5D4DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF6CA8B71B86647FFFCE9FFFFFFCB7B668709007F0000B47A70FF
          FFFF00000000FFFFFFFFFFFFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7E3
          C7328A32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F9B67E7DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC9A3A37001016C0000A35C5CFFFFFFFFFFFFE4D2D1C8A09F
          FFFFFFFFFFFFD4E7EA00FFFFFFFFFFFFB2B2B2696969FCFCFCFFFFFFFFFFFFFF
          FFFFBFDFBF2D842DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFAF9F1F1FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8BBBBC89F9FFFFFFFFFFFFFFFFFFFFCF7
          F7FAF4F4FFFFFFFFFFFFD4E7EB00FFFFFFFFFFFFC4C4C4373737FCFCFCFFFFFF
          FFFFFFFFFFFFD7EAD74AA24AC6E2C6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFD4E7EB00000000FFFFFFF2F2F2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB3D6B3007A00DEEFDEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFFFB1B1B179
          7979FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFA9D3A9148714E4F1E4FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFFF
          D5D2D162605FFFFDFDFFFFFFFFFFFFFFFFFFFFFFFFD5E9D386C183F4F9F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          00FFFFFFE7F4F5EAF5F7E5F2F4E3EFF0E3EFF0E3EFF0E3EFF0E6F1F4E9F3F6E4
          F1F2E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0
          E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E3EFF0E4F0F0FFFFFF0000
          0000}
        ShowHint = True
        OnClick = ToolButton_new_fichier0Click
      end
      object ToolButton3: TToolButton
        Left = 201
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ButtonGBF: TImage
        Left = 209
        Top = 0
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'voir le GBF'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFF00FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFF00FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000FF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FF0000FF
          0000FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000FF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFF0000FF
          FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF0000FF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000FF00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF00
          00FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFF00
          00FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000FF0000FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000}
        ShowHint = True
        OnClick = BoxCabaLabClick
      end
    end
    object ToolBar4: TToolBar
      Left = 1
      Top = 68
      Width = 218
      Height = 30
      ButtonHeight = 32
      ButtonWidth = 30
      Caption = 'ToolBar3'
      Flat = False
      TabOrder = 1
      object ToolButton_new_fichier0: TToolButton
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Hint = 'nouveau fichier r'#233'gressi'
        Caption = 'ToolButton10'
        DragCursor = crCross
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = False
        OnClick = ToolButton_new_fichier0Click
      end
      object ToolButton8: TToolButton
        Left = 30
        Top = 0
        Width = 2
        Caption = 'ToolButton9'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton_Newpage: TToolButton
        Left = 32
        Top = 0
        Cursor = crHandPoint
        Hint = 'nouvelle page r'#233'gressi '
        Caption = 'ToolButton11'
        DragCursor = crDefault
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = False
      end
      object ToolButton19: TToolButton
        Left = 62
        Top = 0
        Width = 2
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
    end
  end
  object CheckBox1: TCheckBox
    Left = 419
    Top = 578
    Width = 117
    Height = 17
    Caption = 'Auto-D'#233'clenchement'
    Checked = True
    State = cbChecked
    TabOrder = 11
    Visible = False
  end
  object PageControlMesures: TPageControl
    Left = 8
    Top = 516
    Width = 217
    Height = 113
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
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
        Width = 73
        Height = 14
        Caption = 'LabelVch1AC'
      end
      object LabelVch1ACDC: TLabel
        Left = 3
        Top = 44
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
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ImageIndex = 3
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
  object MainMenu1: TMainMenu
    Left = 424
    Top = 64
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      object menuRESETconfig: TMenuItem
        Caption = 'R'#233'initialiser l'#39'Analyseur de Spectre'
        ShortCut = 16466
        OnClick = menuRESETconfigClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object MenuRegUtilisateur: TMenuItem
        Caption = 'Exporter vers R'#233'gressi'
        OnClick = MenuRegUtilisateurClick
      end
      object RegressiDDE: TMenuItem
        Caption = 'Exporter vers R'#233'gressi : Instantan'#233
        OnClick = RegressiDDEClick
        object menu_TregressiInst_NEWfichier: TMenuItem
          Caption = 'Nouveau Fichier'
          OnClick = RegressiDDEClick
        end
        object menu_TregressiInst_NEWpage: TMenuItem
          Caption = 'Nouvelle page'
          OnClick = RegressiDDEClick
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object MenuEnregChargConfig: TMenuItem
        Caption = 'Charger/Sauvegarder la configuration'
        object Charger1: TMenuItem
          Caption = 'Chargement rapide'
          OnClick = MenuChargerConfig
        end
        object MenuEnregConfig: TMenuItem
          Caption = 'Enregistrement rapide'
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
      object N9: TMenuItem
        Caption = '-'
      end
      object Quitter1: TMenuItem
        Caption = 'Quitter'
      end
      object RegressiBR: TMenuItem
        Caption = 'Regressi BR'
        Enabled = False
        Visible = False
        OnClick = REGRESSIBR1Click
      end
      object RegressiBR2: TMenuItem
        Caption = 'Regressi BR2'
        Enabled = False
        Visible = False
        OnClick = Regressi2Click
      end
    end
    object Config: TMenuItem
      Caption = 'Configuration des Voies'
      object UnipolaireDiffrentiel1: TMenuItem
        Caption = 'Unipolaire/Diff'#233'rentiel'
        GroupIndex = 7
        object ALLuni: TMenuItem
          Caption = 'Y 0123 Unipolaire'
          RadioItem = True
          OnClick = UniDiffChange
        end
        object ALLdiff: TMenuItem
          Caption = 'Y 0123 Diff'#233'rentiel'
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object UniY1: TMenuItem
          Caption = 'Y0 Unipolaire'
          GroupIndex = 1
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY1: TMenuItem
          Caption = 'Y0 Diff'#233'rentiel'
          GroupIndex = 1
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N2: TMenuItem
          Caption = '-'
          GroupIndex = 4
        end
        object UniY2: TMenuItem
          Caption = 'Y1 Unipolaire'
          GroupIndex = 5
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY2: TMenuItem
          Caption = 'Y1 Diff'#233'rentiel'
          GroupIndex = 5
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N3: TMenuItem
          Caption = '-'
          GroupIndex = 5
        end
        object UniY3: TMenuItem
          Caption = 'Y2 Unipolaire'
          GroupIndex = 6
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY3: TMenuItem
          Caption = 'Y2 Diff'#233'rentiel'
          GroupIndex = 6
          RadioItem = True
          OnClick = UniDiffChange
        end
        object N4: TMenuItem
          Caption = '-'
          GroupIndex = 6
        end
        object UniY4: TMenuItem
          Caption = 'Y3 Unipolaire'
          GroupIndex = 7
          RadioItem = True
          OnClick = UniDiffChange
        end
        object DiffY4: TMenuItem
          Caption = 'Y3 Diff'#233'rentiel'
          GroupIndex = 7
          RadioItem = True
          OnClick = UniDiffChange
        end
      end
      object N6: TMenuItem
        Caption = '-'
        GroupIndex = 7
      end
      object MenuDecalZeros: TMenuItem
        Caption = 'D'#233'calages des z'#233'ros'
        GroupIndex = 7
        OnClick = MenuDECALAGEZEROClick
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
      object TempoET_XY: TMenuItem
        Caption = 'Spectre et signal temporel'
        RadioItem = True
        OnClick = MenuECRANClick
      end
      object N15: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object MenuAcumul: TMenuItem
        Caption = 'Mode Accumulation'
        Enabled = False
        Visible = False
        OnClick = MenuOPTIONSClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object MenuInterfaceTaille: TMenuItem
        Caption = 'Taille'
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
      object N5: TMenuItem
        Caption = '-'
      end
      object menuCouleurs: TMenuItem
        Caption = 'Couleur et Epaisseur des courbes'
        OnClick = MenuConfigCOULEURSClick
      end
    end
    object ConfigOscillo: TMenuItem
      Caption = 'Options'
      object menuEnregistrement: TMenuItem
        Caption = 'Boite d'#39'enregistrements'
        OnClick = MenuOPTIONSClick
      end
    end
    object Aide: TMenuItem
      Caption = ' Aide   '
      object Aide1: TMenuItem
        Caption = ' Utilisation ... '
        OnClick = Aide1Click
      end
      object Aide2: TMenuItem
        Caption = ' R'#233'glages Horizontaux  '
        OnClick = Aide2Click
      end
      object Aide3: TMenuItem
        Caption = ' R'#233'glages Verticaux '
        OnClick = Aide3Click
      end
      object Aide3bis: TMenuItem
        Caption = ' Fr'#233'quence d Echantillonnage '
        OnClick = Aide3bisClick
      end
      object Aide4: TMenuItem
        Caption = ' Base de Temps '
        OnClick = Aide4Click
      end
      object Aide6: TMenuItem
        Caption = ' Stop Mesure '
        OnClick = Aide6Click
      end
      object Aide7: TMenuItem
        Caption = ' Logo Cabalab '
        OnClick = Aide7Click
      end
      object Aide8: TMenuItem
        Caption = ' Accumulation '
        OnClick = Aide8Click
      end
      object Aide9: TMenuItem
        Caption = ' Transfert '
        OnClick = Aide9Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object Apropo: TMenuItem
        Caption = 'A Propos ...'
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
    Left = 576
    Top = 24
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
  object TimerDepassementSignal2: TTimer
    Enabled = False
    Interval = 350
    Left = 296
    Top = 547
  end
  object TimerDepassementSignal1: TTimer
    Enabled = False
    Interval = 500
    Left = 264
    Top = 547
  end
  object TimerDepassementSignal3: TTimer
    Enabled = False
    Interval = 400
    Left = 264
    Top = 587
  end
  object TimerDepassementSignal4: TTimer
    Enabled = False
    Interval = 450
    Left = 296
    Top = 587
  end
end
