inherited FormCadastroPessoas: TFormCadastroPessoas
  Caption = 'Cadastro de Pessoas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCodigo: TLabel
    Width = 42
    Caption = 'C'#243'digo *'
    ExplicitWidth = 42
  end
  object lbNome: TLabel [4]
    Left = 120
    Top = 21
    Width = 84
    Height = 13
    Caption = 'Nome Completo *'
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
    Width = 57
    Height = 13
    Caption = 'CPF / CNPJ '
  end
  object lbEndereco: TLabel [7]
    Left = 299
    Top = 93
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object lbEmail: TLabel [8]
    Left = 18
    Top = 189
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object lbTelefone: TLabel [9]
    Left = 278
    Top = 189
    Width = 51
    Height = 13
    Caption = 'Telefone *'
  end
  object lbRG: TLabel [10]
    Left = 18
    Top = 93
    Width = 14
    Height = 13
    Caption = 'RG'
  end
  object lbCEP: TLabel [11]
    Left = 160
    Top = 93
    Width = 28
    Height = 13
    Caption = 'CEP *'
  end
  object lbMidia: TLabel [12]
    Left = 598
    Top = 93
    Width = 24
    Height = 13
    Caption = 'Midia'
  end
  object lbCidade: TLabel [13]
    Left = 512
    Top = 189
    Width = 33
    Height = 13
    Caption = 'Cidade'
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
    Left = 299
    Top = 112
    Width = 281
    Height = 21
    TabOrder = 8
  end
  object edtEmail: TEdit
    Left = 18
    Top = 208
    Width = 240
    Height = 21
    TabOrder = 9
  end
  object edtTelefone: TEdit
    Left = 278
    Top = 208
    Width = 204
    Height = 21
    TabOrder = 10
  end
  object btnPesquisar: TButton
    Left = 729
    Top = 206
    Width = 75
    Height = 25
    Caption = 'P&esquisar'
    TabOrder = 11
  end
  object edtRG: TEdit
    Left = 18
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 12
  end
  object edtCEP: TEdit
    Left = 160
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object edtMidia: TEdit
    Left = 598
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object edtCidade: TEdit
    Left = 512
    Top = 208
    Width = 207
    Height = 21
    TabOrder = 15
  end
end
