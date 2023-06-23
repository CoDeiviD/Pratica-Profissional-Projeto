unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls,
  uCliente,
  uCtrlClientes;

type
  TFormCadastroClientes = class(TFormCadastroPessoas)
    lbQtdeGrupo: TLabel;
    edtQtdeGrupo: TEdit;
    CBPagou: TCheckBox;
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    oCliente : Clientes;
    aCtrlCliente : CtrlClientes;
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
  self.edtEndereco.Enabled := false;
  self.edtEmail.Enabled := false;
  self.edtTelefone.Enabled := false;
  self.edtQtdeGrupo.Enabled := false;
  self.CBPagou.Enabled := false;
end;

procedure TFormCadastroClientes.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNome.Text <> '' then
     self.edtNome.Color := clWindow;
  self.Sair;
end;

procedure TFormCadastroClientes.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oCliente.getCodigo);
  self.edtNome.Text := oCliente.getNome;
  self.edtDtNasc.Text := datetostr(oCliente.getDtNasc);
  self.edtCPF_CNPJ.Text :=  oCliente.getCPF_CNPJ;
  self.edtEndereco.Text := oCliente.getEndereco;
  self.edtEmail.Text := oCliente.getEmail;
  self.edtTelefone.Text := oCliente.getTelefone;
  self.edtQtdeGrupo.Text := floattostr(oCliente.getQtdeGrupo);
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
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
  self.edtQtdeGrupo.Enabled := true;
  self.CBPagou.Enabled := true;
end;

procedure TFormCadastroClientes.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtDtNasc.Clear;
  edtCPF_CNPJ.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtQtdeGrupo.Clear;
end;

procedure TFormCadastroClientes.Sair;
begin
  inherited;

end;

procedure TFormCadastroClientes.Salvar;
begin
  inherited;
  if length(self.edtNome.Text) = 0 then
  begin
     showmessage('Campo Nome é Obrigatório');
     self.edtNome.Color := clYellow;
     self.edtNome.SetFocus;
  end
  else if (self.edtCPF_CNPJ.Text) = '' then
  begin
     showmessage('Campo CPF/CNPJ é Obrigatório');
     self.edtCPF_CNPJ.Color := clYellow;
     self.edtCPF_CNPJ.SetFocus;
  end
  else if (self.edtTelefone.Text) = '' then
  begin
     showmessage('Campo Telefone é Obrigatório');
     self.edtTelefone.Color := clYellow;
     self.edtTelefone.SetFocus;
  end
  else if (self.edtQtdeGrupo.Text) = '' then
  begin
     showmessage('Campo Quantidade no Grupo é Obrigatório');
     self.edtQtdeGrupo.Color := clYellow;
     self.edtQtdeGrupo.SetFocus;
  end
  else
  begin
     oCliente.setCodigo(strtoint(self.edtCodigo.Text));
     oCliente.setNome(self.edtNome.Text);
     oCliente.setDtNasc(self.edtDtNasc.MaxLength);
     oCliente.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     oCliente.setTelefone(self.edtTelefone.Text);
     oCliente.setQtdeGrupo(self.edtQtdeGrupo.MaxLength);
     oCliente.setPagou(self.CBPagou.Checked);
     aCtrlCliente.Salvar(oCliente.clone);
  end;
end;

end.
