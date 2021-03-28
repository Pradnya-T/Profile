import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage({ImageSource source}) async{
      var image= await getImage(source:ImageSource.gallery);
      setState(() {
        _image=image;
        print('Image path $_image');
      });
    }
    Future uploadPic(BuildContext context) async{
      String filName=basename(_image.path);
      Reference firebaseStorageRef=FirebaseStorage.instance.ref().child(filName);
      UploadTask uploadTask=FirebaseStorage.putFile(_image);
      TaskSnapshot taskSnapshot= await uploadTask.onComplete;
      
      setState(() {
        print("Picture Uploaded Successfully");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Picture Uploaded Successfully')));
      });

    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: (){
            Navigator.pop(context);

          },
        ),
      ),
      body: Builder(
        builder: (context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image!=null)?Image.file(_image,fit:BoxFit.fill)

                          :Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fnature.html&psig=AOvVaw1QlbbUIe86-ruCvlcDYxVM&ust=1617016489947000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLiv8pju0u8CFQAAAAAdAAAAABAD",
                            fit: BoxFit.fill,

                          ),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,

                      ),
                      onPressed: (){
                        getImage();



                      },

                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                        child: Text('Username',
                        style: TextStyle(
                          color: Colors.blueGrey, fontSize: 18.0),
                        ),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Pradnya',
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),
                    ),

                  ),
                  Align(alignment: Alignment.centerRight,
                  child: Container(
                    child: Icon(
                      FontAwesomeIcons.pen,
                      color: Color(0xff476cfb),
                    ),

                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Wing/Flat No.',
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18.0),
                          ),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('B/201',
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),
                    ),

                  ),
                  Align(alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Color(0xff476cfb),
                      ),

                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Decription',
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18.0),
                          ),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Hi! Glad to meet you all.',
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),
                    ),

                  ),
                  Align(alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Color(0xff476cfb),
                      ),

                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Owner/Tenant',
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18.0),
                          ),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Tenant',
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),
                    ),

                  ),
                  Align(alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Color(0xff476cfb),
                      ),

                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Contact No.',
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18.0),
                          ),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('1234567890',
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),
                    ),

                  ),
                  Align(alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Color(0xff476cfb),
                      ),

                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                          child: Text('E-mail',
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18.0),
                          ),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('pradnyatopale@gmail.com',
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),
                    ),

                  ),
                  Align(alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Color(0xff476cfb),
                      ),

                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: (){
                        Navigator.of(context).pop();

                      },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  RaisedButton(
                    color: Color(0xff476cfb),
                    onPressed: (){
                      uploadPic(context);

                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],

                //],

              ),




            ],
          ),
        )
        ,
      ),
    );
  }
}
