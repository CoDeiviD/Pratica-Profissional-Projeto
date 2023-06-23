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
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
      function Pesquisar (pChave: string; pOBJ: TObject): integer; override;
 end;
implementation

{ CtrlFuncs }

function CtrlFuncs.Carregar(pPos: integer): TObject;
begin
   Result := aDaoFuncionario.Carregar(pPos);
end;

function CtrlFuncs.CarregarColecao: TObject;
begin
   Result := aDAOFuncionario.CarregarColecao;
end;

constructor CtrlFuncs.CrieObj;
begin
   aDaoFuncionario := DaoFuncs.CrieObj;
end;

destructor CtrlFuncs.Destrua_se;
begin
   aDaoFuncionario.Destrua_se;
end;

function CtrlFuncs.getDS: TDataSource;
begin
   Result := aDaoFuncionario.getDS;
end;

function CtrlFuncs.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mFunc  : Funcionarios;
begin
   mFunc := Funcionarios(pObj);
   if mFunc.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlFuncs.salvar(pObj: TObject): string;
begin
   aDaoFuncionario.Salvar(pObj);
end;

procedure CtrlFuncs.setDM(pDM: TObject);
begin
  inherited;
   aDaoFuncionario.setDM(pDM);
end;

end.
