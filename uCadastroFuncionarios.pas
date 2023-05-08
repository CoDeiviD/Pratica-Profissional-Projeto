unit uCadastroFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls;

type
  TFormCadastroFuncionarios = class(TFormCadastroPessoas)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroFuncionarios: TFormCadastroFuncionarios;

implementation

{$R *.dfm}

end.
