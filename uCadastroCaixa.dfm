inherited FormCadastroCaixa: TFormCadastroCaixa
  Caption = 'Cadastro de Caixa'
  ClientWidth = 827
  TextHeight = 13
  object lbData: TLabel [4]
    Left = 113
    Top = 21
    Width = 32
    Height = 13
    Caption = 'Data *'
  end
  object lbHistorico: TLabel [5]
    Left = 233
    Top = 21
    Width = 50
    Height = 13
    Caption = 'Hist'#243'rico *'
  end
  object lbEntrada: TLabel [6]
    Left = 18
    Top = 80
    Width = 38
    Height = 13
    Caption = 'Entrada'
  end
  object lbSaida: TLabel [7]
    Left = 128
    Top = 80
    Width = 26
    Height = 13
    Caption = 'Sa'#237'da'
  end
  object lbSaldoTot: TLabel [8]
    Left = 296
    Top = 80
    Width = 86
    Height = 13
    Caption = 'Saldo Total (R$) *'
  end
  inherited btnSalvar: TButton
    Caption = '&Salvar'
  end
  object edtData: TEdit
    Left = 113
    Top = 40
    Width = 96
    Height = 21
    TabOrder = 5
  end
  object edtHistorico: TEdit
    Left = 233
    Top = 40
    Width = 432
    Height = 21
    TabOrder = 6
  end
  object edtEntrada: TEdit
    Left = 16
    Top = 99
    Width = 89
    Height = 21
    TabOrder = 7
  end
  object edtSaida: TEdit
    Left = 128
    Top = 99
    Width = 105
    Height = 21
    TabOrder = 8
  end
  object edtSaldoTot: TEdit
    Left = 296
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 9
  end
end
