unit uDao;

interface
   uses uDM, Data.DB;
   type DAO = class
    private
    protected
      umDM : TDM;
    public
       procedure setDM (pDM : TObject); virtual;
       function getDS : TDataSource;   virtual;
       function Salvar( pObj : TObject): string; virtual;
       function CarregarColecao: TObject;        virtual;
       function Carregar(pPos : integer): TObject;                virtual;
end;
implementation

{ DAO }

function DAO.Carregar(pPos: integer): TObject;
begin

end;

function DAO.CarregarColecao: TObject;
begin

end;

function DAO.getDS: TDataSource;
begin

end;

function DAO.Salvar(pObj: TObject): string;
begin

end;

procedure DAO.setDM(pDM: TObject);
begin
   umDM := TDM(pDM) ;
end;

end.
