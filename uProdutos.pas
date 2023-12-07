unit uProdutos;

interface
  uses uPai;
   type
         Produtos = class(Pai)
    private
    protected
       TpProduto  : string[25];
       Sabor : string[15];
       Qtde : integer;
       VCusto : double;
       Desconto : double;
       Preco   : double;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo, pQtde: integer; pTpProduto, pSabor: String; pPreco, pVCusto, pDesconto: double);
      destructor Destrua_se;
      procedure setTpProduto(pTpProduto:string);
      procedure setSabor(pSabor:string);
      procedure setPreco(pPreco:double);
      procedure setQtde(pQtde:integer);
      procedure setVCusto(pVCusto:double);
      procedure setDesconto(pDesconto:double);
      function getTpProduto: string;
      function getSabor: string;
      function getQtde : integer;
      function getVCusto : double;
      function getDesconto : double;
      function getPreco : double;
      function clone : Produtos;
end;
implementation

{ Produtos }

function Produtos.clone: Produtos;
begin
   Result := Produtos.CrieInit(codigo,Qtde, TpProduto,Sabor,Preco, VCusto, Desconto);
end;

constructor Produtos.CrieInit(pCodigo, pQtde: integer; pTpProduto, pSabor: String; pPreco, pVCusto, pDesconto: double);
begin
   codigo := pCodigo;
   TpProduto := pTpProduto;
   Sabor := pSabor;
   Qtde := pQtde;
   VCusto := pVCusto;
   Desconto := pDesconto;
   Preco := pPreco;
end;

constructor Produtos.CrieObj;
begin
   codigo := 0;
   TpProduto  := '';
   Sabor := '';
   Qtde := 0;
   VCusto := 0.00;
   Desconto := 0.00;
   Preco   := 0.00;
end;

destructor Produtos.Destrua_se;
begin

end;

function Produtos.getDesconto: double;
begin
   Result := Desconto;
end;

function Produtos.getPreco: double;
begin
   Result := Preco;
end;

function Produtos.getQtde: integer;
begin
   Result := Qtde;
end;

function Produtos.getSabor: string;
begin
   Result := Sabor;
end;

function Produtos.getTpProduto: string;
begin
   Result := TpProduto;
end;

function Produtos.getVCusto: double;
begin
   Result := VCusto;
end;

procedure Produtos.setDesconto(pDesconto: double);
begin
   Desconto := pDesconto;
end;

procedure Produtos.setPreco(pPreco: double);
begin
   Preco := pPreco;
end;

procedure Produtos.setQtde(pQtde: integer);
begin
   Qtde := pQtde;
end;

procedure Produtos.setSabor(pSabor: string);
begin
   Sabor := pSabor;
end;

procedure Produtos.setTpProduto(pTpProduto: string);
begin
   TpProduto := pTpProduto;
end;

procedure Produtos.setVCusto(pVCusto: double);
begin
   VCusto := pVCusto;
end;

end.
