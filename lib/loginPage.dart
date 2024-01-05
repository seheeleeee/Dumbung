import 'package:flutter/material.dart';
import 'AlertSettings.dart';
import 'color.dart';

TextEditingController controller = TextEditingController();




class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: textColor(50),
      //     titleTextStyle: TextStyle(fontSize:20, fontWeight:FontWeight.w700,color: textColor(600)),
      //     elevation: 0,
      //     // title: Text('회원가입')),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center ,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child:Text('아 맞다 마스크'),
          ),

            SizedBox(height:300),

          ElevatedButton(

              child: Text('로그인'),
              onPressed: () {
                // Navigator.pushNamed(context, '/first');
              },
          ),
          TextButton(
            child: Text('회원가입'),
            onPressed: () {
              Navigator.pushNamed(context, '/first');
            },
          )



          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/first');
          //   },
          //   child: Text('회원가입'),
          // ),

        ]
      ),

    );
  }
}




class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 48,
          width:150,
          child: ElevatedButton(
            onPressed: () {
              // 회원가입 완료 후 처리
              Navigator.pushNamed(context, '/second');
              // Navigator.popUntil(context, ModalRoute.withName('/second'));
            },

            child: Text('이메일로 회원가입'),
          ),
        ),
      backgroundColor: textColor(50),
      appBar: AppBar(
        backgroundColor: textColor(50),
          titleTextStyle: TextStyle(fontSize:20, fontWeight:FontWeight.w700,color: textColor(600)),
          elevation: 0,
          title: Text('회원가입')),
          body: Column(
              children:[
                SizedBox(height:20),
                AlertSettingWidgets(label: '닉네임', widget2: TextField(), button: Container(), controller: controller, timeController1: controller, timeController2: controller),
                AlertSettingWidgets(label: '닉네임', widget2: TextField(), button: Container(), controller: controller, timeController1: controller, timeController2: controller),
                AlertSettingWidgets(label: '닉네임', widget2: TextField(), button: Container(), controller: controller, timeController1: controller, timeController2: controller),
                AlertSettingWidgets(label: '닉네임', widget2: TextField(), button: Container(), controller: controller, timeController1: controller, timeController2: controller),


          ]
          ),
          // MaterialApp(theme: ThemeData(scaffoldBackgroundColor: textColor(50), fontFamily: 'Pretendard'),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 48,
        width:150,
        child: ElevatedButton(
          onPressed: () {
            // 회원가입 완료 후 처리
            Navigator.pushNamed(context, '/third');
            // Navigator.popUntil(context, ModalRoute.withName('/second'));
          },

          child: Text('go to second page'),
        ),
      ),
      appBar: AppBar(
          backgroundColor: textColor(50),
          titleTextStyle: TextStyle(fontSize:20, fontWeight:FontWeight.w700,color: textColor(600)),
          elevation: 0,
          title: Text('회원가입')),
      body: Center(
        child: Text('동의해주세요')
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 48,
        width:150,
        child: ElevatedButton(
          onPressed: () {
            // 회원가입 완료 후 처리
            Navigator.pushNamed(context, '/home');
            // Navigator.popUntil(context, ModalRoute.withName('/second'));
          },

          child: Text('go to second page'),
        ),
      ),
      appBar: AppBar(
          backgroundColor: textColor(50),
          titleTextStyle: TextStyle(fontSize:20, fontWeight:FontWeight.w700,color: textColor(600)),
          elevation: 0,
          title: Text('회원가입')),
      body: Center(
          child: Text('권한허용해주세요')
      ),
    );
  }
}
