import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class NewFormFillPage extends StatefulWidget {
  const NewFormFillPage({super.key});

  @override
  State<NewFormFillPage> createState() => _NFormFillPageState();
}

class _NFormFillPageState extends State<NewFormFillPage> {


  bool isBangla = false;
  bool isDark = false;
  final formkey=GlobalKey<FormState>();


  final fullNameBn=TextEditingController();
  final fullNameEn=TextEditingController();
  final fatherName=TextEditingController();
  final motherName=TextEditingController();
  final dateBirth=TextEditingController();
  final birthReg=TextEditingController();
  final Nid=TextEditingController();
  final religion=TextEditingController();
  final birthPlace=TextEditingController();

  final  oldPassportNo = TextEditingController();
  final  issueDate = TextEditingController();
  final  expiryDate = TextEditingController();
  final placeOfIssue = TextEditingController();


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
  String passportType = "Ordinary";
  String pageCount = "48";
  String validity = "5 Years";
  String policeVerify = "Yes";
  String urgentType = "Regular";
  bool sameAddress=false;
  Widget field(String label, TextEditingController controller,bool isDark)
  {


    return Padding(
      padding:const  EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        validator: (value)=> value == null || value.isEmpty ? "Required" : null,
        //style: TextStyle(
        // color: isDark?Colors.white:  Color(0xFF0F7A4F),
        //),
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
          title:Text(isBangla?" পাসপোর্ট নবায়ন ফর্ম" : "Passport Renewal Form",
            textAlign: TextAlign.center,
            style: isBangla?GoogleFonts.hindSiliguri(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color:Colors.white)
                :GoogleFonts.inter(
                fontSize: 25,
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
                    field(isBangla ? "জন্মস্থান" : "Place of Birth", birthPlace,isDark),

                    GestureDetector(
                      onTap: pickDate,
                      child: AbsorbPointer(
                        child: field(isBangla?"জন্ম তারিখ":"Date of Birth", dateBirth,isDark),

                      ),
                    ),

                    field(isBangla?"জন্ম নিবন্ধন নম্বর":"Birth Certificate Number", birthReg,isDark),
                    field(isBangla?"জাতীয় পরিচয়পত্র নম্বর (NID)":"Nation Id Card Number",Nid ,isDark),

                    dropdown(isBangla?"লিঙ্গ":"Gender", gender,
                      ["Male","Female","Others"],
                          (val) => setState(() => gender = val!)
                      , isDark: isDark,),


                    dropdown(isBangla?"বৈবাহিক অবস্থা":"Marital Status", maritalStatus,
                      ["Single","Married"],
                          (val)=>setState(()=>maritalStatus=val!),
                      isDark: isDark,
                    ),

                    sectionTitle(isBangla ? "পুরনো পাসপোর্টের তথ্য" : "Old Passport Information"),

                    field(isBangla ? "পুরনো পাসপোর্ট নম্বর" : "Old Passport Number", oldPassportNo, isDark),

                    field(isBangla ? "ইস্যুর তারিখ" : "Date of Issue", issueDate, isDark),

                    field(isBangla ? "মেয়াদ শেষের তারিখ" : "Expiry Date", expiryDate, isDark),

                    field(isBangla ? "ইস্যু স্থান" : "Place of Issue", placeOfIssue, isDark),

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


                    sectionTitle(isBangla ? "পাসপোর্ট সংক্রান্ত তথ্য" : "Passport Information"),

                    dropdown(
                      isBangla ? "পাসপোর্ট টাইপ" : "Passport Type",
                      passportType,
                      ["Ordinary","Official","Diplomatic"],
                          (val) => setState(() => passportType = val!),
                      isDark: isDark,
                    ),

                    dropdown(
                      isBangla ? "পৃষ্ঠা সংখ্যা" : "Page Count",
                      pageCount,
                      ["48","64"],
                          (val) => setState(() => pageCount = val!),
                      isDark: isDark,
                    ),

                    dropdown(
                      isBangla ? "মেয়াদ" : "Validity",
                      validity,
                      ["5 Years","10 Years"],
                          (val) => setState(() => validity = val!),
                      isDark: isDark,
                    ),

                    dropdown(
                      isBangla ? "পুলিশ ভেরিফিকেশন প্রয়োজন?" : "Police Verification Required?",
                      policeVerify,
                      ["Yes","No"],
                          (val) => setState(() => policeVerify = val!),
                      isDark: isDark,
                    ),

                    dropdown(
                      isBangla ? "জরুরি আবেদন?" : "Urgent Application?",
                      urgentType,
                      ["Regular","Express"],
                          (val) => setState(() => urgentType = val!),
                      isDark: isDark,
                    ),


                    sectionTitle(isBangla ? "ছবি আপলোড" : "Photo Upload"),

                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 40, color: Colors.green),
                            SizedBox(height: 8),
                             Text(isBangla ? "নতুন পাসপোর্টের জন্য ছবি আপলোড করুন"
                                : "Upload recent passport photo for renewal"),
                          ],
                        ),
                      ),
                    ),

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
