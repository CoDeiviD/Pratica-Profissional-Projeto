unit uCadastroContaRcb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uContasRcb,
  uCtrlContasRcb;

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
    aContaRcb : ContasRcb;
    aCtrlContaRcb : CtrlContasRcb;
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
  FormCadastroContaRcb: TFormCadastroContaRcb;

implementation

{$R *.dfm}

procedure TFormCadastroContaRcb.BloqueiaEdit;
begin
  inherited;
  self.edtValorRcb.Enabled := false;
  self.edtDtVencR.Enabled := false;
  self.edtDtPgtoR.Enabled := false;
  self.edtValorRcbdo.Enabled := false;
end;

procedure TFormCadastroContaRcb.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(aContaRcb.getCodigo);
  self.edtValorRcb.Text := floattostr(aContaRcb.getValor);
  self.edtDtVencR.Text := floattostr(aContaRcb.getDtVencimento);
  self.edtDtPgtoR.Text := floattostr(aContaRcb.getDtPagamento);
  self.edtValorRcbdo.Text := floattostr(aContaRcb.getVReceb);
end;

procedure TFormCadastroContaRcb.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aContaRcb := ContasRcb(pObj);
  aCtrlContaRcb := CtrlContasRcb(pCtrl);
end;

procedure TFormCadastroContaRcb.DesbloqueiaEdit;
begin
  inherited;
  self.edtValorRcb.Enabled := true;
  self.edtDtVencR.Enabled := true;
  self.edtDtPgtoR.Enabled := true;
  self.edtValorRcbdo.Enabled := true;
end;

procedure TFormCadastroContaRcb.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtValorRcb.Clear;
  edtDtVencR.Clear;
  edtDtPgtoR.Clear;
  edtValorRcb.Clear;
end;

procedure TFormCadastroContaRcb.Sair;
begin
  inherited;

end;

procedure TFormCadastroContaRcb.Salvar;
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
     aCtrlContaRcb.Salvar(aContaRcb.clone);
  end;
end;

end.
