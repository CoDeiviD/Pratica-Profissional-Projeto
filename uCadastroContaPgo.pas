unit uCadastroContaPgo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uContasPgr;

type
  TFormCadastroContaPgo = class(TFormCadastroPai)
    edtValorPgr: TEdit;
    lbValorPgr: TLabel;
    lbDtVencP: TLabel;
    lbDtPgtoP: TLabel;
    lbValorPgo: TLabel;
    lbCodForn: TLabel;
    edtDtVencP: TEdit;
    edtDtPgtoP: TEdit;
    edtValorPgo: TEdit;
    edtCodForn: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    aContaPgr : ContasPgr;
  public
    { Public declarations }
  end;

var
  FormCadastroContaPgo: TFormCadastroContaPgo;

implementation

{$R *.dfm}

procedure TFormCadastroContaPgo.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastroContaPgo.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if length(self.edtValorPgo.Text) = 0 then
  begin
     showmessage('Campo Cidade é Obrigatório');
     self.edtValorPgo.Color := clYellow;
     self.edtValorPgo.SetFocus;
  end
  else
  begin
     aContaPgr.setCodigo(strtoint(self.edtCodigo.Text));
     aContaPgr.setValor(self.edtValorPgr.MaxLength);
     aContaPgr.setDtVencimento(self.edtDtVencP.MaxLength);
     aContaPgr.setDtPagamento(self.edtDtPgtoP.MaxLength);
  end;
end;
end.
