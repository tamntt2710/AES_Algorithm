import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Views/home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/backgrond.png"),
                  fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(right :600.h,top: 200.h),
          child: Center(
              child: Container(
                height: 500.h,
                width: 300.h,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(30.0),
                      child: Text("AES Algorithm",style: TextStyle(color: Colors
                          .white,fontWeight: FontWeight.bold,fontSize: 30),),
                    ),
                    Form(
                      child: Column(
                        key: _formKey,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal:10.h),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric
                                          (horizontal:10.h,vertical: 15.h), // add
                                        child: Icon(Icons.account_circle,color:
                                        Colors.white70,),
                                      ),
                                    border: InputBorder.none,
                                    labelText: "Username",
                                    labelStyle: TextStyle(
                                        color: Colors.white70,
                                      fontSize: 14
                                    )
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal:10.h),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(

                                      prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric
                                          (horizontal:10.h,vertical: 15.h), // add
                                        child: Icon(Icons.lock,color:
                                        Colors.white70,),
                                      ),
                                      border: InputBorder.none,
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top :30.h),
                            child: GestureDetector(
                              onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        HomeScreen()));
                                // final FormState? form = _formKey.currentState;
                                // if(form!.validate())
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) =>
                                //       HomeScreen()),
                                //);
                              },
                              child: Container(
                                height: 40.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child: Text("Login",style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 18
                                  ),),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ),
      )
      );
  }
}


