unit uCliente;

interface
  uses uPai, uPessoas, uCidades;
   type
         Clientes = class(Pai)
    private
    protected
       Nome  : string[35];
       DtNasc : TDateTime;
       CPF_CNPJ : string[11];
       RG : string[7];
       CEP : string[9];
       Endereco : string[21];
       Email : string[22];
       Telefone : string[13];
       Midia : string[30];
       CFS : string[40];
       aCidade : Cidades;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pRG, pCEP, pEndereco, pEmail, pTelefone, pMidia, pCFS: string; pDtNasc : TDateTime; pCodCidade: integer);
      destructor Destrua_se;
      procedure setNome(pNome:string);
      procedure setDtNasc(pDtNasc:TDateTime);
      procedure setCPF_CNPJ(pCPF_CNPJ:string);
      procedure setRG(pRG:string);
      procedure setCEP(pCEP:string);
      procedure setEndereco(pEndereco:string);
      procedure setEmail(pEmail:string);
      procedure setTelefone(pTelefone:string);
      procedure setMidia(pMidia:string);
      procedure setCFS(pCFS:string);
      procedure setaCidade(paCidade:Cidades);
      function getNome: string;
      function getDtNasc: TDateTime;
      function getCPF_CNPJ: string;
      function getRG: string;
      function getCEP: string;
      function getEndereco: string;
      function getEmail: string;
      function getTelefone: string;
      function getMidia: string;
      function getCFS: string;
      function getaCidade : Cidades;
      function clone : Clientes;
end;
implementation

{ Clientes }

function Clientes.clone: Clientes;
begin
   Result := Clientes.CrieInit(codigo,Nome,CPF_CNPJ,RG,CEP,Endereco,Email,Telefone,Midia,CFS,DTNasc,aCidade.getCodigo);
end;

constructor Clientes.CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pRG, pCEP, pEndereco, pEmail,
pTelefone, pMidia, pCFS: string; pDtNasc : TDateTime; pCodCidade: integer);
begin
   Codigo := pCodigo;
   Nome  := pNome;
   DtNasc := pDtNasc;
   CPF_CNPJ := pCPF_CNPJ;
   RG := pRG;
   CEP := pCEP;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
   Midia := pMidia;
   CFS := pCFS;
   aCidade := Cidades.CrieInit(pCodCidade,'','',0);
end;

constructor Clientes.CrieObj;
begin
   codigo := 0;
   Nome  := '';
   DtNasc := 00/00/0000;
   RG  := '';
   CEP  := '';
   CPF_CNPJ := '';
   Endereco := '';
   Email := '';
   Telefone := '';
   Midia := '';
   CFS :=  '';
   aCidade := Cidades.CrieObj;
end;

destructor Clientes.Destrua_se;
begin
inherited;
   aCidade.Destrua_se;
end;

function Clientes.getaCidade: Cidades;
begin
   Result := aCidade;
end;

function Clientes.getCEP: string;
begin
   Result := CEP;
end;

function Clientes.getCFS: string;
begin
   Result := CFS;
end;

function Clientes.getCPF_CNPJ: string;
begin
   Result := CPF_CNPJ;
end;

function Clientes.getDtNasc: TDateTime;
begin
   Result := DtNasc;
end;

function Clientes.getEmail: string;
begin
   Result := Email;
end;

function Clientes.getEndereco: string;
begin
   Result := Endereco;
end;

function Clientes.getMidia: string;
begin
   Result := Midia;
end;

function Clientes.getNome: string;
begin
   Result := Nome;
end;

function Clientes.getRG: string;
begin
   Result := RG;
end;

function Clientes.getTelefone: string;
begin
   Result := Telefone;
end;

procedure Clientes.setaCidade(paCidade: Cidades);
begin
   aCidade := paCidade;
end;

procedure Clientes.setCEP(pCEP: string);
begin
   CEP := pCEP;
end;

procedure Clientes.setCFS(pCFS: string);
begin
   CFS := pCFS;
end;

procedure Clientes.setCPF_CNPJ(pCPF_CNPJ: string);
begin
   CPF_CNPJ := pCPF_CNPJ;
end;

procedure Clientes.setDtNasc(pDtNasc: TDateTime);
begin
   DtNasc := pDtNasc;
end;

procedure Clientes.setEmail(pEmail: string);
begin
   Email := pEmail;
end;

procedure Clientes.setEndereco(pEndereco: string);
begin
   Endereco := pEndereco;
end;

procedure Clientes.setMidia(pMidia: string);
begin
   Midia := pMidia;
end;

procedure Clientes.setNome(pNome: string);
begin
   Nome := pNome;
end;

procedure Clientes.setRG(pRG: string);
begin
   RG := pRG;
end;

procedure Clientes.setTelefone(pTelefone: string);
begin
   Telefone := pTelefone;
end;

end.
