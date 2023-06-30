inherited FormCadastroFornecedores: TFormCadastroFornecedores
  Caption = 'Cadastro de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomeFant: TLabel [4]
    Left = 112
    Top = 21
    Width = 80
    Height = 13
    Caption = 'Nome Fantasia *'
  end
  object lbRazSoc: TLabel [5]
    Left = 360
    Top = 24
    Width = 69
    Height = 13
    Caption = 'Raz'#227'o Social *'
  end
  object lbInscrEstad: TLabel [6]
    Left = 512
    Top = 21
    Width = 87
    Height = 13
    Caption = 'Inscri'#231#227'o Estadual'
  end
  object lbCEP: TLabel [7]
    Left = 16
    Top = 88
    Width = 28
    Height = 13
    Caption = 'CEP *'
  end
  object lbEndereco: TLabel [8]
    Left = 168
    Top = 88
    Width = 45
    Height = 13
    Caption = 'Endereco'
  end
  object lbEmail: TLabel [9]
    Left = 408
    Top = 88
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lbTelefone: TLabel [10]
    Left = 632
    Top = 88
    Width = 51
    Height = 13
    Caption = 'Telefone *'
  end
  object lbpProdutoF: TLabel [11]
    Left = 16
    Top = 152
    Width = 130
    Height = 13
    Caption = 'Principal Produto Fornecido'
  end
  object Label2: TLabel [12]
    Left = 408
    Top = 152
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lbCNPJ: TLabel [13]
    Left = 656
    Top = 21
    Width = 34
    Height = 13
    Caption = 'CNPJ *'
  end
  inherited btnSalvar: TButton
    Caption = '&Salvar'
  end
  object edtNomeFant: TEdit
    Left = 112
    Top = 40
    Width = 229
    Height = 21
    TabOrder = 5
  end
  object edtRazSoc: TEdit
    Left = 360
    Top = 40
    Width = 134
    Height = 21
    TabOrder = 6
  end
  object edtInscrEstad: TEdit
    Left = 512
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edtCNPJ: TEdit
    Left = 656
    Top = 40
    Width = 161
    Height = 21
    TabOrder = 8
  end
  object edtCEP: TEdit
    Left = 16
    Top = 104
    Width = 133
    Height = 21
    TabOrder = 9
  end
  object edtEndereco: TEdit
    Left = 168
    Top = 104
    Width = 217
    Height = 21
    TabOrder = 10
  end
  object edtEmail: TEdit
    Left = 408
    Top = 104
    Width = 209
    Height = 21
    TabOrder = 11
  end
  object edtTelefone: TEdit
    Left = 634
    Top = 104
    Width = 185
    Height = 21
    TabOrder = 12
  end
  object edtpProdutoF: TEdit
    Left = 16
    Top = 168
    Width = 205
    Height = 21
    TabOrder = 13
  end
  object edtCidade: TEdit
    Left = 408
    Top = 168
    Width = 225
    Height = 21
    TabOrder = 14
  end
  object btnPesquisaP: TButton
    Left = 240
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 15
    OnClick = btnPesquisaPClick
  end
  object btnPesquisaC: TButton
    Left = 656
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 16
    OnClick = btnPesquisaCClick
  end
end
