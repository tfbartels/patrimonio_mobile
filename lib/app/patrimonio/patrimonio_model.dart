class Patrimonio {
  final int id;
  final String codigo;
  final String descricao;

  
  Patrimonio(this.id, this.codigo, this.descricao);

  factory Patrimonio.fromJson(Map json){
    return Patrimonio(json['id'], json['codigo'], json['descricao']);
  }

}