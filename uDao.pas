unit uDao;

interface
   uses uDM, Data.DB;
   type DAO = class
    private
    protected
      umDM : TDM;
    public
       constructor CrieObj;             virtual;
       destructor Destrua_se;           virtual;
       procedure setDM (pDM : TObject); virtual;
       function getDS : TDataSource;   virtual;
       function Salvar( pObj : TObject): string;    virtual;
       function CarregarColecao: TObject;           virtual;
       function Carregar(pObj : TObject): string;   virtual;
       function Pesquisar (pChave: string): string; virtual;
       function Excluir (pObj : TOBject): string;  virtual;
end;
implementation

{ DAO }

function DAO.Carregar(pObj : TObject): string;
begin

end;

function DAO.CarregarColecao: TObject;
begin

end;

constructor DAO.CrieObj;
begin

end;

destructor DAO.Destrua_se;
begin

end;

function DAO.Excluir(pObj: TOBject): string;
begin

end;

function DAO.getDS: TDataSource;
begin

end;

function DAO.Pesquisar(pChave: string): string;
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
