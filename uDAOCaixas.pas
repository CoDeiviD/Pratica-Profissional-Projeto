unit uDAOCaixas;

interface
 uses uDao, uDM, uColCaixas, uCaixas, Data.DB;

 type DAOCaixas = class(DAO)
   private
   protected
      aColCaixas : ColCaixas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOCaixas }

function DAOCaixas.Carregar(pPos: integer): TObject;
begin
   Result := aColCaixas.Carregar(pPos);
end;

function DAOCaixas.CarregarColecao: TObject;
begin
   Result := aColCaixas;
end;

constructor DAOCaixas.CrieObj;
begin
   aColCaixas := ColCaixas.CrieObj;
end;

destructor DAOCaixas.Destrua_se;
begin
   aColCaixas.Destrua_se;
end;

function DAOCaixas.getDS: TDataSource;
begin
   Result := umDM.DSCaixas;
end;

function DAOCaixas.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColCaixas.getTam + 1;
   Caixas(pObj).setCodigo(aux);
   aColCaixas.InsereFim(pObj);
end;

end.
