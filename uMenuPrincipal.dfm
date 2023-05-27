object FormSorveteria: TFormSorveteria
  Left = 0
  Top = 0
  Caption = 'Sorveteria Ligeirinho'
  ClientHeight = 385
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 232
    Top = 120
    object Cadastros1: TMenuItem
      Caption = 'C&adastros'
      object Endereo1: TMenuItem
        Caption = 'En&dere'#231'o'
        object Pases1: TMenuItem
          Caption = '&Pa'#237'ses'
          OnClick = Pases1Click
        end
        object Estados1: TMenuItem
          Caption = '&Estados'
          OnClick = Estados1Click
        end
        object Cidades1: TMenuItem
          Caption = '&Cidades'
          OnClick = Cidades1Click
        end
      end
      object Usurio1: TMenuItem
        Caption = 'Usu&'#225'rio'
        object Clientes1: TMenuItem
          Caption = '&Clientes'
          OnClick = Clientes1Click
        end
        object Fornecedores1: TMenuItem
          Caption = 'For&necedores'
          OnClick = Fornecedores1Click
        end
        object Funcionrios1: TMenuItem
          Caption = 'F&uncion'#225'rios'
          OnClick = Funcionrios1Click
        end
      end
    end
    object Visualizao1: TMenuItem
      Caption = '&Visualiza'#231#227'o'
      object Local1: TMenuItem
        Caption = '&Local'
      end
      object Clientes2: TMenuItem
        Caption = '&Clientes'
      end
      object Fornecedores2: TMenuItem
        Caption = 'For&necedores'
      end
      object Funcionarios1: TMenuItem
        Caption = 'F&uncionarios'
      end
    end
    object Atribui1: TMenuItem
      Caption = 'A&tribui'#231#227'o'
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      object Sair2: TMenuItem
        Caption = 'Sair'
        OnClick = Sair2Click
      end
    end
  end
end
