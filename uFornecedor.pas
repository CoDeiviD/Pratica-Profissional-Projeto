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
    public
    end;
implementation

end.
