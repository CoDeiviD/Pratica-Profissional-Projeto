unit uDAOFuncs;

interface
 uses uDao, uDM, uColFuncs, uFuncionario, Data.DB;

 type DAOFuncs = class(DAO)
   private
   protected
      aColFuncs : ColFuncionarios;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOFuncs }

function DAOFuncs.Carregar(pPos: integer): TObject;
begin
   Result := aColFuncs.Carregar(pPos);
end;

function DAOFuncs.CarregarColecao: TObject;
begin
   Result := aColFuncs;
end;

constructor DAOFuncs.CrieObj;
begin
   aColFuncs := ColFuncionarios.CrieObj;
end;

destructor DAOFuncs.Destrua_se;
begin
   aColFuncs.Destrua_se;
end;

function DAOFuncs.getDS: TDataSource;
begin
   Result := umDM.DSFuncs;
end;

function DAOFuncs.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColFuncs.getTam + 1;
   Funcionarios(pObj).setCodigo(aux);
   aColFuncs.InsereFim(pObj);
end;

end.
