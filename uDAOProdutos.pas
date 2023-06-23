unit uDAOProdutos;

interface
 uses uDao, uDM, uColProdutos, uProdutos, Data.DB;

 type DAOProdutos = class(DAO)
   private
   protected
      aColProdutos : ColProdutos;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOProdutos }

function DAOProdutos.Carregar(pPos: integer): TObject;
begin
   Result := aColProdutos.Carregar(pPos);
end;

function DAOProdutos.CarregarColecao: TObject;
begin
   Result := aColProdutos;
end;

constructor DAOProdutos.CrieObj;
begin
   aColProdutos := ColProdutos.CrieObj;
end;

destructor DAOProdutos.Destrua_se;
begin
   aColProdutos.Destrua_se;
end;

function DAOProdutos.getDS: TDataSource;
begin
   Result := umDM.DSProdutos;
end;

function DAOProdutos.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColProdutos.getTam + 1;
   Produtos(pObj).setCodigo(aux);
   aColProdutos.InsereFim(pObj);
end;

end.
