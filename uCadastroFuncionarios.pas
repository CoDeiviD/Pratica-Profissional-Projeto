unit uCadastroFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls,
  uFuncionario,
  uCtrlFuncs;

type
  TFormCadastroFuncionarios = class(TFormCadastroPessoas)
    lbSalario: TLabel;
    lbCargaH: TLabel;
    edtSalario: TEdit;
    edtCargaH: TEdit;
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    oFunc : Funcionarios;
    aCtrlFuncs : CtrlFuncs;
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
  FormCadastroFuncionarios: TFormCadastroFuncionarios;

implementation

{$R *.dfm}

procedure TFormCadastroFuncionarios.BloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := false;
  self.edtDtNasc.Enabled := false;
  self.edtCPF_CNPJ.Enabled := false;
  self.edtEndereco.Enabled := false;
  self.edtEmail.Enabled := false;
  self.edtTelefone.Enabled := false;
  self.edtSalario.Enabled := false;
  self.edtCargaH.Enabled := false;
end;

procedure TFormCadastroFuncionarios.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNome.Text <> '' then
     self.edtNome.Color := clWindow;
  self.Sair;
end;

procedure TFormCadastroFuncionarios.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oFunc.getCodigo);
  self.edtNome.Text := oFunc.getNome;
  self.edtDtNasc.Text := datetostr(oFunc.getDtNasc);
  self.edtCPF_CNPJ.Text :=  oFunc.getCPF_CNPJ;
  self.edtEndereco.Text := oFunc.getEndereco;
  self.edtEmail.Text := oFunc.getEmail;
  self.edtTelefone.Text := oFunc.getTelefone;
  self.edtSalario.Text := floattostr(oFunc.getSalario);
  self.edtCargaH.Text := timetostr(oFunc.getCargaH);
end;

procedure TFormCadastroFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFunc := Funcionarios(pObj);
  aCtrlFuncs := CtrlFuncs(pCtrl);
end;

procedure TFormCadastroFuncionarios.DesbloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := true;
  self.edtDtNasc.Enabled := true;
  self.edtCPF_CNPJ.Enabled := true;
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
  self.edtSalario.Enabled := true;
  self.edtCargaH.Enabled := true;
end;

procedure TFormCadastroFuncionarios.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtDtNasc.Clear;
  edtCPF_CNPJ.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtSalario.Clear;
  edtCargaH.Clear;
end;

procedure TFormCadastroFuncionarios.Sair;
begin
  inherited;
  Close;
end;

procedure TFormCadastroFuncionarios.Salvar;
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
  else if (self.edtSalario.Text) = '' then
  begin
     showmessage('Campo Salário (R$) é Obrigatório');
     self.edtSalario.Color := clYellow;
     self.edtSalario.SetFocus;
  end
  else if (self.edtCargaH.Text) = '' then
  begin
     showmessage('Campo Carga Horária é Obrigatório');
     self.edtCargaH.Color := clYellow;
     self.edtCargaH.SetFocus;
  end
  else
  begin
     oFunc.setCodigo(strtoint(self.edtCodigo.Text));
     oFunc.setNome(self.edtNome.Text);
     oFunc.setDtNasc(self.edtDtNasc.MaxLength);
     oFunc.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     oFunc.setTelefone(self.edtTelefone.Text);
     oFunc.setSalario(self.edtSalario.MaxLength);
     oFunc.setCargaH(self.edtCargaH.MaxLength);
     aCtrlFuncs.Salvar(oFunc.clone);
  end;
end;

end.
