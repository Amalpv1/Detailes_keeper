

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit)async {
      // TODO: implement event handler
      //  addError('error');
      if(event is signupstartEvent){
        // print(event.fname);
        // print(event.lname);
        // print(event.emai);
        // print(event.pwd);

        if(event.emai!='admin@gmail.com'){
          await users.add({
          
          'First name':event.fname,
          'Last name' :event.lname,
          'Email'     :event.emai,
          'Password'  :event.pwd
        })
         .then((value) {
          emit(signupSuccessstate());
         })
        .catchError((error) => print("Failed to add user: $error"));
        }else{
          print('object');
          emit(adminLoginblock());
        }
      }
    }
    
    );
  }

      @override
    void onChange(Change <SignupState> change){
      super.onChange(change);
      debugPrint(change.toString());

    }
    @override
    void onTransition(Transition < SignupEvent, SignupState> transition){
      super.onTransition(transition);
      debugPrint(transition.toString());
    

    }
    @override
     void onError(Object error,StackTrace stackTrace){
      super.onError(error, stackTrace);
      print(error);

     }
     void addError(Object error,[StackTrace? stackTrace] ){
       super.addError(error); 
     }
     @override
    void onEvent (SignupEvent event ){
      super.onEvent(event);
      debugPrint(event.toString());
    }
}
