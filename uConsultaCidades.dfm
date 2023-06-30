inherited FormConsultaCidades: TFormConsultaCidades
  Caption = 'Ver Cidades'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
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
end
