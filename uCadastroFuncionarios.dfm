inherited FormCadastroFuncionarios: TFormCadastroFuncionarios
  Caption = 'Cadastro de Funcionarios'
  PixelsPerInch = 96
  TextHeight = 13
  object lbSalario: TLabel [10]
    Left = 18
    Top = 168
    Width = 65
    Height = 13
    Caption = 'Sal'#225'rio (R$) *'
  end
  object lbCargaH: TLabel [11]
    Left = 312
    Top = 168
    Width = 76
    Height = 13
    Caption = 'Carga Hor'#225'ria *'
  end
  inherited btnPesquisar: TButton
    TabOrder = 13
  end
  object edtSalario: TEdit
    Left = 16
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object edtCargaH: TEdit
    Left = 312
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 12
  end
end
