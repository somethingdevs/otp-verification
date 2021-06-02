import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../screens/mobile_number_screen.dart';

class FrameScreen extends StatefulWidget {
  @override
  _FrameScreenState createState() => _FrameScreenState();
}

class _FrameScreenState extends State<FrameScreen> {
  String lang = 'Arabic';
  List<String> langList = ['Arabic', 'Chinese', 'English', 'Hindi', 'Marathi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                ),
                SvgPicture.asset('lib/assets/image.svg'),
                SizedBox(height: 40),
                Text(
                  'Please select your Language',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  'You can change the language at any time',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 30,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    isExpanded: false,
                    onTap: () {},
                    items: langList.map((String e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: new Text(e),
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        lang = value;
                      });
                    },
                    hint: Text('Select Language'),
                    validator: (value) =>
                        value == null ? 'Please select a language' : null,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileNumberScreen(),
                        ),
                      );
                    },
                    color: Color(0xff2e3b62),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // color: Colors.black,
                height: 110,
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'lib/assets/Vector (1).svg',
                          height: 110,
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: SvgPicture.asset(
                            'lib/assets/Vector (3).svg',
                            height: 110,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
