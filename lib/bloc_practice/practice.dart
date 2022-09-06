import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/bloc_practice/bloc/practice_bloc.dart';

class blocPractice extends StatelessWidget {
  blocPractice({Key? key}) : super(key: key);
  TextEditingController prdtcntlr = TextEditingController();
  TextEditingController decritioncntlr = TextEditingController();
  TextEditingController pricecntlr = TextEditingController();
  PracticeBloc samplebloc = PracticeBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => samplebloc,
          child: BlocBuilder<PracticeBloc, PracticeState>(      
            builder: (context, state) {
              if(state is Addproduct){
                Future.delayed(Duration.zero,(){
                  return showDialog(context: context, builder: (BuildContext cntxt){
                    return AlertDialog(title: Text("Product added successfully"));
                  });
                });
              }
              return Column(
                children: [
                  TextField(
                    controller: prdtcntlr,
                    decoration: InputDecoration(labelText: 'prdtname'),
                  ),
                  TextField(
                    controller: decritioncntlr,
                    decoration: InputDecoration(labelText: 'description'),
                  ),
                  TextField(
                    controller: pricecntlr,
                    decoration: InputDecoration(labelText: 'price'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        samplebloc.add(Prdtaddingevent(
                            description: decritioncntlr.text,
                            prdtname: prdtcntlr.text,
                            price: pricecntlr.text));
                      },
                      child: Text('click me'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
