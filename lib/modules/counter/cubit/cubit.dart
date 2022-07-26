import 'package:all_my_apps/modules/counter/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<MainState>{
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context)=>BlocProvider.of(context);

  int counter = 0;

  void minus()
  {
    counter --;
    emit(MinusState());
  }
  void plus()
  {
    counter ++;
    emit(PlusState());
  }

}