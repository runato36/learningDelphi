object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 166
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 209
    Height = 17
    Caption = 'Please Input your number in this field:'
  end
  object Button1: TButton
    Left = 408
    Top = 60
    Width = 113
    Height = 25
    Caption = 'submit'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 248
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 1
  end
end
