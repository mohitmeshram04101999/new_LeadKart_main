import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/Models/locationAreaResponceModel.dart';
import 'package:leadkart/Models/targetAreaResponceModel.dart';
import 'package:leadkart/component/CustomButton.dart';
import 'package:leadkart/component/customBackground.dart';
import 'package:leadkart/component/customRadioFeild.dart';
import 'package:leadkart/component/custom_button.dart';
import 'package:leadkart/controllers/creaetAddProvider.dart';
import 'package:leadkart/controllers/payment_methods.dart';
import 'package:leadkart/helper/controllerInstances.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:leadkart/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:leadkart/them/constents.dart';
import 'package:provider/provider.dart';

import '../screens/searchScreen.dart';

class CampaignSetting extends StatefulWidget {
  const CampaignSetting({Key? key}) : super(key: key);

  @override
  State<CampaignSetting> createState() => _CampaignSettingState();
}

class _CampaignSettingState extends State<CampaignSetting> {
  var days = {
    "SU": 1,
    "M": 2,
    "T": 3,
    "W": 4,
    "TU": 5,
    "F": 6,
    "SA": 7,
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PaymentMethods.initPhonePe();
  }

  double min = 18; // Define min value
  double max = 66; // Define max value
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Material(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<CreateAddProvider>(
                builder: (context, value, child) {
                  return AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      color: Colors.lightGreen.shade400,
                      child: Center(
                          child: Text(
                        "Ad Creation in Progress...",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),
                      height: value.isAdCreationInProgress == true ? 45 : 0);
                },
              ),
              Expanded(
                child: CustomBackground(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                  
                    //floating actio
                    floatingActionButton: kDebugMode?FloatingActionButton(onPressed: ()async{
                  
                       await Controllers.locationSelecterProvider(context).load(context);
                  
                      showDialog(context: context, builder: (context) => AlertDialog(
                        content: Column(
                          children: [
                            Text(Controllers.locationSelecterProvider(context).areas.length.toString()),
                            for(Area area in Controllers.locationSelecterProvider(context).areas )
                              Text("sadfa")
                          ],
                        ),
                      ),);
                    }):null,
                  
                    appBar: AppBar(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: const Text('Ad Campaign Settings'),
                    ),
                    body: Consumer<CreateAddProvider>(
                        builder: (a, p, c) => ListView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SC.from_height(17)),
                              children: [
                                SizedBox(
                                  height: SC.from_height(10),
                                ),
                                
                                //
                                Container(
                                  padding: EdgeInsets.all(
                                    SC.from_height(5),
                                  ),
                                  width: double.infinity,
                                  // height: SC.from_height(115),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(36, 238, 221, 0.3),
                                      borderRadius: BorderRadius.circular(
                                          SC.from_height(10))),
                                  child: ListTile(
                                    title: Text(
                                      'Target our area and audience',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: SC.from_height(18)),
                                    ),
                                    subtitle: Text(
                                      '# Place the icon in the top right \ncorner# Place the icon in the\ntop right corner# ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: SC.from_height(15)),
                                    ),
                                    trailing: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(),
                                      width: SC.from_height(60),
                                      height: SC.from_height(92),
                                      child: Image.asset(
                                        'assets/img_2.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(15),
                                ),
                                Text(
                                  'Select the Gender',
                                  style: AppConstent.labelStyle2(context),
                                ),
                                SizedBox(
                                  height: SC.from_height(7),
                                ),
                                // RADIO BUTTON //
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomRadio(
                                      value: 1,
                                      active: p.targetGenders.contains(1),
                                      label: "Male",
                                      onTap: (v) {
                                        p.setTargetGender(v);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomRadio(
                                      value: 2,
                                      active: p.targetGenders.contains(2),
                                      label: "Female",
                                      onTap: (v) {
                                        p.setTargetGender(v);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomRadio(
                                      value: 3,
                                      active: p.targetGenders.contains(3),
                                      label: "Other",
                                      onTap: (v) {
                                        p.setTargetGender(v);
                                      },
                                    ),
                                  ],
                                ),
                  
                                // TARGET AREAS //
                                SizedBox(
                                  height: SC.from_height(10),
                                ),
                                Text(
                                  'Target areas',
                                  style: AppConstent.labelStyle2(context)),
                                SizedBox(
                                  height: SC.from_height(10),
                                ),
                                Text(
                                  'Your ad will be shown in this area. It could be list of local area/ city / state or pan india',
                                  style: TextStyle(
                                      fontSize: SC.from_height(16),
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500),
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(20),
                                ),
                  
                                // MAP //
                                Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: double.infinity,
                                    height: SC.from_height(140),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SC.from_height(10))),
                                    child: Image.asset(
                                      'assets/img_3.png',
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  height: SC.from_height(20),
                                ),
                  
                                // CHIP WIDGET //
                                Chip(
                                  label: Text(
                                    'Bhopal Railway station, Railway Colony,Bhopal Madhya Predesh India',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: SC.from_height(14)),
                                    maxLines: 2, // Set max lines for the text
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  backgroundColor: Colors.grey.shade200,
                                  // Customize chip background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SC.from_height(
                                            5)), // Match container border radius
                                    side: BorderSide(
                                        color: Colors.grey
                                            .shade200), // Optional: Match container border color
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
                  
                                SizedBox(
                                  height: SC.from_height(20),
                                ),



                                Text("Target Areas",style: AppConstent.labelStyle2(context),),

                                // ADD TARGET AREA //
                                Wrap(
                                  children: [
                                    for(TargetArea area in p.targetArea)
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("${area.name},${area.region},${area.countryName}"),
                                              SizedBox(width: 5,),
                                              InkWell(
                                                onTap: (){
                                                  p.removeTargetAreA(area);
                                                },
                                                  child: Icon(Icons.close)
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                  ],
                                ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: 8),)
                                  ),onPressed: (){
                                    RouteTo(context,
                                        child: (a, n) =>
                                        const SearchTargetAreaScreen());
                                  }, child: Text("Add Target Area")),
                                ),

                                SizedBox(
                                  height: SC.from_height(20),
                                ),
                  
                                // TARGETTING SUGESTION //
                                Row(
                                  children: [
                                    Text(
                                      'Targeting Suggestions',
                                      style: TextStyle(
                                          fontSize: SC.from_height(17.5),
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: SC.from_height(7),
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Text(
                                          ' (optional)',
                                          style: TextStyle(
                                              fontSize: SC.from_height(16.5),
                                              color: Colors.grey),
                                        )),
                                  ],
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(15),
                                ),
                                Text(
                                  'You can suggest to which type of audience you want to show this ad',
                                  style: TextStyle(
                                      fontSize: SC.from_height(16.5),
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500),
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(15),
                                ),
                  
                                // TARGET SUGESTION TEXTFIELD //
                                TextFormField(
                                  cursorColor: Colors.grey,
                                  maxLines: 2,
                                  // Allow multiline input
                                  keyboardType: TextInputType.multiline,
                                  // Allow multiline keyboard
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(SC.from_height(7)),
                                      borderSide: BorderSide(
                                          color: Colors.grey), // Set border color
                                    ),
                                    labelText: 'Target Sugestion',
                                    // Add label text
                                    labelStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: SC.from_height(16),
                                        fontWeight: FontWeight.w500),
                                    // Customize label text style
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: SC.from_height(12),
                                        horizontal: SC.from_height(10)),
                                    // Adjust padding
                                    // filled: true,
                                    fillColor: Colors.white,
                                    // Optional: Set background color of the text field
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(SC.from_height(7)),
                                      borderSide: BorderSide(
                                          color: Colors.grey), // Set border color
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(SC.from_height(7)),
                                      borderSide: BorderSide(
                                          color: Colors
                                              .grey), // Set border color when focused
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
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(15),
                                ),
                  
                                Text('Ad Schedule',
                                    style:AppConstent.labelStyle2(context)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: CustomPicker(
                                          onTap: () => p.setStartDay(context),
                                          label: "Set Start Date",
                                          child: Text(p.startDate == null
                                              ? "Start Date"
                                              : "${MyHelper.formatDateTime(p.startDate!)}")),
                                    ),
                                    Expanded(
                                      child: CustomPicker(
                                          onTap: () => p.setEndDay(context),
                                          label: "Set End Time",
                                          child: Text(p.endDate == null
                                              ? "End Date"
                                              : "${MyHelper.formatDateTime(p.endDate!)}")),
                                    ),
                                  ],
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(15),
                                ),
                                Text('Running Interval',
                                    style:
                                       AppConstent.labelStyle2(context)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: CustomPicker(
                                          onTap: () => p.setDayStartTime(context),
                                          label: "Start Time",
                                          child: Text(p.dayStartTime == null
                                              ? "Set Start Time"
                                              : "${MyHelper.formatTime(p.dayStartTime!)}")),
                                    ),
                                    Expanded(
                                      child: CustomPicker(
                                          onTap: () => p.setEndTime(context),
                                          label: "End Time",
                                          child: Text(p.dayEndTime == null
                                              ? "Set End Time"
                                              : "${MyHelper.formatTime(p.dayEndTime!)}")),
                                    ),
                                  ],
                                ),
                  
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  collapsedIconColor: AppConstent().primeryColor,
                                  title: const Text(""),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 60),
                                      Icon(Icons.settings),
                                      SizedBox(width: 5),
                                      Text(
                                        "Advanced Setting",
                                        style: TextStyle(
                                            color: AppConstent().primeryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: SC.fromWidth(22)),
                                      )
                                    ],
                                  ),
                                  children: [
                                    //  RANGE SLIDER //
                                    Row(
                                      children: [
                                        Text(
                                          'Age Range',
                                          style: TextStyle(
                                              fontSize: SC.from_height(18)),
                                        ),
                                        Expanded(child: Container()),
                                        Text(
                                          '18 to 66',
                                          style: TextStyle(
                                              fontSize: SC.from_height(17.5)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: SC.from_height(10),
                                    ),
                  
                                    SizedBox(
                                      height: SC.from_width(16),
                                      child: RangeSlider(
                                        values: p.ageRange,
                                        min: min,
                                        max: max,
                                        divisions: 500000,
                                        labels: RangeLabels(
                                          p.ageRange.start.round().toString(),
                                          p.ageRange.end.round().toString(),
                                        ),
                                        activeColor: AppConstent().primeryColor,
                                        // Set active color
                                        inactiveColor: Colors.grey.shade400,
                                        onChanged: (newvalues) {
                                          p.setAgeRange(newvalues);
                                        },
                                      ),
                                    ),
                  
                                    SizedBox(
                                      height: SC.from_height(20),
                                    ),
                                    Text('Days',
                                        style: TextStyle(
                                            fontSize: SC.from_height(17.5))),
                                    SizedBox(
                                      height: SC.from_height(10),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (var i in days.entries)
                                          MyInkWell(
                                            width: SC.from_height(35),
                                            height: SC.from_height(35),
                                            onTap: () => p.setDay(i.value),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: (p.days.contains(i.value))
                                                    ? AppConstent().primeryColor
                                                    : Colors.transparent,
                                                border: Border.all(
                                                    color: AppConstent()
                                                        .primeryColor)),
                                            child: Center(
                                                child: Text(
                                              i.key[0].toString(),
                                              style: TextStyle(
                                                  color: p.days.contains(i.value)
                                                      ? Colors.white
                                                      : AppConstent().primeryColor),
                                            )),
                                          )
                                      ],
                                    ),
                  
                                    SizedBox(
                                      height: SC.from_height(20),
                                    ),
                                  ],
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(20),
                                ),
                  
                                // GFBUTTON //
                  
                                CustomButton(
                                  text: 'Proceed to payment',
                                  onPressed: () {
                                    // p.createAdd(context);
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: true,
                                      // false = user must tap button, true = tap outside dialog
                                      builder: (BuildContext dialogContext) {
                                        return Dialog(
                                          clipBehavior: Clip.hardEdge,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: PaymentMethod.values
                                                .map((e) => ListTile(
                                                      contentPadding:
                                                          EdgeInsets.all(8),
                                                      title: Text(PaymentMethods
                                                          .getPaymentName(e)),
                                                      leading: Image.asset(
                                                          PaymentMethods
                                                              .getPaymentIcon(e),
                                                          width: 50),
                                                      onTap: () async {
                                                        await PaymentMethods
                                                                .getPaymentMethod(
                                                                    e, context)
                                                            .then(
                                                          (value) {
                                                            Navigator.pop(context);
                                                          },
                                                        );
                                                      },
                                                    ))
                                                .toList(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                  
                                SizedBox(
                                  height: SC.from_height(20),
                                ),
                              ],
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
