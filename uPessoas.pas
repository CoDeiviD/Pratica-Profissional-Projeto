unit uPessoas;

interface
   uses uPai, uCidades;
   type
         Pessoas = class(Pai)
    private
    protected
       Nome  : string[35];
       DtNasc : TDateTime;
       CPF_CNPJ : string[11];
       RG : string[7];
       CodCidade: Cidades;
       CEP : string[9];
       Endereco : string[21];
       Email : string[22];
       Telefone : string[13];
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo: integer; pNome, pCPF_CNPJ, pEndereco, pEmail, pTelefone: string; pDtNasc : TDateTime);
      destructor Destrua_se;
      procedure setNome(pNome:string);
      procedure setDtNasc(pDtNasc:TDateTime);
      procedure setCPF_CNPJ(pCPF_CNPJ:string);
      procedure setEndereco(pEndereco:string);
      procedure setEmail(pEmail:string);
      procedure setTelefone(pTelefone:string);
      function getNome: string;
      function getDtNasc: TDateTime;
      function getCPF_CNPJ: string;
      function getEndereco: string;
      function getEmail: string;
      function getTelefone: string;
      function clone: Pessoas;
end;
implementation

{ Pessoas }

function Pessoas.clone: Pessoas;
begin
  Result := Pessoas.CrieInit(codigo,Nome,CPF_CNPJ,Endereco,Email,Telefone,DTNasc);
end;

constructor Pessoas.CrieInit(pCodigo: integer; pNome, pCPF_CNPJ, pEndereco, pEmail, pTelefone: string; pDtNasc: TDateTime);
begin
   codigo := pCodigo;
   Nome := pNome;
   DtNasc := pDtNasc;
   CPF_CNPJ := pCPF_CNPJ;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
end;

constructor Pessoas.CrieObj;
begin
   codigo := 0;
   Nome := '';
   DtNasc := 00/00/00;
   CPF_CNPJ := '';
   Endereco := '';
   Email := '';
   Telefone := '';
end;

destructor Pessoas.Destrua_se;
begin

end;

function Pessoas.getCPF_CNPJ: string;
begin
   Result := CPF_CNPJ;
end;

function Pessoas.getDtNasc: TDateTime;
begin
   Result := DtNasc;
end;

function Pessoas.getEmail: string;
begin
   Result := Email;
end;

function Pessoas.getEndereco: string;
begin
   Result := Endereco;
end;

function Pessoas.getNome: string;
begin
   Result := Nome;
end;

function Pessoas.getTelefone: string;
begin
   Result := Telefone;
end;

procedure Pessoas.setCPF_CNPJ(pCPF_CNPJ: string);
begin
   CPF_CNPJ := pCPF_CNPJ;
end;

procedure Pessoas.setDtNasc(pDtNasc: TDateTime);
begin
   DtNasc := pDtNasc;
end;

procedure Pessoas.setEmail(pEmail: string);
begin
   Email := pEmail;
end;

procedure Pessoas.setEndereco(pEndereco: string);
begin
   Endereco := pEndereco;
end;

procedure Pessoas.setNome(pNome: string);
begin
   Nome := pNome;
end;

procedure Pessoas.setTelefone(pTelefone: string);
begin
   Telefone := pTelefone;
end;

end.
