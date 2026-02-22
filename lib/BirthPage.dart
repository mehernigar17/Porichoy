import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'birthFormfillup.dart';


class BirthPage extends StatefulWidget {
  const BirthPage({super.key});

  @override
  State<BirthPage> createState() => _BirthPage();
}

class _BirthPage extends State<BirthPage> {

  List <bool> isExpandedList=[false,false,false,false];
  List<bool> isHoveredList = [false, false, false, false];
  Widget buildCard({
    required int index,
    required String title,
    required bool expanded,
    required VoidCallback ontap,
    required String content,

  }){
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool  isBangla= appState.isBangla;
    return  Column(
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              isHoveredList[index]= true;
            });
          },
          onExit: (_) {
            setState(() {
              isHoveredList[index] = false;
            });
          },
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:   isHoveredList[index]|| isExpandedList[index] ? Colors.white : const Color(0xFF0F7A4F),
                borderRadius: BorderRadius.circular(16),

              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(title,
                          style:isBangla?
                          GoogleFonts.hindSiliguri(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:   isHoveredList[index]  || expanded
                                ? (isDark ?const Color(0xFF0F7A4F)  : const Color(0xFF0F7A4F))
                                : (isDark ?Colors.white : Colors.white),
                          )
                              : GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:   isHoveredList[index]  || expanded
                                ? (isDark ? const Color(0xFF0F7A4F): const Color(0xFF0F7A4F))
                                : (isDark ? Colors.white: Colors.white),
                          ),

                        )
                      ],
                    ),
                  ),
                  Icon(
                    expanded?Icons.close:Icons.add_box_rounded,
                    color:   isHoveredList[index]|| expanded ? const Color(0xFF0F7A4F) : Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        if (expanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              content,
              style: const TextStyle(color: Color(0xFF0F7A4F)),
            ),
          ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
