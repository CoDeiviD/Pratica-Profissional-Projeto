unit uConsultaContaRcb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroContaRcb, uContasRcb, uCtrlContasRcb, uColContasRcb;

type
  TFormConsultaContaRcb = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroContaRcb : TFormCadastroContaRcb;
    aContaRcb : ContasRcb;
    aCtrlContaRcb: CtrlContasRcb;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  override;
    procedure Inserir;                    override;
    procedure Alterar;                    override;
    procedure Excluir;                    override;
    procedure Sair;                       override;
    procedure Pesquisar;                  override;
    procedure setCadastro(pObj: TObject); override;
    procedure CarregaLV;                  override;
  end;

var
  FormConsultaContaRcb: TFormConsultaContaRcb;

implementation

{$R *.dfm}

{ TFormConsultaContaRcb }

procedure TFormConsultaContaRcb.Alterar;
begin
  inherited;

end;

procedure TFormConsultaContaRcb.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaContaRcb.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaContaRcb.btnInserirClick(Sender: TObject);
begin
   self.Inserir;
end;

procedure TFormConsultaContaRcb.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaContaRcb.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    aContaRcb  : ContasRcb;
    aColContaRcb : ColContasRcb;
begin
  inherited;
  aColContaRcb := ColContasRcb(aCtrlContaRcb.CarregarColecao);
  self.ListView1.Clear;
  tam := aColContaRcb.getTam;
  for k  := 1 to tam do
  begin
     aContaRcb := ContasRcb(aColContaRcb.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(aContaRcb.getCodigo);
     LVItem.Caption := floattostr(aContaRcb.getValor);
     LVItem.Caption := datetostr(aContaRcb.getDtVencimento);
     LVItem.Caption := datetostr(aContaRcb.getDtPagamento);
     LVItem.Caption := floattostr(aContaRcb.getVReceb);
  end;
end;

procedure TFormConsultaContaRcb.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aContaRcb := ContasRcb(pObj);
  aCtrlContaRcb := CtrlContasRcb(pCtrl);
end;

procedure TFormConsultaContaRcb.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroContaRcb.btnSalvar.Caption;
  umFormCadastroContaRcb.btnSalvar.Caption := '&Excluir';
  umFormCadastroContaRcb.ConhecaObj(aContaRcb, aCtrlContaRcb);
  umFormCadastroContaRcb.LimpaEdit;
  umFormCadastroContaRcb.CarregaEdit;
  umFormCadastroContaRcb.ShowModal;
  umFormCadastroContaRcb.btnSalvar.Caption := aux;
end;

procedure TFormConsultaContaRcb.Inserir;
begin
  inherited;
  umFormCadastroContaRcb.ConhecaObj(aContaRcb, aCtrlContaRcb);
  umFormCadastroContaRcb.LimpaEdit;
  umFormCadastroContaRcb.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaContaRcb.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaContaRcb.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaContaRcb.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroContaRcb := TFormCadastroContaRcb(pObj);
end;

end.
