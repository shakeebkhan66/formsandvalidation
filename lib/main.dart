import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        accentColor: Colors.indigoAccent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print("Form is Validate");
    }
    else{
      print("Not Validate");
    }
  }

  String emailvalidate(value){
    if(value.isEmpty){
      return "Error";
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Forms And Validation App",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
              child: Column(       // We can use only child if we want to create a single textfield but here i want to create multiple textfield so that's why i'm using Form() instead of textfield
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    // validator: emailvalidate, // Manually Writing code and validate the Email Authentication

                    // validator: EmailValidator(errorText: "Not Valid"), // Single Validation done by using the library of form_field_validator

                  validator: MultiValidator([
                    RequiredValidator(errorText: "Must Required the Email"),
                    EmailValidator(errorText: "Not Valid"),
                  ]),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                    child:  TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent,
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      // validator: (val){             // Manually Done Validation
                      //   if(val.isEmpty){
                      //     return "Required";
                      //   }
                      //   else if(val.length < 6){
                      //     print("At least 6 Character are Required");
                      //   }
                      //   else{
                      //     return null;
                      //   }
                      // },

                      validator: MultiValidator([
                        RequiredValidator(errorText: "Must Required"),
                        MinLengthValidator(6, errorText: "More than 6 characters are required"),
                      ])
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      color: Colors.deepPurpleAccent,
                      splashColor: Colors.indigoAccent,
                      onPressed: validate,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                          "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}