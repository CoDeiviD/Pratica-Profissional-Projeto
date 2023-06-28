unit uCadastroContaPgo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uContasPgr,
  uCtrlContasPgr;

type
  TFormCadastroContaPgo = class(TFormCadastroPai)
    edtValorPgr: TEdit;
    lbValorPgr: TLabel;
    lbDtVencP: TLabel;
    lbDtPgtoP: TLabel;
    lbValorPgo: TLabel;
    edtDtVencP: TEdit;
    edtDtPgtoP: TEdit;
    edtValorPgo: TEdit;
    lbCodForn: TLabel;
    edtCodForn: TEdit;
  private
    { Private declarations }
    aContaPgr : ContasPgr;
    aCtrlContaPgr: CtrlContasPgr;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure LimpaEdit;                                 override;
    procedure CarregaEdit;                               override;
    procedure BloqueiaEdit;                              override;
    procedure DesbloqueiaEdit;                           override;
    procedure Salvar;                                    override;
    procedure Sair;                                      override;
  end;

var
  FormCadastroContaPgo: TFormCadastroContaPgo;

implementation

{$R *.dfm}

procedure TFormCadastroContaPgo.BloqueiaEdit;
begin
  inherited;
  self.edtValorPgr.Enabled := false;
  self.edtDtVencP.Enabled := false;
  self.edtDtPgtoP.Enabled := false;
  self.edtValorPgo.Enabled := false;
end;

procedure TFormCadastroContaPgo.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(aContaPgr.getCodigo);
  self.edtValorPgr.Text := floattostr(aContaPgr.getValor);
  self.edtDtVencP.Text := floattostr(aContaPgr.getDtVencimento);
  self.edtDtPgtoP.Text := floattostr(aContaPgr.getDtPagamento);
  self.edtValorPgo.Text := floattostr(aContaPgr.getVPago);
end;

procedure TFormCadastroContaPgo.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aContaPgr := ContasPgr(pObj);
  aCtrlContaPgr := CtrlContasPgr(pCtrl);
end;

procedure TFormCadastroContaPgo.DesbloqueiaEdit;
begin
  inherited;
  self.edtValorPgr.Enabled := true;
  self.edtDtVencP.Enabled := true;
  self.edtDtPgtoP.Enabled := true;
  self.edtValorPgo.Enabled := true;
end;

procedure TFormCadastroContaPgo.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtValorPgr.Clear;
  edtDtVencP.Clear;
  edtDtPgtoP.Clear;
  edtValorPgo.Clear;
end;

procedure TFormCadastroContaPgo.Sair;
begin
  inherited;

end;

procedure TFormCadastroContaPgo.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtValorPgo.Text) = 0 then
     self.edtValorPgo.Color := clYellow;
     if ehObrigatorio(self.edtValorPgo.Text, '*') and (length(self.edtValorPgo.Text)= 0) then
     begin
     showmessage('Campo Valor Pago é Obrigatório');
     self.edtValorPgo.SetFocus;
     end
     else
     begin
        if self.btnSalvar.Caption = '&Salvar' then
        begin
           aContaPgr.setCodigo(strtoint(self.edtCodigo.Text));
           aContaPgr.setValor(self.edtValorPgr.MaxLength);
           aContaPgr.setDtVencimento(self.edtDtVencP.MaxLength);
           aContaPgr.setDtPagamento(self.edtDtPgtoP.MaxLength);
           msg := aCtrlContaPgr.Salvar(aContaPgr.clone);
           if msg = '' then
              showmessage('Conta a Pagar Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlContaPgr.Excluir(aContaPgr.clone);
           if msg = '' then
              showmessage('Conta a Pagar Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
        inherited;
     end;
end;

end.
