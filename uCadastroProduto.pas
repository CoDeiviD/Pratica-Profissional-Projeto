unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls, uPai,
  uProdutos,
  uCtrlProdutos;

type
  TFormCadastroProduto = class(TFormCadastroPai)
    lbNomeProd: TLabel;
    lbSabor: TLabel;
    lbPreco: TLabel;
    edtNomeProd: TEdit;
    edtSabor: TEdit;
    edtPreco: TEdit;
  private
    { Private declarations }
    oProd : Produtos;
    aCtrlProd : CtrlProdutos;
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
  FormCadastroProduto: TFormCadastroProduto;

implementation

{$R *.dfm}

procedure TFormCadastroProduto.BloqueiaEdit;
begin
  inherited;
  self.edtNomeProd.Enabled := false;
  self.edtSabor.Enabled := false;
  self.edtPreco.Enabled := false;
end;

procedure TFormCadastroProduto.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oProd.getCodigo);
  self.edtNomeProd.Text := oProd.getTpProduto;
  self.edtSabor.Text := oProd.getSabor;
  self.edtPreco.Text := floattostr(oProd.getPreco);
end;

procedure TFormCadastroProduto.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oProd := Produtos(pObj);
  aCtrlProd := CtrlProdutos(pCtrl);
end;

procedure TFormCadastroProduto.DesbloqueiaEdit;
begin
  inherited;
  self.edtNomeProd.Enabled := true;
  self.edtSabor.Enabled := true;
  self.edtPreco.Enabled := true;
end;

procedure TFormCadastroProduto.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNomeProd.Clear;
  edtSabor.Clear;
  edtPreco.Clear;
end;

procedure TFormCadastroProduto.Sair;
begin
  inherited;

end;

procedure TFormCadastroProduto.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtNomeProd.Text) = 0 then
     self.edtNomeProd.Color := clYellow;
  if length(self.edtPreco.Text) = 0 then
     self.edtPreco.Color := clYellow;
  if ehObrigatorio(self.edtNomeProd.Text, '*') and (length(self.edtNomeProd.Text)= 0) then
  begin
     showmessage('Campo TpProduto é Obrigatório');
     self.edtNomeProd.SetFocus;
  end
  else if ehObrigatorio(self.edtNomeProd.Text, '*') and (self.edtPreco.Text = '') then
  begin
     showmessage('Campo Preço é Obrigatório');
     self.edtPreco.SetFocus;
  end
  else
  begin
     if self.btnSalvar.Caption = '&Salvar' then
     begin
        oProd.setCodigo(strtoint(self.edtCodigo.Text));
        oProd.setTpProduto(self.edtNomeProd.Text);
        oProd.setSabor(self.edtSabor.Text);
        oProd.setPreco(strtofloat(self.edtPreco.Text));
        msg := aCtrlProd.Salvar(oProd.clone);
        if msg = '' then
              showmessage('Produto Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
     end
     else
        begin
           msg := aCtrlProd.Excluir(oProd.clone);
           if msg = '' then
              showmessage('Produto Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
     inherited;
     end;

end;
end.
