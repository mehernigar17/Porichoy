import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
class Complainbox extends StatefulWidget {
  const Complainbox({super.key});

  @override
  State<Complainbox> createState() => _ComplainboxState();
}

class _ComplainboxState extends State<Complainbox> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);

    bool isDark = appState.isDark;
    bool isBangla = appState.isBangla;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF0F7A4F),
        title:Text(isBangla?" অভিযোগ বাক্স" : "Complaint Box",
          textAlign: TextAlign.center,
          style: isBangla?GoogleFonts.hindSiliguri(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color:Colors.white)
              :GoogleFonts.inter(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Colors.white
          ),
        ),
      ),
      body:SafeArea(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Text(context.watch<Appstate>().isBangla
                      ?"আপনার অভিযোগটি অভিযোগের ঘরে লিখুন- "
                      :"Enter your complaint in the complaint box-",
                      style:isBangla?GoogleFonts.hindSiliguri(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark?Colors.white:const Color(0xFF0F7A4F))
                          :GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isDark?Colors.white:const Color(0xFF0F7A4F),
                      )
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: context.watch<Appstate>().isBangla
                            ?"অভিযোগ বাক্স"
                            :'Complaint Box',
                        /*hintText:context.watch<Appstate>().isBangla
                            ?"অভিযোগটি লিখুন"
                            :'Enter your complain',*/
                        alignLabelWithHint: true,
                        hintStyle:context.watch<Appstate>().isBangla
                            ? GoogleFonts.hindSiliguri(
                            color: isDark?Colors.white:const Color(0xFF0F7A4F),
                        fontWeight:FontWeight.w500 )
                            :GoogleFonts.poppins(
                            color: isDark?Colors.white60:const Color(0xFF0F7A4F),
                        ) ,
                        labelStyle:  context.watch<Appstate>().isBangla
                            ? GoogleFonts.hindSiliguri(
                            color:const Color(0xFF0F7A4F),
                            fontWeight:FontWeight.w500 )
                            :GoogleFonts.poppins(
                          color:const Color(0xFF0F7A4F),),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                                color:Colors.lightGreen.shade700,
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 90, horizontal: 15),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width:200,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0F7A4F),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
              ],
            ),
          )
      ),
    );
  }
}
