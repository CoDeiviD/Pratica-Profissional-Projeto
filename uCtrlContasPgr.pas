unit uCtrlContasPgr;

interface
 uses uController, uDaoContasPgr;

 type CtrlContasPgr = class(controller)
   private
   protected
      aDaoContasPgr : DaoContasPgr;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlContasPgr }

function CtrlContasPgr.CarregarColecao: TObject;
begin
   Result := aDAOContasPgr.CarregarColecao;
end;

constructor CtrlContasPgr.CrieObj;
begin
   aDaoContasPgr := DaoContasPgr.CrieObj;
end;

destructor CtrlContasPgr.Destrua_se;
begin
   aDaoContasPgr.Destrua_se;
end;

function CtrlContasPgr.salvar(pObj: TObject): string;
begin

end;

end.
