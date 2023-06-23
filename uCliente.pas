unit uCliente;

interface
  uses uPai, uPessoas;
   type
         Clientes = class(Pai)
    private
    protected
       Nome  : string[35];
       DtNasc : TDateTime;
       CPF_CNPJ : string[11];
       Endereco : string[21];
       Email : string[22];
       Telefone : string[13];
       QtdeGrupo : integer;
       Pagou : Boolean;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pEndereco, pEmail, pTelefone: string; pDtNasc : TDateTime; pQtdeGrupo: integer; pPagou: Boolean);
      destructor Destrua_se;
      procedure setNome(pNome:string);
      procedure setDtNasc(pDtNasc:TDateTime);
      procedure setCPF_CNPJ(pCPF_CNPJ:string);
      procedure setEndereco(pEndereco:string);
      procedure setEmail(pEmail:string);
      procedure setTelefone(pTelefone:string);
      procedure setQtdeGrupo(pQtdeGrupo:integer);
      procedure setPagou(pPagou:Boolean);
      function getNome: string;
      function getDtNasc: TDateTime;
      function getCPF_CNPJ: string;
      function getEndereco: string;
      function getEmail: string;
      function getTelefone: string;
      function getQtdeGrupo: integer;
      function getPagou: Boolean;
      function clone : Clientes;
end;
implementation

{ Clientes }

function Clientes.clone: Clientes;
begin
   Result := Clientes.CrieInit(codigo,Nome,CPF_CNPJ,Endereco,Email,Telefone,DTNasc,QtdeGrupo,Pagou);
end;

constructor Clientes.CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pEndereco, pEmail,
  pTelefone: string; pDtNasc: TDateTime; pQtdeGrupo: integer; pPagou: Boolean);
begin
   Codigo := pCodigo;
   Nome  := pNome;
   DtNasc := pDtNasc;
   CPF_CNPJ := pCPF_CNPJ;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
   QtdeGrupo := pQtdeGrupo;
   Pagou := pPagou;
end;

constructor Clientes.CrieObj;
begin
   codigo := 0;
   Nome  := '';
   DtNasc := 00/00/0000;
   CPF_CNPJ := '';
   Endereco := '';
   Email := '';
   Telefone := '';
   QtdeGrupo := 0;
   Pagou := false;
end;

destructor Clientes.Destrua_se;
begin
inherited;

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

function Clientes.getNome: string;
begin
   Result := Nome;
end;

function Clientes.getPagou: Boolean;
begin
   Result := Pagou;
end;

function Clientes.getQtdeGrupo: integer;
begin
   Result := QtdeGrupo;
end;

function Clientes.getTelefone: string;
begin
   Result := Telefone;
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

procedure Clientes.setNome(pNome: string);
begin
   Nome := pNome;
end;

procedure Clientes.setPagou(pPagou: Boolean);
begin
   Pagou := pPagou;
end;

procedure Clientes.setQtdeGrupo(pQtdeGrupo: integer);
begin
   QtdeGrupo := pQtdeGrupo;
end;

procedure Clientes.setTelefone(pTelefone: string);
begin
   Telefone := pTelefone;
end;

end.
