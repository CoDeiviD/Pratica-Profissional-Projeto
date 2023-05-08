inherited FormCadastroPessoas: TFormCadastroPessoas
  Caption = 'Cadastro de Pessoas'
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel [4]
    Left = 120
    Top = 21
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object lbDtNasc: TLabel [5]
    Left = 408
    Top = 21
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object lbCPF_CNPJ: TLabel [6]
    Left = 560
    Top = 21
    Width = 54
    Height = 13
    Caption = 'CPF / CNPJ'
  end
  object lbEndereco: TLabel [7]
    Left = 18
    Top = 96
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object lbEmail: TLabel [8]
    Left = 313
    Top = 96
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object lbTelefone: TLabel [9]
    Left = 581
    Top = 96
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object edtNome: TEdit
    Left = 120
    Top = 40
    Width = 265
    Height = 21
    TabOrder = 5
  end
  object edtDtNasc: TEdit
    Left = 408
    Top = 40
    Width = 89
    Height = 21
    TabOrder = 6
  end
  object edtCPF_CNPJ: TEdit
    Left = 560
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edtEndereco: TEdit
    Left = 8
    Top = 120
    Width = 281
    Height = 21
    TabOrder = 8
  end
  object edtEmail: TEdit
    Left = 313
    Top = 120
    Width = 232
    Height = 21
    TabOrder = 9
  end
  object edtTelefone: TEdit
    Left = 573
    Top = 120
    Width = 204
    Height = 21
    TabOrder = 10
  end
end
