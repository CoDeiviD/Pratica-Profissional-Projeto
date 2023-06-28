unit uCtrlEstados;

interface
 uses uController, uEstados, uCtrlPaises, uDaoEstados, Data.DB;

 type CtrlEstados = class(controller)
   private
   protected
      aDaoEstados : DaoEstados;
      aCtrlPais : CtrlPaises;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      procedure setaCtrl(pCtrl: TObject);
      function getaCtrlPais : Tobject;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function Carregar(pObj : TObject): string; override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string; override;
 end;
implementation

{ CtrlEstados }

function CtrlEstados.Carregar(pObj : TObject): string;
begin
   Result := aDaoEstados.Carregar(pObj);
end;

constructor CtrlEstados.CrieObj;
begin
   aDaoEstados := DaoEstados.CrieObj;
end;

destructor CtrlEstados.Destrua_se;
begin
   aDaoEstados.Destrua_se;
end;

function CtrlEstados.Excluir(pObj: TOBject): string;
begin
   Result := aDaoEstados.Excluir(pObj);
end;

function CtrlEstados.getaCtrlPais: Tobject;
begin

end;

function CtrlEstados.getDS: TDataSource;
begin
   Result := aDaoEstados.getDS;
end;

function CtrlEstados.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mEstado  : Estados;
begin
   Result := aDaoEstados.Pesquisar(pChave);

end;

function CtrlEstados.salvar(pObj: TObject): string;
begin
   Result := aDaoEstados.Salvar(pObj);
end;

procedure CtrlEstados.setaCtrl(pCtrl: TObject);
begin

end;

procedure CtrlEstados.setDM(pDM: TObject);
begin
  inherited;
  aDaoEstados.setDM(pDM);
end;

end.
