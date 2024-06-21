import 'package:flutter/material.dart';
import 'package:leadkart/helper/dimention.dart';

class ImageRow extends StatelessWidget {
  final List<String> imagePaths;

  ImageRow({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(imagePaths.length, (index) {
            return Container(
              margin: EdgeInsets.all(SC.from_height(4)),
              width: SC.from_height(125),
              height: SC.from_height(125),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            );
          }),
        ),
      ),
    );
  }
}




class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailingText;

  CustomListTile({
    required this.title,
    required this.subtitle,
    required this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: SC.fromWidth(22),
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: SC.from_height(14),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Column(
        children: [
          SizedBox(height: 4,),
          Text(
            trailingText,
            style: TextStyle(
              fontSize: SC.fromWidth(26),
              color: Color.fromRGBO(36, 238, 221, 1),
            ),
          ),
        ],
      ),
    );
  }
}

