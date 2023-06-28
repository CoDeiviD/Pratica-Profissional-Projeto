unit uCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls, uPai,
  uPessoas,
  uCtrlPessoas,
  uConsultaCidades;

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
    lbRG: TLabel;
    lbCEP: TLabel;
    edtRG: TEdit;
    edtCEP: TEdit;
    lbMidia: TLabel;
    edtMidia: TEdit;
    edtCidade: TEdit;
    lbCidade: TLabel;
  private
    { Private declarations }
    aPessoa : Pessoas;
    aCtrlPessoa : CtrlPessoas;
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
  FormCadastroPessoas: TFormCadastroPessoas;

implementation

{$R *.dfm}

procedure TFormCadastroPessoas.BloqueiaEdit;
begin
  inherited;

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
  Close;
end;

procedure TFormCadastroPessoas.Salvar;
begin
  inherited;
  
end;

end.
