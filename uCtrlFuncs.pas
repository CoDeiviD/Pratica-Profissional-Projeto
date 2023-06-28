unit uCtrlFuncs;

interface
 uses uController, uFuncionario, uDaoFuncs, Data.DB;

 type CtrlFuncs = class(controller)
   private
   protected
      aDaoFuncionario : DaoFuncs;
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

{ CtrlFuncs }

function CtrlFuncs.Carregar(pObj: TObject): string;
begin
   Result := aDaoFuncionario.Carregar(pObj);
end;

constructor CtrlFuncs.CrieObj;
begin
   aDaoFuncionario := DaoFuncs.CrieObj;
end;

destructor CtrlFuncs.Destrua_se;
begin
   aDaoFuncionario.Destrua_se;
end;

function CtrlFuncs.Excluir(pObj: TOBject): string;
begin
   Result := aDaoFuncionario.Excluir(pObj);
end;

function CtrlFuncs.getDS: TDataSource;
begin
   Result := aDaoFuncionario.getDS;
end;

function CtrlFuncs.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mFunc  : Funcionarios;
begin
   Result := aDaoFuncionario.Pesquisar(pChave);

end;

function CtrlFuncs.salvar(pObj: TObject): string;
begin
   Result := aDaoFuncionario.Salvar(pObj);
end;

procedure CtrlFuncs.setDM(pDM: TObject);
begin
  inherited;
   aDaoFuncionario.setDM(pDM);
end;

end.
