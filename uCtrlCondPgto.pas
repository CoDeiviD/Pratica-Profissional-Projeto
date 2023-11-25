unit uCtrlCondPgto;

interface
   uses uController, uCondPgto, uDaoCondPgto, Data.DB;

 type CtrlCondPgto = class(controller)
   private
   protected
      aDaoCondPgto : DaoCondPgto;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function Carregar(pObj : TObject): string;   override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlCompras }

function CtrlCondPgto.Carregar(pObj: TObject): string;
begin
   Result := aDaoCondPgto.Carregar(pObj);
end;

constructor CtrlCondPgto.CrieObj;
begin
   aDaoCondPgto := DaoCondPgto.CrieObj;
end;

destructor CtrlCondPgto.Destrua_se;
begin
   aDaoCondPgto.Destrua_se;
end;

function CtrlCondPgto.Excluir(pObj: TOBject): string;
begin
   Result := aDaoCondPgto.Excluir(pObj);
end;

function CtrlCondPgto.getDS: TDataSource;
begin
   Result := aDaoCondPgto.getDS;
end;

function CtrlCondPgto.Pesquisar(pChave: string): string;
begin
   Result := aDaoCondPgto.Pesquisar(pChave);
end;

function CtrlCondPgto.salvar(pObj: TObject): string;
begin
   Result := aDaoCondPgto.Salvar(pObj);
end;

procedure CtrlCondPgto.setDM(pDM: TObject);
begin
  inherited;
  aDaoCondPgto.SetDm(pDM);
end;

end.
