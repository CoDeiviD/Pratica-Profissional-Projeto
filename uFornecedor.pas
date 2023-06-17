unit uFornecedor;

interface
   uses uPai, uPessoas;
   type
         Fornecedores = class(Pai)
    private
    protected
       Nome  : string[35];
       DtNasc : TDateTime;
       CPF_CNPJ : string[11];
       Endereco : string[21];
       Email : string[22];
       Telefone : string[13];
       VCombustivel: Double;
       QtdeCarga: integer;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pEndereco, pEmail, pTelefone: string; pDtNasc : TDateTime; pQtdeCarga: integer; pVCombustivel: Double);
      destructor Destrua_se;
      procedure setNome(pNome:string);
      procedure setDtNasc(pDtNasc:TDateTime);
      procedure setCPF_CNPJ(pCPF_CNPJ:string);
      procedure setEndereco(pEndereco:string);
      procedure setEmail(pEmail:string);
      procedure setTelefone(pTelefone:string);
      procedure setVCombustivel(pVCombustivel:double);
      procedure setQtdeCarga(pQtdeCarga:integer);
      function getNome: string;
      function getDtNasc: TDateTime;
      function getCPF_CNPJ: string;
      function getEndereco: string;
      function getEmail: string;
      function getTelefone: string;
      function getVCombustivel: double;
      function getQtdeCarga: integer;
    end;
implementation

{ Fornecedores }

constructor Fornecedores.CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pEndereco, pEmail,
  pTelefone: string; pDtNasc: TDateTime; pQtdeCarga: integer;
  pVCombustivel: Double);
begin
 // inherited;
   codigo := pCodigo;
   DtNasc := pDtNasc;
   CPF_CNPJ := pCPF_CNPJ;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
   QtdeCarga := pQtdeCarga;
   VCombustivel := pVCombustivel;
end;

constructor Fornecedores.CrieObj;
begin
  inherited;
   codigo := 0;
   Nome  := '';
   DtNasc := 00/00/0000;
   CPF_CNPJ := '';
   Endereco := '';
   Email := '';
   Telefone := '';
   QtdeCarga := 0;
   VCombustivel := 0.00;
end;

destructor Fornecedores.Destrua_se;
begin

end;

function Fornecedores.getCPF_CNPJ: string;
begin
   Result := CPF_CNPJ;
end;

function Fornecedores.getDtNasc: TDateTime;
begin
   Result := DtNasc;
end;

function Fornecedores.getEmail: string;
begin
   Result := Email;
end;

function Fornecedores.getEndereco: string;
begin
   Result := Endereco;
end;

function Fornecedores.getNome: string;
begin
   Result := Nome;
end;

function Fornecedores.getQtdeCarga: integer;
begin
   Result := QtdeCarga;
end;

function Fornecedores.getTelefone: string;
begin
   Result := Telefone;
end;

function Fornecedores.getVCombustivel: double;
begin
   Result := VCombustivel;
end;

procedure Fornecedores.setCPF_CNPJ(pCPF_CNPJ: string);
begin
   CPF_CNPJ := pCPF_CNPJ;
end;

procedure Fornecedores.setDtNasc(pDtNasc: TDateTime);
begin
   DtNasc := pDtNasc;
end;

procedure Fornecedores.setEmail(pEmail: string);
begin
   Email := pEmail;
end;

procedure Fornecedores.setEndereco(pEndereco: string);
begin
   Endereco := pEndereco;
end;

procedure Fornecedores.setNome(pNome: string);
begin
   Nome := pNome;
end;

procedure Fornecedores.setQtdeCarga(pQtdeCarga: integer);
begin
   QtdeCarga := pQtdeCarga;
end;

procedure Fornecedores.setTelefone(pTelefone: string);
begin
   Telefone := pTelefone;
end;

procedure Fornecedores.setVCombustivel(pVCombustivel: double);
begin
   VCombustivel := pVCombustivel;
end;

end.
