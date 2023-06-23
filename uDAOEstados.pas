unit uDAOEstados;

interface
 uses uDao, uDM, uColEstados, uEstados, Data.DB;

 type DAOEstados = class(DAO)
   private
   protected
      aColEstados : ColEstados;
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

function DAOEstados.Carregar(pPos: integer): TObject;
begin
   Result := aColEstados.Carregar(pPos);
end;

function DAOEstados.CarregarColecao: TObject;
begin
   Result := aColEstados;
end;

constructor DAOEstados.CrieObj;
begin
   aColEstados := ColEstados.CrieObj;
end;

destructor DAOEstados.Destrua_se;
begin
   aColEstados.Destrua_se;
end;

function DAOEstados.getDS: TDataSource;
begin
   Result := umDM.DsEstados;
end;

function DAOEstados.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColEstados.getTam + 1;
   Estados(pObj).setCodigo(aux);
   aColEstados.InsereFim(pObj);
end;

end.
