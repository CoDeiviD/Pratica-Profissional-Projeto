unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls,
  uConsultaCidades, uCliente,
  uCtrlClientes;

type
  TFormCadastroClientes = class(TFormCadastroPessoas)
    lbCFS: TLabel;
    edtCFS: TEdit;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente : Clientes;
    aCtrlCliente : CtrlClientes;
    umaConsultaCidades : TFormConsultaCidades;
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
  FormCadastroClientes: TFormCadastroClientes;

implementation

{$R *.dfm}

procedure TFormCadastroClientes.BloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := false;
  self.edtDtNasc.Enabled := false;
  self.edtCPF_CNPJ.Enabled := false;
  self.edtCEP.Enabled := false;
  self.edtRG.Enabled := false;
  self.edtEndereco.Enabled := false;
  self.edtEmail.Enabled := false;
  self.edtTelefone.Enabled := false;
  self.edtMidia.Enabled := false;
  self.edtCFS.Enabled := false;
end;

procedure TFormCadastroClientes.btnPesquisarClick(Sender: TObject);
var aux : string;
begin
  inherited;
  aux := umaConsultaCidades.btnSair.Caption;
  umaConsultaCidades.btnSair.Caption := 'Selecionar';
  umaConsultaCidades.ConhecaObj(oCliente.getaCidade, nil);
  umaConsultaCidades.ShowModal;
  umaConsultaCidades.btnSair.Caption := aux;
  self.edtCidade.Text := oCliente.getaCidade.getCidade;
end;

procedure TFormCadastroClientes.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oCliente.getCodigo);
  self.edtNome.Text := oCliente.getNome;
  self.edtDtNasc.Text := datetostr(oCliente.getDtNasc);
  self.edtCPF_CNPJ.Text :=  oCliente.getCPF_CNPJ;
  self.edtCEP.Text :=  oCliente.getCEP;
  self.edtRG.Text :=  oCliente.getRG;
  self.edtEndereco.Text := oCliente.getEndereco;
  self.edtEmail.Text := oCliente.getEmail;
  self.edtTelefone.Text := oCliente.getTelefone;
  self.edtMidia.Text := oCliente.getMidia;
  self.edtCFS.Text := oCliente.getCFS;
end;

procedure TFormCadastroClientes.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
   oCliente := Clientes(pObj);
   aCtrlCliente := CtrlClientes(pCtrl);
end;

procedure TFormCadastroClientes.DesbloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := true;
  self.edtDtNasc.Enabled := true;
  self.edtCPF_CNPJ.Enabled := true;
  self.edtCEP.Enabled := true;
  self.edtRG.Enabled := true;
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
  self.edtMidia.Enabled := true;
  self.edtCFS.Enabled := true;
end;

procedure TFormCadastroClientes.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtDtNasc.Clear;
  edtCPF_CNPJ.Clear;
  edtCEP.Clear;
  edtRG.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtMidia.Clear;
  edtCFS.Clear;
end;

procedure TFormCadastroClientes.Sair;
begin
  inherited;
  Close;
end;

procedure TFormCadastroClientes.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtNome.Text) = 0 then
     self.edtNome.Color := clYellow;
  if (self.edtCEP.Text) = '' then
     self.edtCEP.Color := clYellow;
  if (self.edtTelefone.Text) = '' then
     self.edtTelefone.Color := clYellow;
     if ehObrigatorio(self.edtNome.Text, '*') and (length(self.edtNome.Text)= 0) then
     begin
       showmessage('Campo Nome é Obrigatório');
       self.edtNome.SetFocus;
     end
     else if ehObrigatorio(self.edtNome.Text, '*') and (self.edtCEP.Text = '') then
     begin
       showmessage('Campo CEP é Obrigatório');
       self.edtCPF_CNPJ.SetFocus;
     end
     else if ehObrigatorio(self.edtNome.Text, '*') and (self.edtTelefone.Text = '') then
     begin
        showmessage('Campo Telefone é Obrigatório');
        self.edtTelefone.SetFocus;
     end
     else
     begin
        if self.btnSalvar.Caption = '&Salvar' then
        begin
          oCliente.setCodigo(strtoint(self.edtCodigo.Text));
          oCliente.setNome(self.edtNome.Text);
          oCliente.setDtNasc(self.edtDtNasc.MaxLength);
          oCliente.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
          oCliente.setRG(self.edtRG.Text);
          oCliente.setCEP(self.edtCEP.Text);
          oCliente.setEndereco(self.edtEndereco.Text);
          oCliente.setEmail(self.edtEmail.Text);
          oCliente.setTelefone(self.edtTelefone.Text);
          oCliente.setMidia(self.edtMidia.Text);
          oCliente.setCFS(self.edtCFS.Text);
          msg := aCtrlCliente.Salvar(oCliente.clone);
          if msg = '' then
             showmessage('Cliente Salvo com sucesso!')
          else
           showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlCliente.Excluir(oCliente.clone);
           if msg = '' then
              showmessage('Cliente Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
       inherited;
     end;
end;

end.
