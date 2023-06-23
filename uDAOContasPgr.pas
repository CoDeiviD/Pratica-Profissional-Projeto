unit uDAOContasPgr;

interface
 uses uDao, uDM, uColContasPgr, uContasPgr, Data.DB;

 type DAOContasPgr = class(DAO)
   private
   protected
      aColContasPgr : ColContasPgr;
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

function DAOContasPgr.Carregar(pPos: integer): TObject;
begin
   Result := aColContasPgr.Carregar(pPos);
end;

function DAOContasPgr.CarregarColecao: TObject;
begin
   Result := aColContasPgr;
end;

constructor DAOContasPgr.CrieObj;
begin
   aColContasPgr := ColContasPgr.CrieObj;
end;

destructor DAOContasPgr.Destrua_se;
begin
   aColContasPgr.Destrua_se;
end;

function DAOContasPgr.getDS: TDataSource;
begin
   Result := umDM.DSContPgr;
end;

function DAOContasPgr.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColContasPgr.getTam + 1;
   ContasPgr(pObj).setCodigo(aux);
   aColContasPgr.InsereFim(pObj);
end;

end.
