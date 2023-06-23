unit uDAOContasRcb;

interface
 uses uDao, uDM, uColContasRcb, uContasRcb, Data.DB;

 type DAOContasRcb = class(DAO)
   private
   protected
      aColContasRcb : ColContasRcb;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOContasRcb }

function DAOContasRcb.Carregar(pPos: integer): TObject;
begin
   Result := aColContasRcb.Carregar(pPos);
end;

function DAOContasRcb.CarregarColecao: TObject;
begin
   Result := aColContasRcb;
end;

constructor DAOContasRcb.CrieObj;
begin
   aColContasRcb := ColContasRcb.CrieObj;
end;

destructor DAOContasRcb.Destrua_se;
begin
   aColContasRcb.Destrua_se;
end;

function DAOContasRcb.getDS: TDataSource;
begin
   Result := umDM.DSContRcb;
end;

function DAOContasRcb.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColContasRcb.getTam + 1;
   ContasRcb(pObj).setCodigo(aux);
   aColContasRcb.InsereFim(pObj);
end;

end.
