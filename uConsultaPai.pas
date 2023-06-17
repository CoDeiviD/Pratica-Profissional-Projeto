unit uConsultaPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uPai;

type
  TFormConsultaPai = class(TForm)
    edtBusca: TEdit;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    btnPesquisa: TButton;
    ListView1: TListView;
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  virtual;
    procedure Inserir;                    virtual;
    procedure Alterar;                    virtual;
    procedure Excluir;                    virtual;
    procedure Sair;                       virtual;
    procedure Pesquisar;                  virtual;
    procedure setCadastro(pObj: TObject); virtual;
    procedure CarregaLV;                  virtual;
  end;

var
  FormConsultaPai: TFormConsultaPai;

implementation

{$R *.dfm}

{ TFormConsuktaPai }

procedure TFormConsultaPai.Alterar;
begin

end;

procedure TFormConsultaPai.btnAlterarClick(Sender: TObject);
begin
   Alterar;
end;

procedure TFormConsultaPai.btnExcluirClick(Sender: TObject);
begin
   Excluir;
end;

procedure TFormConsultaPai.btnInserirClick(Sender: TObject);
begin
   Inserir;
end;

procedure TFormConsultaPai.btnPesquisaClick(Sender: TObject);
begin
   Pesquisar;
end;

procedure TFormConsultaPai.btnSairClick(Sender: TObject);
begin
   Sair;
end;

procedure TFormConsultaPai.CarregaLV;
begin

end;

procedure TFormConsultaPai.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin

end;

procedure TFormConsultaPai.Excluir;
begin

end;

procedure TFormConsultaPai.Inserir;
begin

end;

procedure TFormConsultaPai.Pesquisar;
begin

end;

procedure TFormConsultaPai.Sair;
begin
   Close;
end;

procedure TFormConsultaPai.setCadastro(pObj: TObject);
begin

end;

end.
