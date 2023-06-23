unit uCtrlForns;

interface
 uses uController, uFornecedor, uDaoForns, Data.DB;

 type CtrlForns = class(controller)
   private
   protected
      aDaoFornecedor : DaoForns;
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

{ CtrlForns }

function CtrlForns.Carregar(pPos: integer): TObject;
begin
   Result := aDaoFornecedor.Carregar(pPos);
end;

function CtrlForns.CarregarColecao: TObject;
begin
   Result := aDAOFornecedor.CarregarColecao;
end;

constructor CtrlForns.CrieObj;
begin
   aDaoFornecedor := DaoForns.CrieObj;
end;

destructor CtrlForns.Destrua_se;
begin
   aDaoFornecedor.Destrua_se;
end;

function CtrlForns.getDS: TDataSource;
begin
   Result := aDaoFornecedor.getDS;
end;

function CtrlForns.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mForn  : Fornecedores;
begin
   mForn := Fornecedores(pObj);
   if mForn.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlForns.salvar(pObj: TObject): string;
begin
   aDaoFornecedor.Salvar(pObj);
end;

procedure CtrlForns.setDM(pDM: TObject);
begin
  inherited;
   aDaoFornecedor.setDM(pDM);
end;

end.
