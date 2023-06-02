unit uDao;

interface
   type DAO = class
    private
    protected
    public
       function Salvar( pObj : TObject): string; virtual;
       function CarregarColecao: TObject;        virtual;
end;
implementation

{ DAO }

function DAO.CarregarColecao: TObject;
begin

end;

function DAO.Salvar(pObj: TObject): string;
begin

end;

end.
