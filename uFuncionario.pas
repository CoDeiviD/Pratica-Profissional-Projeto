unit uFuncionario;

interface
   uses uPai, uPessoas, uCidades;
   type
         Funcionarios = class(Pai)
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
       Salario: Double;
       CargaH: TDateTime;
       aCidade: Cidades;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pRG, pCEP, pEndereco, pEmail, pTelefone, pMidia: string; pDtNasc, pCargaH : TDateTime; pSalario: Double; pCodCidade: integer);
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
      procedure setSalario(pSalario:Double);
      procedure setCargaH(pCargaH:TDateTime);
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
      function getSalario: Double;
      function getCargaH: TDateTime;
      function getaCidade : Cidades;
      function clone : Funcionarios;
    end;
implementation

{ Funcionarios }

function Funcionarios.clone: Funcionarios;
begin
   Result := Funcionarios.CrieInit(codigo,Nome,CPF_CNPJ,RG,CEP,Endereco,Email,Telefone,Midia,DTNasc,Salario,CargaH,aCidade.getCodigo);
end;

constructor Funcionarios.CrieInit(pCodigo : integer; pNome, pCPF_CNPJ, pRG, pCEP, pEndereco, pEmail,
pTelefone, pMidia: string; pDtNasc, pCargaH: TDateTime; pSalario: Double; pCodCidade: integer);
begin
   codigo := pCodigo;
   nome := pNome;
   DtNasc := pDtNasc;
   CPF_CNPJ := pCPF_CNPJ;
   RG  := pRG;
   CEP  :=  pCEP;
   Endereco := pEndereco;
   Email := pEmail;
   Telefone := pTelefone;
   Midia := pMidia;
   Salario := pSalario;
   CargaH  := pCargaH;
   aCidade := Cidades.CrieInit(pcodcidade,'','', 0);
end;

constructor Funcionarios.CrieObj;
begin
   codigo := 0;
   Nome  := '';
   DtNasc := 00/00/0000;
   CPF_CNPJ := '';
   RG := '';
   CEP := '';
   Endereco := '';
   Email := '';
   Telefone := '';
   Midia := '';
   Salario := 0;
   CargaH := 0;
   aCidade := Cidades.CrieObj;
end;

destructor Funcionarios.Destrua_se;
begin
inherited;
   aCidade.Destrua_se;
end;

function Funcionarios.getaCidade: Cidades;
begin
   Result := aCidade;
end;

function Funcionarios.getCargaH: TDateTime;
begin
   Result := CargaH;
end;

function Funcionarios.getCEP: string;
begin
   Result := CEP;
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

function Funcionarios.getMidia: string;
begin
   Result := Midia;
end;

function Funcionarios.getNome: string;
begin
   Result := Nome;
end;

function Funcionarios.getRG: string;
begin
   Result := RG;
end;

function Funcionarios.getSalario: Double;
begin
   Result := Salario;
end;

function Funcionarios.getTelefone: string;
begin
   Result := Telefone;
end;

procedure Funcionarios.setaCidade(paCidade: Cidades);
begin
   aCidade := paCidade;
end;

procedure Funcionarios.setCargaH(pCargaH: TDateTime);
begin
   CargaH := pCargaH;
end;

procedure Funcionarios.setCEP(pCEP: string);
begin
   CEP := pCEP;
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

procedure Funcionarios.setMidia(pMidia: string);
begin
   Midia := pMidia;
end;

procedure Funcionarios.setNome(pNome: string);
begin
   Nome := pNome;
end;

procedure Funcionarios.setRG(pRG: string);
begin
   RG := pRG;
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
