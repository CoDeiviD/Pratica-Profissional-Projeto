object frmCadastroCondPgto: TfrmCadastroCondPgto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Condi'#231#227'o de Pagamento'
  ClientHeight = 521
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbPrazo: TLabel
    Left = 8
    Top = 24
    Width = 121
    Height = 15
    Caption = 'Prazo de Parcelamento'
  end
  object lbFormaPgto: TLabel
    Left = 184
    Top = 24
    Width = 114
    Height = 15
    Caption = 'Forma de Pagamento'
  end
  object lbPerc: TLabel
    Left = 488
    Top = 24
    Width = 77
    Height = 15
    Caption = 'Percentual (%)'
  end
  object lbVTot: TLabel
    Left = 608
    Top = 24
    Width = 117
    Height = 15
    Caption = 'Valor Total do Produto'
  end
  object edtPrazo: TEdit
    Left = 8
    Top = 45
    Width = 145
    Height = 23
    TabOrder = 0
  end
  object edtFormaPgto: TEdit
    Left = 184
    Top = 45
    Width = 273
    Height = 23
    TabOrder = 1
  end
  object edtPerc: TEdit
    Left = 488
    Top = 45
    Width = 89
    Height = 23
    TabOrder = 2
  end
  object edtVTot: TEdit
    Left = 608
    Top = 45
    Width = 113
    Height = 23
    TabOrder = 3
  end
  object btnSalvar: TButton
    Left = 576
    Top = 472
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 4
  end
  object btnSair: TButton
    Left = 680
    Top = 472
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 5
  end
end
