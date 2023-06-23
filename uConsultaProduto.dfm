inherited FormConsultaProduto: TFormConsultaProduto
  Caption = 'Ver Produtos'
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
  inherited btnPesquisa: TButton
    OnClick = btnPesquisaClick
  end
  inherited ListView1: TListView
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'Nome do Produto'
      end
      item
        Caption = 'Sabor'
      end
      item
        Caption = 'Pre'#231'o'
      end>
    ViewStyle = vsReport
  end
end
