import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';
import 'package:speech_to_text/speech_to_text.dart';


class AdditionalDetail extends StatefulWidget {
  const AdditionalDetail({Key? key}) : super(key: key);

  @override
  State<AdditionalDetail> createState() => _AdditionalDetailState();
}

class _AdditionalDetailState extends State<AdditionalDetail> {

  SpeechToText speechToText = SpeechToText();
  bool isListening = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeSpeechRecognizer();
  }

  // INITIALIZE SPEECH RECOGINIZER //
  void initializeSpeechRecognizer() async {
    bool available = await speechToText.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );
    if (available) {
      print('Speech recognizer initialized');
    } else {
      print('Failed to initialize speech recognizer');
    }
  }

  // VOICE START LISTINING //
  void startListening() async {
    if (!isListening) {
      bool available = await speechToText.hasPermission && await speechToText.initialize();
      if (available) {
        setState(() {
          isListening = true;
        });

        speechToText.listen(

          listenFor: Duration(seconds: 10),
          onResult: (result) {
            setState(() {
              textEditingController.text = result.recognizedWords;
              isListening = false;
            });
            print('Result: ${result.recognizedWords}');
          },
        );
      } else {
        print('Microphone not available or not initialized');
      }
    } else {
      speechToText.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  final List<String> items = [
    'Website Development',
    'Mobile App Development',
    'UI/UX Design',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyHelper.appConstent.primeryColor,
        title: Text('Additional Detail',style: TextStyle(fontSize: SC.from_height(21)),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SC.from_height(15)),
        child: ListView(
          children: [
            SizedBox(height: SC.from_height(15),),
            Row(
              children: [

              // SELECT AN IMAGE //
              DottedBorder(
                strokeWidth: 1,
                dashPattern: [8],
                color: Colors.grey,
                child: Container(
                  width: SC.from_height(105),
                  height: SC.from_height(110),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(SC.from_height(5))),
                  child:  Center(
                    child: Text(
                      'Business \n   Logo',
                      style: TextStyle(
                          color: Colors.grey.shade700, fontSize: SC.from_height(17),fontWeight: FontWeight.w500),
                    ),
                  )
                ),
              ),
                SizedBox(width: SC.from_height(10),),

              // TEXTFIELDS OF 'BUSINESS NAME' OR 'INDUSTRY'
              Expanded(
                child: Column(
                  children: [
                    // Your Business Name //
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SC.from_height(0)),
                      child: Container(
                        width: SC.from_height(230),
                        child: TextFormField(
                          controller: textEditingController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              onTap: startListening,
                              child: isListening ? Icon(Icons.record_voice_over) : Icon(Icons.mic),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SC.from_height(7)),
                              borderSide:
                              BorderSide(color: Colors.grey.shade400), // Set border color
                            ),
                            labelText: 'Your Business Name', // Add label text
                            labelStyle:
                            TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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
                            if (value.length < 1) {
                              return 'Name must be at least 2 characters long';
                            }
                            if (value.length > 1000) {
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
                    ),

                    SizedBox(height: SC.from_height(20),),

                    // Industry   DROPDOWN//
                    Container(
                      width: SC.from_height(230),
                      height: SC.from_height(45),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(SC.from_height(7)),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            border: InputBorder.none, // Remove the default underline
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: SC.from_height(10)), // Adjust padding
                            hintText: 'Industry',
                            hintStyle: TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700 )// Add hint text
                        ),
                        items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle change
                        },
                        icon: Transform.rotate(
                          angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black.withOpacity(0.8),
                            size: SC.from_height(17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],),

            SizedBox(height: SC.from_height(15),),

            // Container(
            //   padding: EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(7),
            //   ),
            //   width: double.infinity,
            //   height: double.infinity,
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     padding: EdgeInsets.all(10),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2, // Number of columns
            //       crossAxisSpacing: 10,
            //       mainAxisSpacing: 10,
            //     ),
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return Chip(
            //         label: Text(
            //           items[index],
            //           style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
            //         ),
            //         backgroundColor: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //           side: BorderSide(color: Colors.grey),
            //         ),
            //         onDeleted: () {
            //           // Handle chip deletion or button click action
            //           print('${items[index]} chip deleted');
            //         },
            //         deleteIcon: Icon(Icons.cancel, color: Colors.grey),
            //         deleteButtonTooltipMessage: 'Remove',
            //       );
            //     },
            //   ),
            // ),

            // ADD AUDIENCEE //

            //  SERVICES //

            Container(
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(SC.from_height(7)),
              ),
              width: double.infinity,
              height: SC.from_height(140),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: SC.from_height(110),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(SC.from_height(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             // Optional: Add some space before the chip
                            Flexible(
                              child: Chip(
                                label: Text(
                                  'App Development',
                                  style: TextStyle(color: Colors.grey.shade700,fontSize:SC.fromWidth(26) ),
                                ),
                                backgroundColor:
                                Colors.white, // Customize chip background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SC.from_height(
                                          15)), // Match container border radius
                                  side: BorderSide(
                                      color: Colors
                                          .grey), // Optional: Match container border color
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
                            ),
                            SizedBox(width: SC.from_height(10)),
                            Flexible(
                              child: Chip(
                                label: Text(
                                  'UI UX Design',
                                  style: TextStyle(color: Colors.grey.shade700,fontSize:SC.from_height(15) ),
                                ),
                                backgroundColor:
                                Colors.white, // Customize chip background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SC.from_height(
                                          15)), // Match container border radius
                                  side: BorderSide(
                                      color: Colors
                                          .grey), // Optional: Match container border color
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
                            ),

                          ],
                        ),

                        SizedBox(
                            width: SC.from_height(
                                10)), // Optional: Add some space before the chip
                        Flexible(
                          child: Chip(
                            label: Text(
                              'Website Development',
                              style: TextStyle(color: Colors.grey.shade700,fontSize:SC.fromWidth(26) ),
                            ),
                            backgroundColor:
                            Colors.white, // Customize chip background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SC.from_height(
                                      15)), // Match container border radius
                              side: BorderSide(
                                  color: Colors
                                      .grey), // Optional: Match container border color
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
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: SC.from_height(19),
                    left: SC.from_height(20),
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(SC.from_height(7)),
                        color: Colors.white,
                      ),
                      child: Text(
                        ' Services ',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: SC.fromWidth(26)),
                      ),
                    ),
                  )

                ],
              ),
            ),


            SizedBox(height: SC.from_height(20),),


            // Business Contact No. //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Business Contact No.', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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
            SizedBox(height: SC.from_height(20),),

            // Add WhatsApp No.. //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Add WhatsApp No.', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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


            SizedBox(height: SC.from_height(20),),
            // State //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'State', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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

            SizedBox(height: SC.from_height(20),),
            // City //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'City', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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


            SizedBox(height: SC.from_height(20),),
            // Business Name //
            Container(

              height: SC.from_height(45),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(SC.from_height(7)),
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default underline
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SC.from_height(10)), // Adjust padding
                    hintText: 'Industry',
                    hintStyle: TextStyle(fontSize:SC.from_height(16),color: Colors.grey.shade700 )// Add hint text
                ),
                items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle change
                },
                icon: Transform.rotate(
                  angle: 1.5708, // 90 degrees in radians (π/2 or 1.5708 radians)
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black.withOpacity(0.8),
                    size: SC.from_height(17),
                  ),
                ),
              ),
            ),

            SizedBox(height: SC.from_height(20),),
            // Website Link //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Website link', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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


            SizedBox(height: SC.from_height(20),),
            // Instagram Link //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Instagram link', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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


            SizedBox(height: SC.from_height(20),),
            // Twitter Link //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Twitter link', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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

            SizedBox(height: SC.from_height(20),),
            // Youtube Link //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Youtube link', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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

            SizedBox(height: SC.from_height(20),),
            // Facebook Link //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Facbook link', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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


            SizedBox(height: SC.from_height(20),),
            // Address //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Address', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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

            SizedBox(height: SC.from_height(20),),
            // Tagline //
            TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SC.from_height(7)),
                  borderSide:
                  BorderSide(color: Colors.grey.shade400), // Set border color
                ),
                labelText: 'Tagline', // Add label text
                labelStyle:
                TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: SC.from_height(16)), // Customize label text style
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




            SizedBox(height: SC.from_height(20),),
          ],
        ),
      ),
    );
  }
}
