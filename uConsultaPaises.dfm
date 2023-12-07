inherited FormConsultaPaises: TFormConsultaPaises
  Caption = 'Ver Paises'
  OnCreate = FormCreate
  ExplicitWidth = 670
  ExplicitHeight = 418
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
    ReadOnly = True
  end
end
