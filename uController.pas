unit uController;

interface
  type Controller = class
    private
    protected
    public
       constructor CrieObj;
       destructor Destrua_se;
       function Salvar( pObj : TObject): string; virtual;
       function CarregarColecao: TObject;        virtual;
  end;
implementation

{ Controller }

function Controller.CarregarColecao: TObject;
begin

end;

constructor Controller.CrieObj;
begin

end;

destructor Controller.Destrua_se;
begin

end;

function Controller.Salvar(pObj: TObject): string;
begin

end;

end.
