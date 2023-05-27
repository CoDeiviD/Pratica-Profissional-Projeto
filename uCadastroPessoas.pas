unit uCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uPessoas;

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
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    aPessoa : Pessoas;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure LimpaEdit;                                 override;
    procedure CarregaEdit;                               override;
    procedure BloqueiaEdit;                              override;
    procedure DesbloqueiaEdit;                           override;
    procedure Salvar;                                    override;
    procedure Sair;                                      override;
    procedure setConsulta(pObj: TObject);                override;
  end;

var
  FormCadastroPessoas: TFormCadastroPessoas;

implementation

{$R *.dfm}

procedure TFormCadastroPessoas.BloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroPessoas.btnSalvarClick(Sender: TObject);
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

procedure TFormCadastroPessoas.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNome.Text <> '' then
     self.edtNome.Color := clWindow;
end;

procedure TFormCadastroPessoas.CarregaEdit;
begin
  inherited;

end;

procedure TFormCadastroPessoas.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;

end;

procedure TFormCadastroPessoas.DesbloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroPessoas.LimpaEdit;
begin
  inherited;

end;

procedure TFormCadastroPessoas.Sair;
begin
  inherited;

end;

procedure TFormCadastroPessoas.Salvar;
begin
  inherited;

end;

procedure TFormCadastroPessoas.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
