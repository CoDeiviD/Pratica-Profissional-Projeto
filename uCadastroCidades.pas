unit uCadastroCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uConsultaEstados, uCidades;

type
  TFormCadastroCidades = class(TFormCadastroPai)
    lbCidade: TLabel;
    edtCidade: TEdit;
    lbDDD: TLabel;
    edtDDD: TEdit;
    lbCodEstado: TLabel;
    edtCodEstado: TEdit;
    lbEstado: TLabel;
    edtEstado: TEdit;
    btnPesquisar: TButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSalvarExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    aCidade : Cidades;
    umaConsultaEstados : TFormConsultaEstados;
  public
    { Public declarations }
    procedure setConsulta(pObj : TObject); override;
  end;

var
  FormCadastroCidades: TFormCadastroCidades;

implementation

{$R *.dfm}

procedure TFormCadastroCidades.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  umaConsultaEstados.ConhecaObj(aCidade.getoEstado, nil);
  umaConsultaEstados.ShowModal;
  self.edtCodEstado.Text := inttostr(aCidade.getoEstado.getCodigo);
  self.edtEstado.Text := aCidade.getoEstado.getEstado;
end;

procedure TFormCadastroCidades.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastroCidades.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if length(self.edtCidade.Text) = 0 then
  begin
     showmessage('Campo Cidade é Obrigatório');
     self.edtCidade.Color := clYellow;
     self.edtCidade.SetFocus;
  end
  else if (self.edtDDD.Text) = '' then
  begin
     showmessage('Campo DDD é Obrigatório');
     self.edtDDD.Color := clYellow;
     self.edtDDD.SetFocus;
  end
  else
  begin
     aCidade.setCodigo(strtoint(self.edtCodigo.Text));
     aCidade.setCidade(self.edtCidade.Text);
     aCidade.setDDD(self.edtDDD.Text);
  end;
end;

procedure TFormCadastroCidades.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtCidade.Text <> '' then
     self.edtCidade.Color := clWindow;
end;

procedure TFormCadastroCidades.setConsulta(pObj: TObject);
begin
  inherited;
  umaConsultaEstados := TFormConsultaEstados(pObj);
end;

end.
