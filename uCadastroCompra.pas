unit uCadastroCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uCadastroPai, uPai,
  uCompras,uCtrlCompras, uConsultaCondPgto, uConsultaProduto, uConsultaFornecedores;

type
  TfrmCadastroCompra = class(TForm)
    edtModelo: TEdit;
    lbModelo: TLabel;
    edtSerie: TEdit;
    edtNumN: TEdit;
    edtCodForn: TEdit;
    btnPesquisar: TButton;
    lbSerie: TLabel;
    lbNumN: TLabel;
    lbCodForn: TLabel;
    edtDtEmis: TEdit;
    edtDtCheg: TEdit;
    lbDtEmis: TLabel;
    lbDtCheg: TLabel;
    LVProdCompra: TListView;
    edtCodProduto: TEdit;
    lbProduto: TLabel;
    btnSalvar: TButton;
    btnSair: TButton;
    btnBuscar: TButton;
    edtForn: TEdit;
    lbFornecedor: TLabel;
    lbCodProduto: TLabel;
    edtProduto: TEdit;
    edtCondPgto: TEdit;
    lbCondPgto: TLabel;
    LVCondPgto: TListView;
    btnGerar: TButton;
    lbDtCad: TLabel;
    lbDtUltAlt: TLabel;
    lbObrigadtorio: TLabel;
    edtDtCad: TEdit;
    edtDtUltAlt: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    aCompra : Compras;
    aCtrlCompra : CtrlCompras;
    umFormConsultaCondPgto : TfrmConsultaCondPgto;
    umFormConsultaProduto : TformConsultaProduto;
    umFormConsultaForns : TformConsultaFornecedores;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); virtual;
    procedure LimpaEdit;                                 virtual;
    procedure CarregaEdit;                               virtual;
    procedure BloqueiaEdit;                              virtual;
    procedure DesbloqueiaEdit;                           virtual;
    procedure Salvar;                                    virtual;
    procedure Sair;                                      virtual;
    procedure setConsulta(pObj: TObject);                virtual;
    function ehObrigatorio(pTexto: string; pLetra: char): boolean; virtual;
  end;

var
  frmCadastroCompra: TfrmCadastroCompra;

implementation

{$R *.dfm}

{ TfrmCadastroCompra }

procedure TfrmCadastroCompra.BloqueiaEdit;
begin
  inherited;
  self.edtModelo.Enabled := false;
  self.edtSerie.Enabled := false;
  self.edtNumN.Enabled := false;
  self.edtDtEmis.Enabled := false;
  self.edtDtCheg.Enabled := false;
  self.edtCodForn.Enabled := false;
  self.edtProduto.Enabled := false;
end;

procedure TfrmCadastroCompra.btnBuscarClick(Sender: TObject);
begin
   umFormConsultaProduto.ShowModal;
end;

procedure TfrmCadastroCompra.btnGerarClick(Sender: TObject);
begin
   umFormConsultaCondPgto.ShowModal;
end;

procedure TfrmCadastroCompra.btnPesquisarClick(Sender: TObject);
var aux : string;
begin
  inherited;
  aux := umFormConsultaForns.btnSair.Caption;
  umFormConsultaForns.btnSair.Caption := 'Selecionar';
  umFormConsultaForns.ConhecaObj(aCompra.getoForn, nil);
  umFormConsultaForns.ShowModal;
  umFormConsultaForns.btnSair.Caption := aux;
  self.edtCodForn.Text := aCompra.getoForn.getNomeFantasia;
end;

procedure TfrmCadastroCompra.btnSairClick(Sender: TObject);
begin
   Sair;
end;

procedure TfrmCadastroCompra.btnSalvarClick(Sender: TObject);
begin
   Salvar;
   Sair;
end;

procedure TfrmCadastroCompra.CarregaEdit;
begin
  inherited;
  self.edtModelo.Text := aCompra.getModelo;
  self.edtSerie.Text := aCompra.getSerie;
  self.edtNumN.Text := floattostr(aCompra.getNumero);
  self.edtDtEmis.Text := datetostr(aCompra.getDtEmissao);
  self.edtDtCheg.Text := datetostr(aCompra.getDtChegada);
  //self.edtCodForn.Text := strtofloat(aCompra.getoForn);
  //self.edtProduto.Text := floattostr(aCompra.getoProduto);
end;

procedure TfrmCadastroCompra.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCompra := Compras(pObj);
  aCtrlCompra := CtrlCompras(pCtrl);
end;

procedure TfrmCadastroCompra.DesbloqueiaEdit;
begin
  inherited;
  self.edtModelo.Enabled := true;
  self.edtSerie.Enabled := true;
  self.edtNumN.Enabled := true;
  self.edtDtEmis.Enabled := true;
  self.edtDtCheg.Enabled := true;
  self.edtCodForn.Enabled := true;
  self.edtProduto.Enabled := true;
end;

function TfrmCadastroCompra.ehObrigatorio(pTexto: string;
  pLetra: char): boolean;
begin

end;

procedure TfrmCadastroCompra.LimpaEdit;
begin
  inherited;
  edtModelo.Clear;
  edtSerie.Clear;
  edtNumN.Clear;
  edtDtEmis.Clear;
  edtDtCheg.Clear;
  edtCodForn.Clear;
  edtProduto.Clear;
end;

procedure TfrmCadastroCompra.Sair;
begin
  inherited;
  Close;
end;

procedure TfrmCadastroCompra.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtModelo.Text) = 0 then
     self.edtModelo.Color := clYellow;
  if length(self.edtSerie.Text) = 0 then
     self.edtSerie.Color := clYellow;
  if length(self.edtNumN.Text) = 0 then
     self.edtNumN.Color := clYellow;
  if ehObrigatorio(self.edtModelo.Text, '*') and (length(self.edtModelo.Text)= 0) then
  begin
     showmessage('Campo Modelo é Obrigatório');
     self.edtModelo.SetFocus;
  end
  else if ehObrigatorio(self.edtModelo.Text, '*') and (self.edtSerie.Text = '') then
  begin
     showmessage('Campo Série é Obrigatório');
     self.edtSerie.SetFocus;
  end
  else if ehObrigatorio(self.edtModelo.Text, '*') and (self.edtNumN.Text = '') then
  begin
     showmessage('Campo Número da Nota é Obrigatório');
     self.edtNumN.SetFocus;
  end
  else
  begin
     if self.btnSalvar.Caption = '&Salvar' then
     begin
        aCompra.setModelo(self.edtModelo.Text);
        aCompra.setSerie(self.edtSerie.Text);
        aCompra.setNumero(strtoint(self.edtNumN.Text));
        msg := aCtrlCompra.Salvar(aCompra.clone);
        if msg = '' then
              showmessage('Produto Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
     end
     else
        begin
           msg := aCtrlCompra.Excluir(aCompra.clone);
           if msg = '' then
              showmessage('Produto Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
     inherited;
     end;

end;

procedure TfrmCadastroCompra.setConsulta(pObj: TObject);
begin
   umformConsultaForns := TFormConsultaFornecedores(pObj);
   umformConsultaProduto := TFormConsultaProduto(pObj);
end;

end.
