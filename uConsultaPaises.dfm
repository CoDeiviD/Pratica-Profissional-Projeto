inherited FormConsultaPaises: TFormConsultaPaises
  Caption = 'Ver Paises'
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
        Caption = 'Pais'
      end
      item
        Caption = 'Sigla'
      end
      item
        Caption = 'DDI'
      end
      item
        Caption = 'Moeda'
      end>
    ViewStyle = vsReport
  end
end
