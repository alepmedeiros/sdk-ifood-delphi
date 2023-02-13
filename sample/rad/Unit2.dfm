object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Consultar Lojas'
  ClientHeight = 653
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 653
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 420
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 201
      Height = 40
      Align = alTop
      Caption = 'Listar Lojas'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = -1
      ExplicitTop = 8
      ExplicitWidth = 186
    end
    object Button2: TButton
      Left = 0
      Top = 40
      Width = 201
      Height = 40
      Align = alTop
      Caption = 'Detalhes da Loja'
      TabOrder = 1
      OnClick = Button2Click
      ExplicitLeft = -1
      ExplicitTop = 49
      ExplicitWidth = 186
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 83
      Width = 201
      Height = 5
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      TabOrder = 2
      ExplicitTop = 120
    end
    object Button4: TButton
      Left = 0
      Top = 91
      Width = 201
      Height = 40
      Align = alTop
      Caption = 'Status da loja'
      TabOrder = 3
      OnClick = Button4Click
      ExplicitTop = 8
    end
    object Button3: TButton
      Left = 0
      Top = 131
      Width = 201
      Height = 40
      Align = alTop
      Caption = 'Lista interrup'#231#245'es da loja'
      TabOrder = 4
      OnClick = Button3Click
      ExplicitTop = 8
    end
    object Button5: TButton
      Left = 0
      Top = 171
      Width = 201
      Height = 40
      Align = alTop
      Caption = 'Criar interrup'#231#245'es'
      TabOrder = 5
      OnClick = Button5Click
      ExplicitTop = 8
    end
    object Button6: TButton
      Left = 0
      Top = 211
      Width = 201
      Height = 40
      Align = alTop
      Caption = 'Excluir Interrup'#231#245'es'
      TabOrder = 6
      OnClick = Button6Click
      ExplicitTop = 8
    end
  end
  object Panel2: TPanel
    Left = 201
    Top = 0
    Width = 675
    Height = 653
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 331
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Memo1: TMemo
      Left = 0
      Top = 472
      Width = 675
      Height = 181
      Align = alBottom
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 462
      Width = 675
      Height = 10
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 431
    end
    object ListView1: TListView
      Left = 0
      Top = 0
      Width = 675
      Height = 462
      Align = alClient
      BorderStyle = bsNone
      Columns = <
        item
          Caption = 'Id'
          Width = 200
        end
        item
          Caption = 'Nome'
          Width = 260
        end
        item
          Caption = 'Status'
          Width = 150
        end>
      TabOrder = 2
      ViewStyle = vsReport
      ExplicitLeft = 136
      ExplicitTop = 176
      ExplicitWidth = 250
      ExplicitHeight = 150
    end
  end
end
