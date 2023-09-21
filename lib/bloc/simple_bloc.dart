import 'package:bloc/bloc.dart';

part 'simple_event.dart';

part 'simple_state.dart';

class SimpleBloc extends Bloc<SimpleEvent, SimpleState> {
  SimpleBloc() : super(SimpleInitial()) {
    on<SimpleAEvent>((event, emit) => emit(SimpleAState()));
    on<SimpleBEvent>((event, emit) => emit(SimpleBState()));
  }
}
