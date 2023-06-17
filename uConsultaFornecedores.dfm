inherited FormConsultaFornecedores: TFormConsultaFornecedores
  Caption = 'Ver Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnInserir: TButton
    OnClick = btnInserirClick
  end
  inherited btnAlterar: TButton
    OnClick = btnAlterarClick
  end
  inherited btnExcluir: TButton
    OnClick = btnExcluirClick
  end
  inherited btnSair: TButton
    OnClick = btnSairClick
  end
  inherited ListView1: TListView
    Columns = <
      item
        Caption = 'Codigo'
      end
      item
        Caption = 'NomeFornecedor'
        Width = 100
      end
      item
        Caption = 'DataNascimento'
        Width = 90
      end
      item
        Caption = 'CPF_CNPJ'
        Width = 80
      end
      item
        Caption = 'Endereco'
        Width = 100
      end
      item
        Caption = 'Email'
        Width = 100
      end
      item
        Caption = 'Telefone'
        Width = 100
      end
      item
        Caption = 'Combustivel'
        Width = 80
      end
      item
        Caption = 'QuantidadeCarga'
        Width = 97
      end
      item
        Caption = 'DataCadastro'
        Width = 100
      end
      item
        Caption = 'DataUltimaAlteracao'
        Width = 120
      end>
    ViewStyle = vsReport
  end
end