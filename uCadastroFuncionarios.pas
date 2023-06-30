unit uCadastroFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls,
  uConsultaCidades, uFuncionario,
  uCtrlFuncs;

type
  TFormCadastroFuncionarios = class(TFormCadastroPessoas)
    lbSalario: TLabel;
    lbCargaH: TLabel;
    edtSalario: TEdit;
    edtCargaH: TEdit;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    oFunc : Funcionarios;
    aCtrlFuncs : CtrlFuncs;
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
  FormCadastroFuncionarios: TFormCadastroFuncionarios;

implementation

{$R *.dfm}

procedure TFormCadastroFuncionarios.BloqueiaEdit;
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
  self.edtSalario.Enabled := false;
  self.edtCargaH.Enabled := false;
end;

procedure TFormCadastroFuncionarios.btnPesquisarClick(Sender: TObject);
var aux : string;
begin
  inherited;
//  aux := umaConsultaCidades.btnSair.Caption;
  umaConsultaCidades.btnSair.Caption := 'Selecionar';
  umaConsultaCidades.ConhecaObj(oFunc.getaCidade, nil);
  umaConsultaCidades.ShowModal;
  umaConsultaCidades.btnSair.Caption := aux;
  self.edtCidade.Text := oFunc.getaCidade.getCidade;
end;

procedure TFormCadastroFuncionarios.CarregaEdit;
begin
  inherited;
  self.edtNome.Text := oFunc.getNome;
  self.edtDtNasc.Text := datetostr(oFunc.getDtNasc);
  self.edtCPF_CNPJ.Text :=  oFunc.getCPF_CNPJ;
  self.edtCEP.Text :=  oFunc.getCEP;
  self.edtRG.Text :=  oFunc.getRG;
  self.edtEndereco.Text := oFunc.getEndereco;
  self.edtEmail.Text := oFunc.getEmail;
  self.edtTelefone.Text := oFunc.getTelefone;
  self.edtMidia.Text := oFunc.getMidia;
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
  self.edtCEP.Enabled := true;
  self.edtRG.Enabled := true;
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
  self.edtMidia.Enabled := true;
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
  edtCEP.Clear;
  edtRG.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtMidia.Clear;
  edtSalario.Clear;
  edtCargaH.Clear;
end;

procedure TFormCadastroFuncionarios.Sair;
begin
  inherited;
  Close;
end;

procedure TFormCadastroFuncionarios.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtNome.Text) = 0 then
     self.edtNome.Color := clYellow;
  if (self.edtCEP.Text) = '' then
     self.edtCEP.Color := clYellow;
  if (self.edtTelefone.Text) = '' then
     self.edtTelefone.Color := clYellow;
  if (self.edtSalario.Text) = '' then
     self.edtSalario.Color := clYellow;
  if (self.edtCargaH.Text) = '' then
     self.edtCargaH.Color := clYellow;
     if ehObrigatorio(self.edtNome.Text, '*') and (length(self.edtNome.Text)= 0) then
     begin
        showmessage('Campo Nome é Obrigatório');
        self.edtNome.SetFocus;
     end
     else if ehObrigatorio(self.edtNome.Text, '*') and (self.edtCEP.Text = '') then
     begin
     showmessage('Campo CEP é Obrigatório');
     self.edtCEP.SetFocus;
     end
     else if ehObrigatorio(self.edtNome.Text, '*') and (self.edtTelefone.Text = '') then
     begin
     showmessage('Campo Telefone é Obrigatório');
     self.edtTelefone.SetFocus;
     end
     else if ehObrigatorio(self.edtNome.Text, '*') and (self.edtSalario.Text = '') then
     begin
     showmessage('Campo Salário (R$) é Obrigatório');
     self.edtSalario.SetFocus;
     end
     else if ehObrigatorio(self.edtNome.Text, '*') and (self.edtCargaH.Text = '') then
     begin
     showmessage('Campo Carga Horária é Obrigatório');
     self.edtCargaH.SetFocus;
     end
     else
     begin
        if self.btnSalvar.Caption = '&Salvar' then
        begin
           oFunc.setCodigo(strtoint(self.edtCodigo.Text));
           oFunc.setNome(self.edtNome.Text);
           oFunc.setDtNasc(self.edtDtNasc.MaxLength);
           oFunc.setCPF_CNPJ(self.edtCPF_CNPJ.Text);
           oFunc.setTelefone(self.edtTelefone.Text);
           oFunc.setSalario(self.edtSalario.MaxLength);
           oFunc.setCargaH(self.edtCargaH.MaxLength);
           msg := aCtrlFuncs.Salvar(oFunc.clone);
           if msg = '' then
              showmessage('Funcionario Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlFuncs.Excluir(oFunc.clone);
           if msg = '' then
              showmessage('Funcionario Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
        inherited;
     end;
end;

end.
