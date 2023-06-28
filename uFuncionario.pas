unit uFuncionario;

interface
   uses uPai, uPessoas;
   type
         Funcionarios = class(Pai)
    private
    protected
       Nome  : string[35];
       DtNasc : TDateTime;
       CPF_CNPJ : string[11];
       Endereco : string[21];
       Email : string[22];
       Telefone : string[13];
       Salario: Double;
       CargaH: TDateTime;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pEndereco, pEmail, pTelefone: string; pDtNasc, pCargaH : TDateTime; pSalario: Double);
      destructor Destrua_se;
      procedure setNome(pNome:string);
      procedure setDtNasc(pDtNasc:TDateTime);
      procedure setCPF_CNPJ(pCPF_CNPJ:string);
      procedure setEndereco(pEndereco:string);
      procedure setEmail(pEmail:string);
      procedure setTelefone(pTelefone:string);
      procedure setSalario(pSalario:Double);
      procedure setCargaH(pCargaH:TDateTime);
      function getNome: string;
      function getDtNasc: TDateTime;
      function getCPF_CNPJ: string;
      function getEndereco: string;
      function getEmail: string;
      function getTelefone: string;
      function getSalario: Double;
      function getCargaH: TDateTime;
      function clone : Funcionarios;
    end;
implementation

{ Funcionarios }

function Funcionarios.clone: Funcionarios;
begin
   Result := Funcionarios.CrieInit(codigo,Nome,CPF_CNPJ,Endereco,Email,Telefone,DTNasc,Salario,CargaH);
end;

constructor Funcionarios.CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pEndereco, pEmail,
  pTelefone: string; pDtNasc, pCargaH: TDateTime; pSalario: Double);
begin
   codigo := pCodigo;
   DtNasc := pDtNasc;
   CPF_CNPJ := pCPF_CNPJ;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
   Salario := pSalario;
   CargaH  := pCargaH;
end;

constructor Funcionarios.CrieObj;
begin
   codigo := 0;
   Nome  := '';
   DtNasc := 00/00/0000;
   CPF_CNPJ := '';
   Endereco := '';
   Email := '';
   Telefone := '';
   Salario := 0;
   CargaH := 00/00;
end;

destructor Funcionarios.Destrua_se;
begin

end;

function Funcionarios.getCargaH: TDateTime;
begin
   Result := CargaH;
end;

function Funcionarios.getCPF_CNPJ: string;
begin
   Result := CPF_CNPJ;
end;

function Funcionarios.getDtNasc: TDateTime;
begin
   Result := DtNasc;
end;

function Funcionarios.getEmail: string;
begin
   Result := Email;
end;

function Funcionarios.getEndereco: string;
begin
   Result := Endereco;
end;

function Funcionarios.getNome: string;
begin
   Result := Nome;
end;

function Funcionarios.getSalario: Double;
begin
   Result := Salario;
end;

function Funcionarios.getTelefone: string;
begin
   Result := Telefone;
end;

procedure Funcionarios.setCargaH(pCargaH: TDateTime);
begin
   CargaH := pCargaH;
end;

procedure Funcionarios.setCPF_CNPJ(pCPF_CNPJ: string);
begin
   CPF_CNPJ := pCPF_CNPJ;
end;

procedure Funcionarios.setDtNasc(pDtNasc: TDateTime);
begin
   DtNasc := pDtNasc;
end;

procedure Funcionarios.setEmail(pEmail: string);
begin
   Email := pEmail;
end;

procedure Funcionarios.setEndereco(pEndereco: string);
begin
   Endereco := pEndereco;
end;

procedure Funcionarios.setNome(pNome: string);
begin
   Nome := pNome;
end;

procedure Funcionarios.setSalario(pSalario: Double);
begin
   Salario := pSalario;
end;

procedure Funcionarios.setTelefone(pTelefone: string);
begin
   Telefone := pTelefone;
end;

end.
