inherited FormConsultaFornecedores: TFormConsultaFornecedores
  Caption = 'Ver Fornecedores'
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
end
