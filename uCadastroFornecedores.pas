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
    procedure btnSalvarClick(Sender: TObject);
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
    procedure setConsulta(pObj: TObject);                override;
  end;

var
  FormCadastroFornecedores: TFormCadastroFornecedores;

implementation

{$R *.dfm}

procedure TFormCadastroFornecedores.BloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroFornecedores.btnSalvarClick(Sender: TObject);
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
     oForn.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
     oForn.setTelefone(self.edtTelefone.Text);
     oForn.setVCombustivel(self.edtVCombustivel.MaxLength);
     oForn.setQtdeCarga(self.edtQtdeCarga.MaxLength);
  end;
end;

procedure TFormCadastroFornecedores.CarregaEdit;
begin
  inherited;

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

end;

procedure TFormCadastroFornecedores.LimpaEdit;
begin
  inherited;

end;

procedure TFormCadastroFornecedores.Sair;
begin
  inherited;

end;

procedure TFormCadastroFornecedores.Salvar;
begin
  inherited;

end;

procedure TFormCadastroFornecedores.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
