import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/services/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

  Future<bool>login(User user) async{
    final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
    headers: <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8'
    },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' : user.email,
        'password' : user.password
      }),
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0,50.0,10.0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Padding(
                    padding: const EdgeInsets.only(bottom: 1.0),
                child: Image.asset(
                  'assets/remove.png',
                  width: 400.0,
                  height: 200,
                ),
                ),
                SizedBox(height: 30.0,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        maxLength: 40,
                        decoration: InputDecoration(
                          label: Text(
                              'Username',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Provide username';
                          }
                          if (value.length < 2) {
                            return 'Username should be atleast 3 letters long';
                          }
                          return null;
                        } ,
                        onSaved:  (value) {
                          username = value!;
                        },
                      ),

                      SizedBox(height: 20.0,),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text(
                              'Password',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Provide a password';
                          }
                          if (value.length < 8) {
                            return 'Name should be atleast 8 letters long';
                          }
                          if (value.length >20) {
                            return 'Password must be 20 characters long only';
                          }
                          return null;
                        } ,
                        onSaved: (value){
                          password = value!;
                        },
                      ),
                      SizedBox(height: 25.0,),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()){
                            formKey.currentState!.save();
                           User user = User(
                             username: username,
                             email: '',
                             password: password
                           );
                         /* if(login(user)){
                            Navigator.pushReplacementNamed(context, '/');
                          }*/
                            setState(() {
                              buttonContent = FutureBuilder(
                                future: login(user),
                                builder: (context, snapshots){
                                  if(snapshots.connectionState == ConnectionState.waiting){
                                    return loadingDisplay;
                                  }
                                  if(snapshots.hasData){

                                  }
                                  return Text('Log in');
                                }
                              );
                            });
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          }
                        },
                        child: buttonContent,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            foregroundColor: Colors.white
                        ),
                      ),
                      SizedBox(height: 25.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'or Login with',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                          SizedBox(height: 25.0,),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata),
                                SizedBox(width: 10.0,),
                                Text('Google'),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[700],
                              foregroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 25.0,),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.facebook,),
                                SizedBox(width: 10.0,),
                                Text('Facebook'),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              foregroundColor: Colors.white
                            ),
                          ),
                          SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Dont have an account?',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              InkWell(
                                child: Text(
                                  'Signup Here',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: ()=> Navigator.pushReplacementNamed(context,'/signup'),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ],
                  ),
                ),
            ),
      ),
    );
  }
}
