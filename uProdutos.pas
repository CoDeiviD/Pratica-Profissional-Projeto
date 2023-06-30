unit uProdutos;

interface
  uses uPai;
   type
         Produtos = class(Pai)
    private
    protected
       TpProduto  : string[25];
       Sabor : string[15];
       Preco   : double;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo: integer; pTpProduto, pSabor: String; pPreco: double);
      destructor Destrua_se;
      procedure setTpProduto(pTpProduto:string);
      procedure setSabor(pSabor:string);
      procedure setPreco(pPreco:double);
      function getTpProduto: string;
      function getSabor: string;
      function getPreco : double;
      function clone : Produtos;
end;
implementation

{ Produtos }

function Produtos.clone: Produtos;
begin
   Result := Produtos.CrieInit(codigo,TpProduto,Sabor,Preco);
end;

constructor Produtos.CrieInit(pCodigo: integer; pTpProduto, pSabor: String; pPreco: double);
begin
   codigo := pCodigo;
   TpProduto := pTpProduto;
   Sabor := pSabor;
   Preco := pPreco;
end;

constructor Produtos.CrieObj;
begin
   codigo := 0;
   TpProduto  := '';
   Sabor := '';
   Preco   := 0.00;
end;

destructor Produtos.Destrua_se;
begin

end;

function Produtos.getPreco: double;
begin
   Result := Preco;
end;

function Produtos.getSabor: string;
begin
   Result := Sabor;
end;

function Produtos.getTpProduto: string;
begin
   Result := TpProduto;
end;

procedure Produtos.setPreco(pPreco: double);
begin
   Preco := pPreco;
end;

procedure Produtos.setSabor(pSabor: string);
begin
   Sabor := pSabor;
end;

procedure Produtos.setTpProduto(pTpProduto: string);
begin
   TpProduto := pTpProduto;
end;

end.
