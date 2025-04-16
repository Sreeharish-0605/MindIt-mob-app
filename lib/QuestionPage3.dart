import 'package:flutter/material.dart';
import 'package:MindIt/variable.dart';
import 'ResultPage.dart';

class QuestionPage3 extends StatefulWidget {
  const QuestionPage3({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage3> {
  int _currentPage = 1;
  final Map<String, String> _answers = {};
  final ScrollController _scrollController = ScrollController();
  TextEditingController complaint = TextEditingController();
  TextEditingController pastillness = TextEditingController();
  //String prefix = selectedLanguage == 'English'? (others ? "Does your relative" : "Do you"): others? "உங்கள் உறவினருக்கோ" : "உங்களுக்கோ";
  // String prefix = others ? "Does your relative" : "Do you";
  // Define questions for each page as lists
  final List<Map<String, dynamic>> _page1Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have Physical illness?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} உடல்நலம் சார்ந்த பிரச்சினைகள் உள்ளதா?',
      'yellowIncrement': true,
      'inputType': 'checkbox',
      'options': [
        {'label': 'Diabetes Mellitus', 'checked': false},
        {'label': 'Hypertension', 'checked': false},
        {'label': 'Stroke', 'checked': false},
        {'label': 'Heart Disease', 'checked': false},
        {'label': 'Thyroid Disorder', 'checked': false}
      ]
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have sleep disturbances?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தூக்கம் சார்ந்த தொந்தரவு உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have disturbance in appetite or food intake?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} பசியெடுப்பதிலோ, உணவு உண்பதிலோ தொந்தரவு உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have disturbance in sexual life?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தாம்பத்தில் உறவில் ஏதேனும் பிரச்சினைகள் உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have impairment in vision?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} பார்வையில் ஏதேனும் குறைபாடு உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have impairment in hearing?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} செவித்திறன் ஏதேனும் குறைபாடு உள்ளதா?',
      'yellowIncrement': true,
    },
  ];

  final List<Map<String, dynamic>> _page2Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} wander in the street (difficult to find the way to their home)?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தெருவில் அலைகிற பழக்கம் உண்டா?',
      'yellowIncrement': null,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have difficulty in walking?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} நடப்பதில் சிரமம் இருக்கிறதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} hear voices when no one is around?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} யாரும் அருகில் இல்லாத போதும் பேச்சுக்குரல் கேட்கின்றதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} see images when no one is around?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} யாரும் அருகில் இல்லாத போதும் கண்களுக்கு உருவங்கள் தெரிகின்றதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel abnormal sensation without any stimulus?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} எந்த வெளிப்படுத்திய காரணமுமின்றி அசாதாரண உணர்வு இருக்கிறதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} able to do day to day work as before?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} முன்புபோல் தினசரி வேலைகளை செய்ய முடியுகிறதா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page3Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} find it difficult to find the way to his home?'
          : '${others ? answersfor : "நீங்கள்"} வீட்டின் வழியை சரியாக கண்டுபிடித்து வந்து ${others ? "விடுகின்றாரா" : "விடுகின்றீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} recognize familiar people?'
          : '${others ? answersfor : "நீங்கள்"} சக சொந்தங்களை அடையாளம் கண்டு ${others ? "கொள்கின்றாரா" : "கொள்கின்றீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel sad recently?'
          : '${others ? answersfor : "நீங்கள்"} பெரும்பாலான நேரங்களில் வருத்தத்துடன் ${others ? "உள்ளாரா" : " உள்ளீர்களா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel suspicious of other\'s activities and fight with them?'
          : '${others ? answersfor : "நீங்கள்"} அனைவரின் மீதும் சந்தேகம் கொண்டு எளிதில் சண்டை போடும் தன்மை கொண்டவரா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have sleep disturbances?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தூக்கம் சார்ந்த தொந்தரவு உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} expressing fearfulness and racing heartbeat at recent times?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} சமிபத்தில் பயம்கொண்டு மனஅழுத்தம் ஏற்படுகிறதா மற்றும் இதயத் துடிப்பு வேகமாக இருக்கிறதா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page4Questions = [
    {
      'question':  selectedLanguage == 'English'
      ? '${others ? "Does $answersfor" : "Do you"} able to talk as before?'
      : '${others ? answersfor : "நீங்கள்"} முன்புபோல் மற்றவர்களுடன் பேசுகிறீர்களா?'
      ,
      'redIncrement': null,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have memory disturbances for recent activities?'
          : '${others ? answersfor : "நீங்கள்"} சமீப காலங்களில் ஞாபக மறதியுடன் ${others ? "உள்ளாரா" : " உள்ளீர்களா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} take substances (Nicotine, Cannabis, Alcohol)?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} போதை பொருட்கள் பழக்கங்கள் உள்ளதா? (புகையிலை, கஞ்சா, மது) ',
      'yellowIncrement': false, // Reversed logic
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} fall frequently?'
          : '${others ? answersfor : "நீங்கள்"} நடக்கும் போது தடுமாறி கீழே விழுகின்றாரா${others ? "விழுகின்றாரா" : "விழுகின்றீரா"}?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have difficulty in dressing?'
          : '${others ? "$answersfor க்கு " : "உங்களுக்கோ உங்கள "}  உடையை அணிந்து கொள்வதில் சிரமம் உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have difficulty in handling money?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} பணத்தை கையாள்வதில் சிரமங்கள் உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have tremors of hand at rest?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} ஓய்வில் இருக்கும்போது கையில் நடுக்கம் இருக்கிறதா?',
      'redIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page5Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} expressing suicidal idea?'
          : '${others ? answersfor : "நீங்கள்"} தற்கொலை எண்ணங்களை ${others ? "வெளிப்படுத்துகிறாரா" : "வெளிப்படுத்துகிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel he/she is special?'
          : '${others ? answersfor : "நீங்கள்"} மற்றவர்களை விட உயர்ந்தவர் என்று ${others ? "நினைக்கிறாரா" : "நினைக்கிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} engage in unusual sexual behaviour?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} நடவடிக்கைகளில் சமீபமாக மாற்றங்கள் தெரிகிறதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} engage in stealing/lying?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} சமீபகாலங்களில் பொய் சொல்லும் திருடக்கூடிய பழக்கம் உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have multiple bodily symptoms(headache/myalgia)?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} பலவிதமான உடல்நல தொந்தரவுகள் உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} able to identify the time/ place/ person around him?'
          : '${others ? "$answersfor க்கு அவரைச்" : "உங்களுக்கோ உங்களை"}  சுற்றியுள்ள நேரம் / இடம் / நபரை அடையாளம் காண முடிகிறதா?',
      'redIncrement': null,
    },
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
                  child:  Center(
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
              value: _currentPage / 5,
              backgroundColor: Colors.grey[300],
              color: const Color.fromRGBO(155, 177, 104, 1.0),
              minHeight: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Page $_currentPage of 5',
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
                  onPressed: _currentPage <= 5
                      ? () {
                          setState(() {
                            // Check if we are on the last page
                            if (_currentPage == 1) {
                              _answers[
                                      "Past history of psychiatric illness and taking treatment"] =
                                  pastillness.text;
                            }
                            if (_currentPage == 5) {
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
                    selectedLanguage == 'English' ? 'Next' : 'அடுத்து',
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
      default:
        return [];
    }

    return [
      Text(
        selectedLanguage == "English" ? "Answer the questions!" : "கேள்விகளுக்கு பதில் அளிக்கவும்!",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      ...currentPageQuestions.map((questionData) {
        return buildQuestion(
            '${questionData['question']}',selectedLanguage == "English" ? ['Yes', 'No'] : ['ஆம்', 'இல்லை'],
            redInc: questionData['redIncrement'] ?? false,
            yellowInc: questionData['yellowIncrement'] ?? false);
      }),
      if (_currentPage == 1) ...[
        Text(selectedLanguage == "English" 
    ? "Past history of psychiatric illness and taking treatment?" 
    : "முன்னணி மனநல நோயின் வரலாறு மற்றும் சிகிச்சை எடுக்கின்றீர்களா?",
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
      if (_currentPage == 5) ...[
        Text(selectedLanguage == "English" 
    ? "Any other complaints?" 
    : "இன்னும் ஏதேனும் புகார்கள் உள்ளனவா?",
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
                      if (question == 'recognize familiar people?' || question == 'சக சொந்தங்களை அடையாளம் கண்டு கொள்கிறாரா?') {
                        if (value == 'No' || value=='இல்லை') {
                          // Increment score
                          if (redInc) red++;
                          if (yellowInc) yellow++;
                        }
                        // Decrement if changing from No to Yes
                        if (previousValue == 'No' ||previousValue=='இல்லை') {
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
                        if (previousValue == 'Yes' || previousValue=='ஆம்') {
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
}

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
