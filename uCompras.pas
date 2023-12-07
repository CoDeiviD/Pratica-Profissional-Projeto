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
       oForn : Fornecedores;
       oProd : Produtos;
       //NotaFisc : string; [45];
     public
        constructor CrieObj;
        constructor CrieInit(pNumero: integer; pModelo, pSerie: String; pDtEmissao, pDtChegada: TDate; poCodForn, poCodProduto: integer; poForn, poProduto: string);
        destructor Destrua_se;
        procedure setModelo(pModelo:string);
        procedure setSerie(pSerie:string);
        procedure setNumero(pNumero:integer);
        procedure setDtEmissao(pDtEmissao:TDate);
        procedure setDtChegada(pDtChegada:TDate);
        procedure setoProduto(poProduto:Produtos);
        procedure setoForn(poForn: Fornecedores);
        function getModelo: string;
        function getSerie: string;
        function getNumero : integer;
        function getDtEmissao : TDate;
        function getDtChegada : TDate;
        function getoProduto: Produtos;
        function getoForn: Fornecedores;
        function clone : Compras;
    end;
implementation

{ Compras }

function Compras.clone: Compras;
begin
   Result := Compras.CrieInit(Numero,Modelo,Serie,DtEmissao,DtChegada,oForn.getCodigo,oProd.getCodigo,oForn.getNomeFantasia,oProd.getTpProduto);
end;

constructor Compras.CrieInit(pNumero: integer; pModelo, pSerie: String;
   pDtEmissao, pDtChegada: TDate; poCodForn, poCodProduto: integer;
  poForn, poProduto: string);
begin
   Numero := pNumero;
   Modelo := pModelo;
   Serie := pSerie;
   DtEmissao := pDtEmissao;
   DtChegada := pDtChegada;
   oForn := Fornecedores.CrieInit(poCodForn,poForn,'','','','','','','',0,0);
   oProd := Produtos.CrieInit(poCodProduto,0,'','',0.00,0.00,0.00);
end;

constructor Compras.CrieObj;
begin
   Numero := 0;
   Modelo := '';
   Serie := '';
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

function Compras.getSerie: string;
begin
   Result := Serie;
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

procedure Compras.setSerie(pSerie: string);
begin
   Serie := pSerie;
end;

end.
