unit uCadPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormCadPessoas = class(TForm)
    lbNome: TLabel;
    lbCPF_CNPJ: TLabel;
    lbEmail: TLabel;
    lbDtNasc: TLabel;
    lbTelefone: TLabel;
    lbEndereco: TLabel;
    edtNome: TEdit;
    edtCPF_CNPJ: TEdit;
    edtEmail: TEdit;
    edtDtNasc: TEdit;
    edtTelefone: TEdit;
    edtEndereco: TEdit;
    btnSalvar: TButton;
    btnSair: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadPessoas: TFormCadPessoas;

implementation

{$R *.dfm}

end.
