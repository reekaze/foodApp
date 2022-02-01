import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/styles/CustomStyle.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  File? img;

  FirebaseAuth auth = FirebaseAuth.instance;
  signUp() async {
    try {
//bikin akun
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
//simpan gambar
      FirebaseStorage storage = FirebaseStorage.instance;
      storage
          .ref('uploads/profile/${auth.currentUser!.uid}/profilePic.png')
          .putFile(img!);
//simpan nama
      users
          .doc(userCredential.user!.uid)
          .set(
            {'name': _nameController.text},
            SetOptions(merge: true),
          )
          .then((value) =>
              print("'full_name' & 'age' merged with existing data!"))
          .catchError((error) => print("Failed to merge data: $error"));

      await Future.delayed(Duration(seconds: 10));
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        testAlert(context, "Can't Sign Up", "Password to weak");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        testAlert(context, "Can't Sign Up", "Email already used");
      }
    } catch (e) {
      print(e);
    }
  }

  void imagePick() async {
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        img = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Stack(
              children: [
                img != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(img!),
                        radius: 40,
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                        radius: 40,
                      ),
                Positioned(
                  bottom: -3,
                  left: 40,
                  child: IconButton(
                      onPressed: () {
                        imagePick();
                      },
                      icon: Icon(Icons.add_a_photo)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: signUp,
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  primary: CustomStyle.red,
                )),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signIn');
                },
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  primary: CustomStyle.red,
                )),
            Flexible(
              child: Container(),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  void testAlert(BuildContext context, String title, String content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ok'))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
