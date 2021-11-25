object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = '             Move books from a shelf'
  ClientHeight = 162
  ClientWidth = 212
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clRed
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 132
    Height = 13
    Caption = 'FROM shelf coordinates'
  end
  object Label2: TLabel
    Left = 40
    Top = 67
    Width = 115
    Height = 13
    Caption = 'TO shelf coordinates'
  end
  object Label3: TLabel
    Left = 32
    Top = 24
    Width = 42
    Height = 13
    Caption = 'Column'
  end
  object Label4: TLabel
    Left = 145
    Top = 24
    Width = 24
    Height = 13
    Caption = 'Row'
  end
  object Label5: TLabel
    Left = 32
    Top = 80
    Width = 42
    Height = 13
    Caption = 'Column'
  end
  object Label6: TLabel
    Left = 145
    Top = 80
    Width = 24
    Height = 13
    Caption = 'Row'
  end
  object Edit1: TEdit
    Left = 24
    Top = 40
    Width = 57
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 132
    Top = 40
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 24
    Top = 99
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 132
    Top = 99
    Width = 57
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 80
    Top = 136
    Width = 49
    Height = 18
    Caption = 'Done'
    TabOrder = 4
    OnClick = Button1Click
  end
end
