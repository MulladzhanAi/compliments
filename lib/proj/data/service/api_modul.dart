import 'package:compliments/proj/data/service/api_service.dart';
import 'package:compliments/proj/data/service/api_service_to_model.dart';

class ApiModul{
  static ApiServiceToModel ? _apiServiceToModel;

  static ApiServiceToModel getApiService(){
    if(_apiServiceToModel==null){
      _apiServiceToModel=ApiServiceToModel(ApiService());
    }
    return _apiServiceToModel!;
  }
}