/*import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_wellbeing/MemberScreen.dart';
import 'variable.dart';

// ignore: must_be_immutable
class PersonalDetailsPage extends StatefulWidget {
  final String? _mobileController = "1234567980";

  PersonalDetailsPage({super.key});
  @override
  _PersonalDetailsPageSt a te 
createState() =>
      _PersonalDetailsPageState(_mobileController);
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? _mobileController;
  String? _name;
  String? _age;
  String? _gender;
  String? _locality;
  String? _qualification;
  String? _working;
  String? _workExperience;
  bool _acceptedTerms = false;
  bool _shareDetails = false;
  List<String> answers = [];
  Map<String, String> details = {};

  _PersonalDetailsPageState(String? mobileController) {
    _mobileController = mobileController;
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _savePatientData() async {
    try {
      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(patientid);
      final memberDocRef =
          userDocRef.collection('members').doc(_name.toString());

      await memberDocRef.set({
        'details': details,
        'otherdetails': otherdetails,
        'answers': answers,
        'created_at': Timestamp.now(),
      });
    } catch (e) {
      // Log any error that occurs
      print('Error saving patient data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: RoundedAppBarClipper(curveHeight: 30.0),
                child: Container(
                  color: const Color.fromRGBO(155, 177, 104, 1.0),
                  height: 180,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 16.0, right: 16.0),
                      child: Text(
                        selectedLanguage == 'English' ? 'Personal Details':'தனிப்பட்ட விவரங்கள்',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                buildTextField(selectedLanguage == 'English' ? 'Name:':'பெயர்:', name),
                const SizedBox(height: 20),
                buildTextField(selectedLanguage == 'English' ? 'Age:   ':'வயது:', age,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 20),
                buildTextField(selectedLanguage == 'English' ? 'Phone Number:':'தொலைபேசி எண்:', phone,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 20),
                buildRadioGroup('Gender:', ['Male', 'Female', 'Other'], _gender,
                    (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
                const SizedBox(height: 20),
                buildRadioGroup(
                    'Locality:', ['City', 'Town', 'Village'], _locality,
                    (value) {
                  setState(() {
                    _locality = value;
                  });
                }),
                const SizedBox(height: 20),
                buildRadioGroup(
                    'Qualification:',
                    ['SSLC', 'HSC', 'UG', 'PG', 'PhD', 'None'],
                    _qualification, (value) {
                  setState(() {
                    _qualification = value;
                  });
                }),
                const SizedBox(height: 20),
                buildRadioGroup('Working:', ['Yes', 'No'], _working, (value) {
                  setState(() {
                    _working = value;
                    if (value == 'No') _workExperience = null;
                  });
                }),
                if (_working == 'Yes') const SizedBox(height: 20),
                if (_working == 'Yes')
                  buildRadioGroup(
                      'Work Experience:',
                      ['Below 5 years', 'Above 5 years'],
                      _workExperience, (value) {
                    setState(() {
                      _workExperience = value;
                    });
                  }),
                const SizedBox(height: 20),
                const Text(
                  'Disclaimer:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _shareDetails,
                      onChanged: (value) {
                        setState(() {
                          _shareDetails = value!;
                        });
                      },
                    ),
                    const Expanded(
                        child: Text(
                            'I agree to share my details to the medical professionals.')),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptedTerms = value!;
                        });
                      },
                    ),
                    const Expanded(
                        child: Text(
                            'I accept the terms and conditions and privacy policy.')),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(155, 177, 104, 1.0),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            color: Color.fromRGBO(155, 177, 104, 1.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(155, 177, 104, 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _name = name.text;
                            _age = age.text;
                            _mobileController = phone.text;
                            //patientid = phone.text;
                            print(_name);
                            print(_age);
                            print(_mobileController);

                            details.addAll({
                              //8124720122
                              'Name': _name.toString(),
                              'Age': _age.toString(),
                              'Phone': _mobileController.toString(),
                              'Gender': _gender.toString(),
                              'Locality': _locality.toString(),
                              'Qualification': _qualification.toString(),
                              'Working': _working.toString(),
                              'Work Experience': _workExperience.toString(),
                            });
                            print("$_mobileController $_name");
                          });
                          bool success = validateForm(
                              context,
                              _name.toString(),
                              _age.toString(),
                              _mobileController.toString(),
                              _gender.toString(),
                              _locality.toString(),
                              _qualification.toString(),
                              _working.toString());
                          if (success && (_acceptedTerms && _shareDetails)) {
                            _savePatientData();

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuccessSplashScreen()));
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool validateForm(
    BuildContext context,
    String name,
    String age,
    String mobileController,
    String gender,
    String locality,
    String qualification,
    String working) {
  print("validateForm called");
  if (name.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter your name without special characters')),
    );
    return false;
  }

  if (age.isEmpty ||
      int.tryParse(age) == null ||
      int.parse(age) < 1 ||
      int.parse(age) > 120) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Enter a valid age (1-120)')),
    );
    return false;
  }

  if (mobileController.isEmpty ||
      !RegExp(r'^[0-9]{10}$').hasMatch(mobileController)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Enter a valid 10-digit phone number')),
    );
    return false;
  }

  if (gender == null || gender.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select your gender')),
    );
    return false;
  }

  if (locality == null || locality.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select your locality')),
    );
    return false;
  }

  if (qualification == null || qualification.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select your qualification')),
    );
    return false;
  }

  if (working == null || working.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select your working status')),
    );
    return false;
  }
  return true;

  // // If everything is valid, show a success Snackbar
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text('Form submitted successfully!')),
  // );
}

Widget buildTextField(String labelText, TextEditingController controller,
    {TextInputType keyboardType = TextInputType.text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

Widget buildRadioGroup(
  String labelText,
  List<String> options,
  String? selectedValue,
  ValueChanged<String?> onChanged,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: const TextStyle(fontWeight: FontWeight.bold)),
      Column(
        children: options
            .map(
              (option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedValue,
                onChanged: onChanged,
              ),
            )
            .toList(),
      ),
    ],
  );
}

class SuccessSplashScreen extends StatefulWidget {
  const SuccessSplashScreen({super.key});

  @override
  _SuccessSplashScreenState createState() => _SuccessSplashScreenState();
}

class _SuccessSplashScreenState extends State<SuccessSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Automatically close splash after 3 seconds and navigate back
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MemberScreen(phoneNumber: patientid)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(155, 177, 104, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white, size: 80),
            SizedBox(height: 20),
            Text(
              'Registered Successfully!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  RoundedAppBarClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - curveHeight * 2,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
*/
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:MindIt/MemberScreen.dart';
import 'variable.dart';

// ignore: must_be_immutable
class PersonalDetailsPage extends StatefulWidget {
  final String? _mobileController = "1234567980";

  PersonalDetailsPage({super.key});
  @override
  _PersonalDetailsPageState createState() =>
      _PersonalDetailsPageState(_mobileController);
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? _mobileController;
  String? _name;
  String? _age;
  String? _district;
  String? _selectedDistrict;
  String? _gender;
  String? _locality;
  String? _qualification;
  String? _working;
  String? _workExperience;
  bool _acceptedTerms = false;
  bool _shareDetails = false;
  List<String> answers = [];
  Map<String, String> details = {};
  List<String> districtList = [
    'Ariyalur',
    'Chengalpattu',
    'Chennai',
    'Coimbatore',
    'Cuddalore',
    'Dharmapuri',
    'Dindigul',
    'Erode',
    'Kallakurichi',
    'Kancheepuram',
    'Kanniyakumari',
    'Karur',
    'Krishnagiri',
    'Madurai',
    'Mayiladuthurai',
    'Nagapattinam',
    'Namakkal',
    'Nilgiris',
    'Perambalur',
    'Pudukkottai',
    'Ramanathapuram',
    'Ranipet',
    'Salem',
    'Sivaganga',
    'Tenkasi',
    'Thanjavur',
    'Theni',
    'Thoothukudi',
    'Tiruchirappalli',
    'Tirunelveli',
    'Tirupathur',
    'Tiruppur',
    'Tiruvallur',
    'Tiruvannamalai',
    'Tiruvarur',
    'Vellore',
    'Viluppuram',
    'Virudhunagar'
  ];

  _PersonalDetailsPageState(String? mobileController) {
    _mobileController = mobileController;
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _savePatientData() async {
    try {
      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(patientid);
      final memberDocRef =
          userDocRef.collection('members').doc(_name.toString());

      await memberDocRef.set({
        'details': details,
        'otherdetails': otherdetails,
        'answers': answers,
        'created_at': Timestamp.now(),
      });
    } catch (e) {
      // Log any error that occurs
      //print('Error saving patient data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: RoundedAppBarClipper(curveHeight: 30.0),
                child: Container(
                  color: const Color.fromRGBO(155, 177, 104, 1.0),
                  height: 180,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 16.0, right: 16.0),
                      child: Text(
                        selectedLanguage == 'English'
                            ? 'Personal Details'
                            : 'தனிப்பட்ட விவரங்கள்',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                buildTextField(
                    selectedLanguage == 'English' ? 'Name:' : 'பெயர்:', name),
                const SizedBox(height: 20),
                buildTextField(
                    selectedLanguage == 'English' ? 'Age:   ' : 'வயது:', age,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 20),
                buildTextField(
                    selectedLanguage == 'English'
                        ? 'Phone Number:'
                        : 'தொலைபேசி எண்:',
                    phone,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 20),
                buildRadioGroup(
                    selectedLanguage == 'English' ? 'Gender:' : 'பாலினம்',
                    [
                      selectedLanguage == 'English' ? 'Male' : 'ஆண்',
                      selectedLanguage == 'English' ? 'Female' : 'பெண்',
                      selectedLanguage == 'English' ? 'Other' : 'மற்றவை'
                    ],
                    _gender, (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
                const SizedBox(height: 20),
                buildRadioGroup(
                    selectedLanguage == 'English' ? 'Locality:' : 'ஊர்',
                    [
                      selectedLanguage == 'English' ? 'City' : 'நகரம்',
                      selectedLanguage == 'English' ? 'Town' : 'பேரூரம்',
                      selectedLanguage == 'English' ? 'Village' : 'கிராமம்'
                    ],
                    _locality, (value) {
                  setState(() {
                    _locality = value;
                  });
                }),
                /*-------------------- */ const SizedBox(height: 20),
                Text(
                  selectedLanguage == 'English' ? 'District:' : 'மாவட்டம்:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedDistrict,
                  items: districtList.map((String district) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDistrict = newValue;
                      district = newValue!;
                    });
                  },
                ),

/* -----------------------*/

                const SizedBox(height: 20),
                buildRadioGroup(
                    selectedLanguage == 'English' ? 'Qualification:' : 'தகுதி',
                    [
                      'SSLC',
                      'HSC',
                      'UG',
                      'PG',
                      'PhD',
                      selectedLanguage == 'English'
                          ? 'None'
                          : 'இதுவரை எதுவும் இல்லை'
                    ],
                    _qualification, (value) {
                  setState(() {
                    _qualification = value;
                  });
                }),
                const SizedBox(height: 20),
                buildRadioGroup(
                    selectedLanguage == 'English'
                        ? 'Working:'
                        : 'வேலை செய்கிறீர்களா? ',
                    [
                      selectedLanguage == 'English' ? 'Yes' : 'ஆம்',
                      selectedLanguage == 'English' ? 'No' : 'இல்லை'
                    ],
                    _working, (value) {
                  setState(() {
                    _working = value;
                    if (value == 'No' || value == 'இல்லை') {
                      _workExperience = null;
                    }
                  });
                }),
                if (_working == 'Yes' || _working == 'ஆம்')
                  const SizedBox(height: 20),
                if (_working == 'Yes' || _working == 'ஆம்')
                  buildRadioGroup(
                      selectedLanguage == 'English'
                          ? 'Work Experience:'
                          : 'வேலை அனுபவம்',
                      [
                        selectedLanguage == 'English'
                            ? 'Below 5 years'
                            : '5 ஆண்டுகளுக்கு கீழ்',
                        selectedLanguage == 'English'
                            ? 'Above 5 years'
                            : '5 ஆண்டுகளுக்கு மேல்'
                      ],
                      _workExperience, (value) {
                    setState(() {
                      _workExperience = value;
                    });
                  }),
                const SizedBox(height: 20),
                Text(
                  selectedLanguage == 'English'
                      ? 'Disclaimer:'
                      : 'பொறுப்புத் தவிர்ப்பு',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _shareDetails,
                      onChanged: (value) {
                        setState(() {
                          _shareDetails = value!;
                        });
                      },
                    ),
                    Expanded(
                        child: Text(selectedLanguage == 'English'
                            ? 'I agree to share my details to the medical professionals.'
                            : 'நான் எனது விவரங்களை மருத்துவ நிபுணர்களுடன் பகிர்வதை ஒப்புக்கொள்கிறேன்.')),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptedTerms = value!;
                        });
                      },
                    ),
                    Expanded(
                        child: Text(selectedLanguage == 'English'
                            ? 'I accept the terms and conditions and privacy policy.'
                            : 'நான் விதிமுறைகள் மற்றும் தனியுரிமை கொள்கையை ஏற்கிறேன்.')),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(155, 177, 104, 1.0),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          selectedLanguage == 'English' ? 'Back' : 'பின்னுக்கு',
                          style: const TextStyle(
                            color: Color.fromRGBO(155, 177, 104, 1.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(155, 177, 104, 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _name = name.text;
                            _age = age.text;
                            _mobileController = phone.text;
                            //patientid = phone.text;
                            // print(_name);
                            // print(_age);
                            // print(_mobileController);

                            details.addAll({
                              //8124720122
                              'Name': _name.toString(),

                              'Age': _age.toString(),
                              'Phone': _mobileController.toString(),
                              'District': _selectedDistrict.toString(),
                              'Gender': _gender.toString(),
                              'Locality': _locality.toString(),
                              'Qualification': _qualification.toString(),
                              'Working': _working.toString(),
                              'Work Experience': _workExperience.toString(),
                            });
                            // print(_mobileController.toString() +" " +_name.toString());
                          });
                          bool success = validateForm(
                            context,
                            _name.toString(),
                            _age.toString(),
                            _mobileController.toString(),
                            _gender.toString(),
                            _locality.toString(),
                            _qualification.toString(),
                            _working.toString(),
                            /*====== */
                            _selectedDistrict.toString(),
                            /* =============== */
                          );
                          if (success && (_acceptedTerms && _shareDetails)) {
                            _savePatientData();

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuccessSplashScreen()));
                          }
                        },
                        child: Text(
                          selectedLanguage == 'English' ? 'Save' : 'சேமிக்க',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool validateForm(
  BuildContext context,
  String name,
  String age,
  String mobileController,
  String gender,
  String locality,
  String qualification,
  String working,
  String selectedDistrict,
) {
  //print("validateForm called");
  if (name.isEmpty || !RegExp(r'^[a-zA-Z\u0B80-\u0BFF\s]+$').hasMatch(name)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Please enter your name without special characters'
              : 'தயவுசெய்து சிறப்பு எழுத்துக்கள் இல்லாமல் உங்கள் பெயரை உள்ளிடுங்கள்')),
    );
    return false;
  }

  if (age.isEmpty ||
      int.tryParse(age) == null ||
      int.parse(age) < 1 ||
      int.parse(age) > 120) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Enter a valid age (1-120)'
              : 'தயவுசெய்து சரியான வயதை உள்ளிடுங்கள் (1-120)')),
    );
    return false;
  }

  if (mobileController.isEmpty ||
      !RegExp(r'^[0-9]{10}$').hasMatch(mobileController)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Enter a valid 10-digit phone number'
              : 'தயவுசெய்து சரியான 10 இலக்க எண் உள்ளிடுங்கள்')),
    );
    return false;
  }

  if (gender == null || gender.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Please select your gender'
              : 'தயவுசெய்து உங்கள் பாலினத்தை தேர்வு செய்யுங்கள்')),
    );
    return false;
  }

  if (locality == null || locality.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Please select your locality'
              : 'தயவுசெய்து உங்கள் ஊரைப் தேர்வு செய்யுங்கள்')),
    );
    return false;
  }
  /*============*/
  if (selectedDistrict == null || selectedDistrict!.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Please select your district'
              : 'தயவுசெய்து உங்கள் மாவட்டத்தை தேர்வு செய்யுங்கள்')),
    );
    return false;
  }

  /*============== */

  if (qualification == null || qualification.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Please select your qualification'
              : 'தயவுசெய்து உங்கள் கல்வித் தகுதியை தேர்வு செய்யுங்கள்')),
    );
    return false;
  }

  if (working == null || working.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(selectedLanguage == 'English'
              ? 'Please select your working status'
              : 'தயவுசெய்து உங்கள் வேலை நிலையை தேர்வு செய்யுங்கள்')),
    );
    return false;
  }
  return true;

  // // If everything is valid, show a success Snackbar
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text('Form submitted successfully!')),
  // );
}

Widget buildTextField(String labelText, TextEditingController controller,
    {TextInputType keyboardType = TextInputType.text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

Widget buildRadioGroup(
  String labelText,
  List<String> options,
  String? selectedValue,
  ValueChanged<String?> onChanged,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: const TextStyle(fontWeight: FontWeight.bold)),
      Column(
        children: options
            .map(
              (option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedValue,
                onChanged: onChanged,
              ),
            )
            .toList(),
      ),
    ],
  );
}

class SuccessSplashScreen extends StatefulWidget {
  const SuccessSplashScreen({super.key});

  @override
  _SuccessSplashScreenState createState() => _SuccessSplashScreenState();
}

class _SuccessSplashScreenState extends State<SuccessSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Automatically close splash after 3 seconds and navigate back
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MemberScreen(phoneNumber: patientid)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline,
                color: Colors.white, size: 80),
            const SizedBox(height: 20),
            Text(
              selectedLanguage == 'English'
                  ? 'Registered Successfully!'
                  : 'பதிவு வெற்றிகரமாக முடிந்தது!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  RoundedAppBarClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - curveHeight * 2,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
