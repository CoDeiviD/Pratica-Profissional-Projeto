inherited FormCadastroContaPgo: TFormCadastroContaPgo
  Caption = 'Cadastro de Contas a Pagar'
  PixelsPerInch = 96
  TextHeight = 13
  object lbValorPgr: TLabel [4]
    Left = 136
    Top = 21
    Width = 64
    Height = 13
    Caption = 'Valor a Pagar'
  end
  object lbDtVencP: TLabel [5]
    Left = 288
    Top = 21
    Width = 96
    Height = 13
    Caption = 'Data de Vencimento'
  end
  object lbDtPgtoP: TLabel [6]
    Left = 408
    Top = 21
    Width = 95
    Height = 13
    Caption = 'Data de Pagamento'
  end
  object lbValorPgo: TLabel [7]
    Left = 536
    Top = 21
    Width = 60
    Height = 13
    Caption = 'Valor Pago *'
  end
  object lbCodForn: TLabel [8]
    Left = 18
    Top = 80
    Width = 74
    Height = 13
    Caption = 'CodFornecedor'
  end
  inherited btnSalvar: TButton
    Caption = '&Salvar'
  end
  object edtValorPgr: TEdit
    Left = 136
    Top = 40
    Width = 105
    Height = 21
    TabOrder = 5
  end
  object edtDtVencP: TEdit
    Left = 288
    Top = 40
    Width = 97
    Height = 21
    TabOrder = 6
  end
  object edtDtPgtoP: TEdit
    Left = 409
    Top = 40
    Width = 104
    Height = 21
    TabOrder = 7
  end
  object edtValorPgo: TEdit
    Left = 536
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtCodForn: TEdit
    Left = 18
    Top = 99
    Width = 71
    Height = 21
    TabOrder = 9
  end
end
