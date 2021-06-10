class Cliente {
  late String id;
  late String nome;
  late String cpfCnpj;
  late String telefone;
  late String celular;
  late String estado;
  late String bairro;
  late String endereco;
  late String login;
  late String senha;

  Cliente(this.id, this.nome, this.cpfCnpj, this.telefone, this.celular,
      this.estado, this.bairro, this.endereco, this.login, this.senha);

//Converter um DOCUMENTO em um OBJETO
  Cliente.fromJson(Map<String, dynamic> map, String id) {
    //O id é por que eu quero checar ele
    //Aqui é tudo igual, Strin e Dynamic por que são as unicas variaveis aceitas no firebase
    this.id = id;
    this.nome = map['nome'];
    this.cpfCnpj = map['cpfCnpj'];
    this.telefone = map['telefone'];
    this.celular = map['celular'];
    this.estado = map['estado'];
    this.bairro = map['bairro'];
    this.endereco = map['endereco'];
    this.login = map['login'];
    this.senha = map['senha'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'cpfCnpj': this.cpfCnpj,
      'telefone': this.telefone,
      'celular': this.celular,
      'estado': this.estado,
      'bairro': this.bairro,
      'endereco': this.endereco,
      'login': this.login,
      'senha': this.senha
    };
  }
}
