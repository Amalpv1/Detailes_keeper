part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class signupstartEvent extends SignupEvent{
  signupstartEvent({required this.fname, required this.lname,required this.emai,required this.pwd});
  String fname;
  String lname;
  String emai;
  String pwd;
}
