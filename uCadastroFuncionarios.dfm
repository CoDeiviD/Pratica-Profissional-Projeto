inherited FormCadastroFuncionarios: TFormCadastroFuncionarios
  Caption = 'Cadastro de Funcionarios'
  PixelsPerInch = 96
  TextHeight = 13
  object lbSalario: TLabel [10]
    Left = 20
    Top = 248
    Width = 65
    Height = 13
    Caption = 'Sal'#225'rio (R$) *'
  end
  object lbCargaH: TLabel [11]
    Left = 278
    Top = 248
    Width = 76
    Height = 13
    Caption = 'Carga Hor'#225'ria *'
  end
  inherited btnPesquisar: TButton
    TabOrder = 13
    OnClick = btnPesquisarClick
  end
  object edtSalario: TEdit [28]
    Left = 18
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object edtCargaH: TEdit [29]
    Left = 278
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 12
  end
  inherited edtRG: TEdit
    TabOrder = 14
  end
  inherited edtCEP: TEdit
    TabOrder = 15
  end
  inherited edtMidia: TEdit
    TabOrder = 16
  end
  inherited edtCidade: TEdit
    TabOrder = 17
  end
end
