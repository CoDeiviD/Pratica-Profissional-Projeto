inherited FormConsultaEstados: TFormConsultaEstados
  Caption = 'Ver Estados'
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
        Caption = 'Codigo'
      end
      item
        Caption = 'Estado'
        Width = 100
      end
      item
        Caption = 'UF'
        Width = 70
      end
      item
        Caption = 'CodigoPais'
        Width = 64
      end
      item
        Caption = 'Pais'
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
