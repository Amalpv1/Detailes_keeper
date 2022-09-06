part of 'practice_bloc.dart';

@immutable
abstract class PracticeEvent {}
class Prdtaddingevent extends PracticeEvent{
  Prdtaddingevent({required this.prdtname,required this.description,required this.price});
String prdtname;
String description;
String price;


}