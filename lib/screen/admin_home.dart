import 'package:flutter/material.dart';
import '../firebase_service/user_repository.dart';
import '../model/user_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  FirebaseServices firebaseServices = FirebaseServices();
  List<UserModel> userData = [];
  List<String> role = ["User", "Executive"];
  List selectedRole = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  /// fetchUserData
  void fetchUserData() async {
    List<UserModel> users = await firebaseServices.allUser();
    setState(() {
      userData = users;
      selectedRole = List.generate(userData.length, (index) => "User");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Home"),
      ),
      body: Container(
        color: Colors.blue[900],
        child: ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              UserModel userModel = userData[index];
              return ListTile(
                title: Text(userModel.email ?? ""),
                subtitle: Text(
                  userModel.phoneNo ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: DropdownButton<String>(
                  value: selectedRole[index],
                  icon: const Icon(Icons.add),
                  style: const TextStyle(color: Colors.white70),
                  underline: Container(
                    height: 2,
                    color: Colors.white70,
                  ),
                  items: role.map<DropdownMenuItem<String>>((String role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(
                        role,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole[index] = newValue!;
                    });
                  },
                ),
              );
            }),
      ),
    );
  }
}
