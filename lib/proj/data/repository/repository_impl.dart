import 'package:compliments/proj/data/service/api_modul.dart';
import 'package:compliments/proj/domain/repository/repository.dart';

import '../../domain/models/compliment.dart';

class RepositoryImpl extends Repository{

  @override
  Future<Compliment> getCompliment() async{
    var result = await ApiModul.getApiService().getCompliment();
    return result;
  }

}