unit uDAOCidades;

interface
 uses uDao, uDM, uColCidades, uCidades, Data.DB;

 type DAOCidades = class(DAO)
   private
   protected
      aColCidades : ColCidades;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOCidades }

function DAOCidades.Carregar(pPos: integer): TObject;
begin
   Result := aColCidades.Carregar(pPos);
end;

function DAOCidades.CarregarColecao: TObject;
begin
   Result := aColCidades;
end;

constructor DAOCidades.CrieObj;
begin
   aColCidades := ColCidades.CrieObj;
end;

destructor DAOCidades.Destrua_se;
begin
   aColCidades.Destrua_se;
end;

function DAOCidades.getDS: TDataSource;
begin
   Result := umDM.DsCidades;
end;

function DAOCidades.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColCidades.getTam + 1;
   Cidades(pObj).setCodigo(aux);
   aColCidades.InsereFim(pObj);
end;

end.
