import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/profile_selection_screen.dart';

class VerfiyPhoneScreen extends StatefulWidget {
  final String phNumber;

  VerfiyPhoneScreen(this.phNumber);

  @override
  _VerfiyPhoneScreenState createState() => _VerfiyPhoneScreenState();
}

class _VerfiyPhoneScreenState extends State<VerfiyPhoneScreen> {
  String firstDigit = '';
  String secondDigit = '';
  String thirdDigit = '';
  String fourthDigit = '';
  String fifthDigit = '';
  String sixthDigit = '';
  String otp = '';
  bool isLoading = false;
  int? _forceResendingToken = 0;

  String _verificationId = '';

  TextEditingController textEditingController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  _verifyPhone() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91${widget.phNumber}',
      verificationCompleted: (phoneAuthCredential) async {
        await _auth
            .signInWithCredential(phoneAuthCredential)
            .then((value) async {
          if (value.user != null) {
            print('Logged In!');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSelectionScreen(),
                ));
          }
        });
      },
      verificationFailed: (error) {
        print(error.message);
      },
      codeSent: (verificationId, forceResendingToken) {
        setState(() {
          _verificationId = verificationId;
          _forceResendingToken = forceResendingToken;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      timeout: Duration(seconds: 30),
      forceResendingToken: _forceResendingToken,
    );
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Verify Phone',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Code is sent to ${widget.phNumber}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: Colors.blue[300],
                    disabledColor: Colors.blue[300],
                    activeFillColor: Colors.blue[300],
                    selectedColor: Colors.blue[300],
                    inactiveColor: Colors.blue[300],
                    inactiveFillColor: Colors.blue[300],
                    selectedFillColor: Colors.blue[300],
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  hapticFeedbackTypes: HapticFeedbackTypes.medium,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      otp = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t receive the code? '),
                    GestureDetector(
                      child: Text(
                        'Request Again',
                        style: TextStyle(
                          color: Colors.blue[900],
                        ),
                      ),
                      onTap: () => _verifyPhone(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      try {
                        await _auth
                            .signInWithCredential(
                          PhoneAuthProvider.credential(
                            verificationId: _verificationId,
                            smsCode: otp,
                          ),
                        )
                            .then((value) async {
                          if (value.user != null) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => ProfileSelectionScreen(),
                            ));
                          }
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'VERIFY AND CONTINUE',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xff2e3b62),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // color: Colors.blue,
                height: 110,
                width: double.infinity,
                child: SvgPicture.asset(
                  'lib/assets/Group 3 (1).svg',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
