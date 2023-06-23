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
    procedure btnSalvarExit(Sender: TObject);
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

procedure TFormCadastroProduto.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtNomeProd.Text <> '' then
     self.edtNomeProd.Color := clWindow;
  self.Sair;
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
begin
  inherited;
  if length(self.edtNomeProd.Text) = 0 then
  begin
     showmessage('Campo Pais é Obrigatório');
     self.edtNomeProd.Color := clYellow;
     self.edtNomeProd.SetFocus;
  end
  else if (self.edtSabor.Text) = '' then
  begin
     showmessage('Campo Sigla é Obrigatório');
     self.edtSabor.Color := clYellow;
     self.edtSabor.SetFocus;
  end
  else if (self.edtPreco.Text) = '' then
  begin
     showmessage('Campo DDI é Obrigatório');
     self.edtPreco.Color := clYellow;
     self.edtPreco.SetFocus;
  end
  else
  begin
     oProd.setCodigo(strtoint(self.edtCodigo.Text));
     oProd.setTpProduto(self.edtNomeProd.Text);
     oProd.setSabor(self.edtSabor.Text);
     oProd.setPreco(strtofloat(self.edtPreco.Text));
     aCtrlProd.Salvar(oProd.clone);
     inherited;
  end;

end;

end.
