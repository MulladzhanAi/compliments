import 'package:compliments/proj/domain/models/compliment.dart';

abstract class ComplimentState{}

class ComplimentEmptyState extends ComplimentState{}

class ComplimentLoadingState extends ComplimentState{}

class ComplimentLoadedState extends ComplimentState{
  Compliment compliment;
  ComplimentLoadedState({required this.compliment});
}