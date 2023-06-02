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
        Caption = 'Codigo'
      end
      item
        Caption = 'Cidade'
        Width = 100
      end
      item
        Caption = 'DDD'
        Width = 70
      end
      item
        Caption = 'codEstado'
        Width = 62
      end
      item
        Caption = 'Estado'
        Width = 100
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
