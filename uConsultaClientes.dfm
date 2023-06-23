inherited FormConsultaClientes: TFormConsultaClientes
  Caption = 'Ver Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnAlterar: TButton
    OnClick = btnAlterarClick
  end
  inherited btnExcluir: TButton
    OnClick = btnExcluirClick
  end
  inherited btnSair: TButton
    OnClick = btnSairClick
  end
  inherited btnPesquisa: TButton
    OnClick = btnPesquisaClick
  end
  inherited ListView1: TListView
    Left = 24
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'NomeCliente'
      end
      item
        Caption = 'DataNascimento'
      end
      item
        Caption = 'CPF_CNPJ'
      end
      item
        Caption = 'Endereco'
      end
      item
        Caption = 'Email'
      end
      item
        Caption = 'Telefone'
      end
      item
        Caption = 'NGrupo'
      end
      item
        Caption = 'Pagou'
      end>
    ViewStyle = vsReport
    ExplicitLeft = 24
  end
end
