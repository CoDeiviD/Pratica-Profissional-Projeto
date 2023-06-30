unit uCadastroFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls, uPai,
  uConsultaProduto, uConsultaCidades, uFornecedor,
  uCtrlForns;

type
  TFormCadastroFornecedores = class(TFormCadastroPai)
    lbNomeFant: TLabel;
    edtNomeFant: TEdit;
    edtRazSoc: TEdit;
    lbRazSoc: TLabel;
    edtInscrEstad: TEdit;
    lbInscrEstad: TLabel;
    edtCNPJ: TEdit;
    edtCEP: TEdit;
    edtEndereco: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    lbCEP: TLabel;
    lbEndereco: TLabel;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    edtpProdutoF: TEdit;
    edtCidade: TEdit;
    lbpProdutoF: TLabel;
    Label2: TLabel;
    btnPesquisaP: TButton;
    btnPesquisaC: TButton;
    lbCNPJ: TLabel;
    procedure btnPesquisaCClick(Sender: TObject);
    procedure btnPesquisaPClick(Sender: TObject);
  private
    { Private declarations }
    oForn : Fornecedores;
    aCtrlForns : CtrlForns;
    umaConsultaProduto : TFormConsultaProduto;
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
    procedure setConsulta(pObj: TObject);                override;
  end;

var
  FormCadastroFornecedores: TFormCadastroFornecedores;

implementation

{$R *.dfm}

{ TFormCadastroFornecedores }

procedure TFormCadastroFornecedores.BloqueiaEdit;
begin
  inherited;
  self.edtNomeFant.Enabled := false;
  self.edtRazSoc.Enabled := false;
  self.edtInscrEstad.Enabled := false;
  self.edtCNPJ.Enabled := false;
  self.edtCEP.Enabled := false;
  self.edtEndereco.Enabled := false;
  self.edtEmail.Enabled := false;
  self.edtTelefone.Enabled := false;
end;

procedure TFormCadastroFornecedores.btnPesquisaCClick(Sender: TObject);
var aux : string;
begin
  inherited;
  aux := umaConsultaCidades.btnSair.Caption;
  umaConsultaCidades.btnSair.Caption := 'Selecionar';
  umaConsultaCidades.ConhecaObj(oForn.getaCidade, nil);
  umaConsultaCidades.ShowModal;
  umaConsultaCidades.btnSair.Caption := aux;
  self.edtCidade.Text := oForn.getaCidade.getCidade;
end;

procedure TFormCadastroFornecedores.btnPesquisaPClick(Sender: TObject);
var aux : string;
begin
  inherited;
  aux := umaConsultaProduto.btnSair.Caption;
  umaConsultaProduto.btnSair.Caption := 'Selecionar';
  umaConsultaProduto.ConhecaObj(oForn.getoProduto, nil);
  umaConsultaProduto.ShowModal;
  umaConsultaProduto.btnSair.Caption := aux;
  self.edtCidade.Text := oForn.getoProduto.getTpProduto;
end;

procedure TFormCadastroFornecedores.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oForn.getCodigo);
  self.edtNomeFant.Text := oForn.getNomeFantasia;
  self.edtRazSoc.Text := oForn.getRazaoSocial;
  self.edtCNPJ.Text :=  oForn.getCNPJ;
  self.edtEndereco.Text := oForn.getEndereco;
  self.edtEmail.Text := oForn.getEmail;
  self.edtTelefone.Text := oForn.getTelefone;
end;

procedure TFormCadastroFornecedores.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oForn := Fornecedores(pObj);
  aCtrlForns := CtrlForns(pCtrl);
end;

procedure TFormCadastroFornecedores.DesbloqueiaEdit;
begin
  inherited;
  self.edtNomeFant.Enabled := true;
  self.edtRazSoc.Enabled := true;
  self.edtInscrEstad.Enabled := true;
  self.edtCNPJ.Enabled := true;
  self.edtCEP.Enabled := true;
  self.edtEndereco.Enabled := true;
  self.edtEmail.Enabled := true;
  self.edtTelefone.Enabled := true;
end;

procedure TFormCadastroFornecedores.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNomeFant.Clear;
  edtRazSoc.Clear;
  edtInscrEstad.Clear;
  edtCNPJ.Clear;
  edtCEP.Clear;
  edtEndereco.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
end;

procedure TFormCadastroFornecedores.Sair;
begin
  inherited;

end;

procedure TFormCadastroFornecedores.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtNomeFant.Text) = 0 then
     self.edtNomeFant.Color := clYellow;
  if (self.edtRazSoc.Text) = '' then
     self.edtRazSoc.Color := clYellow;
  if (self.edtCNPJ.Text) = '' then
     self.edtCNPJ.Color := clYellow;
  if (self.edtCEP.Text) = '' then
     self.edtCEP.Color := clYellow;
     if ehObrigatorio(self.edtNomeFant.Text, '*') and (length(self.edtNomeFant.Text)= 0) then
     begin
       showmessage('Campo Nome Fantasia é Obrigatório');
       self.edtNomeFant.SetFocus;
     end
     else if ehObrigatorio(self.edtNomeFant.Text, '*') and (self.edtRazSoc.Text = '') then
     begin
       showmessage('Campo Razão Social é Obrigatório');
       self.edtRazSoc.SetFocus;
     end
     else if ehObrigatorio(self.edtNomeFant.Text, '*') and (self.edtCNPJ.Text = '') then
     begin
        showmessage('Campo CNPJ é Obrigatório');
        self.edtCNPJ.SetFocus;
     end
     else if ehObrigatorio(self.edtNomeFant.Text, '*') and (self.edtCEP.Text = '') then
     begin
        showmessage('Campo CEP é Obrigatório');
        self.edtCEP.SetFocus;
     end
     else
     begin
        if self.btnSalvar.Caption = '&Salvar' then
        begin
          oForn.setCodigo(strtoint(self.edtCodigo.Text));
          oForn.setNomeFantasia(self.edtNomeFant.Text);
          oForn.setRazaoSocial(self.edtRazSoc.Text);
          oForn.setInscrEstadual(self.edtInscrEstad.Text);
          oForn.setCNPJ(self.edtCNPJ.Text);
          oForn.setCEP(self.edtCEP.Text);
          oForn.setEndereco(self.edtEndereco.Text);
          oForn.setTelefone(self.edtTelefone.Text);
          oForn.setEmail(self.edtEmail.Text);
          msg := aCtrlForns.Salvar(oForn.clone);
          if msg = '' then
             showmessage('Fornecedor Salvo com sucesso!')
          else
           showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlForns.Excluir(oForn.clone);
           if msg = '' then
              showmessage('Fornecedor Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
       inherited;
     end;
end;

procedure TFormCadastroFornecedores.setConsulta(pObj: TObject);
begin
  inherited;
  umaConsultaCidades := TFormConsultaCidades(pObj);
  umaConsultaProduto := TFormConsultaProduto(pObj);
end;

end.
