import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'practice_event.dart';
part 'practice_state.dart';

class PracticeBloc extends Bloc<PracticeEvent, PracticeState> {
  PracticeBloc() : super(PracticeInitial()) {
    on<PracticeEvent>((event, emit) {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      // TODO: implement event handler
      if(event is Prdtaddingevent){
        // print(event.prdtname);
        
  
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'productname':event.prdtname , // John Doe
            'description':event.description , // Stokes and Sons
            'price':event.price  // 42
          })
          .then((value) => emit(Addproduct())
          )
          .catchError((error) => print("Failed to add user: $error"));

        
      }
    });
  }
}
