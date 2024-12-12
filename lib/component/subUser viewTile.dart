import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leadkart/them/constents.dart';

class SubUserTile extends StatelessWidget {
  final dynamic user;
  final void Function()? onTap;
  const SubUserTile({this.onTap, required this.user, super.key});

  String formatPermissionText(String text) {
    return text
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  Map<String, List<String>> parsePermissions(dynamic permissions) {
    if (permissions is String) {
      // Parse the string if it's a JSON string
      log('permissions: $permissions');
      try {
        List<dynamic> parsedList = jsonDecode(permissions);
        Map<String, List<String>> result = {};

        for (var item in parsedList) {
          if (item is Map) {
            item.forEach((key, value) {
              if (value is List) {
                result[key] = List<String>.from(value);
              }
            });
          }
        }
        return result;
      } catch (e) {
        debugPrint('Error parsing permissions: $e');
        return {};
      }
    } else if (permissions is List) {
      // Handle case where permissions is already a List
      Map<String, List<String>> result = {};
      for (var item in permissions) {
        if (item is Map) {
          item.forEach((key, value) {
            if (value is List) {
              result[key] = List<String>.from(value);
            }
          });
        }
      }
      return result;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle();
    TextStyle subTitleStyle = TextStyle(color: Colors.grey.shade700);
    final permissionsMap = parsePermissions(user["permissions"]);

    // Check if permissions is empty or null
    // if (user["permissions"] == null ||
    //     (user["permissions"] is List &&
    //         (user["permissions"] as List).isEmpty) ||
    //     (user["permissions"] is String && user["permissions"].isEmpty)) {
    if (permissionsMap.isEmpty) {
      return ListTile(
        leading: Container(
          width: 35,
          height: 35,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            imageUrl: user['userId']['image'] ?? "",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => CircleAvatar(
              backgroundColor: AppConstent().secondaryColor,
              child: Icon(Icons.person),
            ),
          ),
        ),
        title: Text(
          user['userId']['name'] ?? "Unknown",
          style: titleStyle,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobile - ${user['userId']['mobile'] ?? ""}",
              style: subTitleStyle,
            ),
            Text(
              "Role - No permissions assigned",
              style: subTitleStyle,
            ),
          ],
        ),
      );
    }
    // }

    // Parse permissions

    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Container(
        width: 35,
        height: 35,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: user['userId']['image'] ?? "",
          fit: BoxFit.cover,
          errorWidget: (context, url, error) =>  CircleAvatar(
            backgroundColor: AppConstent().secondaryColor,
            child: Icon(Icons.person),
          ),
        ),
      ),
      onExpansionChanged: (expanded) {
        if (expanded) {
          log('Expanded');
          log('permissions: $permissionsMap');
        } else {
          log('Collapsed');
        }
      },
      title: Text(
        user['userId']['name'] ?? "Unknown",
        style: titleStyle,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mobile - ${user['userId']['mobile'] ?? ""}",
            style: subTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Role - ${user['roleName'] ?? "Custom Permissions"}",
            style: subTitleStyle,
          ),
        ],
      ),
      children: [
        if (permissionsMap.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: permissionsMap.length,
              itemBuilder: (context, index) {
                final sectionName = permissionsMap.keys.elementAt(index);
                final permissions = permissionsMap[sectionName] ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        sectionName.toUpperCase(),
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppConstent().secondaryColor,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: permissions.map((permission) {
                        return Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          color: WidgetStateProperty.resolveWith((states) => Colors.grey.shade100,),
                          label: Text(
                            formatPermissionText(permission),
                            style: TextStyle(
                              fontSize: 14,
                              color:AppConstent().secondaryColor,
                            ),
                          ),
                          backgroundColor: Colors.blue.shade700,
                        );
                      }).toList(),
                    ),
                     Divider(
                      color: Colors.grey.withOpacity(.3),
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}
