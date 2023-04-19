class Patrimonio {
  int? id;
  String? codigo;
  String? descricao;
    
  fromJson(Map json){
    id = json['id']; 
    codigo = json['codigo'];
    descricao =  json['descricao'];
  }

}