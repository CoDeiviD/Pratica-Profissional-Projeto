unit uCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls;

type
  TFormCadastroPessoas = class(TFormCadastroPai)
    lbNome: TLabel;
    edtNome: TEdit;
    lbDtNasc: TLabel;
    edtDtNasc: TEdit;
    lbCPF_CNPJ: TLabel;
    lbEndereco: TLabel;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    edtCPF_CNPJ: TEdit;
    edtEndereco: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPessoas: TFormCadastroPessoas;

implementation

{$R *.dfm}

end.
