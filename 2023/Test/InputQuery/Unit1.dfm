object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Access dialog box'
  ClientHeight = 231
  ClientWidth = 505
  Color = clOlive
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 112
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 351
    Top = 133
    Width = 130
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 112
    Top = 160
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
  end
  object Button1: TButton
    Left = 128
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Register'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 17
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ABSDatabase1: TABSDatabase
    CurrentVersion = '7.93 '
    DatabaseFileName = 'Customers.abs'
    DatabaseName = 'Customers.abs'
    Exclusive = False
    Password = 'Oilnam77'
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 264
    Top = 32
  end
  object ABSTable1: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'Customers.abs'
    InMemory = False
    ReadOnly = False
    TableName = 'Cust01'
    Exclusive = False
    Left = 376
    Top = 32
  end
end
