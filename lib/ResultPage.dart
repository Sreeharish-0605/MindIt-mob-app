// /*import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lottie/lottie.dart';
// import 'package:MindIt/variable.dart';
// import 'package:MindIt/LoginPage.dart';

// class ResultPage extends StatefulWidget {
//   final Map<String, String> answers;

//   const ResultPage({Key? key, required this.answers}) : super(key: key);

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   int _rating = 0;
//   final TextEditingController _feedbackController = TextEditingController();
//   bool _feedbackSubmitted = false;

//   Future<void> _savePatientData(String recommendation) async {
//     try {
//       CollectionReference patientsRef =
//           FirebaseFirestore.instance.collection('users');

//       await patientsRef
//           .doc(patientid)
//           .collection('members')
//           .doc(answersfor)
//           .set({
//         'answers': widget.answers,
//         'result': recommendation,
//         'created_at': Timestamp.now(),
//       }, SetOptions(merge: true));

//       setState(() {});
//     } catch (e) {
//       // print('Error saving patient data: $e');
//     }
//   }

//   Future<void> _submitFeedback() async {
//     try {
//       CollectionReference feedbackRef =
//           FirebaseFirestore.instance.collection('feedback');

//       await feedbackRef.add({
//         'patientId': patientid,
//         'answersFor': answersfor,
//         'rating': _rating,
//         'feedbackText': _feedbackController.text.trim(),
//         'submittedAt': Timestamp.now(),
//       });

//       setState(() {
//         _feedbackSubmitted = true;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Feedback submitted successfully!')),
//       );
//     } catch (e) {
//       // print('Error submitting feedback: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to submit feedback. Please try again.')),
//       );
//     }
//   }

//   Widget _buildStarRating() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (index) {
//         return IconButton(
//           icon: Icon(
//             index < _rating ? Icons.star : Icons.star_border,
//             color: Colors.amber,
//             size: 40,
//           ),
//           onPressed: () {
//             setState(() {
//               _rating = index + 1;
//             });
//           },
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ClipPath(
//             clipper: RoundedAppBarClipper(curveHeight: 50),
//             child: Container(
//               color: const Color.fromRGBO(155, 177, 104, 1.0),
//               height: 150,
//               alignment: Alignment.center,
//               child: const Text(
//                 'Assessment Result',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Your Health Assessment',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 20),
//                     _buildRecommendation(),
//                     Center(
//                       child: Lottie.asset(
//                         'assets/animations/result.json',
//                         width: 300,
//                         height: 300,
//                         repeat: true,
//                         animate: true,
//                         frameRate: FrameRate.max,
//                       ),
//                     ),

//                     // Feedback Section
//                     if (!_feedbackSubmitted) ...[
//                       const SizedBox(height: 20),
//                       const Text(
//                         'How was your assessment experience?',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       _buildStarRating(),
//                       const SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: TextField(
//                           controller: _feedbackController,
//                           decoration: InputDecoration(
//                             hintText:
//                                 'Share your thoughts about the assessment',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           maxLines: 3,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _rating > 0 ? _submitFeedback : null,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: _rating > 0
//                               ? const Color.fromRGBO(155, 177, 104, 1.0)
//                               : Colors.grey,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 30.0, vertical: 12.0),
//                         ),
//                         child: const Text(
//                           'Submit Feedback',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ] else ...[
//                       const SizedBox(height: 20),
//                       const Text(
//                         'Thank you for your feedback!',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],

//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         red = 0;
//                         yellow = 0;
//                         patientid = "";
//                         patientname = "";
//                         selected = "";
//                         others = false;
//                         caretaker = "";
//                         phoneNum = "";
//                         otherdetails = {};
//                         answersfor = "";
//                         Navigator.popUntil(context, (route) {
//                           return route.settings.name == 'login';
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color.fromRGBO(155, 177, 104, 1.0),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30.0, vertical: 12.0),
//                       ),
//                       child: const Text(
//                         'Back to Home',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRecommendation() {
//     String health = "GOOD";
//     String meet = "VHN";

//     if (selected == "below18") {
//       if (red >= 1 && yellow >= 5) {
//         // if (red >= 1 || yellow >= 5) {
//         health = "TERTIARY";
//         meet = "TERTIARY";
//       } else if (yellow > 5) {
//         //      } else if (yellow < 5) {
//         health = "BETTER";
//         meet = "GOVERMENT HOSPITAL";
//       } else {
//         health = "GOOD";
//         meet = "VHN";
//       }
//     } else if (selected == "adult") {
//       if (red >= 1 && yellow >= 3) {
//         health = "TERTIARY";
//         meet = "TERTIARY";
//       } else if (yellow > 3) {
//         health = "BETTER";
//         meet = "GOVERMENT HOSPITAL";
//       } else {
//         health = "GOOD";
//         meet = "VHN";
//       }
//     } else if (selected == "above60") {
//       if (red >= 1 && yellow >= 3) {
//         health = "TERTIARY";
//         meet = "TERTIARY";
//       } else if (yellow > 3) {
//         health = "BETTER";
//         meet = "GOVERMENT HOSPITAL";
//       } else {
//         health = "GOOD";
//         meet = "VHN";
//       }
//     }
//     String recommendation =
//         "${others ? answersfor + " is" : "You are"} suggested to kindly meet Psychiatrist at $meet.";
//     _savePatientData(recommendation);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const Text(
//           'Recommendation',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           recommendation,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 16, color: Colors.black),
//         ),
//       ],
//     );
//   }
// }

// class RoundedAppBarClipper extends CustomClipper<Path> {
//   final double curveHeight;

//   RoundedAppBarClipper({required this.curveHeight});

//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - curveHeight);
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height - curveHeight);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:MindIt/variable.dart';

class ResultPage extends StatefulWidget {
  final Map<String, String> answers;

  const ResultPage({super.key, required this.answers});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();
  bool _feedbackSubmitted = false;
Map<String, String> districtAddressMap = {
  "Ariyalur": "GOVERNMENT HOSPITAL, T.PALUR ROAD, JAYAMKONDAM-621802",
  "Chengalpattu": "GREAT SOUTHERN TRUNK ROAD, MAHALAKSHMI COLONY, TAMBARAM, CHROMPET, CHENNAI -600044",
  "Coimbatore": "GOVERNMENT HOSPITAL, POLLACHI, UDUMALAI PETTAI ROAD, POLLACHI-642001",
  "Cuddalore": "GOVERNMENT HOSPITAL, NELLIKUPPAM MAIN ROAD, CUDDALORE -607001",
  "Dharmapuri": "GOVERNMENT HOSPITAL, PENNAGARAM, DHARMAPURI-636810",
  "Dindigul": "GOVERNMENT HOSPITAL, SOUTH ANNA NAGAR, AYAKUDI, PALANI, DINDUGAL -624601",
  "Erode": "THANTHAI PERIYAR GOVERNMENT HEAD QUARTERS HOSPITAL, EVN ROAD, KAIKOLAR THOTTAM, ERODE-638009",
  "Kallakurichi": "GOVERNMENT HOSPITAL, TIRUKOILUR, KALLAKURUCHI-605757",
  "Kancheepuram": "GOVERNMENT HEAD QUARTERS HOSPITAL, NO.5, RAILWAY ROAD, KANCHEEPURAM -631501",
  "Kanyakumari" : "GOVERNMENT DISTRICT HEAD QUARTERS HOSPITAL, PADHMANABAPURAM, THUCKALAY, KANYAKUMARI- 629175",
  "Karur": "GOVERNMENT HEAD QUARTERS HOSPITAL, KULITHALAI, KARUR-639107",
  "Krishnagiri": "GOVERNMENT HOSPITAL, DENKANIKOTTAI ROAD, HOSUR, KRISHNAGIRI-635109",
  "Madurai": "GOVERNMENT MADURAI DISTRICT HEAD QUARTERS HOSPITAL, USILAMPATTI, MADURAI-625532",
  "Mayiladuthurai": "PERIYAR GOVERNMENT HOSPITAL, HOSPITAL ROAD, KORANAD, MAYILADUTHURAI- 609001",
  "Nagapattinam": "GOVERNMENT HOSPITAL, HOSPITAL ROAD, NORTH MADAVILAGAM, VEDARANYAM, NAGAPATTINAM-614810",
  "Namakkal": "GOVERNMENT HOSPITAL, NEAR OLD BUSTAND, RASIPURAM, NAMAKKAL-637408",
  "Nilgiris": "GOVERNMENT HOSPITAL, GUDALUR, NILGIRIS-643212",
  "Perambalur": "GOVERNMENT HEAD QUARTERS HOSPITAL, THURAIYUR -PERAMBALUR ROAD, SUPER NAGAR, PERAMBALUR-621212",
  "Pudukkottai": "GOVERNMENT HOSPITAL, EZHIL NAGAR, ARANTHANGI, PUDUKOTTAI-614616",
  "Ramanathapuram": "GOVERNMENT HOSPITAL, KAATU PARAMAKUDI, PARAMAKUDI, RAMANATHAPURAM-623707",
  "Ranipet": "GOVERNMENT HEAD QUARTERS HOSPITAL, WALAJAPET, RANIPET-632513",
  "Salem": "GOVERNMENT HEAD QUARTERS HOSPITAL, METTUR DAM, METTUR, SALEM-636401",
  "Sivaganga": "GOVERNMENT HOSPITAL, PERIYAR NAGAR, KARAIKUDI, SIVAGANGA-630001",
  "Tenkasi": "GOVERNMENT HOSPITAL, KODIKURICHI-TENKASI ROAD, TENKASI-627811",
  "Thanjavur": "GOVERNMENT HEAD QUARTERS HOSPITAL, DR MOORTHY ROAD, ANNA NAGAR, KUMABAKONAM, THANJAVUR-612001",
  "Theni": "GOVERNMENT HEAD QUARTERS HOSPITAL, KATCHERI ROAD, PERIAKULAM, THENI-625207",
  "Thoothukudi": "GOVERNMENT HEAD QUARTERS HOSPITAL, KOVILPATTI, THOOTHUKUDI-628501",
  "Tiruchirappalli": "GOVERNMENT HEAD QUARTERS HOSPITAL, VIRALIMALAI-MANAPPARAI ROAD, MANAPPARAI, TIRUCHIRAPPALLI-621306",
  "Tirunelveli": "GOVERNMENT HOSPITAL, VALLIYUR, TIRUNELVELI-627117",
  "Tirupathur": "GOVERNMENT HEAD QUARTERS HOSPITAL, ACHAMANGALAM, THIRUPATHUR-635601",
  "Tiruppur": "GOVERNMENT DISTRICT HEAD QUARTERS HOSPITAL, KANGEYAM, TIRUPUR-638701",
  "Tiruvallur": "GOVERNMENT HOSPITAL, TIRUTHANI, TIRUVALLUR-631209",
  "Tiruvannamalai": "GOVERNMENT DISTRICT HEAD QUARTERS HOSPITAL, CHEYYAR, THIRUVANNAMALAI-604407",
  "Tiruvarur": "GOVERNMENT HOSPITAL, MANNARKUDI, TIRUVARUR-614001",
  "Vellore": "GOVERNMENT HOSPITAL, PUDUPET, AMBAPURAM, GUDIYATHAM, VELLORE-632602",
  "Viluppuram": "GOVERNMENT HOSPITAL, TINDIVANAM, VILLUPURAM-604001",
  "Virudhunagar": "GOVERNMENT HOSPITAL, ARUPPUKOTTAI, VIRUDHUNAGAR-626101",
  "": district
};


Map<String, String> districtHospitalMap = {
  "Ariyalur": "Government Ariyalur Medical College and Hospital",
  "Chengalpattu": "Government Chengalpattu Medical College and Hospital",
  "Chennai": "Madras Medical College and Rajaji Hospital(Park Town), or Stanley Medical College and Hospital(Washermanpet), or Kilpauk Medical College and Hospital(kilpauk), or Government Medical College (Omandurar Government Estate) and Tamil Nadu Government Multi Super Speciality Hospital(Triplicane), or Government ESIC Medical College & PGIMSR(Chennai)",
  "Coimbatore": "Government Coimbatore Medical College and Hospital(Peelamedu), or Government Medical College & ESI Hospital(Singanallur)",
  "Cuddalore": "Government Cuddalore Medical College and Hospital, Chidambaram, Cuddalore",
  "Dindigul": "Government Dindigul Medical College and Hospital, Dindigul",
  "Dharmapuri": "Government Dharmapuri Medical College and Hospital, Dharmapuri",
  "Erode": "Government Erode Medical College and Hospital, Perundurai, Erode",
  "Karur": "Government Karur Medical College and Hospital, Karur",
  "Kallakurichi": "Government Kallakurichi Medical College and Hospital, Kallakurichi",
  "Kancheepuram": "Government Kancheepuram Medical College and Hospital, Kancheepuram",
  "Kanyakumari": " Kanyakumari Government Medical College and Hospital, Nagercoil, Kanyakumari",
  "Krishnagiri": "Government Krishnagiri Medical College and Hospital, Krishnagiri",
  "Madurai": "Government Madurai Medical College and Rajaji Hospital, Madurai",
  "Namakkal": "Government Namakkal Medical College and Hospital, Namakkal",
  "Nilgiris": "Government Nilgiris Medical College and Hospital, Coonoor, Nilgiris",
  "Nagapattinam": "Government Nagapattinam Medical College and Hospital, Nagapattinam",
  "Pudukkottai":"Government Pudukkottai Medical College and Hospital, Pudukkottai",
  "Ramanathapuram": "Government Ramanathapurm Medical College and Hospital, Ramanathapuram",
  "Salem": "Government Mohan Kumaramangalam Medical College and Hospital, Salem",
  "Sivaganga": "Government Sivagangai Medical College and Hospital, Sivagangai",
  "Thanjavur": "Government Thanjavur Medical College and Hospital, Thanjavur",
  "Theni": "Government Theni Medical College and Hospital, Theni",
  "Thiruvarur": "Governement Thiruvarur Medical College and Hospital, Thiruvarur",
  "Thoothukudi": "Government Thoothukudi Medical College and Hospital, Thoothukudi",
  "Tiruchirappalli": "K.A.P. Viswanatham Government Medical College and Hospital, Tiruchirapalli",
  "Tiruppur": "Government Tiruppur Medical College and Hospital, Tiruppur",
  "Tiruvallur": "Government Tiruvallur Medical College and Hospital, Tiruvallur",
  "Tirunelveli": "Government Tirunelveli Medical College and Hospital, Palayamkottai, TirunelVeli",
  "Vellore": "Government Vellore Medical College and Hospital, Vellore",
  "Virudhunagar": "Government Virudhunagar Medical Collge and Hospital, Virudhunagar",
  "Viluppuram": "Government Villupuram Medical College and Hospital, Mundiyampakkam, Villupuram",
  "Tiruvannamalai": "Government Tiruvannamalai Medical College and Hospital, Thiruvannamalai",
  "":district
};





  Future<void> _savePatientData(String recommendation) async {
    try {
      CollectionReference patientsRef =
          FirebaseFirestore.instance.collection('users');

      await patientsRef
          .doc(patientid)
          .collection('members')
          .doc(answersfor)
          .set({
        'answers': widget.answers,
        'result': recommendation,
        'created_at': Timestamp.now(),
      }, SetOptions(merge: true));

      setState(() {});
    } catch (e) {
      // print('Error saving patient data: $e');
    }
  }

  Future<void> _submitFeedback() async {
    try {
      CollectionReference feedbackRef =
          FirebaseFirestore.instance.collection('feedback');

      await feedbackRef.add({
        'patientId': patientid,
        'answersFor': answersfor,
        'rating': _rating,
        'feedbackText': _feedbackController.text.trim(),
        'submittedAt': Timestamp.now(),
      });

      setState(() {
        _feedbackSubmitted = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(selectedLanguage == "தமிழ்"
                ? 'கருத்துக்கணிப்பு வெற்றிகரமாக சமர்ப்பிக்கப்பட்டது!'
                : 'Feedback submitted successfully!')),
      );
    } catch (e) {
      // print('Error submitting feedback: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(selectedLanguage == "தமிழ்"
                ? 'கருத்துக்கணிப்பை சமர்ப்பிக்க முடியவில்லை. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.'
                : 'Failed to submit feedback. Please try again.')),
      );
    }
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: RoundedAppBarClipper(curveHeight: 50),
            child: Container(
              color: const Color.fromRGBO(155, 177, 104, 1.0),
              height: 150,
              alignment: Alignment.center,
              child: Text(
                selectedLanguage == "தமிழ்"
                    ? 'மதிப்பீட்டு முடிவு'
                    : 'Assessment Result',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(
                    selectedLanguage == "தமிழ்"
                        ? others
                            ? '$answersfor அவர்களின் ஆரோக்கிய மதிப்பீடு'
                            : 'உங்கள் ஆரோக்கிய மதிப்பீடு'
                        : others
                            ? "$answersfor's Health Assessment"
                            : 'Your Health Assessment',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                    const SizedBox(height: 15),
                    _buildRecommendation(),
                    Center(
                      child: Lottie.asset(
                        'assets/animations/result.json',
                        width: 250,
                        height: 250,
                        repeat: true,
                        animate: true,
                        frameRate: FrameRate.max,
                      ),
                    ),
                    if (!_feedbackSubmitted) ...[
                      const SizedBox(height: 20),
                      Text(
                        selectedLanguage == "தமிழ்"
                            ? 'உங்கள் மதிப்பீட்டு அனுபவம் எப்படி?'
                            : 'How was your assessment experience?',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildStarRating(),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: _feedbackController,
                          decoration: InputDecoration(
                            hintText: selectedLanguage == "தமிழ்"
                                ? 'மதிப்பீட்டைப் பற்றிய உங்கள் கருத்துகளை பகிரவும்'
                                : 'Share your thoughts about the assessment',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: _rating > 0 ? _submitFeedback : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _rating > 0
                              ? const Color.fromRGBO(155, 177, 104, 1.0)
                              : Colors.grey,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 12.0),
                        ),
                        child: Text(
                          selectedLanguage == "தமிழ்"
                              ? 'கருத்துக் கணிப்பை சமர்ப்பிக்கவும்'
                              : 'Submit Feedback',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ] else ...[
                      const SizedBox(height: 20),
                      Text(
                        selectedLanguage == "தமிழ்"
                            ? 'உங்கள் கருத்துக்கு நன்றி!'
                            : 'Thank you for your feedback!',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        red = 0;
                        yellow = 0;
                        patientid = "";
                        patientname = "";
                        selected = "";
                        others = false;
                        caretaker = "";
                        phoneNum = "";
                        otherdetails = {};
                        answersfor = "";
                        Navigator.popUntil(context, (route) {
                          return route.settings.name == 'login';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(155, 177, 104, 1.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 12.0),
                      ),
                      child: Text(
                        selectedLanguage == "English"
                            ? "Back to Home"
                            : "முகப்புக்கு திரும்பவும்",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation() {
    //String health = "GOOD";
    String meet = "VHN";
    String recommend_address = "";
    String recommendation = "";
    if (selected == "below18") {
      if (red >= 1 && yellow >= 5) {
        // if (red >= 1 || yellow >= 5) {
        //health = "TERTIARY";
        meet = "TERTIARY";
        recommend_address = districtHospitalMap[district] ?? "nearby Medical College";
       // recommend_address2 = districtAddressMap[otherdetails['district']];
        
      } else if (yellow > 5) {
        //      } else if (yellow < 5) {
        //health = "BETTER";
        meet = "GOVERMENT HOSPITAL";
        recommend_address = districtAddressMap[district] ?? " nearyby Government Hospital";
      } else {
        //health = "GOOD";
        meet = "VHN";
      }
    } else if (selected == "adult") {
      if (red >= 1 && yellow >= 3) {
        //health = "TERTIARY";
        meet = "TERTIARY";
        recommend_address = districtHospitalMap[district] ?? "nearby Medical College ";
      } else if (yellow > 3) {
        //health = "BETTER";
        meet = "GOVERMENT HOSPITAL";
        recommend_address = districtAddressMap[district] ?? "nearby Government Hospital ";
      } else {
        //health = "GOOD";
        meet = "VHN";
      }
    } else if (selected == "above60") {
      if (red >= 1 && yellow >= 3) {
        //health = "TERTIARY";
        meet = "TERTIARY";
        recommend_address = districtHospitalMap[otherdetails[district]] ?? "nearby Medical College ";
      } else if (yellow > 3) {
        //health = "BETTER";
        meet = "GOVERMENT HOSPITAL";
        recommend_address = districtAddressMap[otherdetails[district]] ?? "nearby Government Hospital ";
      } else {
        //health = "GOOD";
        meet = "VHN";
      }
    }
    if(meet == "VHN"){
      recommendation = (selectedLanguage == "English")
        ? "${others ? "$answersfor is" : "You are"} doing well"
        : "${others ? "$answersfor இன்" : "உங்கள்"} உடல்நிலை நன்றாக உள்ளது";
    }
    else{
          recommendation = (selectedLanguage == "English")
        ? "${others ? "$answersfor is" : "You are"} recommended to visit $recommend_address."
        : "${others ? "$answersfor" : "நீங்கள்"} $recommend_address ஐப் பார்வையிட பரிந்துரைக்கப்படுகிறீர்கள்.";
    }


    // String recommendation = selectedLanguage.equals("English") ? (others ? answersfor + " is" : "You are") + " suggested to kindly meet Psychiatrist at " + meet + "." : (others ? answersfor + " ஐ" : "நீங்கள்") + " மனநல மருத்துவரை சந்திக்குமாறு " + meet + " இல் பரிந்துரைக்கப்படுகிறீர்கள்.";

    //"${others ? answersfor + " is" : "You are"} suggested to kindly meet Psychiatrist at $meet.";
    _savePatientData(recommendation);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedLanguage == 'English' ? 'Recommendation' : 'பரிந்துரை',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          recommendation,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}

class RoundedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  RoundedAppBarClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
    
  }
}