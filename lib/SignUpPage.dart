import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:MindIt/variable.dart';
import 'package:MindIt/PersonalDetailsPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  //SignUpPage({required this.mobileController});final String mobileController;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  PersonalDetailsPage ob = PersonalDetailsPage();
  String _selectedOption = "yourself";
  String? _relation;
  final List<String> _relationseng = [
    "child",
    "spouse",
    "sibling",
    "friend",
    "others"
  ];
  final List<String> _relationstam = [
    "குழந்தை",
    "துணைவர்",
    "உடன்பிறப்பு",
    "நண்பர்",
    "மற்றவர்கள்"
  ];

  TextEditingController patname = TextEditingController();

  TextEditingController rela = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _savePatientData() async {
    try {
      // Generate a unique ID for the patient
      final otherRef = FirebaseFirestore.instance.collection('users');

      // Save the patient data to Firestore
      await otherRef.doc(patientid).update({
        'created_at': Timestamp.now(),
      });
      // Update the UI with the new patient ID
      setState(() {});
    } catch (e) {
      // // // print or handle error
      // print('Error saving patient data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> relations =
        selectedLanguage == 'English' ? _relationseng : _relationstam;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            color: const Color.fromRGBO(155, 177, 104, 1.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                selectedLanguage == 'English'
                    ? 'Add a New Member'
                    : ' புதிய உறுப்பினரைச் சேர்க்க',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align content and buttons
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedLanguage == 'English'
                        ? 'For whom are you entering?'
                        : 'யாருக்காக விவரங்களை உள்ளிடுகிறீர்கள்?',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: "yourself",
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                  _relation = null;
                                });
                              },
                            ),
                            Text(selectedLanguage == 'English'
                                ? 'Yourself'
                                : 'நீங்களே'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: "others",
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            ),
                            Text(selectedLanguage == 'English'
                                ? 'Others'
                                : 'மற்றவர்கள்'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (_selectedOption == "others")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          selectedLanguage == 'English'
                              ? 'Select relation:'
                              : 'உறவைத் தேர்ந்தெடுக்கவும்:',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        DropdownButton<String>(
                          value: _relation,
                          hint: Text(selectedLanguage == 'English'
                              ? 'Select relation:'
                              : 'உறவைத் தேர்ந்தெடுக்கவும்:'),
                          isExpanded: true,
                          items: relations.map((String relation) {
                            return DropdownMenuItem<String>(
                              value: relation,
                              child: Text(relation),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _relation = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  const SizedBox(height: 15),
                  if (_relation == "others" || _relation == "மற்றவர்கள்")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: rela,
                          decoration: InputDecoration(
                            hintText: selectedLanguage == 'English'
                                ? 'Enter your relation'
                                : 'உங்கள் உறவை உள்ளிடவும்',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                      selectedLanguage == 'English' ? 'Back' : 'பின் செல்',
                      style: const TextStyle(color: Colors.white),),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _submitForm();
                    //await _savePatientData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalDetailsPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child:
                      Text(selectedLanguage == 'English' ? 'Next' : 'அடுத்து',
                      style: const TextStyle(color: Colors.white),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
   // String patname = patname.text;
    patientname = patname.text;
    otherdetails.addAll({
      "who": _selectedOption.toString(),
      "relation": _relation.toString(),
      "patientname": patientname,
    });
    if (_selectedOption == "yourself") {
      others = false;
    } else if (_selectedOption == "others" && _relation != null) {
      others = true;
    } else {}
  }
}

class MyCustomClipper extends CustomClipper<Path> {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
