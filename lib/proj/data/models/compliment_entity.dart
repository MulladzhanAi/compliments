

class ComplimentEntity{
  final String text;

  ComplimentEntity({required this.text});

  factory ComplimentEntity.fromJson(Map<String,dynamic> json){
    return ComplimentEntity(text: json['text']);
  }

}