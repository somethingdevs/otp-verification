import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProfileSelectionScreen extends StatefulWidget {
  @override
  _ProfileSelectionScreenState createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  int groupValue = 0;

  setSelectedRadio(int value) {
    setState(() {
      groupValue = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              'Please select your profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (dynamic value) {
                      setState(() {
                        print('Shipper selected');
                        setSelectedRadio(value);
                      });
                    },
                  ),
                  SvgPicture.asset('lib/assets/Group.svg'),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('Shipper'),
                      SizedBox(height: 5),
                      Text(
                        'Lorem ipsum dolor sit\n amet consecteur adipiscing',
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  )
                ],
              ),
              // color: Colors.blue,
              height: 70,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (dynamic value) {
                      setState(() {
                        print('Transporter selected');
                        setSelectedRadio(value);
                      });
                    },
                  ),
                  SvgPicture.asset('lib/assets/Group (1).svg'),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text('Transporter'),
                      SizedBox(height: 5),
                      Text(
                          'Lorem ipsum dolor sit \n amet consecteur adipiscing'),
                    ],
                  )
                ],
              ),
              // color: Colors.blue,
              height: 70,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Color(0xff2e3b62),
                onPressed: () {},
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
    );
  }
}
