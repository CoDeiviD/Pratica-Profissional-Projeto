unit uDAOPaises;

interface
 uses uDao, uDM, uColPaises, uPaises, Data.DB;

 type DAOPaises = class(DAO)
   private
   protected
      aColPaises : ColPaises;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOPaises }

function DAOPaises.Carregar(pPos: integer): TObject;
begin
   Result := aColPaises.Carregar(pPos);
end;

function DAOPaises.CarregarColecao: TObject;
begin
   result := aColPaises;
end;

constructor DAOPaises.CrieObj;
begin
   aColPaises := ColPaises.CrieObj;
end;

destructor DAOPaises.Destrua_se;
begin
   aColPaises.Destrua_se;
end;

function DAOPaises.getDS: TDataSource;
begin
   Result := umDM.DsPaises;
end;

function DAOPaises.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColPaises.getTam + 1;
   paises(pObj).setCodigo(aux);
   aColPaises.InsereFim(pObj);
end;

end.
