import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leadkart/Models/offeringResponceModel.dart';
import 'package:leadkart/helper/dimention.dart';

class OfferTile extends StatelessWidget {
  final OfferDetail offer;
  const OfferTile({required this.offer,super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: SC.fromContextWidth(context, 2),
        height: SC.fromContextWidth(context, 2.3),
        decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 5,
              ),
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return const Icon(FontAwesomeIcons.imagePortrait,size: 30,);
                  },
                    imageUrl: "${offer.image}"),
              ),
              Text("${offer.title}", style:Theme.of(context).textTheme.titleMedium),
              Text("${offer.description}", style:Theme.of(context).textTheme.titleSmall)
            ],
          ),
        ),
      ),
    );
  }
}
