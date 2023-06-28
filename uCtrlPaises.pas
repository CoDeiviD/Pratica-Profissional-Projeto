unit uCtrlPaises;

interface
 uses uController, uPaises, uDaoPaises, Data.DB;

 type CtrlPaises = class(controller)
   private
   protected
      aDaoPaises : DaoPaises;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string;   override;
      function Carregar(pObj : TObject): string; override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;   override;
 end;
implementation

{ CtrlPaises }

function CtrlPaises.Carregar(pObj : TObject): string;
begin
   Result := aDaoPaises.Carregar(pObj);
end;

constructor CtrlPaises.CrieObj;
begin
   aDaoPaises := DaoPaises.CrieObj;
end;

destructor CtrlPaises.Destrua_se;
begin
   aDaoPaises.Destrua_se;
end;

function CtrlPaises.Excluir(pObj: TOBject): string;
begin
   Result := aDaoPaises.Excluir(pObj);
end;

function CtrlPaises.getDS: TDataSource;
begin
   Result := aDaoPaises.getDS;
end;

function CtrlPaises.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mPais  : Paises;
begin
   Result := aDaoPaises.Pesquisar(pChave);

end;

function CtrlPaises.salvar(pObj: TObject): string;
begin
   Result := aDaoPaises.Salvar(pObj);
end;

procedure CtrlPaises.setDM(pDM: TObject);
begin
  inherited;
  aDaoPaises.setDM(pDM);
end;

end.
