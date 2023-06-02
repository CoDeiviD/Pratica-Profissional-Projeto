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
  inherited ListView1: TListView
    Columns = <
      item
        Caption = 'Codigo'
      end
      item
        Caption = 'Pais'
        Width = 100
      end
      item
        Caption = 'Sigla'
      end
      item
        Caption = 'DDI'
        Width = 70
      end
      item
        Caption = 'Moeda'
        Width = 60
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
