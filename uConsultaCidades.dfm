inherited FormConsultaCidades: TFormConsultaCidades
  Caption = 'Ver Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnInserir: TButton
    OnClick = btnInserirClick
  end
  inherited btnAlterar: TButton
    Top = 351
    OnClick = btnAlterarClick
    ExplicitTop = 351
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
        Caption = 'Cidade'
      end
      item
        Caption = 'DDI'
      end
      item
        Caption = 'Estado'
      end>
    ViewStyle = vsReport
  end
end
