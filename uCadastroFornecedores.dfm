inherited FormCadastroFornecedores: TFormCadastroFornecedores
  Caption = 'Cadastro de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  object lbVCombustivel: TLabel [10]
    Left = 18
    Top = 176
    Width = 91
    Height = 13
    Caption = 'Combust'#237'vel (R$) *'
  end
  object lbQtdeCarga: TLabel [11]
    Left = 288
    Top = 176
    Width = 97
    Height = 13
    Caption = 'Quantidade Carga *'
  end
  inherited btnPesquisar: TButton
    TabOrder = 13
  end
  object edtVCombustivel: TEdit
    Left = 18
    Top = 195
    Width = 141
    Height = 21
    TabOrder = 11
  end
  object edtQtdeCarga: TEdit
    Left = 288
    Top = 195
    Width = 130
    Height = 21
    TabOrder = 12
  end
end
