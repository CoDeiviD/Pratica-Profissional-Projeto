inherited FormConsultaClientes: TFormConsultaClientes
  Caption = 'Ver Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListView1: TListView
    Columns = <
      item
        Caption = 'Codigo'
      end
      item
        Caption = 'NomeCliente'
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
        Caption = 'QuantidadeGrupo'
        Width = 97
      end
      item
        Caption = 'Pagou'
        Width = 45
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
