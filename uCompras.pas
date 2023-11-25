unit uCompras;

interface
  uses uPai, uFornecedor, uProdutos, uCondPgto;
   type
         Compras = class(Pai)
    private
    protected
       Modelo : string;
       Serie  : string;
       Numero : integer;
       DtEmissao  : TDate;
       DtChegada  : TDate;
       Qtde : integer;
       VCusto : double;
       Desconto : double;
       oForn : Fornecedores;
       oProd : Produtos;
       NotaFisc : string; //[45];
     public
        constructor CrieObj;
        constructor CrieInit(pCodigo, pNumero, pQtde: integer; pModelo, pSerie: String; pVCusto, pDesconto: double; pDtEmissao, pDtChegada: TDate; poCodForn, poCodProduto: integer; poForn, poProduto: string);
        destructor Destrua_se;
        procedure setModelo(pModelo:string);
        procedure setSerie(pSerie:string);
        procedure setNumero(pNumero:integer);
        procedure setDtEmissao(pDtEmissao:TDate);
        procedure setDtChegada(pDtChegada:TDate);
        procedure setQtde(pQtde:integer);
        procedure setVCusto(pVCusto:double);
        procedure setDesconto(pDesconto:double);
        procedure setoProduto(poProduto:Produtos);
        procedure setoForn(poForn: Fornecedores);
        function getModelo: string;
        function getSerie: string;
        function getNumero : integer;
        function getDtEmissao : TDate;
        function getDtChegada : TDate;
        function getQtde : integer;
        function getVCusto : double;
        function getDesconto : double;
        function getoProduto: Produtos;
        function getoForn: Fornecedores;
        function clone : Compras;
    end;
implementation

{ Compras }

function Compras.clone: Compras;
begin
   Result := Compras.CrieInit(codigo,Numero,Qtde,Modelo,Serie,VCusto,Desconto,DtEmissao,DtChegada,oForn.getCodigo,oProd.getCodigo,oForn.getNomeFantasia,oProd.getTpProduto);
end;

constructor Compras.CrieInit(pCodigo, pNumero, pQtde: integer; pModelo, pSerie: String;
  pVCusto, pDesconto: double; pDtEmissao, pDtChegada: TDate; poCodForn, poCodProduto: integer;
  poForn, poProduto: string);
begin
   codigo := pCodigo;
   Numero := pNumero;
   Qtde := pQtde;
   Modelo := pModelo;
   Serie := pSerie;
   VCusto := pVCusto;
   Desconto := pDesconto;
   DtEmissao := pDtEmissao;
   DtChegada := pDtChegada;
   oForn := Fornecedores.CrieInit(poCodForn,poForn,'','','','','','','',0,0);
   oProd := Produtos.CrieInit(poCodProduto,poProduto,'',0);
end;

constructor Compras.CrieObj;
begin
   codigo := 0;
   Numero := 0;
   Qtde := 0;
   Modelo := '';
   Serie := '';
   VCusto := 0;
   Desconto := 0.00;
   DtEmissao := 00/00/0000;
   DtChegada := 00/00/0000;
   oForn := Fornecedores.CrieObj;
   oProd := Produtos.CrieObj;
end;

destructor Compras.Destrua_se;
begin
   oForn.Destrua_se;
   oProd.Destrua_se;
end;

function Compras.getDesconto: double;
begin
   Result := Desconto;
end;

function Compras.getDtChegada: TDate;
begin
   Result := DtChegada;
end;

function Compras.getDtEmissao: TDate;
begin
   Result := DtEmissao;
end;

function Compras.getModelo: string;
begin
   Result := Modelo;
end;

function Compras.getNumero: integer;
begin
   Result := Numero;
end;

function Compras.getoForn: Fornecedores;
begin
   Result := oForn;
end;

function Compras.getoProduto: Produtos;
begin
   Result := oProd;
end;

function Compras.getQtde: integer;
begin
   Result := Qtde;
end;

function Compras.getSerie: string;
begin
   Result := Serie;
end;

function Compras.getVCusto: double;
begin
   Result := VCusto;
end;

procedure Compras.setDesconto(pDesconto: double);
begin
   Desconto := pDesconto;
end;

procedure Compras.setDtChegada(pDtChegada: TDate);
begin
   DtChegada := pDtChegada;
end;

procedure Compras.setDtEmissao(pDtEmissao: TDate);
begin
   DtEmissao := pDtEmissao;
end;

procedure Compras.setModelo(pModelo: string);
begin
   Modelo := pModelo;
end;

procedure Compras.setNumero(pNumero: integer);
begin
   Numero := pNumero;
end;

procedure Compras.setoForn(poForn: Fornecedores);
begin
   oForn := poForn;
end;

procedure Compras.setoProduto(poProduto: Produtos);
begin
   oProd := poProduto;
end;

procedure Compras.setQtde(pQtde: integer);
begin
   Qtde := pQtde;
end;

procedure Compras.setSerie(pSerie: string);
begin
   Serie := pSerie;
end;

procedure Compras.setVCusto(pVCusto: double);
begin
   VCusto := pVCusto;
end;

end.
