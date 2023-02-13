object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 501
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object lblStatus: TLabel
    Left = 8
    Top = 428
    Width = 72
    Height = 19
    Caption = 'lblStatus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 2
    Top = 41
    Width = 169
    Height = 40
    Caption = 'Solicita'#231#227'o de Acesso'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 325
    Top = 41
    Width = 326
    Height = 460
    Align = alRight
    TabOrder = 1
  end
  object Button2: TButton
    Left = 2
    Top = 84
    Width = 169
    Height = 40
    Caption = 'Gerar Token'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 177
    Top = 90
    Width = 136
    Height = 27
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 10
    Padding.Bottom = 10
    TabOrder = 4
    object Edit2: TEdit
      Left = 0
      Top = 10
      Width = 319
      Height = 21
      Align = alLeft
      BorderStyle = bsNone
      TabOrder = 0
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 325
      Top = 10
      Width = 326
      Height = 21
      Align = alRight
      BorderStyle = bsNone
      TabOrder = 1
      Text = 'Edit3'
    end
  end
  object Button3: TButton
    Left = 0
    Top = 172
    Width = 169
    Height = 40
    Caption = 'Configurar Loja'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 2
    Top = 453
    Width = 201
    Height = 40
    Caption = 'Habilitar abertura de loja'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 2
    Top = 129
    Width = 169
    Height = 40
    Caption = 'Refress Token'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 224
    Top = 456
  end
end
