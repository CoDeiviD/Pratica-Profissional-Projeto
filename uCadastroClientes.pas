unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls,
  uCliente;

type
  TFormCadastroClientes = class(TFormCadastroPessoas)
    lbQtdeGrupo: TLabel;
    edtQtdeGrupo: TEdit;
    CBPagou: TCheckBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    oCliente : Clientes;
  public
    { Public declarations }

    procedure setConsulta(pObj : TObject); override;
  end;

var
  FormCadastroClientes: TFormCadastroClientes;

implementation

{$R *.dfm}

procedure TFormCadastroClientes.btnSalvarClick(Sender: TObject);
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
  else if (self.edtQtdeGrupo.MaxLength) = 0 then
  begin
     showmessage('Campo Quantidade no Grupo é Obrigatório');
     self.edtQtdeGrupo.Color := clYellow;
     self.edtQtdeGrupo.SetFocus;
  end
  else if (self.CBPagou.Checked) = True then
  begin
     showmessage('Campo Pagou é Obrigatório');
     self.CBPagou.Color := clYellow;
     self.CBPagou.SetFocus;
  end
  else
  begin
     oCliente.setCodigo(strtoint(self.edtCodigo.Text));
     oCliente.setNome(self.edtNome.Text);
     oCliente.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     oCliente.setTelefone(self.edtTelefone.Text);
     oCliente.setQtdeGrupo(self.edtQtdeGrupo.MaxLength);
     oCliente.setPagou(self.CBPagou.Checked);
  end;
end;

procedure TFormCadastroClientes.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNome.Text <> '' then
     self.edtNome.Color := clWindow;
end;

procedure TFormCadastroClientes.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
