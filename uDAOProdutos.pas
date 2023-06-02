unit uDAOProdutos;

interface
 uses uDao, uColProdutos, uProdutos;

 type DAOProdutos = class(DAO)
   private
   protected
      aColProdutos : ColProdutos;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOProdutos }

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

function DAOProdutos.salvar(pObj: TObject): string;
begin

end;

end.
