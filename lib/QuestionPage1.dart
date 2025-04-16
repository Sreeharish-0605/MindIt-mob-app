// import 'package:flutter/material.dart';
// import 'package:MindIt/variable.dart';
// import 'ResultPage.dart';

// class QuestionPage1 extends StatefulWidget {
//   const QuestionPage1({super.key});

//   @override
//   _QuestionPageState createState() => _QuestionPageState();
// }

// class _QuestionPageState extends State<QuestionPage1> {
//   int _currentPage = 1;
//   Map<String, String> _answers = {};
//   TextEditingController complaint = TextEditingController();
//   TextEditingController pastillness = TextEditingController();

//   // Define questions for each page as lists
//   final List<Map<String, dynamic>> _page1Questions = [
//     {
//       'question': '${selectedLanguage == 'English' ? 'Did the mother have any problems during pregnancy?':
// 'கர்ப்பிணியாக இருக்கும் போது குழந்தையின் தாய்க்கு உடல்நல பிரச்சினைகள் ஏதேனும் இருந்ததா? (சர்க்கரைவியாதி, இரத்தக்கொதிப்பு)'}',
//       'yellowIncrement': true,
//     },
//     {
//       'question': 'Did your child cry immediately after birth?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Is your child milestones delayed?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Does your child play with other children?',
//       'yellowIncrement': true,
//     },
//     {
//       'question': 'Does your child talk with other children?',
//       'yellowIncrement': true,
//     },
//   ];

//   final List<Map<String, dynamic>> _page2Questions = [
//     {
//       'question': 'Does your child make eye contact while talking?',
//       'redIncrement': true,
//     },
//     {
//       'question':
//           'Do your child having difficulty sitting in one place at home or school?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Does your child having difficulty listening to class?',
//       'yellowIncrement': true,
//     },
//     {
//       'question':
//           'Does your child have difficulty in waiting for his/her turn to answer?',
//       'yellowIncrement': true,
//     },
//     {
//       'question': 'Does your child repetatively washes his/her hand',
//       'redIncrement': true,
//     },
//   ];

//   final List<Map<String, dynamic>> _page3Questions = [
//     {
//       'question':
//           'Does your child do things impulsively without thinking about the consequences?',
//       'yellowIncrement': true,
//     },
//     {
//       'question': 'Does your child do repetative movements?',
//       'yellowIncrement': true,
//     },
//     {
//       'question':
//           'Despite adequate training does your child still struggle with reading, writing, and mathematics?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Is your child regular to school?',
//       'yellowIncrement': true,
//     },
//     {
//       'question': 'Does your child understands the simple commands?',
//       'redIncrement': true,
//     },
//   ];

//   final List<Map<String, dynamic>> _page4Questions = [
//     {
//       'question': 'Does your child bully others?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Does your child bullied by others?',
//       'redIncrement': true,
//     },
//     {
//       'question':
//           'Does your child pee in their bed even after the age of 5 years?',
//       'yellowIncrement': true,
//     },
//     {
//       'question':
//           'Does your child passed stool in their bed even after the age of 5 years?',
//       'yellowIncrement': true,
//     },
//     {
//       'question':
//           'Does your child needs assistance for daily routine even as older children?',
//       'yellowIncrement': true,
//     },
//   ];

//   final List<Map<String, dynamic>> _page5Questions = [
//     {
//       'question': 'Does your child quarrel with elders or teachers?',
//       'yellowIncrement': true,
//     },
//     {
//       'question': 'Does your child act cruelly towards animals?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Does your child engage in the act of stealing or lying?',
//       'redIncrement': true,
//     },
//     {
//       'question':
//           'Does your child wake up in the middle of night and scream frequently?',
//       'yellowIncrement': true,
//     },
//     {
//       'question':
//           'Does your child have breathlessness and faint for trivial reasons?',
//       'redIncrement': true,
//     },
//     {
//       'question':
//           'Is your child ever expressed fearfulness, raising of heart beat in recent times?',
//       'yellowIncrement': null,
//     },
//   ];

//   final List<Map<String, dynamic>> _page6Questions = [
//     {
//       'question':
//           'Does your child have repetitive eye blinking or shoulder struggling?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Is your son/daughter using substance?',
//       'redIncrement': true,
//     },
//     {
//       'question': 'Does your son/daughter seems to be talk to herself/himself?',
//       'yellowIncrement': true,
//     },
//     {
//       'question':
//           'Is there any difference in the behaviour of your child in recent times?',
//       'yellowIncrement': null,
//     },
//     // {
//     //   'question': 'Any other complaints?',
//     //   'yellowIncrement': true,
//     // },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               ClipPath(
//                 clipper: RoundedAppBarClipper(curveHeight: 30.0),
//                 child: Container(
//                   color: const Color.fromRGBO(155, 177, 104, 1.0),
//                   height: 180,
//                   child: const Center(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         'Are the following symptoms present for 7 days or more?',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     child: CustomPaint(
//                       painter: DiamondPainter(),
//                       child: Center(
//                         child: Text(
//                           '$_currentPage',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: _buildQuestions(_currentPage),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: LinearProgressIndicator(
//               value: _currentPage / 7,
//               backgroundColor: Colors.grey[300],
//               color: const Color.fromRGBO(155, 177, 104, 1.0),
//               minHeight: 10,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 16.0),
//             child: Text(
//               'Page $_currentPage of 7',
//               style: const TextStyle(
//                   color: Colors.black54, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: const Color.fromRGBO(155, 177, 104, 1.0),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: TextButton(
//                   onPressed: _currentPage > 1
//                       ? () {
//                           setState(() {
//                             _currentPage--;
//                           });
//                         }
//                       : null,
//                   child: const Text(
//                     'Back',
//                     style: TextStyle(
//                       color: Color.fromRGBO(155, 177, 104, 1.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(155, 177, 104, 1.0),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: TextButton(
//                   onPressed: _currentPage <= 7
//                       ? () {
//                           setState(() {
//                             // Check if we are on the last page
//                             if (_currentPage == 1) {
//                               _answers[
//                                       "Past history of psychiatric illness and taking treatment"] =
//                                   pastillness.text;
//                             }
//                             if (_currentPage == 7) {
//                               // Navigate to ResultPage with answers
//                               _answers["any other complaint?"] = complaint.text;

//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       ResultPage(answers: _answers),
//                                 ),
//                               );
//                             } else {
//                               // Increment current page
//                               _currentPage++;
//                               // print('Answers: $_answers');
//                               // print('Red Score: $red, Yellow Score: $yellow');
//                             }
//                           });
//                         }
//                       : null,
//                   child: const Text(
//                     'Next',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildQuestions(int page) {
//     // Retain the original table for page 7
//     if (page == 7) {
//       return [
//         const Text(
//           'Answer the questions!',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 10),
//         buildTable(),
//       ];
//     }

//     List<Map<String, dynamic>> currentPageQuestions;

//     switch (page) {
//       case 1:
//         currentPageQuestions = _page1Questions;
//         break;
//       case 2:
//         currentPageQuestions = _page2Questions;
//         break;
//       case 3:
//         currentPageQuestions = _page3Questions;
//         break;
//       case 4:
//         currentPageQuestions = _page4Questions;
//         break;
//       case 5:
//         currentPageQuestions = _page5Questions;
//         break;
//       case 6:
//         currentPageQuestions = _page6Questions;
//         break;
//       default:
//         return [];
//     }

//     return [
//       const Text(
//         'Answer the questions!',
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(height: 10),
//       ...currentPageQuestions.map((questionData) {
//         return buildQuestion(questionData['question'], ['Yes', 'No'],
//             redInc: questionData['redIncrement'] ?? false,
//             yellowInc: questionData['yellowIncrement'] ?? false);
//       }).toList(),
//       if (_currentPage == 1) ...[
//         Text("Past history of psychiatric illness and taking treatment?",
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         TextFormField(
//           controller: pastillness,
//           keyboardType: TextInputType.multiline,
//           maxLines: null,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             errorMaxLines: 2,
//           ),
//         ),
//       ],
//       if (_currentPage == 6) ...[
//         Text("Any other complaints?",
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         TextFormField(
//           controller: complaint,
//           keyboardType: TextInputType.multiline,
//           maxLines: null,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             errorMaxLines: 2,
//           ),
//         ),
//       ]
//     ];
//   }

//   Widget buildQuestion(String question, List<String> options,
//       {bool redInc = false, bool yellowInc = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           question,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: options.map((option) {
//             return Expanded(
//               child: RadioListTile(
//                 title: Text(option),
//                 value: option,
//                 groupValue: _answers[question],
//                 onChanged: (value) {
//                   setState(() {
//                     String? previousValue = _answers[question];
//                     _answers[question] = value.toString();

//                     if (previousValue != value) {
//                       // Questions where "No" should increment
//                       if (question ==
//                               'Did your child cry immediately after birth?' ||
//                           question ==
//                               'Does your child play with other children?' ||
//                           question ==
//                               'Does your child talk with other children?' ||
//                           question ==
//                               'Does your child make eye contact while talking?' ||
//                           question == 'Is your child regular to school?' ||
//                           question ==
//                               'Does your child understands the simple commands?') {
//                         if (value == 'No') {
//                           // Increment score
//                           if (redInc) red++;
//                           if (yellowInc) yellow++;
//                         }
//                         // Decrement if changing from No to Yes
//                         if (previousValue == 'No') {
//                           if (redInc) red--;
//                           if (yellowInc) yellow--;
//                         }
//                       }
//                       // All other questions increment on "Yes"
//                       else {
//                         if (value == 'Yes') {
//                           if (redInc) red++;
//                           if (yellowInc) yellow++;
//                         }
//                         // Decrement if changing from Yes to No
//                         if (previousValue == 'Yes') {
//                           if (redInc) red--;
//                           if (yellowInc) yellow--;
//                         }
//                       }
//                     }

//                     // print('Question: $question');
//                     // print('Value: $value');
//                     // print('Red Score: $red');
//                     // print('Yellow Score: $yellow');
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             );
//           }).toList(),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   // Retain the original buildTable method from the first document
//   Widget buildTable() {
//     final Map<String, String> milestones = {
//       'Social Smile': '6 weeks',
//       'Neck Control': '4 months',
//       'Sit with little support': '6 month',
//       'Babbies': '6 months',
//       'Run': '18 months',
//       'Bowel control': '3 years',
//       'Bladder control': '5 years'
//     };

//     Map<String, bool> _checkboxValues = {};

//     milestones.keys.forEach((key) {
//       _checkboxValues[key] = _checkboxValues[key] ?? false;
//     });

//     return Table(
//       border: TableBorder.all(color: Colors.grey),
//       children: [
//         const TableRow(children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Milestone',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Expected Time',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'If Delayed',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ]),
//         ...milestones.entries.map((entry) {
//           return TableRow(children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(entry.key),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(entry.value),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   return Checkbox(
//                     value: _checkboxValues[entry.key],
//                     activeColor: Colors.green,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _checkboxValues[entry.key] = value!;
//                         _answers[entry.key] = (value!.toString());
//                         // print(_checkboxValues);
//                       });
//                     },
//                   );
//                 },
//               ),
//             ),
//           ]);
//         }).toList(),
//       ],
//     );
//   }
// }

// // Retain the original RoundedAppBarClipper and DiamondPainter classes

// class RoundedAppBarClipper extends CustomClipper<Path> {
//   final double curveHeight;

//   RoundedAppBarClipper({required this.curveHeight});

//   @override
//   Path getClip(Size size) {
//     final Path path = Path()
//       ..lineTo(0.0, size.height - curveHeight)
//       ..quadraticBezierTo(
//           size.width / 2, size.height, size.width, size.height - curveHeight)
//       ..lineTo(size.width, 0.0)
//       ..close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class DiamondPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = const Color.fromRGBO(0, 0, 0, 1.0);
//     Path path = Path()
//       ..moveTo(size.width / 2, 0)
//       ..lineTo(size.width, size.height / 2)
//       ..lineTo(size.width / 2, size.height)
//       ..lineTo(0, size.height / 2)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
import 'package:flutter/material.dart';
import 'package:MindIt/variable.dart';
import 'ResultPage.dart';

class QuestionPage1 extends StatefulWidget {
  const QuestionPage1({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage1> {
  int _currentPage = 1;
    final ScrollController _scrollController = ScrollController();
  final Map<String, String> _answers = {};
  TextEditingController complaint = TextEditingController();
  TextEditingController pastillness = TextEditingController();

  // Define questions for each page as lists
  final List<Map<String, dynamic>> _page1Questions = [
    {
      'question':
          selectedLanguage == 'English' ? 'Did the mother have any problems during pregnancy?' : 'கர்ப்பிணியாக இருக்கும் போது குழந்தையின் தாய்க்கு உடல்நல பிரச்சினைகள் ஏதேனும் இருந்ததா? (சர்க்கரைவியாதி, இரத்தக்கொதிப்பு)',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Did your child cry immediately after birth?' : 'குழந்தை பிறந்தவுடன் உடனே அழுததா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Is your child milestones delayed?' : 'உங்கள் குழந்தையின் வளர்ச்சி தாமதமாக உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child play with other children?' : 'உங்கள் குழந்தை மற்ற குழந்தைகளுடன் சகஜமாக விளையாடுகிறதா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child talk with other children?' : 'உங்கள் குழந்தை மற்ற குழந்தைகளுடன் பேசுகிறதா?',
      'yellowIncrement': true,
    },
  ];

  final List<Map<String, dynamic>> _page2Questions = [
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child make eye contact while talking?' : 'உங்கள் குழந்தை மற்றவர்களுடன் பேசும் போது அவர்களை கவனித்து பேசுகிறதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Do your child having difficulty sitting in one place at home or school?' : 'உங்கள் குழந்தை பள்ளியிலோ/ வீட்டிலோ ஓரிடத்தில் உட்கார்ந்து  கவனிக்கிறதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child having difficulty listening to class?' : 'உங்கள் குழந்தை வகுப்பறையில் பாடங்களை கவனிப்பதில் சிரமம் உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child have difficulty in waiting for his/her turn to answer?' : 'உங்கள் குழந்தை அவருடைய வாய்ப்பு வரும் வரை பதில் சொல்ல காத்திருப்பாரா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child repetatively washes his/her hand' : 'உங்கள் குழந்தை அடிக்கடி கைகழுவும் வழக்கம் கொண்டவரா?',
      'redIncrement': true,
    },
  ];

  final List<Map<String, dynamic>> _page3Questions = [
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child do things impulsively without thinking about the consequences?' : 'உங்கள் குழந்தை சில செயல்களை முன்யோசனை இல்லாமல் திடீரென செய்கிறாதா? (Impulsive)',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child do repetative movements?' : 'உங்கள் குழந்தை சில உடல் அசைவுகளை திரும்ப திரும்ப செய்கிறதா? (Repetitive Movements)',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Despite adequate training does your child still struggle with reading, writing, and mathematics?' : 'முறையாக பள்ளிக்கு சென்றும் உங்கள் குழந்தை படிப்பதிலோ, எழுதுவதிலோ, கணக்கு பாடம் செய்வதிலோ சிரமம் உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Is your child regular to school?' : 'உங்கள் குழந்தை தினசரி பள்ளிக்கு செல்பவரா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child understands the simple commands?' : 'உங்கள் குழந்தை நீங்கள் பேசுவதை புரிந்து கொள்கிறாரா?',
      'redIncrement': true,
    },
  ];

  final List<Map<String, dynamic>> _page4Questions = [
    {
      'question': selectedLanguage == 'English' ? 'Does your child bully others?' : 'உங்கள் குழந்தை மற்றவர்களை துன்புறுத்துகிறதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child bullied by others?' : 'உங்கள் குழந்தையை யாரேனும் கேலி செய்கிறார்களா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child pee in their bed even after the age of 5 years?' : '5 வயதிற்கு பிறகும் உங்கள் குழந்தை இரவில் உறங்கும் போது படுக்கையில் சிறுநீர் கழிக்கும் வழக்கம்  உண்டா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child passed stool in their bed even after the age of 5 years?' : '5 வயதிற்கு பிறகும் உங்கள் குழந்தை இரவில் உறங்கும் போது படுக்கையில் மலம் கழிக்கும் வழக்கம் உண்டா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child needs assistance for daily routine even as older children?' : '5 வயதிற்கு பிறகும்  குழந்தையின் தினசரி நடவடிக்கைகள் (பல் துலக்குவது, குளிப்பது, சாப்பிடுவது) செய்வதற்கு உதவிகள் தேவைப்படுகின்றதா?',
      'yellowIncrement': true,
    },
  ];

  final List<Map<String, dynamic>> _page5Questions = [
    {
      'question': selectedLanguage == 'English' ? 'Does your child quarrel with elders or teachers?' : 'உங்கள் குழந்தை பெரியவர்கள் அல்லது ஆசிரியர்களுடன் சண்டையிடுகிறதா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child act cruelly towards animals?' : 'உங்கள் குழந்தை வளர்ப்பு பிராணிகளிடம் மூர்க்கத்தனமாக நடந்து கொள்கிறதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child engage in the act of stealing or lying?' : 'உங்கள் குழந்தைக்கு பொய் சொல்வதோ அல்லது களவாடும் பழக்கம் உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child wake up in the middle of night and scream frequently?' : 'உங்கள் குழந்தை இரவில் உறங்கும் போது இடையில் தானே விழித்துக் கொண்டு, அதிக மூச்சு வாங்கி, வியர்த்து அழும் தன்மை உண்டா? (5 வயதிற்கு பிறகு)',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child have breathlessness and faint for trivial reasons?' : 'உங்கள் குழந்தை திடீரென மூச்சு வாங்கி மூர்சசை ஆகி கீழே விழுந்து விடுகிறாரா? ',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Is your child ever expressed fearfulness, raising of heart beat in recent times?' : 'உங்கள் குழந்தை சமீப காலங்களில் எப்போதாவது பயத்தை வெளிப்படுத்தியுள்ளதா, இதயத் துடிப்பை அதிகரித்திருக்கிறதா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page6Questions = [
    {
      'question':
          selectedLanguage == 'English' ? 'Does your child have repetitive eye blinking or shoulder struggling?' : 'உங்கள் குழந்தைக்கு திரும்ப திரும்ப கண் சிமிட்டுதல் அல்லது தோள்பட்டையை உயர்த்தும் பழக்கம் உண்டா? (Shoulder shrugging)',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Is your son/daughter using substance?' : 'உங்கள் மகன்/மகளுக்கு போதைப் பொருட்கள் பழக்கம் உண்டா?',
      'redIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Does your son/daughter seems to be talk to herself/himself?' : 'உங்கள் மகன்/மகளுக்கு தனக்குள்ளேயே முணுமுணுத்துக் கொள்ளும் வழக்கம் உண்டா?',
      'yellowIncrement': true,
    },
    {
      'question':
          selectedLanguage == 'English' ? 'Is there any difference in the behaviour of your child in recent times?' : 'சமீப காலமாக உங்கள் குழந்தையின் நடத்தையில் ஏதேனும் வேறுபாடு உள்ளதா?',
      'yellowIncrement': null,
    },
    // {
    //   'question': 'Any other complaints?',
    //   'yellowIncrement': true,
    // },
  ];

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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        selectedLanguage == "English"
                            ? "Are the following symptoms present for 7 days or more?"
                            : "பின்வரும் அறிகுறிகள் 7 நாட்கள் அல்லது அதற்கு மேல் இருக்கிறதா?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: Center(
                        child: Text(
                          '$_currentPage',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController, 
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildQuestions(_currentPage),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: LinearProgressIndicator(
              value: _currentPage / 7,
              backgroundColor: Colors.grey[300],
              color: const Color.fromRGBO(155, 177, 104, 1.0),
              minHeight: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Page $_currentPage of 7',
              style: const TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
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
                  onPressed: _currentPage > 1
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                  child: Text(
                    selectedLanguage == "English" ? "Back" : "முந்தையது",
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
                  onPressed: _currentPage <= 7
                      ? () {
                          setState(() {
                            // Check if we are on the last page
                            if (_currentPage == 1) {
                              _answers[
                                      "Past history of psychiatric illness and taking treatment"] =
                                  pastillness.text;
                            }
                            if (_currentPage == 7) {
                              // Navigate to ResultPage with answers
                              _answers["any other complaint?"] = complaint.text;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ResultPage(answers: _answers),
                                ),
                              );
                            } else {
                              // Increment current page
                              _currentPage++;
                              _scrollController.jumpTo(0.0);
                              // print('Answers: $_answers');
                              // print('Red Score: $red, Yellow Score: $yellow');
                            }
                          });
                        }
                      : null,
                  child: Text(
                    selectedLanguage == "English" ? "Next" : "அடுத்து",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildQuestions(int page) {
    // Retain the original table for page 7
    if (page == 7) {
      return [
        Text(
          selectedLanguage == "English"
              ? "Answer the questions!"
              : "கேள்விகளுக்கு பதில் அளிக்கவும்!",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        buildTable(),
      ];
    }

    List<Map<String, dynamic>> currentPageQuestions;

    switch (page) {
      case 1:
        currentPageQuestions = _page1Questions;
        break;
      case 2:
        currentPageQuestions = _page2Questions;
        break;
      case 3:
        currentPageQuestions = _page3Questions;
        break;
      case 4:
        currentPageQuestions = _page4Questions;
        break;
      case 5:
        currentPageQuestions = _page5Questions;
        break;
      case 6:
        currentPageQuestions = _page6Questions;
        break;
      default:
        return [];
    }

    return [
      Text(
        selectedLanguage == "English"
            ? "Answer the questions!"
            : "கேள்விகளுக்கு பதில் அளிக்கவும்!",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      ...currentPageQuestions.map((questionData) {
        return buildQuestion(questionData['question'],
            selectedLanguage == "English" ? ['Yes', 'No'] : ['ஆம்', 'இல்லை'],
            redInc: questionData['redIncrement'] ?? false,
            yellowInc: questionData['yellowIncrement'] ?? false);
      }),
      if (_currentPage == 1) ...[
        Text(
            selectedLanguage == "English"
                ? "Past history of psychiatric illness and taking treatment?"
                : "முன்னைய மனநல நோய் வரலாறு மற்றும் சிகிச்சை மேற்கொள்வது?",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextFormField(
          controller: pastillness,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            errorMaxLines: 2,
          ),
        ),
      ],
      if (_currentPage == 6) ...[
        Text(
            selectedLanguage == "English"
                ? "Any other complaints?"
                : "வேறு ஏதாவது குறைபாடுகள் உள்ளனவா?",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextFormField(
          controller: complaint,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            errorMaxLines: 2,
          ),
        ),
      ]
    ];
  }

  Widget buildQuestion(String question, List<String> options,
      {bool redInc = false, bool yellowInc = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Row(
          children: options.map((option) {
            return Expanded(
              child: RadioListTile(
                title: Text(option),
                value: option,
                groupValue: _answers[question],
                onChanged: (value) {
                  setState(() {
                    String? previousValue = _answers[question];
                    _answers[question] = value.toString();

                    if (previousValue != value) {
                      // Questions where "No" should increment
                      if (question ==
                              'Did your child cry immediately after birth?' ||
                          question ==
                              'Does your child play with other children?' ||
                          question ==
                              'Does your child talk with other children?' ||
                          question ==
                              'Does your child make eye contact while talking?' ||
                          question == 'Is your child regular to school?' ||
                          question ==
                              'Does your child understands the simple commands?' ||
                          question == 'குழந்தை பிறந்தவுடன் உடனே அழுததா?' ||
                          question ==
                              'உங்கள் குழந்தை மற்ற குழந்தைகளுடன் சகஜமாக விளையாடுகிறதா?' ||
                          question ==
                              'உங்கள் குழந்தை மற்ற குழந்தைகளுடன் பேசுகிறதா?' ||
                          question ==
                              'உங்கள் குழந்தை மற்றவர்களுடன் பேசும் போது அவர்களை கவனித்து பேசுகிறதா?' ||
                          question ==
                              'உங்கள் குழந்தை தினசரி பள்ளிக்கு செல்பவரா?' ||
                          question ==
                              '15)	உங்கள் குழந்தை நீங்கள் பேசுவதை புரிந்து கொள்கிறாரா?') {
                        if (value == 'No' || value == 'இல்லை') {
                          // Increment score
                          if (redInc) red++;
                          if (yellowInc) yellow++;
                        }
                        // Decrement if changing from No to Yes
                        if (previousValue == 'No' || previousValue == 'இல்லை') {
                          if (redInc) red--;
                          if (yellowInc) yellow--;
                        }
                      }
                      // All other questions increment on "Yes"
                      else {
                        if (value == 'Yes' || value == 'ஆம்') {
                          if (redInc) red++;
                          if (yellowInc) yellow++;
                        }
                        // Decrement if changing from Yes to No
                        if (previousValue == 'Yes' || previousValue == 'ஆம்') {
                          if (redInc) red--;
                          if (yellowInc) yellow--;
                        }
                      }
                    }

                    // print('Question: $question');
                    // print('Value: $value');
                    // print('Red Score: $red');
                    // print('Yellow Score: $yellow');
                  });
                },
                activeColor: Colors.green,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Retain the original buildTable method from the first document
  Widget buildTable() {
    final Map<String, String> milestones = selectedLanguage == "English"
        ? {
            'Smiles at relatives': '6 weeks',
            'Neck control': '4 months',
            'Sits with little support': '6 months',
            'Babbling': '6 months',
            'Running': '18 months',
            'Bowel control': '3 years',
            'Bladder control': '5 years'
          }
        : {
            'உறவினர்களை பார்த்து சிரித்தல்': '6 வாரங்கள்',
            'கழுத்து நிற்பது': '4 மாதங்கள்',
            'சிறிது உதவியுடன் உட்காருவது': '6 மாதங்கள்',
            'மழலை பாபா பேசுவது': '6 மாதங்கள்',
            'ஓடுவது': '18 மாதங்கள்',
            'வயிற்று கட்டுப்பாடு': '3 ஆண்டுகள்',
            'சிறுநீர் கட்டுப்பாடு': '5 ஆண்டுகள்'
          };

    Map<String, bool> checkboxValues = {};

    for (var key in milestones.keys) {
      checkboxValues[key] = checkboxValues[key] ?? false;
    }

    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedLanguage == "English" ? "Milestone" : "முக்கிய கட்டம்",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedLanguage == "English"
                  ? "Expected Time"
                  : "எதிர்பார்க்கப்பட்ட நேரம்",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedLanguage == "English" ? "If Delayed" : "தாமதமானால்",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ]),
        ...milestones.entries.map((entry) {
          return TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.key),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.value),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Checkbox(
                    value: checkboxValues[entry.key],
                    activeColor: Colors.green,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValues[entry.key] = value!;
                        _answers[entry.key] = (value.toString());
                        // print(_checkboxValues);
                      });
                    },
                  );
                },
              ),
            ),
          ]);
        }),
      ],
    );
  }
}

// Retain the original RoundedAppBarClipper and DiamondPainter classes

class RoundedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  RoundedAppBarClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..lineTo(0.0, size.height - curveHeight)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - curveHeight)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromRGBO(0, 0, 0, 1.0);
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
