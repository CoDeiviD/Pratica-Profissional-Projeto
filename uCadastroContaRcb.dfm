inherited FormCadastroContaRcb: TFormCadastroContaRcb
  Caption = 'Cadastro de Contas a Receber'
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodCliente: TLabel [4]
    Left = 18
    Top = 77
    Width = 52
    Height = 13
    Caption = 'CodCliente'
  end
  object lbValorRcb: TLabel [5]
    Left = 128
    Top = 21
    Width = 76
    Height = 13
    Caption = 'Valor a Receber'
  end
  object lbDtVencR: TLabel [6]
    Left = 304
    Top = 21
    Width = 81
    Height = 13
    Caption = 'Data Vencimento'
  end
  object lbDtPgtoR: TLabel [7]
    Left = 480
    Top = 21
    Width = 80
    Height = 13
    Caption = 'Data Pagamento'
  end
  object lbValorRcbdo: TLabel [8]
    Left = 648
    Top = 21
    Width = 80
    Height = 13
    Caption = 'Valor Recebido *'
  end
  inherited edtCodigo: TEdit
    Left = 18
    ExplicitLeft = 18
  end
  object edtValorRcb: TEdit
    Left = 128
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtDtVencR: TEdit
    Left = 304
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtDtPgtoR: TEdit
    Left = 480
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edtValorRcbdo: TEdit
    Left = 648
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtCodCliente: TEdit
    Left = 16
    Top = 96
    Width = 73
    Height = 21
    TabOrder = 9
  end
end
