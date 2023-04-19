class Pessoa {
  late int id;
  late String nome;
  
    
  fromJson(Map json){
    id = json['id']; 
    nome = json['nome'];
  }

}