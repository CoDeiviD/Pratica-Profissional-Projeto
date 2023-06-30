unit uConsultaEstados;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroEstados, uEstados, uCtrlEstados, uColEstados, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormConsultaEstados = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroEstados : TFormCadastroEstados;
    oEstado : Estados;
    aCtrlEstado : CtrlEstados;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  override;
    procedure Inserir;                    override;
    procedure Alterar;                    override;
    procedure Excluir;                    override;
    procedure Sair;                       override;
    procedure Pesquisar;                  override;
    procedure setCadastro(pCad: TObject); override;
  end;

var
  FormConsultaEstados: TFormConsultaEstados;

implementation

{$R *.dfm}

{ TFormConsultaEstados }

procedure TFormConsultaEstados.Alterar;
var mMsg: string;
begin
  inherited;
  mMsg := aCtrlEstado.Carregar(oEstado);
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.CarregaEdit;
  umFormCadastroEstados.ShowModal;
end;

procedure TFormConsultaEstados.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oEstado := Estados(pObj);
  aCtrlEstado := CtrlEstados(pCtrl);
  self.DBGrid1.DataSource := aCtrlEstado.getDS;
  aCtrlEstado.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaEstados.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlEstado.Carregar(oEstado);
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  mAux := umFormCadastroEstados.btnSalvar.Caption;
  umFormCadastroEstados.btnSalvar.Caption := '&Excluir';
  umFormCadastroEstados.LimpaEdit;

  umFormCadastroEstados.CarregaEdit;
  umFormCadastroEstados.BloqueiaEdit;
  umFormCadastroEstados.ShowModal;
  umFormCadastroEstados.DesbloqueiaEdit;
  umFormCadastroEstados.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaEstados.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroEstados := TFormCadastroEstados.Create(nil);
end;

procedure TFormConsultaEstados.Inserir;
begin
  inherited;
  oEstado.setCodigo(0);
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaEstados.Pesquisar;
begin
  inherited;
  aCtrlEstado.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaEstados.Sair;
begin
  inherited;

//  Close;
end;

procedure TFormConsultaEstados.setCadastro(pCad: TObject);
begin
  inherited;
//  umFormCadastroEstados := TFormCadastroEstados(pCad);
end;

end.
