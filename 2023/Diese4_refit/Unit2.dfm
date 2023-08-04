object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 
    '                                                                ' +
    '                                   Log of Data Entry'
  ClientHeight = 306
  ClientWidth = 780
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 271
    Width = 338
    Height = 26
    Margins.Top = 1
    Margins.Bottom = 1
    AutoSize = False
    Caption = 
      '   LtrTUp =Lt from Last TUp ; PartFill=partial ; LFCons=rate of ' +
      'Cons'#13#10'   Btw TUps ; HrsCalc = Hrs of LFCons calculation ; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 761
    Height = 257
    Color = clBtnFace
    DataSource = Form1.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 360
    Top = 271
    Width = 75
    Height = 25
    Caption = 'close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
