import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porichoy/homepage.dart';
import 'package:porichoy/login.dart';
import 'package:porichoy/appstate.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();

}

class _signupState extends State<signup> {

  var numberText=TextEditingController();
  var passText=TextEditingController();
  var confirmPassText = TextEditingController();

  Future<void> registerUser() async {
    if (numberText.text.isEmpty || passText.text.isEmpty || confirmPassText.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all information"), backgroundColor: Colors.red),
      );
      return;
    }

    if (passText.text != confirmPassText.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!"), backgroundColor: Colors.orange),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "${numberText.text.trim()}@myapp.com",
        password: passText.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const homepage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Registration Failed")),
      );
    }
  }

  bool  _obsecureText =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){
                final appstate=context.read<Appstate>();
                appstate.setLanguage(!appstate.isBangla);
              },
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
                    labelText: context.watch<Appstate>().isBangla
                        ?"মোবাইল নম্বর"
                        :'Mobile Number',
                    hintText:context.watch<Appstate>().isBangla
                        ?"মোবাইল নম্বর লিখুন"
                        :'Enter Mobile Number',
                    hintStyle:context.watch<Appstate>().isBangla
                        ? GoogleFonts.hindSiliguri(
                        color:const Color(0xFF0F7A4F),
                        fontWeight:FontWeight.w500 )
                        :GoogleFonts.poppins(
                      color:const Color(0xFF0F7A4F),) ,
                    labelStyle:  context.watch<Appstate>().isBangla
                        ? GoogleFonts.hindSiliguri(
                        color:const Color(0xFF0F7A4F),
                        fontWeight:FontWeight.w500 )
                        :GoogleFonts.poppins(
                      color:const Color(0xFF0F7A4F),),
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
                      labelText: context.watch<Appstate>().isBangla
                          ?"নতুন পাসওয়ার্ড "
                          :'New Password',
                      hintText:context.watch<Appstate>().isBangla
                          ?"পাসওয়ার্ড"
                          :'Password',
                      hintStyle:context.watch<Appstate>().isBangla
                          ? GoogleFonts.hindSiliguri(
                          color:const Color(0xFF0F7A4F),
                          fontWeight:FontWeight.w500 )
                          :GoogleFonts.poppins(
                        color:const Color(0xFF0F7A4F),) ,
                      labelStyle:  context.watch<Appstate>().isBangla
                          ? GoogleFonts.hindSiliguri(
                          color:const Color(0xFF0F7A4F),
                          fontWeight:FontWeight.w500 )
                          :GoogleFonts.poppins(
                        color:const Color(0xFF0F7A4F),),
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
                  controller: confirmPassText,
                  decoration: InputDecoration(
                      labelText: context.watch<Appstate>().isBangla
                          ?" পাসওয়ার্ড নিশ্চিত করুন "
                          :'Confirm Password',
                      hintText:context.watch<Appstate>().isBangla
                          ?"পাসওয়ার্ড "
                          :'Confirm Password',
                      hintStyle:context.watch<Appstate>().isBangla
                          ? GoogleFonts.hindSiliguri(
                          color:const Color(0xFF0F7A4F),
                          fontWeight:FontWeight.w500 )
                          :GoogleFonts.poppins(
                        color:const Color(0xFF0F7A4F),) ,
                      labelStyle:  context.watch<Appstate>().isBangla
                          ? GoogleFonts.hindSiliguri(
                          color:const Color(0xFF0F7A4F),
                          fontWeight:FontWeight.w500 )
                          :GoogleFonts.poppins(
                        color:const Color(0xFF0F7A4F),),
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
                  onPressed:registerUser,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F7A4F),
                      minimumSize: Size(400, 50)
                  ),
                  child:Text(context.watch<Appstate>().isBangla
                      ?"সাইন আপ"
                      :"Sign Up",
                    style: context.watch<Appstate>().isBangla
                        ? GoogleFonts.hindSiliguri(
                        color:Colors.white,
                        fontSize: 16,
                        fontWeight:FontWeight.w600 )
                        :GoogleFonts.poppins(
                        color:Colors.white,
                        fontSize: 16,
                        fontWeight:FontWeight.w600) ,
                  ),
                ),
              ),
              Container(height:130,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(context.watch<Appstate>().isBangla
                      ?"ইতিমধ্যে একটি অ্যাকাউন্ট আছে?"
                      :"Already Have an Account?",
                    style: context.watch<Appstate>().isBangla
                        ? GoogleFonts.hindSiliguri(
                      color:Colors.black,
                      fontSize: 16,
                    )
                        :GoogleFonts.poppins(
                      color:Colors.black,
                      fontSize: 16,
                    ),),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context)=>login(),
                      ),
                    );
                  },
                    child: Text(context.watch<Appstate>().isBangla
                        ?"লগইন করুন"
                        :"Login Now",
                      style: context.watch<Appstate>().isBangla
                          ? GoogleFonts.hindSiliguri(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: const Color(0xFF0F7A4F),
                      )
                          :GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: const Color(0xFF0F7A4F),
                      ),),
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

