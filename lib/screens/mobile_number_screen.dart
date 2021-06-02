import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../screens/verify_phone_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  var _textController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Please enter your mobile number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  // color: Colors.blue,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  child: Text(
                    'You\'ll receive a 4 digit code to verify next',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  // color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset('lib/assets/india 2.svg'),
                      SizedBox(width: 10),
                      Text('+91 '),
                      SizedBox(
                        width: 10,
                      ),
                      Text('-'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              counterText: '',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VerfiyPhoneScreen(_textController.text),
                          ));
                    },
                    color: Color(0xff2e3b62),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
                  'lib/assets/Group 3.svg',
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
