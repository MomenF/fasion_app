



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Setting extends StatefulWidget {

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  //Todo variables
  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Setting"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height:double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 12)
            ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(90),
        )
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile Settings" ,style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
              decoration: TextDecoration.underline,
              decorationThickness: 3

            ),),
            Divider(
              height: 25,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Card(
                    color: Colors.grey[300],
                    shadowColor: Colors.black,
                    elevation: 10,
                  ),
                ),
                _image == null ? Icon(Icons.person,size: 250,color: Colors.white,) :Image( image: FileImage(_image!),),
              ],
            ),
           Container(
              height: 50,
              margin: const EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: MaterialButton(
                  onPressed: (){
                    setState(() {

                    });
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Upload The profile Picture"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                getImage(ImageSource.camera);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt,color: Colors.blueAccent,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("Take Picture by Camera"),
                                ],
                              ),
                            ),
                            Divider(
                              height:
                              25,
                            ),
                            InkWell(
                              onTap: () {
                                getImage(ImageSource.camera);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.image,color: Colors.blueAccent,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("Import Picture from Gallery"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            child: Text("Cancel",style: TextStyle(
                              color: Colors.blueAccent
                            ),),

                              )

                        ],
                      );
                    });
                  },
                  color: Colors.red,
                  child: Positioned(
                    left: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    CircleAvatar(
                    backgroundColor: Colors.blue[300],
                      child: Icon(Icons.camera_alt, color: Colors.white,
                      ),
                    ),
                     SizedBox(
                       width: 5,
                     ),
                     Text("Upload Profile Picture",style: TextStyle(
                          color: Colors.white,
                        ),),

                      ],
                    ),
                  ),
                ),
              ),
            ) ,
          ],
        ),
      ),
    );
  }
}

