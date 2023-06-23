unit uCadastroFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls,
  uFornecedor,
  uCtrlForns;

type
  TFormCadastroFornecedores = class(TFormCadastroPessoas)
    lbVCombustivel: TLabel;
    lbQtdeCarga: TLabel;
    edtVCombustivel: TEdit;
    edtQtdeCarga: TEdit;
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    oForn : Fornecedores;
    aCtrlForns : CtrlForns;
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
  FormCadastroFornecedores: TFormCadastroFornecedores;

implementation

{$R *.dfm}

procedure TFormCadastroFornecedores.BloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := false;
  self.edtDtNasc.Enabled := false;
  self.edtCPF_CNPJ.Enabled := false;
  self.edtEndereco.Enabled := false;
  self.edtEmail.Enabled := false;
  self.edtTelefone.Enabled := false;
  self.edtQtdeCarga.Enabled := false;
  self.edtVCombustivel.Enabled := false;
end;

procedure TFormCadastroFornecedores.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNome.Text <> '' then
     self.edtNome.Color := clWindow;
  self.Sair;
end;

procedure TFormCadastroFornecedores.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oForn.getCodigo);
  self.edtNome.Text := oForn.getNome;
  self.edtDtNasc.Text := datetostr(oForn.getDtNasc);
  self.edtCPF_CNPJ.Text :=  oForn.getCPF_CNPJ;
  self.edtEndereco.Text := oForn.getEndereco;
  self.edtEmail.Text := oForn.getEmail;
  self.edtTelefone.Text := oForn.getTelefone;
  self.edtQtdeCarga.Text := floattostr(oForn.getQtdeCarga);
  self.edtVCombustivel.Text := floattostr(oForn.getVCombustivel);
end;

procedure TFormCadastroFornecedores.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oForn :=  Fornecedores(pObj);
  aCtrlForns := CtrlForns(pCtrl);
end;

procedure TFormCadastroFornecedores.DesbloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := true;
  self.edtDtNasc.Enabled := true;
  self.edtCPF_CNPJ.Enabled := true;
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
  self.edtQtdeCarga.Enabled := true;
  self.edtVCombustivel.Enabled := true;
end;

procedure TFormCadastroFornecedores.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtDtNasc.Clear;
  edtCPF_CNPJ.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtVCombustivel.Clear;
  edtQtdeCarga.Clear;
end;

procedure TFormCadastroFornecedores.Sair;
begin
  inherited;
  Close;
end;

procedure TFormCadastroFornecedores.Salvar;
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
  else if (self.edtVCombustivel.Text) = '' then
  begin
     showmessage('Campo Combustível (R$) é Obrigatório');
     self.edtVCombustivel.Color := clYellow;
     self.edtVCombustivel.SetFocus;
  end
  else if (self.edtQtdeCarga.Text) = '' then
  begin
     showmessage('Campo Quantidade Carga é Obrigatório');
     self.edtQtdeCarga.Color := clYellow;
     self.edtQtdeCarga.SetFocus;
  end
  else
  begin
     oForn.setCodigo(strtoint(self.edtCodigo.Text));
     oForn.setNome(self.edtNome.Text);
     oForn.setDtNasc(self.edtDtNasc.MaxLength);
     oForn.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     oForn.setTelefone(self.edtTelefone.Text);
     oForn.setVCombustivel(self.edtVCombustivel.MaxLength);
     oForn.setQtdeCarga(self.edtQtdeCarga.MaxLength);
     aCtrlForns.Salvar(oForn.clone);
  end;
end;

end.
