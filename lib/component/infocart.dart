
import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/them/constents.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppConstent().infoContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: SC.from_width(10), vertical: SC.from_width(10)),
          // margin: EdgeInsets.symmetric(vertical: SC.from_width(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.black,),
              SizedBox(
                width: SC.from_width(10),
              ),
              Flexible(
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: title,
                          style: Theme.of(context).textTheme.displayMedium),
                      TextSpan(
                          text: subTitle,
                          style: Theme.of(context).textTheme.displaySmall),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}