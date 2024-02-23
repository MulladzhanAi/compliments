import 'package:compliments/proj/data/service/api_service.dart';
import 'package:compliments/proj/domain/models/compliment_mapper.dart';

import '../../domain/models/compliment.dart';
import 'api_service.dart';

class ApiServiceToModel{

  ApiService apiService;

  ApiServiceToModel(this.apiService);

  Future<Compliment> getCompliment() async{
    var complimentApi = await apiService.getCompliment();
    var result= ComplimentMapper.MapToCompliment(complimentApi);
    return result;
  }

}