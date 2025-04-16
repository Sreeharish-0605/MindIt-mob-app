// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:MindIt/variable.dart';
// import 'package:flutter/material.dart';
// import 'QuestionPage1.dart';
// import 'QuestionPage2.dart';
// import 'QuestionPage3.dart';

// class AgeSelectionPage extends StatefulWidget {
//   const AgeSelectionPage({Key? key}) : super(key: key);

//   @override
//   State<AgeSelectionPage> createState() => _AgeSelectionPageState();
// }

// class _AgeSelectionPageState extends State<AgeSelectionPage> {
//   String patientName = "Loading...";
//   String previousHistory = "Fetching history...";
//   String resultPageContent = "";

//   @override
//   void initState() {
//     super.initState();
//     _fetchPatientDetails();
//   }

//   Future<void> _fetchPatientDetails() async {
//     try {
//       DocumentSnapshot patientSnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(patientid)
//           .collection('members')
//           .doc(answersfor)
//           .get();

//       if (patientSnapshot.exists) {
//         setState(() {
//           patientName = patientSnapshot['details.Name'] ?? "Unknown";
//           previousHistory = patientSnapshot['result'] ?? "No history available";
//           resultPageContent =
//               patientSnapshot['result'] ?? "No result data available";
//         });
//       }
//     } catch (error) {
//       setState(() {
//         patientName = "fetching name";
//         previousHistory = "No Previous History";
//       });
//       print("Error fetching patient details: $error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Top Section with Rounded Clipper
//           ClipPath(
//             clipper: RoundedClipper(),
//             child: Container(
//               height: 150,
//               color: const Color.fromRGBO(155, 177, 104, 1.0),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: Text(
//                     'Welcome, $caretaker',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 40),
//           Text(
//             "You are entering for ${others ? answersfor : "yourself"}",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             "Select ${others ? "his" : "your"} age group",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 40),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               children: [
//                 _buildAgeButton(
//                     context, "Below 18yrs", const QuestionPage1(), "below18"),
//                 const SizedBox(height: 30),
//                 _buildAgeButton(
//                     context, "18yrs - 60yrs", const QuestionPage2(), "adult"),
//                 const SizedBox(height: 30),
//                 _buildAgeButton(
//                     context, "Above 60yrs", const QuestionPage3(), "above60"),
//                 const SizedBox(height: 30),
//                 GestureDetector(
//                   child: Container(
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Text(
//                       "Previous history: $previousHistory",
//                       style: const TextStyle(fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: TextButton(
//               onPressed: () => _showLogoutDialog(context),
//               style: TextButton.styleFrom(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                 side: const BorderSide(
//                   color: Color.fromRGBO(155, 177, 104, 1.0),
//                 ),
//               ),
//               child: const Text(
//                 "Logout",
//                 style: TextStyle(
//                   color: Color.fromRGBO(155, 177, 104, 1.0),
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   ElevatedButton _buildAgeButton(
//       BuildContext context, String label, Widget page, String answer) {
//     return ElevatedButton(
//       onPressed: () {
//         selected = answer;
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         );
//       },
//       child: Text(
//         label,
//         style: const TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
//         textStyle: const TextStyle(fontSize: 18),
//         backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
//       ),
//     );
//   }

//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm Logout'),
//           content: const Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.black54),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.popUntil(context, (route) {
//                   return route.settings.name == 'login';
//                 });
//               },
//               child: const Text(
//                 'Logout',
//                 style: TextStyle(
//                   color: Color.fromRGBO(155, 177, 104, 1.0),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class RoundedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class PatientResultPage extends StatelessWidget {
//   final String content;

//   const PatientResultPage({Key? key, required this.content}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Patient Result')),
//       body: Center(
//         child: Text(
//           content,
//           style: const TextStyle(fontSize: 18),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MindIt/variable.dart';
import 'package:flutter/material.dart';
import 'QuestionPage1.dart';
import 'QuestionPage2.dart';
import 'QuestionPage3.dart';

class AgeSelectionPage extends StatefulWidget {
  const AgeSelectionPage({super.key});

  @override
  State<AgeSelectionPage> createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  String patientName = "Loading...";
  String previousHistory = "Fetching history...";
  String resultPageContent = "";

  @override
  void initState() {
    super.initState();
    _fetchPatientDetails();
  }

  Future<void> _fetchPatientDetails() async {
    try {
      DocumentSnapshot patientSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(patientid)
          .collection('members')
          .doc(answersfor)
          .get();

      if (patientSnapshot.exists) {
        setState(() {
          patientName = patientSnapshot['details.Name'] ?? "Unknown";
          previousHistory = patientSnapshot['result'] ?? "No history available";
          district =
              patientSnapshot['details.District'] ?? "district not given";

          resultPageContent =
              patientSnapshot['result'] ?? "No result data available";
        });
      }
    } catch (error) {
      setState(() {
        patientName = "fetching name";
        previousHistory = "No Previous History";
      });
      // print("Error fetching patient details: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Section with Rounded Clipper
          ClipPath(
            clipper: RoundedClipper(),
            child: Container(
              height: 150,
              color: const Color.fromRGBO(155, 177, 104, 1.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    selectedLanguage == 'English'
                        ? "Welcome $caretaker"
                        : "வணக்கம் $caretaker",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            selectedLanguage == "English"
                ? "You are entering for ${others ? answersfor : "yourself"}"
                : "நீங்கள் ${others ? "$answersfor க்காக" : "உங்களுக்காக"} உள்ளீர்கள்",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 20),

          Text(
            selectedLanguage == "English"
                ? "Select ${others ? "his" : "your"} age group"
                : "${others ? "அவரின்" : "உங்கள்"} வயது குழுவை தேர்வுசெய்க",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                _buildAgeButton(
                    context,
                    selectedLanguage == 'English'
                        ? "Below 18yrs"
                        : "18 வயதுக்கு கீழ்",
                    const QuestionPage1(),
                    "below18"),
                const SizedBox(height: 15),
                _buildAgeButton(
                    context,
                    selectedLanguage == 'English'
                        ? "18yrs - 60yrs"
                        : "18 வயது - 60 வயது",
                    const QuestionPage2(),
                    "adult"),
                const SizedBox(height: 15),
                _buildAgeButton(
                    context,
                    selectedLanguage == 'English'
                        ? "Above 60yrs"
                        : "60 வயதுக்கு மேல்",
                    const QuestionPage3(),
                    "above60"),
                const SizedBox(height: 30),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      selectedLanguage == "English"
                          ? "Previous history: $previousHistory"
                          : "முந்தைய வரலாறு: $previousHistory",
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextButton(
              onPressed: () => _showLogoutDialog(context),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                side: const BorderSide(
                  color: Color.fromRGBO(155, 177, 104, 1.0),
                ),
              ),
              child: Text(
                selectedLanguage == "English" ? "Logout" : "வெளியேறு",
                style: const TextStyle(
                  color: Color.fromRGBO(155, 177, 104, 1.0),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildAgeButton(
      BuildContext context, String label, Widget page, String answer) {
    return ElevatedButton(
      onPressed: () {
        selected = answer;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        textStyle: const TextStyle(fontSize: 18),
        backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            selectedLanguage == "English"
                ? "Confirm Logout"
                : "வெளியேறுவதை உறுதிப்படுத்தவும்",
          ),
          content: Text(
            selectedLanguage == "English"
                ? "Are you sure you want to logout?"
                : "நீங்கள் நிச்சயமாக வெளியேற விரும்புகிறீர்களா?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) {
                  return route.settings.name == 'login';
                });
              },
              child: Text(
                selectedLanguage == "English" ? "Logout" : "வெளியேறு",
                style: const TextStyle(
                  color: Color.fromRGBO(155, 177, 104, 1.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PatientResultPage extends StatelessWidget {
  final String content;

  const PatientResultPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Result')),
      body: Center(
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
