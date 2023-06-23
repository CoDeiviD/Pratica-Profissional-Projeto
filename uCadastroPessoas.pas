unit uCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls, uPai,
  uPessoas,
  uCtrlPessoas;

type
  TFormCadastroPessoas = class(TFormCadastroPai)
    lbNome: TLabel;
    edtNome: TEdit;
    lbDtNasc: TLabel;
    edtDtNasc: TEdit;
    lbCPF_CNPJ: TLabel;
    lbEndereco: TLabel;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    edtCPF_CNPJ: TEdit;
    edtEndereco: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    btnPesquisar: TButton;
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    aPessoa : Pessoas;
    aCtrlPessoa : CtrlPessoas;
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
  FormCadastroPessoas: TFormCadastroPessoas;

implementation

{$R *.dfm}

procedure TFormCadastroPessoas.BloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := false;
  self.edtDtNasc.Enabled := false;
  self.edtCPF_CNPJ.Enabled := false;
  self.edtEndereco.Enabled := false;
  self.edtEmail.Enabled := false;
  self.edtTelefone.Enabled := false;
end;

procedure TFormCadastroPessoas.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNome.Text <> '' then
     self.edtNome.Color := clWindow;
end;

procedure TFormCadastroPessoas.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(aPessoa.getCodigo);
  self.edtNome.Text := aPessoa.getNome;
  self.edtDtNasc.Text := datetostr(aPessoa.getDtNasc);
  self.edtCPF_CNPJ.Text :=  aPessoa.getCPF_CNPJ;
  self.edtEndereco.Text := aPessoa.getEndereco;
  self.edtEmail.Text := aPessoa.getEmail;
  self.edtTelefone.Text := aPessoa.getTelefone;
end;

procedure TFormCadastroPessoas.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aPessoa := Pessoas(pObj);
  aCtrlPessoa := CtrlPessoas(pCtrl);
end;

procedure TFormCadastroPessoas.DesbloqueiaEdit;
begin
  inherited;
  self.edtNome.Enabled := true;
  self.edtDtNasc.Enabled := true;
  self.edtCPF_CNPJ.Enabled := true;
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
end;

procedure TFormCadastroPessoas.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtCPF_CNPJ.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
end;

procedure TFormCadastroPessoas.Sair;
begin
  inherited;
  Close;
end;

procedure TFormCadastroPessoas.Salvar;
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
  else
  begin
     aPessoa.setCodigo(strtoint(self.edtCodigo.Text));
     aPessoa.setNome(self.edtNome.Text);
     aPessoa.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     aPessoa.setTelefone(self.edtTelefone.Text);
end;
end;

end.
