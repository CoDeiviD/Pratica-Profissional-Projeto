inherited FormConsultaPaises: TFormConsultaPaises
  Caption = 'Ver Paises'
  OnCreate = FormCreate
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
    OnClick = nil
  end
  inherited DBGrid1: TDBGrid
    DataSource = DM.DsPaises
    ReadOnly = True
  end
end
