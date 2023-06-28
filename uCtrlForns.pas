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
      function Carregar(pObj : TObject): string;   override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlForns }

function CtrlForns.Carregar(pObj: TObject): string;
begin
   Result := aDaoFornecedor.Carregar(pObj);
end;

constructor CtrlForns.CrieObj;
begin
   aDaoFornecedor := DaoForns.CrieObj;
end;

destructor CtrlForns.Destrua_se;
begin
   aDaoFornecedor.Destrua_se;
end;

function CtrlForns.Excluir(pObj: TOBject): string;
begin
   Result := aDaoFornecedor.Excluir(pObj);
end;

function CtrlForns.getDS: TDataSource;
begin
   Result := aDaoFornecedor.getDS;
end;

function CtrlForns.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mForn  : Fornecedores;
begin
   Result := aDaoFornecedor.Pesquisar(pChave);

end;

function CtrlForns.salvar(pObj: TObject): string;
begin
   Result := aDaoFornecedor.Salvar(pObj);
end;

procedure CtrlForns.setDM(pDM: TObject);
begin
  inherited;
   aDaoFornecedor.setDM(pDM);
end;

end.
