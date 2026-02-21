import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class progress extends StatefulWidget {
  const progress({super.key});

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
    final appstate=Provider.of<Appstate>(context);
    bool  isDark=appstate.isDark;
    bool  isBangla=appstate.isBangla;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF0F7A4F),
        title: Text(appstate.isBangla
            ? "অগ্রগতি সূচক"
            : "Progress Bar",
          style: context.watch<Appstate>().isBangla
              ? GoogleFonts.hindSiliguri(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          )
              :GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          )
      ),

    );
  }
}
