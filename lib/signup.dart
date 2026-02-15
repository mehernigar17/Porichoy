import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porichoy/homepage.dart';
import 'package:porichoy/login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var numberText=TextEditingController();
  var passText=TextEditingController();
  bool  _obsecureText =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.language,color:const Color(0xFF0F7A4F))
          )
        ],
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('assets/pictures/porichoy.png'),
                height: 200,
                width: 200,
              ),
              Container(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: numberText,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(
                      color:const Color(0xFF0F7A4F),
                    ),
                    hintText: 'Enter Mobile Number',
                    prefixIcon: Icon(Icons.phone,color:const Color(0xFF0F7A4F)),
                    focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                            color: Colors.lightGreen.shade700,
                            width: 2
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                            color:const Color(0xFF0F7A4F),
                            width:2
                        )
                    ),
                  ),
                  validator: (value){
                    return value!.isEmpty?'Please Enter Mobile Number':null;
                  },
                ),
              ),
              Container(height: 23,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: _obsecureText,
                  controller: passText,
                  decoration: InputDecoration(
                      labelText:'New Password' ,
                      labelStyle: TextStyle(
                        color:const Color(0xFF0F7A4F),
                      ),
                      hintText: 'New Password',
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              color: Colors.lightGreen.shade700,
                              width: 2
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              color: const Color(0xFF0F7A4F),
                              width:2
                          )
                      ),
                      suffixIcon: IconButton(
                        onPressed:(){
                          setState(() {
                            _obsecureText=!_obsecureText;
                          });
                        },
                        icon:Icon(_obsecureText
                            ? Icons.visibility_off
                            : Icons.visibility,color:const Color(0xFF0F7A4F)),
                      )

                  ),
                  validator: (value){
                    return value!.isEmpty?'Please Enter Password':null;
                  },
                ),
              ),
              Container(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: _obsecureText,
                  decoration: InputDecoration(
                      labelText:'Confirm Password' ,
                      labelStyle: TextStyle(
                        color:const Color(0xFF0F7A4F),
                      ),
                      hintText: 'Confirm Password',
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              color: Colors.lightGreen.shade700,
                              width: 2
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              color: const Color(0xFF0F7A4F),
                              width:2
                          )
                      ),
                      suffixIcon: IconButton(
                        onPressed:(){
                          setState(() {
                            _obsecureText=!_obsecureText;
                          });
                        },
                        icon:Icon(_obsecureText
                            ? Icons.visibility_off
                            : Icons.visibility,color:const Color(0xFF0F7A4F)),
                      )

                  ),
                  validator: (value){
                    return value!.isEmpty?'Please Enter Password':null;
                  },
                ),
              ),
              Container(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context)=>homepage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F7A4F),
                      minimumSize: Size(400, 50)
                  ),
                  child:Text('Sign Up',
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(height:150,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an Account?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context)=>login(),
                      ),
                    );
                  },
                    child: Text("Login Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: const Color(0xFF0F7A4F),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
