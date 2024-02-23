import 'package:compliments/proj/data/models/compliment_entity.dart';
import 'package:compliments/proj/domain/models/compliment.dart';

class ComplimentMapper{
  static Compliment MapToCompliment(ComplimentEntity entity){
    return Compliment(text: entity.text);
  }
}