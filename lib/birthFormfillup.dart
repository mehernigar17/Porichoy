import 'package:porichoy/appstate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class Birthformfillup extends StatefulWidget {
  const Birthformfillup({super.key});

  @override
  State<Birthformfillup> createState() => _BirthformfillupState();
}

class _BirthformfillupState extends State<Birthformfillup> {


  bool isBangla = false;
  bool isDark = false;
  final formkey=GlobalKey<FormState>();


  final fullNameBn=TextEditingController();
  final fullNameEn=TextEditingController();
  final fatherName=TextEditingController();
  final motherName=TextEditingController();
  final dateBirth=TextEditingController();
  final religion=TextEditingController();
  final perVillage=TextEditingController();
  final perPost=TextEditingController();
  final perThana=TextEditingController();
  final perDistrict=TextEditingController();
  final perDivision=TextEditingController();
  final preVillage=TextEditingController();
  final prePost=TextEditingController();
  final preThana=TextEditingController();
  final preDistrict=TextEditingController();
  final preDivision=TextEditingController();
  final guardianName=TextEditingController();
  final guardianNid=TextEditingController();
  final guardianPhone=TextEditingController();
  final mobile=TextEditingController();
  final altMobile=TextEditingController();
  final email=TextEditingController();



  String gender="Male";
  String maritalStatus="Single";
  String relation="Father";
  bool sameAddress=false;
  Widget field(String label, TextEditingController controller,bool isDark)
  {


    return Padding(
      padding:const  EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        validator: (value)=> value == null || value.isEmpty ? "Required" : null,

        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: isDark?Colors.white:Color(0xFF0F7A4F),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  Color(0xFF0F7A4F))
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  Color(0xFF0F7A4F))

            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  Color(0xFF0F7A4F),width: 2)
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            )
        ),

      ),



    );
  }


  Widget dropdown(String label,String value,List <String> items,Function(String?)onChanged, {bool isDark = false}){

    List <DropdownMenuItem<String>>menuItems=[];
    for(var item in items){
      menuItems.add(DropdownMenuItem(
        value: item,
        child:Text(item),
      ));


    }
    return Padding(padding:
    EdgeInsets.symmetric(vertical: 6) ,
      child: DropdownButtonFormField<String>(
        value: value,
        items: menuItems,


        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: isDark?Colors.white:Color(0xFF0F7A4F),
              fontWeight: FontWeight.bold,
            ),
            floatingLabelStyle: TextStyle(
              color: isDark ? Colors.white : Color(0xFF0F7A4F),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color:    Color(0xFF0F7A4F)),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  Color(0xFF0F7A4F))

            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:const BorderSide(color:  Color(0xFF0F7A4F),width: 2)
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            )
        ),




      ),

    );

  }



  Widget  sectionTitle(String text){
    return Container(
      //color: Color(0xFF0F7A4F),
      width: double.infinity,
      margin: EdgeInsets.all(12),
      padding:EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF0F7A4F),

        borderRadius: BorderRadius.circular(8),
        border: Border.all(color:  Color(0xFF0F7A4F),


        ),
      ),
      child: Center(
          child: Text(
            text,
            style: isBangla?GoogleFonts.hindSiliguri(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white,
            )
                : GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          )

      ),
    );
  }


  Future <void> pickDate()async{
    DateTime?picked=await showDatePicker(context: context,
        firstDate: DateTime(1944),
        lastDate: DateTime.now(),
        builder: (context,child){

          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF0F7A4F),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        }
    );

  }
  void submit (){
    if(formkey.currentState!.validate()){

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Form validated successfully!"),)
      );
   }

  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool isBangla = appState.isBangla;
    return Scaffold(
        backgroundColor: isDark?Colors.black:Colors.white,
        appBar: AppBar(
          backgroundColor:const Color(0xFF0F7A4F),
          title:Text(isBangla?"জন্ম নিবন্ধনের জন্য আবেদন" : "Application for birth registration",
            textAlign: TextAlign.center,
            style: isBangla?GoogleFonts.hindSiliguri(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:Colors.white)
                :GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white

            ),

          ),

        ) ,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    sectionTitle(isBangla?"ব্যক্তিগত তথ্য":"Personal Information"),
                    field(isBangla?"পূর্ণ নাম (বাংলায়)":"Full Name In Bangla",fullNameBn,isDark ),
                    field(isBangla?" পূর্ণ নাম (ইংরেজিতে)":"Full Name In English",fullNameEn ,isDark),
                    field(isBangla?"পিতার নাম":"Fathers's Name",fatherName ,isDark),
                    field(isBangla?"মাতার নাম":"Mothers's Name",fullNameBn,isDark ),
                    field(isBangla ? "ধর্ম" : "Religion", religion,isDark),
                    GestureDetector(
                      onTap: pickDate,
                      child: AbsorbPointer(
                        child: field(isBangla?"জন্ম তারিখ":"Date of Birth", dateBirth,isDark),
                      ),
                    ),


                    dropdown(isBangla?"লিঙ্গ":"Gender", gender,
                      ["Male","Female","Others"],
                          (val) => setState(() => gender = val!)
                      , isDark: isDark,),

                    sectionTitle(isBangla ? "যোগাযোগের ঠিকানা" : "Contact Address"),

                    field(isBangla ? "স্থায়ী - গ্রাম/বাসা" : "Permanent - Village/House", perVillage,isDark),
                    field(isBangla ? "স্থায়ী - পোস্ট অফিস" : "Permanent - Post Office", perPost,isDark),
                    field(isBangla ? "স্থায়ী - থানা" : "Permanent - Thana", perThana,isDark),
                    field(isBangla ? "স্থায়ী - জেলা" : "Permanent - District", perDistrict,isDark),
                    field(isBangla ? "স্থায়ী - বিভাগ" : "Permanent - Division", perDivision,isDark),

                    CheckboxListTile(
                      value: sameAddress,
                      onChanged: (val) {
                        setState(() => sameAddress = val!);
                      },
                      title: Text(isBangla ? "বর্তমান ঠিকানা স্থায়ী ঠিকানার মতো" : "Current address same as permanent"),
                      checkColor: Colors.white,
                      activeColor: isDark ? Colors.greenAccent : Colors.green,
                      tileColor: isDark ? Colors.grey[850] : Colors.white,
                    ),


                    if (!sameAddress) ...[
                      field(isBangla ? "বর্তমান - গ্রাম/বাসা" : "Present - Village/House", preVillage,isDark),
                      field(isBangla ? "বর্তমান - পোস্ট অফিস" : "Present - Post Office", prePost,isDark),
                      field(isBangla ? "বর্তমান - থানা" : "Present - Thana", preThana,isDark),
                      field(isBangla ? "বর্তমান - জেলা" : "Present - District", preDistrict,isDark),
                      field(isBangla ? "বর্তমান - বিভাগ" : "Present - Division", preDivision,isDark),
                    ],


                    sectionTitle(isBangla ? "অভিভাবকের তথ্য" : "Guardian Information"),

                    field(isBangla ? "অভিভাবকের নাম" : "Guardian Name", guardianName,isDark),

                    dropdown(
                      isBangla ? "সম্পর্ক" : "Relation",
                      relation,
                      ["Father","Mother","Husband","Legal Guardian"],
                          (val) => setState(() => relation = val!),
                      isDark: isDark,
                    ),

                    field(isBangla ? "অভিভাবকের NID" : "Guardian NID", guardianNid,isDark),
                    field(isBangla ? "ফোন নম্বর" : "Phone Number", guardianPhone,isDark),


                    sectionTitle(isBangla ? "যোগাযোগ তথ্য" : "Contact Information"),

                    field(isBangla ? "মোবাইল নম্বর" : "Mobile Number", mobile,isDark),
                    field(isBangla ? "বিকল্প মোবাইল" : "Alternate Mobile", altMobile,isDark),
                    field(isBangla ? "ইমেইল ঠিকানা" : "Email Address", email,isDark),


                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0F7A4F),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isBangla ? "জমা দিন" : "Submit",
                          style: isBangla
                              ? GoogleFonts.hindSiliguri(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                              : GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),


                  ],

                )
            )
        )
    );

  }
}
