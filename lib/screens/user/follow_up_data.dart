import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class FollowUpDate extends StatefulWidget {
  const FollowUpDate({Key? key}) : super(key: key);

  @override
  State<FollowUpDate> createState() => _FollowUpDateState();
}

class _FollowUpDateState extends State<FollowUpDate> {

  Future<DateTime?> _selectDate(BuildContext context) async {
    // Implement your date selection logic, e.g., using showDatePicker
    DateTime? selectedDate = await showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(

            primaryColor: Color.fromRGBO(36, 238, 221, 1), // Set your primary color here
            // accentColor: Colors.redAccent, // Set your accent color here
            colorScheme: ColorScheme.light(primary: Color.fromRGBO(36, 238, 221, 1)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    return selectedDate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Set Follow Up Date',style: TextStyle(fontSize:  SC.from_height(21)),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(25)),
        child: ListView(

          children: [
            SizedBox(height: SC.from_height(22),),
            Center(
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: SC.from_height(195),
                  height: SC.from_height(165),
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SC.from_height(10)),

                  ),

                  child: Image.asset('assets/10.png',fit: BoxFit.cover,)
              ),
            ),
            SizedBox(height: SC.from_height(22),),

            //  Select date //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
              child: TextFormField(

                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Select date',
                  hintStyle: TextStyle(fontSize: SC.from_height(16),color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  suffixIcon: InkWell(
                    onTap: (){
                      _selectDate(context);
                    },
                      child: Icon(Icons.calendar_month_outlined, color: Colors.grey,)), // Add search icon
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SC.from_height(12),
                      horizontal: SC.from_height(10)), // Adjust padding
                  filled: true,
                  fillColor: Colors.white, // Optional: Set background color of the text field
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey.shade400), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey.shade400), // Set border color when focused
                  ),
                ),

              ),
            ),

            SizedBox(height: SC.from_height(22),),

            //  Select time for a follow up //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
              child: TextFormField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Select time',
                  hintStyle: TextStyle(fontSize: SC.from_height(16),color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Icon(Icons.calendar_month_outlined, color: Colors.grey),
                  ), // Add calendar icon with tap handler
                  contentPadding: EdgeInsets.symmetric(
                    vertical: SC.from_height(12),
                    horizontal: SC.from_height(10),
                  ), // Adjust padding
                  filled: true,
                  fillColor: Colors.white, // Optional: Set background color of the text field
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey.shade400), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(color: Colors.grey.shade400), // Set border color when focused
                  ),
                ),
              ),
            ),
            SizedBox(height: SC.from_height(22),),

            // Write a note here... //
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SC.from_height(0)), // Adjust padding if needed
              child: TextFormField(
                cursorColor: Colors.grey,
                maxLines: null, // Allow multiline input
                keyboardType: TextInputType.multiline, // Allow multiline keyboard
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide:
                    BorderSide(color: Colors.grey,), // Set border color
                  ),
                  labelText: 'Write a note here...', // Add label text
                  labelStyle:
                  TextStyle(color: Colors.grey.shade600,fontSize: SC.from_height(16)), // Customize label text style
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SC.from_height(12),
                      horizontal: SC.from_height(10)), // Adjust padding
                  filled: true,
                  fillColor: Colors
                      .white, // Optional: Set background color of the text field
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide:
                    BorderSide(color: Colors.grey.shade400), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SC.from_height(7)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade400), // Set border color when focused
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
            ),

            SizedBox(height: SC.from_height(35),),

            // GFBUTTON //

            CustomButton(
              text: 'Save', onPressed: () {
              // context.pushNamed("homePage");
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FollowUpDate()));
            },
            ),

          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: SC.from_height(400),
          child: Column(
            children: [
              SizedBox(height: SC.from_height(20),),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Set Follow up date',style: TextStyle(color: Colors.grey.shade700,fontSize:SC.from_height(19),fontWeight: FontWeight.w500 ),),
                subtitle: Text('07 May 2024, 09:32 AM',style: TextStyle(fontSize:SC.from_height(15),color: Colors.grey.shade700 ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: SC.from_height(10),),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(SC.from_height(10)),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: SC.from_height(15),
                    crossAxisSpacing: SC.from_height(15),
                    childAspectRatio: 2.35, // Adjust aspect ratio to fit your design
                  ),
                  itemCount: 6, // Number of items in the grid
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: MyHelper.appConstent.primeryColor),
                        borderRadius: BorderRadius.circular(SC.from_height(8)),
                      ),
                      width: SC.from_height(155),
                      height: SC.from_height(70),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              fontSize: SC.from_height(16),
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            'At 09:32 AM',
                            style: TextStyle(
                              fontSize: SC.from_height(16),
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        );
      },
    );
  }
}

