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
       function Salvar( pObj : TObject): string;  virtual;
       function Carregar(pObj : TObject): string; virtual;
       function Pesquisar (pChave: string): string; virtual;
       function Excluir (pObj : TOBject): string;   virtual;
  end;
implementation

{ Controller }

function Controller.Carregar(pObj : TObject): string;
begin

end;

constructor Controller.CrieObj;
begin

end;

destructor Controller.Destrua_se;
begin

end;

function Controller.Excluir(pObj: TOBject): string;
begin

end;

function Controller.getDS: TDataSource;
begin

end;

function Controller.Pesquisar(pChave: string): string;
begin

end;

function Controller.Salvar(pObj: TObject): string;
begin

end;

procedure Controller.setDM(pDM: TObject);
begin

end;

end.
