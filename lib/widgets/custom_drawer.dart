import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/Home_screen_state.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  File? _profileImage;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('userName')?? "এমডি আমিনুল ইসলাম রাসেল";
      emailController.text = prefs.getString('userEmail')?? "aminul.islam200256@gmail.com";
      _imagePath = prefs.getString('profileImage');
      if (_imagePath!= null) {
        _profileImage = File(_imagePath!);
      }
    });
  }

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', nameController.text);
    await prefs.setString('userEmail', emailController.text);
    if (_imagePath!= null) {
      await prefs.setString('profileImage', _imagePath!);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile!= null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        _imagePath = pickedFile.path;
      });
      _saveUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        elevation: 7.0,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50.0),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                ),
                accountName: Text(
                  nameController.text.isNotEmpty? nameController.text: "আপনার নাম",
                  style: const TextStyle(color: Colors.black45, fontSize: 18),
                ),
                accountEmail: Text(
                  emailController.text.isNotEmpty? emailController.text: "আপনার ইমেইল",
                  style: const TextStyle(color: Colors.black45),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundImage: _profileImage!= null
                        ? FileImage(_profileImage!)
                        : const AssetImage("assets/profile.jpg") as ImageProvider,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("প্রোফাইল সম্পাদনা করুন"),
                onTap: () => _editProfileDialog(),
              ),
              _buildListTile(context, Icons.home, "হোম", const HomeScreenState()),
              _buildListTile(context, Icons.settings, "সেটিংস", null),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text("লগ আউট"),
                onTap: () => _confirmLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editProfileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("প্রোফাইল সম্পাদনা করুন"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "নাম"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "ইমেইল"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _saveUserData();
                });
                Navigator.of(context).pop();
              },
              child: const Text("সংরক্ষণ করুন"),
            ),
          ],
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("লগ আউট নিশ্চিত করুন"),
          content: const Text(
            "আপনি কি নিশ্চিত যে আপনি লগ আউট করতে চান?",
            style: TextStyle(fontSize: 16),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("বাতিল"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close drawer
                exit(0);
              },
              child: const Text("লগ আউট", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  ListTile _buildListTile(BuildContext context, IconData icon, String title, Widget? screen) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (screen!= null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
    );
  }
}