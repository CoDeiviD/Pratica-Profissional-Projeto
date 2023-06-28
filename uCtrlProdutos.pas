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
      function Carregar(pObj : TObject): string;   override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlProdutos }

function CtrlProdutos.Carregar(pObj : TObject): string;
begin
   Result := aDaoProdutos.Carregar(pObj);
end;

constructor CtrlProdutos.CrieObj;
begin
   aDaoProdutos := DaoProdutos.CrieObj;
end;

destructor CtrlProdutos.Destrua_se;
begin
   aDaoProdutos.Destrua_se;
end;

function CtrlProdutos.Excluir(pObj: TOBject): string;
begin
   Result := aDaoProdutos.Excluir(pObj);
end;

function CtrlProdutos.getDS: TDataSource;
begin
   Result := aDaoProdutos.getDS;
end;

function CtrlProdutos.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mProduto : Produtos;
begin
   Result := aDaoProdutos.Pesquisar(pChave);

end;

function CtrlProdutos.salvar(pObj: TObject): string;
begin
   Result := aDaoProdutos.Salvar(pObj);
end;

procedure CtrlProdutos.setDM(pDM: TObject);
begin
  inherited;
   aDaoProdutos.setDM(pDm);
end;

end.
