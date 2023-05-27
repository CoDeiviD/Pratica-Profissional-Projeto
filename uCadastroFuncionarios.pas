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
    procedure btnSalvarClick(Sender: TObject);
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
    procedure setConsulta(pObj: TObject);                override;
  end;

var
  FormCadastroFuncionarios: TFormCadastroFuncionarios;

implementation

{$R *.dfm}

procedure TFormCadastroFuncionarios.BloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if length(self.edtNome.Text) = 0 then
  begin
     showmessage('Campo Nome � Obrigat�rio');
     self.edtNome.Color := clYellow;
     self.edtNome.SetFocus;
  end
  else if (self.edtCPF_CNPJ.Text) = '' then
  begin
     showmessage('Campo CPF/CNPJ � Obrigat�rio');
     self.edtCPF_CNPJ.Color := clYellow;
     self.edtCPF_CNPJ.SetFocus;
  end
  else if (self.edtTelefone.Text) = '' then
  begin
     showmessage('Campo Telefone � Obrigat�rio');
     self.edtTelefone.Color := clYellow;
     self.edtTelefone.SetFocus;
  end
  else if (self.edtSalario.MaxLength) = 0 then
  begin
     showmessage('Campo Sal�rio (R$) � Obrigat�rio');
     self.edtSalario.Color := clYellow;
     self.edtSalario.SetFocus;
  end
  else if (self.edtCargaH.MaxLength) = 0 then
  begin
     showmessage('Campo Carga Hor�ria � Obrigat�rio');
     self.edtCargaH.Color := clYellow;
     self.edtCargaH.SetFocus;
  end
  else
  begin
     oFunc.setCodigo(strtoint(self.edtCodigo.Text));
     oFunc.setNome(self.edtNome.Text);
     oFunc.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     oFunc.setTelefone(self.edtTelefone.Text);
     oFunc.setSalario(self.edtSalario.MaxLength);
     oFunc.setCargaH(self.edtCargaH.MaxLength);
  end;
end;

procedure TFormCadastroFuncionarios.CarregaEdit;
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.DesbloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.LimpaEdit;
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.Sair;
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.Salvar;
begin
  inherited;

end;

procedure TFormCadastroFuncionarios.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
