import 'package:flutter/material.dart';
import 'package:MindIt/variable.dart';
import 'ResultPage.dart';

class QuestionPage2 extends StatefulWidget {
  const QuestionPage2({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage2> {
  int _currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  final Map<String, String> _answers = {};
  TextEditingController complaint = TextEditingController();
  TextEditingController pastillness = TextEditingController();
  //String prefix = selectedLanguage == 'English'? (others ? "Does ${answersfor}" : "Do you"): others ? "$answersfor க்கு": "உங்களுக்கோ";
  // Define questions for each page as lists
  final List<Map<String, dynamic>> _page1Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have Physical illness?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} உடல்நலம் சார்ந்த பிரச்சினைகள் உள்ளதா?',
      'yellowIncrement': true,
      // 'inputType': 'checkbox',
      // 'options': [
      //   {'label': 'Diabetes Mellitus', 'checked': false},
      //   {'label': 'Hypertension', 'checked': false},
      //   {'label': 'Stroke', 'checked': false},
      //   {'label': 'Heart Disease', 'checked': false},
      //   {'label': 'Thyroid Disorder', 'checked': false}
      // ]
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have sleep disturbances?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தூக்கம் சார்ந்த தொந்தரவு உள்ளதா?',
      'yellowIncrement': true,
      // 'hasFollowUp': true,
      // 'followUp': {
      //   'question': 'How long have you had sleep disturbances?',
      //   'inputType': 'dropdown',
      //   'options': ['Since one week', 'Since one month', 'Since six months'],
      //   'showWhen': 'yes'
      // }
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
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தாம்பத்திய உறவில் ஏதேனும் பிரச்சினைகள் உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} worry a lot about future?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} எதிர்காலத்தை நினைத்து அதிகம் பயப்படுகிறீர்களா?', //chnge
      'yellowIncrement': true,
      'hasFollowUp': true,
      'followUp': {
        'question': selectedLanguage == 'English'
            ? 'How long have you been worried?'
            : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} எவ்வளவு காலமாக கவலைப்படுகிறீர்கள்?',
        'inputType': 'dropdown',
        'options': ['Since one week', 'Since one month', 'Since six months'],
        'showWhen': 'yes'
      }
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} expressing restlessness, fearfulness, difficulty in breathing at recent times?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} சமீப காலங்களில் அமைதியின்மை, பயம், சுவாசிப்பதில் சிரமம் போன்றவற்றை வெளிப்படுகிறதா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page2Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} find having repetitive thoughts about particular thing like (fear of contamination)repetitive handwashing?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} திரும்ப திரும்ப சில எண்ணங்கள் தவிர்க்க முடியாமல் தோன்றுகிறதா (அதாவது கை அழுக்காக இருக்கிறது)',
      'redIncrement': true,
      'hasFollowUp': true,
      'followUp': {
        'question':
            'How long have you had repetitive thoughts about particular thing like (fear of contamination)repetitive handwashing?',
        'inputType': 'dropdown',
        'options': ['Since one week', 'Since one month', 'Since six months'],
        'showWhen': 'yes'
      }
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel irritable even for trivial reasons?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} எளிதில் கோபம் வருமா?',
      'yellowIncrement': true,
      'hasFollowUp': true,
      'followUp': {
        'question': selectedLanguage == 'English'
            ? 'How long have you feel irritable?'
            : 'நீங்கள் எவ்வளவு நேரம் எரிச்சலாக உணர்கிறீர்கள்?',
        'inputType': 'dropdown',
        'options': ['Since one week', 'Since one month', 'Since six months'],
        'showWhen': 'yes'
      }
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} tend to check often (door locks/ gas cylinders)?'
          : '${others ? answersfor : "நீங்கள்"} எதையாவது அடிக்கடி சரிப்பார்ப்பவரா (கேஸ் மூடப்பட்டிருக்கிறதா, கதவு பூட்டப்பட்டிருக்கிறதா)',
      'redIncrement': true,
      'hasFollowUp': true,
      'followUp': {
        'question': 'How long have you tend to check often?',
        'inputType': 'dropdown',
        'options': ['Since one week', 'Since one month', 'Since six months'],
        'showWhen': 'yes'
      }
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel special?'
          : '${others ? answersfor : "நீங்கள்"} மற்றவர்களை விட உயர்ந்தவர் என்று ${others ? "நினைக்கிறாரா" : "நினைக்கிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} spend excessively?'
          : '${others ? answersfor : "உங்களுக்கோ நீங்கள்"} அதிக செலவு செய்பவர் என்று நினைக்கிறீர்களா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} able to concentrate at work?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} வேலை செய்வதில் கவனம் செலுத்த முடியுமா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page3Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel sad most of the time?'
          : '${others ? answersfor : "நீங்கள்"} பெரும்பாலான நேரங்களில் மன வருத்தத்தில் ${others ? "இருக்கிறாரா" : "இருக்கிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel interested to do the hobbies as before?'
          : '${others ? answersfor : "நீங்கள்"} விருப்பமான பழக்கங்களை முன்புபோல் செய்ய ஆர்வமாக ${others ? "உள்ளாரா" : " உள்ளீர்களா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel guilty about recent act?'
          : '${others ? answersfor : "நீங்கள்"} சமீபத்தில் நிகழ்ந்த எந்த செயலையும் நினைத்து குற்ற உணர்வுடன் ${others ? "இருக்கிறாரா" : "இருக்கிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} hear voices when no one is around?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} யாரும் அருகில் இல்லாத போதும் பேச்சுக் குரல் கேட்கிறதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} see images when no one is around?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} யாரும் அருகில் இல்லாத போதும் உருவங்கள் தெரிகிறதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} wander around the street?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தெருவில் அலைகிற பழக்கம் உண்டா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page4Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel suspicious about any relative?'
          : '${others ? answersfor : "நீங்கள்"} ஏதேனும் உறவினரைப் பற்றி சந்தேகத்துடன் ${others ? "நினைக்கிறாரா" : "நினைக்கிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel suspicious and fight with everyone without any reason?'
          : '${others ? "$answersfor க்கு" : "நீங்கள்"} எந்த காரணமும் இல்லாமல் அனைவருடனும் சந்தேகத்துடன் இருந்து சண்டை ${others ? "போடுகிறாரா" : "போடுகிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} able to maintain personal hygiene as before?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தனிப்பட்ட தூய்மையை (குளிப்பது, பல்துலக்குவது) தானாக பார்த்துக் கொள்கிறாரா ${others ? "கொள்கிறாரா" : "கொள்கிறீரா"}?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} go for a regular work?'
          : '${others ? answersfor : "நீங்கள்"} தினசரி வேலைக்கு ${others ? "செல்கிறாரா" : "செல்கிறீரா"}?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} able to do house hold chores as before?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} அன்றாட வீட்டு வேலைகள் செய்ய முடிகிறதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} able to identify the time/ place/ person around ${others ? "him" : "you"}'
          : '${others ? "$answersfor க்கு அவரைச்" : "உங்களுக்கோ உங்களை"}  சுற்றியுள்ள நேரம் / இடம் / நபரை அடையாளம் காண முடிகிறதா?',
      'yellowIncrement': null,
    },
  ];

  final List<Map<String, dynamic>> _page5Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} talking with others as before?'
          : '${others ? answersfor : "நீங்கள்"} முன்புபோல் மற்றவர்களுடன் பேசுகிறீர்களா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have pain over multiple areas of body which makes to often visit hospital?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} உடலில் பல பகுதியில் வலிகள் இருப்பதால் அடிக்கடி மருத்துவரை பார்க்கும் வழக்கம் உள்ளதா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel fear of any dreadful illness in body?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தீராத வியாதி இருப்பதாக பயப்படுகின்ரீர்களா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have any self injured cut mark in the forearm?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} கைகளில் கீறிக் கொள்ளும் வழக்கம் உள்ளதா?',
      'yellowIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} feel comfortable about gender and dressing?'
          : '${others ? "$answersfor க்கு தங்களின்" : "உங்களுக்கோ உங்களின்"} பாலினத்தையும் பாலினத்திற்கு தகுந்த உடை அணிவதையும் ஏற்றுக்கொள்ள முடிகிறதா?',
      'redIncrement': true,
    },
  ];

  final List<Map<String, dynamic>> _page6Questions = [
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} engage in the art of stealing/ lying?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} பொய் சொல்லும் வழக்கமோ, களவாடும் பழக்கமோ உண்டா?',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} take any substances(alcohol, cannabis, smoking)'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} போதை பொருட்களை எடுத்துக் கொள்ளும் பழக்கம் உண்டா (ஆல்கஹால், கஞ்சா, புகையிலை)',
      'redIncrement': true,
    },
    {
      'question': selectedLanguage == 'English'
          ? '${others ? "Does $answersfor" : "Do you"} have any ideas of harming yourself?'
          : '${others ? "$answersfor க்கு" : "உங்களுக்கோ"} தற்கொலை எண்ணங்கள் உள்ளதா?',
      'redIncrement': true,
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
              value: _currentPage / 6,
              backgroundColor: Colors.grey[300],
              color: const Color.fromRGBO(155, 177, 104, 1.0),
              minHeight: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Page $_currentPage of 6',
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
                  onPressed: _currentPage <= 6
                      ? () {
                          setState(() {
                            // Check if we are on the last page
                            if (_currentPage == 1) {
                              _answers[
                                      "Past history of psychiatric illness and taking treatment"] =
                                  pastillness.text;
                            }
                            if (_currentPage == 6) {
                              _answers["any other complaint?"] = complaint.text;
                              // Navigate to ResultPage with answers
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
                              print('Answers: $_answers');
                              print('Red Score: $red, Yellow Score: $yellow');
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
        return buildQuestion('${questionData['question']}',
            selectedLanguage == "English" ? ['Yes', 'No'] : ['ஆம்', 'இல்லை'],
            redInc: questionData['redIncrement'] ?? false,
            yellowInc: questionData['yellowIncrement'] ?? false);
      }),
      if (_currentPage == 1) ...[
        Text(
            selectedLanguage == "English"
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
      if (_currentPage == 6) ...[
        Text(
            selectedLanguage == "English"
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
                      if (question == 'feel interested to do the hobbies as before?' ||
                          question ==
                              'able to maintain personal hygiene as before?' ||
                          question == 'go for a regular work?' ||
                          question ==
                              'able to do house hold chores as before?' ||
                          question == 'talking with others as before?' ||
                          question ==
                              'feel comfortable about gender and dressing?' ||
                          question ==
                              'விருப்பமான பழக்கங்களை முன்புபோல் செய்ய ஆர்வமாக உள்ளீர்களா?' ||
                          question ==
                              'தனிப்பட்ட தூய்மையை (குளிப்பது, பல்துலக்குவது) தானாக பார்த்துக் கொள்கிறாரா?' ||
                          question == 'தினசரி வேலைக்கு செல்கிறாரா?' ||
                          question ==
                              'அன்றாட வீட்டு வேலைகள் செய்ய முடிகிறதா?' ||
                          question == 'மற்றவர்களுடன் சகஜமாக  பேசுகின்றாரா?' ||
                          question ==
                              'தங்களின் பாலினத்தையும் பாலினத்திற்கு தகுந்த உடை அணிவதையும் ஏற்றுக்கொள்ள முடிகிறதா?') {
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

                    print('Question: $question');
                    print('Value: $value');
                    print('Red Score: $red');
                    print('Yellow Score: $yellow');
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

// Existing RoundedAppBarClipper and DiamondPainter classes remain the same
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
