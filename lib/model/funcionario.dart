class Funcionario{
  late String id;
  late String nome;
  late String cpfCnpj;
  late String telefone;
  late String celular;
  late String endereco;
  late String cargo;
  late String ativo;
  late String login;
  late String senha;

  Funcionario(this.id, this.nome,this.cpfCnpj, this.telefone, this.celular,this.endereco, this.cargo,this.ativo, this.login, this.senha);

  //Converter um DOCUMENTO em um OBJETO
  Funcionario.fromJson(Map<String, dynamic> map, String id) {
    //O id é por que eu quero checar ele
    this.id = id;
    this.nome = map['nome'];
    this.cpfCnpj = map['cpfCnpj'];
    this.telefone = map['telefone'];
    this.celular = map['celular'];
    this.endereco = map['endereco'];
    this.cargo = map['cargo'];
    this.ativo = map['ativo'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String, dynamic> toJson() {
    return {
      'id'    : this.id,
      'nome': this.nome,
      'cpfCnpj': this.cpfCnpj,
      'telefone': this.telefone,
      'celular': this.celular,
      'endereco': this.endereco,
      'cargo': this.cargo,
      'ativo': this.ativo,
      'login': this.login,
      'senha': this.senha
    };
  }
}