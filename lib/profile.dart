import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appstate.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _phoneNumber;
  String? _displayName;
  String? _email;
  bool _isLoading = true;

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';

    String? firestoreEmail;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      firestoreEmail = doc.data()?['email'];
    }

    setState(() {
      _phoneNumber = email.endsWith('@myapp.com')
          ? email.replaceAll('@myapp.com', '')
          : null;
      _displayName = user?.displayName;
      _email = firestoreEmail;
      _isLoading = false;
    });
  }

  Future<void> _saveEmail(String newEmail) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({'email': newEmail.trim()}, SetOptions(merge: true));

    setState(() {
      _email = newEmail.trim();
    });
  }

  void _showEditEmailDialog(BuildContext context, Appstate appState) {
    _emailController.text = _email ?? '';
    final Color brandColor = const Color(0xFF0F7A4F);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          appState.isBangla ? "ইমেইল আপডেট করুন" : "Update Email",
          style: GoogleFonts.hindSiliguri(),
        ),
        content: TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: appState.isBangla ? "ইমেইল লিখুন" : "Enter email address",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: brandColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: brandColor, width: 1.5),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              appState.isBangla ? "বাতিল" : "Cancel",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_emailController.text.trim().isNotEmpty) {
                Navigator.pop(context);
                await _saveEmail(_emailController.text);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: brandColor),
            child: Text(
              appState.isBangla ? "সংরক্ষণ" : "Save",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Appstate>(
      builder: (context, appState, _) {
        final Color scaffoldBg = appState.isDark ? Colors.grey[900]! : Colors.white;
        final Color textColor = appState.isDark ? Colors.white : Colors.black;
        final Color brandColor = const Color(0xFF0F7A4F);

        final String displayPhone = (_phoneNumber != null && _phoneNumber!.isNotEmpty)
            ? _phoneNumber!
            : (appState.isBangla ? "নম্বর পাওয়া যায়নি" : "Number not found");

        final String displayName = (_displayName != null && _displayName!.isNotEmpty)
            ? _displayName!
            : (appState.isBangla ? "নাম পাওয়া যায়নি" : "Name not found");

        final String displayEmail = (_email != null && _email!.isNotEmpty)
            ? _email!
            : (appState.isBangla ? "ইমেইল যোগ করা হয়নি" : "Email not added");

        return Scaffold(
          backgroundColor: scaffoldBg,
          appBar: AppBar(
            title: Text(appState.isBangla ? "প্রোফাইল" : "Profile"),
            foregroundColor: textColor,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: brandColor,
                            child: const Icon(Icons.person, size: 70, color: Colors.white),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: appState.isDark ? Colors.grey[800] : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: scaffoldBg, width: 2),
                              ),
                              child: Icon(Icons.edit, size: 18, color: brandColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _isLoading
                          ? SizedBox(
                        height: 24,
                        width: 24,
                      )
                          : Text(
                        displayName,
                        style: GoogleFonts.hindSiliguri(fontSize: 22, color: textColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  appState.isBangla ? "ব্যক্তিগত তথ্য" : "Personal Information",
                  style: GoogleFonts.hindSiliguri(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.phone, color: Color(0xFF0F7A4F)),
                  title: Text(
                    appState.isBangla ? "ফোন নম্বর" : "Phone Number",
                    style: TextStyle(color: textColor, fontSize: 12),
                  ),
                  subtitle: _isLoading
                      ? SizedBox(
                    height: 16, width: 16,
                  )
                      : Text(displayPhone, style: TextStyle(color: textColor, fontSize: 16)),
                ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.email, color: Color(0xFF0F7A4F)),
                  title: Text(
                    appState.isBangla ? "ইমেইল" : "Email",
                    style: TextStyle(color: textColor, fontSize: 12),
                  ),
                  subtitle: _isLoading
                      ? SizedBox(
                    height: 16, width: 16,
                  )
                      : Text(
                    displayEmail,
                    style: TextStyle(
                      color: (_email == null || _email!.isEmpty)
                          ? Colors.grey
                          : textColor,
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: brandColor, size: 20),
                    onPressed: () => _showEditEmailDialog(context, appState),
                  ),
                ),


                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.location_on, color: Color(0xFF0F7A4F)),
                  title: Text(
                    appState.isBangla ? "স্থায়ী ঠিকানা" : "Permanent Address",
                    style: TextStyle(color: textColor, fontSize: 12),
                  ),
                  subtitle: Text(
                    appState.isBangla ? "ঢাকা, বাংলাদেশ" : "Dhaka, Bangladesh",
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}