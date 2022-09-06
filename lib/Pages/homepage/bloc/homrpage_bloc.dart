import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homrpage_event.dart';
part 'homrpage_state.dart';

class HomrpageBloc extends Bloc<HomrpageEvent, HomrpageState> {
  HomrpageBloc() : super(HomrpageInitial()) {
    on<HomrpageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
