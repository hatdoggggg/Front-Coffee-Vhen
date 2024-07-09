import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/services/user.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});


  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

createAccount(User user) async{
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/v1/auth/register/user'),
    headers : <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username' : user.username,
      'email' : user.email,
      'password' : user.password,
    }),
  );
  print(response.body);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0,50.0,10.0,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                'Lets Get Started!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  fontSize: 24.5,
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
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please provide a name';
                        }
                        if (value.length < 2) {
                          return 'Name should be atleast 3 letters long';
                        }
                        return null;
                      } ,
                      onSaved:  (value) {
                        username = value!;
                      },
                    ),
                    SizedBox(height: 30.0,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please provide a email';
                        }
                        if (value.length < 2) {
                          return 'Name should be atleast 60 letters long';
                        }
                        return null;
                      } ,
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 30.0,),
                      TextFormField(
                        obscureText: true,
                       decoration: InputDecoration(
                       label: Text('Password'),
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0)
                         ),
                       ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please provide a password';
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
                    SizedBox(height: 30.0,),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          User user = User(
                              username: username,
                              email: email,
                              password: password
                          );
                          createAccount(user);
                          Navigator.pushReplacementNamed(context, '/login');
;                        }
                      },
                      child: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[300],
                        foregroundColor: Colors.black
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Login Here',
                            style: TextStyle(
                              color: Colors.limeAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: ()=> Navigator.pushReplacementNamed(context,'/login'),
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
    );
  }
}
