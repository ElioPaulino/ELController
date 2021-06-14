class Presenca {
  late String id;
  late String nome;
  late String qrCode;
  late String estabelecimento;
  late String data;

  Presenca(this.id, this.nome, this.qrCode, this.estabelecimento, this.data);

//Converter um DOCUMENTO em um OBJETO
  Presenca.fromJson(Map<String, dynamic> map, String id) {
    //O id é por que eu quero checar ele
    //Aqui é tudo igual, Strin e Dynamic por que são as unicas variaveis aceitas no firebase
    this.id = id;
    this.nome = map['nome'];
    this.qrCode = map['qrCode'];
    this.estabelecimento = map['estabelecimento'];
    this.data = map['data'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'qrCode': this.qrCode,
      'estabelecimento': this.estabelecimento,
      'data': this.data,
    };
  }
}
