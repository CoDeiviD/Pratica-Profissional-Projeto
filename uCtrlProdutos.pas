unit uCtrlProdutos;

interface
 uses uController, uProdutos, uDaoProdutos, Data.DB;

 type CtrlProdutos = class(controller)
   private
   protected
      aDaoProdutos : DaoProdutos;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
      function Pesquisar (pChave: string; pOBJ: TObject): integer; override;
 end;
implementation

{ CtrlProdutos }

function CtrlProdutos.Carregar(pPos: integer): TObject;
begin
   Result := aDaoProdutos.Carregar(pPos);
end;

function CtrlProdutos.CarregarColecao: TObject;
begin
   Result := aDAOProdutos.CarregarColecao;
end;

constructor CtrlProdutos.CrieObj;
begin
   aDaoProdutos := DaoProdutos.CrieObj;
end;

destructor CtrlProdutos.Destrua_se;
begin
   aDaoProdutos.Destrua_se;
end;

function CtrlProdutos.getDS: TDataSource;
begin
   Result := aDaoProdutos.getDS;
end;

function CtrlProdutos.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mProduto : Produtos;
begin
   mProduto := Produtos(pObj);
   if mProduto.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlProdutos.salvar(pObj: TObject): string;
begin
   aDaoProdutos.Salvar(pObj);
end;

procedure CtrlProdutos.setDM(pDM: TObject);
begin
  inherited;
   aDaoProdutos.setDM(pDm);
end;

end.
