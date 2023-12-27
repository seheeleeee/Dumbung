import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  print(dataList);
  runApp(const MaterialApp(home: MyApp()));

}


TextEditingController _textEditingController = TextEditingController();


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}


class MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  bool isSwitched = false;
  Widget build(BuildContext context) {

    void submit(){
      Navigator.of(context).pop(_textEditingController.text);
    }

    return MaterialApp(
      // home: Image.asset('assets/image2.png')
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home : DefaultTabController(
            length: 2,
            child: Scaffold(
                key: _key,
                bottomNavigationBar: Container(
                    decoration:BoxDecoration(color: Colors.white10),
                    height: 80,
                    child: Container (
                        margin:EdgeInsets.all(20),
                        child: ElevatedButton(onPressed: (){
                          // showCupertinoModalPopup(context: context, builder: (context)=> actionSheet);
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Container(
                                    height: 600, // 모달 높이 크기
                                    //MediaQuery.of(context).size.height * 0.8,
                                    decoration: const BoxDecoration(
                                      color: Colors.white, // 모달 배경색
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // color: Colors.black,
                                            height:60,
                                            child: Center(
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                  children: [
                                                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('취소')),
                                                    Text('새로운 알림 설정', style: TextStyle(color: Colors.black)),
                                                    TextButton(onPressed: (){

                                                      setState((){
                                                        // _data.add(dataID+1);
                                                        dataID++;
                                                        dataList.add({'dataID':'$dataID', 'tag':'일상', 'memo': _textEditingController.text});
                                                      });
                                                      Navigator.pop(context);
                                                      _textEditingController.clear();
                                                    }, child: Text('확인'))
                                                  ],
                                                )
                                            )
                                        ),
                                        Container(
                                            height: 60,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('현관문 여는 시간',)
                                              ],
                                            )

                                        ),
                                        Container(
                                            height: 100,
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('추가 조건'),
                                                DropdownMenu(
                                                  initialSelection: dlist.first,
                                                  // onSelected: (String? value) {
                                                  //   // This is called when the user selects an item.
                                                  //   setState(() {
                                                  //     dropdownValue = value!;
                                                  //   });
                                                  // },
                                                  dropdownMenuEntries: dlist.map<DropdownMenuEntry<String>>((String value) {
                                                    return DropdownMenuEntry<String>(value: value, label: value);
                                                  }).toList(),)
                                              ],
                                            )
                                        ),
                                        Container(
                                            height: 100,
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('알림 메시지'),
                                                TextField(
                                                  controller: _textEditingController,
                                                  decoration: InputDecoration(border: UnderlineInputBorder(), hintText: '원하는 알림을 입력해봐yo',),
                                                ),
                                              ],
                                            )
                                        )
                                      ],
                                    )
                                );
                              });
                        }, child: Icon(Icons.add),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10) ))
                    )

                )
                ,
                appBar: AppBar(
                    shape: Border(
                        bottom: BorderSide(color: Colors.white)
                    ),

                    // leading: Icon(Icons.menu),
                    backgroundColor: Colors.black,
                    actions: [Padding(padding: EdgeInsets.all(16), child:Icon(Icons.menu))],
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:TabBar(
                            indicatorColor: Colors.white,
                            isScrollable: true,
                            tabs: [
                              Tab(child: Text('TODAY')),
                              Tab(child: Text('루틴'))
                            ],
                          ),
                        )
                    )


                ),



                body: TabBarView(
                    children:[

                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                            children:[
                              Container(
                                margin: EdgeInsets.fromLTRB(0,20,0,20),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[
                                      Text('Sep 11, 2023   ' ,textAlign:TextAlign.left , style: TextStyle(color: Colors.white, fontSize:20, fontWeight:FontWeight.bold, height:1)),
                                      Icon(Icons.calendar_month, color:Colors.white)
                                    ]
                                ),
                              ),
                              Expanded(child: Dumbunglist())

                              // Dumbung()
                            ]
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                              children:[
                                Expanded(child: Dumbunglist()),
                              ]
                          )
                      )
                    ]
                )


            )
        )
    );
  }
}








class Dumbung extends StatefulWidget {
  // const Dumbung({super.key});
  final String tag;
  final String memo;
  // return new Dumbung(tag:tag);
  // @override
  Dumbung({
    required String tag,
    required String memo
  }): this.tag = tag, this.memo = memo;
  State<Dumbung> createState() => _DumbungState(tag, memo);
}

class _DumbungState extends State<Dumbung> {
  bool isSwitched = false;

  _DumbungState(this.tag, this.memo);
  final String tag;
  final String memo;
  // GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DumbungTile(context);
  }

  Widget DumbungTile(BuildContext context) {
    return
      Container(
          height:110,
          margin: EdgeInsets.fromLTRB(0,0,0,20),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white,),
          child: Row(
              children: [
                Flexible(flex: 7, fit: FlexFit.tight, child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(width: 50,height:18, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color : Colors.green,),child:Text(tag, style: TextStyle(fontSize:12, color: Colors.white), textAlign: TextAlign.center,),),
                          Text(memo, style: TextStyle(fontSize:24, fontWeight:FontWeight.w500, height:1.6 )),
                          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [Icon(Icons.sunny, size:12, color:Colors.orange), Text('시간, 날짜', style: TextStyle(fontSize:12, color: Colors.grey, height:1.6))]),
                        ]
                    )
                  // child : Text('우산'),
                )
                ),
                Flexible(flex:2,
                    child:Container(
                      alignment: Alignment.center,
                      child: CupertinoSwitch(
                          value: isSwitched,
                          activeColor: Colors.amberAccent,
                          onChanged: (value) {
                            setState((){
                              isSwitched = value;
                            });
                          }
                      ),
                    )
                )
              ]
          )
      );
  }

}

class Dumbunglist extends StatefulWidget {
  const Dumbunglist({super.key});

  @override
  State<Dumbunglist> createState() => _DumbunglistState();
}

class _DumbunglistState extends State<Dumbunglist> {

  @override
  Widget build(BuildContext context) {
    final count = dataList.length;
    return ListView.builder(
        itemCount: count,
        // itemExtent: 100,
        itemBuilder: (context, index){
          return Dismissible(
              key: ObjectKey(dataList[index]),
              child: Dumbung(tag: dataList[index]['tag'].toString(), memo: dataList[index]['memo'].toString() ),
              onDismissed: (direction) {
                dataList.removeAt(index);
              }
            // secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete), alignment: Alignment.centerLeft),
          );
        });

  }
}

