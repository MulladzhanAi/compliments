import '../models/compliment_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{

  Future<ComplimentEntity> getCompliment() async{
  final String link="https://tools-api.robolatoriya.com/compliment";
  Uri url=Uri.parse(link);
  var response = await http.get(url);
  var data = json.decode(response.body);
  var compliment = ComplimentEntity.fromJson(data);
  return compliment;
  }

}