unit uDao;

interface
   type DAO = class
    private
    protected
    public
       function Salvar( pObj : TObject): string; virtual;
end;
implementation

{ DAO }

function DAO.Salvar(pObj: TObject): string;
begin

end;

end.
