unit uCtrlProdutos;

interface
 uses uController, uDaoProdutos;

 type CtrlProdutos = class(controller)
   private
   protected
      aDaoProdutos : DaoProdutos;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlProdutos }

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

function CtrlProdutos.salvar(pObj: TObject): string;
begin

end;

end.
