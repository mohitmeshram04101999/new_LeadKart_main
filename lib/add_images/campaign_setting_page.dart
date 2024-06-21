
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';

class CampaignSetting extends StatefulWidget {
  const CampaignSetting({Key? key}) : super(key: key);

  @override
  State<CampaignSetting> createState() => _CampaignSettingState();
}

class _CampaignSettingState extends State<CampaignSetting> {

  String _selectedGender = 'Male';

  RangeValues _values = RangeValues(18, 66); // Define _values with initial range
  double min = 18; // Define min value
  double max = 66; // Define max value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Ad Campaign Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(17)),
        child: ListView(
          children: [
            SizedBox(height: SC.from_height(10),),
            Container(
              padding: EdgeInsets.all(SC.from_height(5),),
              width: double.infinity,
              // height: SC.from_height(115),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(36, 238, 221, 0.3),
                  borderRadius: BorderRadius.circular(SC.from_height(10))),
              child: ListTile(
                title: Text('Target our area and audience', style: TextStyle(
                    color: Colors.black, fontSize: SC.from_height(18)),),
                subtitle: Text(
                  '# Place the icon in the top right \ncorner# Place the icon in the\ntop right corner# ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: SC.from_height(15)),),
                trailing: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  width: SC.from_height(60),
                  height: SC.from_height(92),
                  child: Image.asset('assets/img_2.png', fit: BoxFit.cover,),
                ),
              ),
            ),

            SizedBox(height: SC.from_height(15),),
            Text('Select the Gender',
              style: TextStyle(fontSize: SC.from_height(18),fontWeight: FontWeight.w500),),

            // RADIO BUTTON //
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Row(
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: _selectedGender,
                      activeColor: Color.fromRGBO(36, 238, 221, 1),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text('Male',style: TextStyle(fontSize: SC.from_height(17)),),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Female',
                      groupValue: _selectedGender,
                      activeColor: Color.fromRGBO(36, 238, 221, 1),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text('Female',style: TextStyle(fontSize: SC.from_height(17))),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Other',
                      groupValue: _selectedGender,
                      activeColor: Color.fromRGBO(36, 238, 221, 1),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text('Other',style: TextStyle(fontSize: SC.from_height(17))),
                  ],
                ),
              ],
            ),


            // TARGET AREAS //
            SizedBox(height: SC.from_height(10),),
            Text('Target areas',style: TextStyle(fontSize:SC.from_height(18) ,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
            SizedBox(height: SC.from_height(10),),
            Text('Your ad will be shown in this area. It could be list of local area/ city / state or pan india',
              style: TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700,fontWeight: FontWeight.w500 ),),

            SizedBox(height: SC.from_height(20),),

            // MAP //
            Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                height: SC.from_height(140),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(10))),
                child: Image.asset('assets/img_3.png',fit: BoxFit.cover,)
            ),
            SizedBox(height: SC.from_height(20),),


            // CHIP WIDGET //
            Chip(
              label: Text(
                'Bhopal Railway station, Railway Colony,Bhopal Madhya Predesh India',
                style: TextStyle(
                    color: Colors.grey.shade600, fontSize: SC.from_height(14)),
                maxLines: 2, // Set max lines for the text
                overflow: TextOverflow.ellipsis,
              ),
              backgroundColor:
              Colors.grey.shade200,
              // Customize chip background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    SC.from_height(5)), // Match container border radius
                side: BorderSide(
                    color: Colors
                        .grey.shade200), // Optional: Match container border color
              ),

              // Optional: Add an icon to the chip
              onDeleted: () {
                // Handle chip deletion or button click action
                print('Chip button pressed');
              },
              deleteIcon: Icon(Icons.cancel,
                  color: Colors
                      .grey), // Optional: Customize delete icon
              deleteButtonTooltipMessage:
              'Remove', // Tooltip for the delete button
            ),

            SizedBox(height: SC.from_height(20),),
            // ADD TARGET AREA //
            Container(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(10)),
              width: double.infinity,
              height: SC.from_height(50),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [

                  Text('Add Target Area', style: TextStyle(
                      fontSize: SC.from_height(15),
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500),),
                  Expanded(child: Container()),
                  InkWell(
                      onTap: () {

                      },
                      child: Text('Add', style: TextStyle(
                          fontSize: SC.from_height(15.5),
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(36, 238, 221, 1)),)),
                ],
              ),
            ),
            SizedBox(height: SC.from_height(20),),

            // TARGETTING SUGESTION //
            Row(
              children: [

                Text('Targeting Suggestions', style: TextStyle(
                    fontSize: SC.from_height(17.5),
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500),),

                SizedBox(width: SC.from_height(7),),
                InkWell(
                    onTap: () {

                    },
                    child: Text(' (optional)', style: TextStyle(
                        fontSize: SC.from_height(16.5), color: Colors.grey),)),
              ],
            ),

            SizedBox(height: SC.from_height(15),),
            Text(
              'You can suggest to which type of audience you want to show this ad',
              style: TextStyle(
                  fontSize: SC.from_height(16.5), color: Colors.grey.shade700,fontWeight: FontWeight.w500),),

            SizedBox(height: SC.from_height(15),),


            // TARGET SUGESTION TEXTFIELD //
            TextFormField(
              cursorColor: Colors.grey,
              maxLines: 2,
              // Allow multiline input
              keyboardType: TextInputType.multiline,
              // Allow multiline keyboard
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey), // Set border color
                ),
                labelText: 'Target Sugestion',
                // Add label text
                labelStyle:
                TextStyle(color: Colors.grey.shade700,fontSize: SC.from_height(16),fontWeight: FontWeight.w500),
                // Customize label text style
                contentPadding: EdgeInsets.symmetric(
                    vertical: SC.from_height(12),
                    horizontal: SC.from_height(10)),
                // Adjust padding
                filled: true,
                fillColor: Colors
                    .white,
                // Optional: Set background color of the text field
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey), // Set border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide: BorderSide(
                      color: Colors.grey), // Set border color when focused
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                if (value.length < 2) {
                  return 'Name must be at least 2 characters long';
                }
                if (value.length > 50) {
                  return 'Name must be less than 50 characters';
                }
                final nameExp = RegExp(r"^[a-zA-Z\s\-']+$");
                if (!nameExp.hasMatch(value)) {
                  return 'Name contains invalid characters';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),


            SizedBox(height: SC.from_height(15),),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                width: SC.from_height(180),
                height: SC.from_height(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.settings, color: Color.fromRGBO(36, 238, 221, 1),),
                    SizedBox(width: SC.from_height(7),),
                    Text('Advance Setting', style: TextStyle(
                      fontSize: SC.from_height(17),
                      color: Color.fromRGBO(36, 238, 221, 1),),)
                  ],
                ),
              ),
            ),


            //  RANGE SLIDER //
            Row(
              children: [
                Text(
                  'Age Range', style: TextStyle(fontSize: SC.from_height(18)),),
                Expanded(child: Container()),
                Text(
                  '18 to 66', style: TextStyle(fontSize: SC.from_height(17.5)),),
              ],
            ),
            SizedBox(height: SC.from_height(10),),
            Container(
              height: SC.from_width(16),
              child: RangeSlider(
                values: _values,
                min: min,
                max: max,
                divisions: 500000,
                labels: RangeLabels(
                  _values.start.round().toString(),
                  _values.end.round().toString(),
                ),
                activeColor: Color.fromRGBO(36, 238, 221, 1),
                // Set active color
                inactiveColor: Colors.grey.shade400,
                onChanged: (newvalues) {
                  setState(() {
                    _values = newvalues;
                  });
                },
              ),
            ),
            SizedBox(height: SC.from_height(20),),
            Text('Days', style: TextStyle(fontSize: SC.from_height(17.5))),

            SizedBox(height: SC.from_height(20),),

            // GFBUTTON //

            CustomButton(
              text: 'Proceed to payment', onPressed: () {
              // context.pushNamed("homePage");
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> CampaignSetting()));
            },
            ),



            SizedBox(height: SC.from_height(20),),
          ],
        ),
      ),
    );
  }
}
