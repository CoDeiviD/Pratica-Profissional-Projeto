unit uController;

interface
  uses uDM, uPai, Data.DB;
  type Controller = class
    private
    protected
    public
       constructor CrieObj;
       destructor Destrua_se;
       procedure setDM (pDM : TObject); virtual;
       function getDS : TDataSource;    virtual;
       function Salvar( pObj : TObject): string; virtual;
       function CarregarColecao: TObject;        virtual;
       function Carregar(pPos : integer): TObject;        virtual;
       function Pesquisar (pChave: string; pOBJ: TObject): integer; virtual;
  end;
implementation

{ Controller }

function Controller.Carregar(pPos : integer): TObject;
begin

end;

function Controller.CarregarColecao: TObject;
begin

end;

constructor Controller.CrieObj;
begin

end;

destructor Controller.Destrua_se;
begin

end;

function Controller.getDS: TDataSource;
begin

end;

function Controller.Pesquisar(pChave: string; pOBJ: TObject): integer;
begin

end;

function Controller.Salvar(pObj: TObject): string;
begin

end;

procedure Controller.setDM(pDM: TObject);
begin

end;

end.
