unit uCadastroContaRcb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uContasRcb;

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
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    aContaRcb : ContasRcb;
  public
    { Public declarations }
  end;

var
  FormCadastroContaRcb: TFormCadastroContaRcb;

implementation

{$R *.dfm}

procedure TFormCadastroContaRcb.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastroContaRcb.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if length(self.edtValorRcbdo.Text) = 0 then
  begin
     showmessage('Campo Cidade é Obrigatório');
     self.edtValorRcbdo.Color := clYellow;
     self.edtValorRcbdo.SetFocus;
  end
  else
  begin
     aContaRcb.setCodigo(strtoint(self.edtCodigo.Text));
     aContaRcb.setValor(self.edtValorRcb.MaxLength);
     aContaRcb.setDtVencimento(self.edtDtVencR.MaxLength);
     aContaRcb.setDtPagamento(self.edtDtPgtoR.MaxLength);
  end;
end;

end.
