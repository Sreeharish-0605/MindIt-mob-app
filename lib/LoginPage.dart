import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MindIt/MemberScreen.dart';
import 'Admin/Admin_UserPage().dart';
import 'package:MindIt/variable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctname = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String verificationId = '';
  bool isOtpSent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed.
    mobileController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void _navigateToQuestionPage(BuildContext context) {
    //print("Hi...");
    final phoneNumber = '+91${mobileController.text.trim()}';
    if ('+91${mobileController.text.trim()}' == '+919025111251') {
      // Navigate to Admin_UserPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Admin_UserPage()),
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MemberScreen(phoneNumber: phoneNumber)));
    }
  }

  Future<void> verifyPhoneNumber() async {
    try {
      final phoneNumber = '+91${mobileController.text.trim()}';
      if (phoneNumber.length != 13) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid phone number format')),
        );
        return;
      }

      patientid = phoneNumber;
      caretaker = ctname.text.trim();
      if (caretaker.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Name cannot be empty')),
        );
        return;
      }
      caretaker = caretaker.isNotEmpty
          ? caretaker[0].toUpperCase() + caretaker.substring(1)
          : caretaker;
      if (caretaker.length < 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Name must be atleast 3 character long')),
        );
        return;
      }

      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final userDocRef = firestore.collection('users').doc(phoneNumber);
      await userDocRef.set({
        "created_at":
            FieldValue.serverTimestamp(), // Optional: track creation time
      });
      _navigateToQuestionPage(context);
      // if(phoneNumber=='+919025111251'){
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(builder: (context) => const Admin_UserPage())
      //   );
      // }
      // bool docexists = (await FirebaseFirestore.instance
      //         .collection('patients')
      //         .doc(patientid)
      //         .get())
      //     .exists;
      // print('Doc. Exists: $docexists');

      // if (phoneNumber.length == 13 && phoneNumber != '+919025111251') {
      //   //&& docexists){
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => MemberScreen(phoneNumber: phoneNumber)));
      // }
      // //else if(phoneNumber.length==13 && phoneNumber!='+919025111251' && !docexists){
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Phone Number not registered!')),
      //   );
      //   return;
      // }

      /* await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          _navigateToQuestionPage(context);
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Verification failed!'))

              // SnackBar(content: Text('Verification failed: ${e.message}')),
              );
        },
        codeSent: (String verificationId, int? resendToken) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Code sent to $phoneNumber')),
          );
          setState(() {
            this.verificationId = verificationId;
            isOtpSent = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            this.verificationId = verificationId;
          });
        },
      );*/
    } catch (e) {
     // print("Error is $e");
    }
  }

  Future<void> signInWithOTP() async {
    final code = otpController.text.trim();
    if (code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the OTP')),
      );
      return;
    }

    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
     // print('User signed in: ${userCredential.user}');
      _navigateToQuestionPage(context);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'invalid-verification-code') {
        errorMessage = 'The verification code entered is invalid.';
      } else {
        errorMessage = 'Error signing in with OTP: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CircularAppBarClipper(),
              child: Container(
                height: 200,
                color: const Color(0xFF9BB168),
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center, // Centers the 'Login' text
                    child: Text(
                      selectedLanguage == 'English' ? 'Login' : 'உள்நுழைய',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    selectedLanguage == 'English' ? 'Name' : 'பெயர்',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: ctname,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        // child: Text(
                        //   '+91',
                        //   style: TextStyle(fontSize: 18),
                        // ),
                      ),
                      labelText: selectedLanguage == 'English'
                          ? 'Enter your name'
                          : 'உங்கள் பெயரை உள்ளிடவும்',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    selectedLanguage == 'English'
                        ? 'Mobile Number'
                        : 'மொபைல் எண்',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          '+91',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      labelText: selectedLanguage == 'English'
                          ? 'Mobile Number'
                          : 'மொபைல் எண்',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: verifyPhoneNumber,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9BB168),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Text(
                          selectedLanguage == 'English' ? 'Login' : 'உள் நுழை',
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  /*            if (isOtpSent) ...[
                    SizedBox(height: 10),
                    TextField(
                      controller: otpController,
                      decoration: InputDecoration(
                        labelText: 'Enter The OTP',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: verifyPhoneNumber,
                          child: Text('Resend OTP'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 199, 197, 197),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: signInWithOTP,
                          child: Text('Next'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9BB168),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],*/
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      selectedLanguage == 'English'
                          ? 'Trouble in Login? Contact'
                          : 'உள்நுழைவதில் சிக்கலா? தொடர்பு கொள்ளவும்',
                      style: const TextStyle(
                          fontSize: 14, color: Color.fromARGB(240, 0, 0, 0)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone, color: Color(0xFF9BB168)),
                      const SizedBox(width: 10),
                      Text(
                        selectedLanguage == 'English'
                            ? 'Talk to an Expert'
                            : 'ஒரு நிபுணரிடம் பேசுங்கள்',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'support@me.com',
                      style: TextStyle(fontSize: 14, color: Color(0xFF9BB168)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
