import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Center(
                child: Text(
                  "AES Algorithm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Column(
                        children: [
                          chooseButton(bits[0]),
                          chooseButton(bits[1]),
                          chooseButton(bits[2]),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 40.h,
                                horizontal :20.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Center(
                                child: Text("Thời gian : 0.01", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 2
                                ), ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150.w,

                      padding: EdgeInsets.symmetric(vertical: 30.h,horizontal:
                      20.h),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        children: [
                          titleOfAction("AES Encrypt"),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal:
                            20.h),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textOfAES("Plaint Text"),
                                  key(30,true),
                                  buttonAction("Encrypt",true),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    decrytedCode(0x321456AE),
                                    decrytedCode(0x321456AE)
                                  ],
                                ),
                                SizedBox(height: 30.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    decrytedCode(0x321456AE),
                                    decrytedCode(0x321456AE)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // select mode,
                    // max hoa
                    Container(
                      width: 150.w,
                      padding: EdgeInsets.symmetric(vertical: 30.h,horizontal:
                      20.h),
                      decoration: BoxDecoration(
                          color: Colors.black
                      ),
                      child: Column(
                        children: [
                          titleOfAction("AES Decryption"),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal:
                            0.h),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height : 50.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                      child: Center(
                                          child: TextFormField(
                                            style: TextStyle(color: Colors
                                                .black),
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color:
                                                  Colors.white, width: 2.0),
                                                ),
                                                labelText: "Column 1",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14
                                                )
                                            ),
                                          )
                                      ),
                                    ),
                                    Container(
                                      height : 50.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                      child: Center(
                                          child: TextFormField(
                                            style: TextStyle(color: Colors
                                                .black),
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color:
                                                  Colors.white, width: 2.0),
                                                ),
                                                labelText: "Column 1",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14
                                                )
                                            ),
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                  SizedBox(height: 15.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height : 50.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        child: Center(
                                            child: TextFormField(
                                              style: TextStyle(color: Colors
                                                  .black),
                                              decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color:
                                                    Colors.black, width: 2.0),
                                                  ),
                                                  labelText: "Column 1",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        height : 50.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        child: Center(
                                            child: TextFormField(
                                              style: TextStyle(color: Colors
                                                  .black),
                                              decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color:
                                                    Colors.white, width: 2.0),
                                                  ),
                                                  labelText: "Column 1",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                  key(30,false),
                                  buttonAction("Decrypt",false),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height : 50.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                      child: Center(
                                        child: Text("Decrypted Text",style:
                                        TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            wordSpacing: 2

                                        ),),
                                      ),
                                    ),
                                  )



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // giai ma
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
Widget chooseButton(int bit){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h,horizontal :20.h),
    child: ElevatedButton(
      child: Text('$bit bit'),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
  );
}
Widget decrytedCode(int text){
  return Container(
    height : 50.h,
    width: 40.w,
    decoration: BoxDecoration(
        color: Colors.black
    ),
    child: Center(
      child: Text("0x${text.toRadixString(16).toUpperCase()}",style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          wordSpacing: 2

      ),),
    ),
  );
}
Widget buttonAction(String text,bool encrypt){
  return GestureDetector(
    onTap: (){
    },
    child: Container(
      height: 40.h,
      width: 40.w,
      decoration: encrypt ? BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30)
      ) : BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),

      ),
      child: Center(
        child: encrypt ? Text(text,style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),) : Text(text,style: TextStyle(
          fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18
        ),),
      ),
    ),
  );
}
Widget key(double vertical,bool encrypt){
  return  Padding(
    padding: EdgeInsets.symmetric(vertical : vertical),
    child: TextFormField(
      style: encrypt ?  TextStyle(color: Colors.black)  : TextStyle(color:
      Colors.white) ,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: encrypt ? BorderSide(color:
            Colors.black, width: 2.0) : BorderSide(color:
            Colors.white, width: 2.0),
          ),
          labelText: "Enter your key",
          labelStyle:encrypt ? TextStyle(
              color: Colors.black,
              fontSize: 14
          ) : TextStyle(
              color: Colors.white,
              fontSize: 14
          )
      ),
    ),
  );
}
Widget textOfAES(String label){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:
          Colors.black, width: 2.0),
        ),
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 14
        )
    ),
  );
}
Widget titleOfAction(String title){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,
        horizontal:20.h),
    decoration : BoxDecoration(
        color: Colors.black
    ),
    child: Text(title,style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
    )),

  );
}