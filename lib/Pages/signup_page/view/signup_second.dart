import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/Pages/homepage/view/homepage.dart';
import 'package:splash/Pages/signup_page/bloc/signup_bloc.dart';

class signupPage2 extends StatelessWidget {
  signupPage2({Key? key}) : super(key: key);
  SignupBloc signupBloc = SignupBloc();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: BlocProvider(
            create: (context) => signupBloc,
            child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                // TODO: implement listener
                if(state is signupSuccessstate){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>homePage() ,));
                }
              },
              builder: (context, state) {
                if(state is adminLoginblock){
                  return Container(
                    child: Text('you have prohibitted to create this account'),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Signup Page',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: fnamecontroller,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.amber[800],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: lnamecontroller,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.amber[800],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.amber[800],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: pwdcontroller,
                        obscureText: true,
                        // keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'password',
                            prefixIcon: Icon(
                              Icons.lock_sharp,
                              color: Colors.amber[800],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text('Already a member?'),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                signupBloc.add(signupstartEvent(
                                    emai: emailcontroller.text,
                                    fname: fnamecontroller.text,
                                    lname: lnamecontroller.text,
                                    pwd: pwdcontroller.text));
                              },
                              child: Text('sign up'))),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
