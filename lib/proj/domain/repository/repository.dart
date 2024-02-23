import '../models/compliment.dart';

abstract class Repository{
  Future<Compliment> getCompliment();
}