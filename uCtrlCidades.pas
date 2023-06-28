unit uCtrlCidades;

interface
 uses uController, uCidades, uDaoCidades, Data.DB;

 type CtrlCidades = class(controller)
   private
   protected
      aDaoCidades : DaoCidades;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function Carregar(pOBJ: TObject): string;  override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlCidades }

function CtrlCidades.Carregar(pOBJ: TObject): string;
begin
   Result := aDaoCidades.Carregar(pObj);
end;

constructor CtrlCidades.CrieObj;
begin
   aDaoCidades := DaoCidades.CrieObj;
end;

destructor CtrlCidades.Destrua_se;
begin
   aDaoCidades.Destrua_se;
end;

function CtrlCidades.Excluir(pObj: TOBject): string;
begin
   Result := aDaoCidades.Excluir(pObj);
end;

function CtrlCidades.getDS: TDataSource;
begin
   Result := aDaoCidades.getDS;
end;

function CtrlCidades.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mCidade  : Cidades;
begin
   Result := aDaoCidades.Pesquisar(pChave);

end;

function CtrlCidades.salvar(pObj: TObject): string;
begin
   Result := aDaoCidades.Salvar(pObj);
end;

procedure CtrlCidades.setDM(pDM: TObject);
begin
  inherited;
   aDaoCidades.setDM(pDM);
end;

end.
