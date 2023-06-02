unit uCadastroContaRcb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls;

type
  TFormCadastroContaRcb = class(TFormCadastroPai)
    edtValorRcb: TEdit;
    edtDtVencR: TEdit;
    edtDtPgtoR: TEdit;
    edtValorRcbdo: TEdit;
    edtCodCliente: TEdit;
    lbCodCliente: TLabel;
    lbValorRcb: TLabel;
    lbDtVencR: TLabel;
    lbDtPgtoR: TLabel;
    lbValorRcbdo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroContaRcb: TFormCadastroContaRcb;

implementation

{$R *.dfm}

end.
