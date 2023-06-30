inherited FormConsultaPaises: TFormConsultaPaises
  Caption = 'Ver Paises'
  OnCreate = FormCreate
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
    OnClick = nil
  end
  inherited DBGrid1: TDBGrid
    DataSource = DM.DsPaises
    ReadOnly = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPAIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGLA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOEDA'
        Visible = True
      end>
  end
end
