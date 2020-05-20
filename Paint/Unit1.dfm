object frmPaint: TfrmPaint
  Left = 0
  Top = 0
  Caption = 'Russel Paint'
  ClientHeight = 516
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 407
    Top = 8
    Width = 500
    Height = 500
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Label1: TLabel
    Left = 24
    Top = 45
    Width = 38
    Height = 16
    Caption = 'Color:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblInstruct: TLabel
    Left = 24
    Top = 392
    Width = 6
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 151
    Top = 125
    Width = 132
    Height = 13
    Caption = 'Click Iimage on list to load it'
  end
  object Label3: TLabel
    Left = 119
    Top = 294
    Width = 161
    Height = 13
    Caption = 'Image must be saved as a bitmap'
  end
  object pnlColor: TPanel
    Left = 64
    Top = 40
    Width = 25
    Height = 24
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    OnClick = pnlColorClick
  end
  object btnClear: TButton
    Left = 271
    Top = 80
    Width = 89
    Height = 25
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnClearClick
  end
  object btnDrawR: TButton
    Left = 176
    Top = 80
    Width = 89
    Height = 25
    Caption = 'Draw Rectangle'
    TabOrder = 2
    OnClick = btnDrawRClick
  end
  object btnSave: TButton
    Left = 286
    Top = 334
    Width = 89
    Height = 25
    Caption = 'Save to File'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object Button4: TButton
    Left = 95
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Pen Width'
    TabOrder = 4
    OnClick = Button4Click
  end
  object btnDrawE: TButton
    Left = 271
    Top = 40
    Width = 89
    Height = 25
    Caption = 'Draw Ellipse'
    TabOrder = 5
    OnClick = btnDrawEClick
  end
  object Button1: TButton
    Left = 286
    Top = 289
    Width = 89
    Height = 25
    Caption = 'Load from File'
    TabOrder = 6
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 151
    Top = 144
    Width = 121
    Height = 126
    ItemHeight = 13
    TabOrder = 7
    OnClick = ListBox1Click
  end
  object Button3: TButton
    Left = 286
    Top = 144
    Width = 89
    Height = 25
    Caption = 'Save to List'
    TabOrder = 8
    OnClick = Button3Click
  end
  object btnDrawL: TButton
    Left = 176
    Top = 40
    Width = 89
    Height = 25
    Caption = 'Draw Line'
    TabOrder = 9
    OnClick = btnDrawLClick
  end
  object btnFreeHand: TButton
    Left = 95
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Free Hand'
    TabOrder = 10
    OnClick = btnFreeHandClick
  end
  object ColorListBox1: TColorListBox
    Left = 64
    Top = 71
    Width = 121
    Height = 97
    TabOrder = 11
    Visible = False
    OnClick = ColorListBox1Click
  end
  object cmbPenWidth: TComboBox
    Left = 95
    Top = 111
    Width = 145
    Height = 21
    TabOrder = 12
    Text = 'Pen Width'
    Visible = False
    OnChange = cmbPenWidthChange
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.bmp'
    Left = 80
    Top = 192
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 192
  end
end
