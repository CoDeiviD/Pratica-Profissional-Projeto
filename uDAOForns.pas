unit uDAOForns;

interface
 uses uDao, uDM, uColForns, uFornecedor, Data.DB;

 type DAOForns = class(DAO)
   private
   protected
      aColForns : ColFornecedores;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOForns }

function DAOForns.Carregar(pPos: integer): TObject;
begin
   Result := aColForns.Carregar(pPos);
end;

function DAOForns.CarregarColecao: TObject;
begin
   Result := aColForns;
end;

constructor DAOForns.CrieObj;
begin
   aColForns := ColFornecedores.CrieObj;
end;

destructor DAOForns.Destrua_se;
begin
   aColForns.Destrua_se;
end;

function DAOForns.getDS: TDataSource;
begin
   Result := umDM.DsForns;
end;

function DAOForns.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColForns.getTam + 1;
   Fornecedores(pObj).setCodigo(aux);
   aColForns.InsereFim(pObj);
end;

end.
