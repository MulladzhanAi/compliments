import 'package:compliments/proj/bloc/compliment_events.dart';
import 'package:compliments/proj/bloc/compliment_state.dart';
import 'package:compliments/proj/data/repository/repository_modul.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplimentBloc extends Bloc<ComplimentEvents,ComplimentState>{
  ComplimentBloc() : super(ComplimentEmptyState()) {
    on<ComplimentGetEvent>(_getCompliment);
  }

  _getCompliment(ComplimentGetEvent event,Emitter<ComplimentState> emit) async{
    emit(ComplimentLoadingState());
    final compliment =await RepositoryModul.getRepository().getCompliment();
    emit(ComplimentLoadedState(compliment: compliment));
  }

}