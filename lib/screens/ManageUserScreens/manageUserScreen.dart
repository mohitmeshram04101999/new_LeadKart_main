import 'package:flutter/material.dart';
import 'package:leadkart/controllers/addSubUserProvider.dart';
import 'package:leadkart/screens/ManageUserScreens/manageuserTab.dart';
import 'package:provider/provider.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Manage Users"),
              actions: [
                Consumer<AddSubUserProvider>(
                    builder: (a, p, c) => IconButton(
                        onPressed: () => p.addUser(context),
                        icon: const Icon(Icons.person_add)))
              ],
            ),
            body: ManageSubUserTab()));
  }
}
