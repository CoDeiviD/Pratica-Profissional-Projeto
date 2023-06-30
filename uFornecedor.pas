unit uFornecedor;

interface
   uses uPai, uCidades, uProdutos;
   type
         Fornecedores = class(Pai)
    private
    protected
       NomeFantasia  : string[35];
       RazaoSocial : string[21];
       InscrEstadual : string[21];
       CNPJ : string[11];
       CEP : string[9];
       Endereco : string[21];
       Email : string[22];
       Telefone : string[13];
       oProduto : Produtos;
       aCidade : Cidades;
    public
      constructor CrieObj;
//      constructor CrieInit(pCodigo : integer; pNomeFantasia, pRazaoSocial, pInscrEstadual, pCNPJ, pCEP, pEndereco, pEmail, pTelefone: string; pCodProduto, pCodCidade: integer);
      constructor CrieInit(pCodigo : integer; pNomeFantasia, pRazaoSocial, pInscrEstadual, pCNPJ, pCEP, pEndereco, pEmail,  pTelefone: string; pCodProduto, pCodCidade: integer);
      destructor Destrua_se;
      procedure setNomeFantasia(pNomeFantasia:string);
      procedure setRazaoSocial(pRazaoSocial:string);
      procedure setInscrEstadual(pInscrEstadual:string);
      procedure setCNPJ(pCNPJ:string);
      procedure setCEP(pCEP:string);
      procedure setEndereco(pEndereco:string);
      procedure setEmail(pEmail:string);
      procedure setTelefone(pTelefone:string);
      procedure setoProduto(poProduto:Produtos);
      procedure setaCidade(paCidade:Cidades);
      function getNomeFantasia: string;
      function getRazaoSocial: string;
      function getInscrEstadual: string;
      function getCNPJ: string;
      function getCEP: string;
      function getEndereco: string;
      function getEmail: string;
      function getTelefone: string;
      function getoProduto: Produtos;
      function getaCidade: Cidades;
      function clone : Fornecedores;
    end;
implementation

{ Fornecedores }

function Fornecedores.clone: Fornecedores;
begin
   Result := Fornecedores.CrieInit(codigo,NomeFantasia,RazaoSocial,InscrEstadual,CNPJ,CEP,Endereco,Email,Telefone,oProduto.getCodigo,aCidade.getCodigo);
end;

constructor Fornecedores.CrieInit(pCodigo : integer; pNomeFantasia, pRazaoSocial, pInscrEstadual, pCNPJ, pCEP, pEndereco, pEmail,
  pTelefone: string; pCodProduto, pCodCidade: integer);
begin
   codigo := pCodigo;
   NomeFantasia := pNomeFantasia;
   RazaoSocial := pRazaoSocial;
   InscrEstadual := pInscrEstadual;
   CNPJ := pCNPJ;
   CEP := pCEP;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
   oProduto := Produtos.CrieInit(pCodProduto,'','',0.00);
   aCidade := Cidades.CrieInit(pCodCidade,'','',0);
end;

constructor Fornecedores.CrieObj;
begin
   codigo := 0;
   NomeFantasia  := '';
   RazaoSocial := '';
   InscrEstadual := '';
   CNPJ := '';
   Endereco := '';
   Email := '';
   Telefone := '';
   aCidade := Cidades.CrieObj;
   oProduto := Produtos.CrieObj;
end;

destructor Fornecedores.Destrua_se;
begin
inherited;
   oProduto.Destrua_se;
   aCidade.Destrua_se;
end;

function Fornecedores.getaCidade: Cidades;
begin
   Result := aCidade;
end;

function Fornecedores.getCEP: string;
begin
   Result := CEP;
end;

function Fornecedores.getCNPJ: string;
begin
   Result := CNPJ;
end;

function Fornecedores.getRazaoSocial: string;
begin
   Result := RazaoSocial;
end;

function Fornecedores.getEmail: string;
begin
   Result := Email;
end;

function Fornecedores.getEndereco: string;
begin
   Result := Endereco;
end;

function Fornecedores.getInscrEstadual: string;
begin
   Result := InscrEstadual;
end;

function Fornecedores.getNomeFantasia: string;
begin
   Result := NomeFantasia;
end;

function Fornecedores.getoProduto: Produtos;
begin
   Result := oProduto;
end;

function Fornecedores.getTelefone: string;
begin
   Result := Telefone;
end;

procedure Fornecedores.setaCidade(paCidade: Cidades);
begin
   aCidade := paCidade;
end;

procedure Fornecedores.setCEP(pCEP: string);
begin
   CEP := pCEP;
end;

procedure Fornecedores.setCNPJ(pCNPJ: string);
begin
   CNPJ := pCNPJ;
end;

procedure Fornecedores.setRazaoSocial(pRazaoSocial: string);
begin
   RazaoSocial := pRazaoSocial;
end;

procedure Fornecedores.setEmail(pEmail: string);
begin
   Email := pEmail;
end;

procedure Fornecedores.setEndereco(pEndereco: string);
begin
   Endereco := pEndereco;
end;

procedure Fornecedores.setInscrEstadual(pInscrEstadual: string);
begin
   InscrEstadual := pInscrEstadual;
end;

procedure Fornecedores.setNomeFantasia(pNomeFantasia: string);
begin
   NomeFantasia := pNomeFantasia;
end;

procedure Fornecedores.setoProduto(poProduto: Produtos);
begin
   oProduto := poProduto;
end;

procedure Fornecedores.setTelefone(pTelefone: string);
begin
   Telefone := pTelefone;
end;

end.
