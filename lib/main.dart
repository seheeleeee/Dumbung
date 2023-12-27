import 'dart:math';

import 'package:dumbung/bloc/data_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'dataset.dart';
import 'bubblePainters.dart';
import 'AlertSettings.dart';
import 'bloc/data_bloc.dart';
import 'bloc/data_state.dart';
import 'bloc/data_bloc_event.dart';

// 이벤트 정의
enum CounterEvent { increment, decrement }
// Bloc 정의
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}


DataListBloc _dataListBloc = DataListBloc();


void main() {

  // dataList.sort((a, b) => a["time"]!.compareTo(b["time"]!));
  dataInitialize();
  dataSort(dataList);
  // print(dataList);
  // print(lunchIndex(dataList));
  runApp(MyApp());
}


TextEditingController _textEditingController = TextEditingController(text: '');
TextEditingController _timeEditingController_1 = TextEditingController(text: '09:00');
TextEditingController _timeEditingController_2 = TextEditingController(text: '09:00');
//
// class User {
//   final String name;
//   final int age;
//
//   User({this.name = '', this.age=0});
// }
//
// class UserBloc extends Bloc<UserEvent, User> {
//   UserBloc() : super(User()) {
//
//     //이벤트 리스너
//     on<CreateUserEvent>(createUser);
//   }
//
//   // 이벤트 리스너 구현부
//   FutureOr<void> createUser(CreateUserEvent event, Emitter<User> emit) {
//     final User user = User(name: event.name, age: int.tryParse(event.age) ?? 0);
//     emit(user);
//   }
// }
//
//
// // 이벤트 정의
// abstract class UserEvent {}
//
// class CreateUserEvent extends UserEvent {
//   final String name;
//   final String age;
//
//   CreateUserEvent({required this.name, required this.age});
// }
//
//


class MyApp extends StatelessWidget {
  // final DataListBloc _dataListBloc = DataListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataListBloc>(
      create: (context) => _dataListBloc,
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();


  @override
  bool isSwitched = false;
  // AlertSettingWidgets timeWidget = AlertSettingWidgets(label: '현관문 여는 시간', widget2: CupertinoButton( child: Text(''), onPressed: (){},), button: CupertinoButton( child: Text(''), onPressed: (){},), controller: _textEditingController,);
  // bool _selected = false;
// DateTime today = DateTime(2016, 5, 10, 09, 00);

  Widget build(BuildContext context) {
    // void submit() {
    //   Navigator.of(context).pop(_textEditingController.text);
    // }
    final DataListBloc dataListBloc = BlocProvider.of<DataListBloc>(context);


    return MaterialApp(
        // home: Image.asset('assets/image2.png')
        theme: ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'Pretendard'),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                key: _key,
                appBar: AppBar(
                  elevation: 0, // 그림자없애기
                  title: Text('오늘은 비가 와요',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 36,
                      )),
                  centerTitle: false,
                  backgroundColor: Colors.white,
                ),
                bottomNavigationBar: TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(0,0,0,20),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(child: Column( children:[Icon(Icons.favorite),Text('Today')])),
                    Tab(child: Column(children:[Icon(Icons.search),Text('Routine')])),
                    Tab(child: Column(children:[Icon(Icons.settings),Text('Settings')]))
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: SizedBox(
                  width: 72,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Container(
                                height: MediaQuery.of(context).size.height,// 모달 높이 크기
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF7F7F7), // 모달 배경색
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:EdgeInsets.all(8),
                                        color: textColor(500),
                                        height: 110,
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.arrow_back_ios_new, color:textColor(0)),
                                                    ),
                                                Text('새로운 알림',
                                                    style: TextStyle(color: textColor(0),fontSize: 20, fontWeight: FontWeight.w600)),
                                                IconButton(
                                                    onPressed: () {
                                                      // print(_timeEditingController_1.text);
                                                      _dataListBloc.add(DataAdded({
                                                        "dataID": "6",
                                                        "tag": "일상",
                                                        'memo':
                                                        _textEditingController
                                                            .text,
                                                        // 'time': '11:20'
                                                        'time': _timeEditingController_1.text
                                                      }));

                                                      print(dataList);
                                                      setState(() {
                                                      });

                                                        Navigator.pop(context);
                                                        _textEditingController.clear();
                                                        _timeEditingController_1.clear();
                                                        _timeEditingController_2.clear();


                                                    },
                                                    icon: Icon(Icons.check,color:textColor(0)),iconSize: 28,)
                                          ],
                                        )),
                                    Container(
                                      height: 20
                                    ),
                                    AlertSettingWidgets(label: '현관문 여는 시간', widget2: CupertinoButton( child: Text(''), onPressed: (){},), button: CupertinoButton(child: Text(''), onPressed: (){},), controller: _textEditingController, timeController1: _timeEditingController_1,timeController2: _timeEditingController_2),
                                    AlertSettingWidgets(label: '반복 설정', widget2: Text('없음',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color:textColor(300))), button: newAlertButton(voidCallback: (){}),controller: _textEditingController, timeController1: _timeEditingController_1,timeController2: _timeEditingController_2,),
                                    AlertSettingWidgets(label: '추가 조건', widget2: Text('없음',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color:textColor(300))), button: newAlertButton(voidCallback: (){}),controller: _textEditingController, timeController1: _timeEditingController_1,timeController2: _timeEditingController_2),
                                    AlertSettingWidgets(label: '알림메시지 입력', widget2: TextField(), button: Container(), controller: _textEditingController, timeController1: _timeEditingController_1,timeController2: _timeEditingController_2),
                                    AlertSettingWidgets(label: '카테고리', widget2: Text('없음',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color:textColor(300))), button: newAlertButton(voidCallback: (){}),controller: _textEditingController, timeController1: _timeEditingController_1,timeController2: _timeEditingController_2),

                                  ],
                                ));
                          });
                    },

                    // print('플로팅 액션 버튼이 눌렸습니다.');
                    // child: Icon(Icons.add),
                    // style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10) ),
                    child: Icon(Icons.add, size:32),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F222D),
                      shape: RoundedRectangleBorder(
                        // 사각형 모양으로 변경
                        borderRadius:
                            BorderRadius.circular(30.0), // 모서리를 둥글게 조정할 수 있음
                      ), // 버튼 내부에 아이콘 표시
                    ),
                  ),
                ),
                // 위치 조정: endFloat은 우측 하단에 위치하도록 설정

                body: TabBarView(children: [
                  // BlocBuilder<DataListBloc, List<Map<String, String>>>(
                  //   bloc: _dataListBloc,
                  //   builder: (context, state) {
                  //     return
                  //
                  //   },
                  // )


                  Container(//첫번째탭
                    margin: EdgeInsets.all(10),
                    child: Column(children: [

                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        height:50,
                        child: _FilterChips()
                        ),

                      // Image.asset('assets/afternoon.png'),


                            // Image.asset('assets/afternoon.png'),

                            // Expanded(child:
                            // Padding(
                            //     padding: const EdgeInsets.fromLTRB(8,0,6,0),
                            //     child: Dumbunglist())
                            // )



                      Expanded(child:Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,6,0),
                          child: SingleChildScrollView(
                            child: Column(
                              children:[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset('assets/morning.png', width:28),
                                ),
                                Divider(height:50),

                                BlocBuilder<DataListBloc, List<Map<String, String>>>(
                                  bloc: _dataListBloc,
                                  builder: (context, state){
                                    // print('state');
                                    // print(state);
                                    return Dumbunglist(dataList: state.sublist(0,lunchIndex(state)+1));
                                  },
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset('assets/afternoon.png', width:28)),

                                Divider(height:50),
                                // Dumbunglist(dataList: dataList.sublist(lunchIndex(dataList)+1,dataList.length)),
                                BlocBuilder<DataListBloc, List<Map<String, String>>>(
                                  bloc: _dataListBloc,
                                  builder: (context, state) {
                                    // print(dataList);
                                    return Dumbunglist(dataList: state.sublist(lunchIndex(state)+1,state.length));
                                    // Dumbunglist(dataList: dataList.sublist(0,lunchIndex(dataList)+1));
                                  },
                                ),
                              ]
                        ))
                      )
                      )


                      // Dumbung()
                    ]),
                  ),
                  Container( // 두번째 탭
                      margin: EdgeInsets.all(10),
                      child: Column(children: [
                        Expanded(child: Dumbunglist(dataList: dataList.sublist(0,lunchIndex(dataList)))),
                      ]))
                ]))));
  }
}


class Dumbung extends StatefulWidget {
  // const Dumbung({super.key});
  final int index;
  final String tag;
  final String memo;
  final int color;
  final String time;
  // return new Dumbung(tag:tag);
  // @override
  Dumbung({required String tag, required String memo,required int index, required int color, required String time})
      : this.tag = tag,
        this.index = index,
        this.color = color,
        this.time = time,
        this.memo = memo;

  State<Dumbung> createState() => _DumbungState(tag, memo, index, color, time);
}

class _DumbungState extends State<Dumbung> {
  bool isSwitched = false;
  final String tag;
  final String memo;
  final int index;
  final int color;
  final String time;
  _DumbungState(this.tag, this.memo, this.index, this.color, this.time);
  // GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DumbungTile(context);
  }

  Widget DumbungTile(BuildContext context) {
    return CustomPaint(
      painter: (index % 2 == 0)
          ? MyPainter(Case: color)
          : MyPainter2(Case: color),
        child: (index % 2 == 0)
          ? Container(
          padding: EdgeInsets.fromLTRB(20, 20, 24, 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height:0),Text((int.parse(time.substring(0,2)) >= 12 )? time+'PM': time+'AM', style: TextStyle(color: bubbleTextColor(color),fontSize:28,fontWeight:FontWeight.w500,)), Text(tag,style: TextStyle(color: bubbleTextColor(color), fontSize:16,fontWeight:FontWeight.w500,))],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(memo,
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight:FontWeight.w500,
                              color: bubbleTextColor(color))),
                      Text(memo, style: TextStyle(fontSize: 36,color: bubbleTextColor(color),fontWeight:FontWeight.w500,
                      )),
                    ])
              ]),

        )
          : Container(
          padding: EdgeInsets.fromLTRB(20, 40, 24, 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(memo,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight:FontWeight.w500,
                          color: bubbleTextColor(color))),
                  Text(memo, style: TextStyle(fontSize: 36,color: bubbleTextColor(color),fontWeight:FontWeight.w500,
                    )),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [SizedBox(height:48),Text((int.parse(time.substring(0,2)) >= 12)? time+'PM': time+'AM', style: TextStyle(color: bubbleTextColor(color),fontSize:28,fontWeight:FontWeight.w500,)), Text(tag,style: TextStyle(color: bubbleTextColor(color), fontSize:16,fontWeight:FontWeight.w500,))],
                ),
              ]),
        )
    );

  }
}



class Dumbunglist extends StatelessWidget {
  // const Dumbunglist({super.key});
  List dataList2;
  Dumbunglist({required List dataList}) 
      : this.dataList2 = dataList;
  
  // @override
  // List dataList2;

  List<Widget> _listItem(context){ // Listview에서 Listbody(ListItem)으로 변경함.
    List<Widget> widgets = [];
    for (int index = 0; index < dataList2.length; index++){
      widgets.add(
          Align(
              heightFactor: 0.58,
              child: Dismissible(
                  key: ObjectKey(dataList2[index]),
                  // color: (index % 2 == 0) ? Colors.red : Colors.green,
                  // child: Dumbung(tag: dataList[index]['tag'].toString(), memo: dataList[index]['memo'].toString() ),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: (index % 2==0) ? 200 : 266,
                      child: Dumbung(tag: dataList2[index]['tag'].toString(), memo: dataList2[index]['memo'].toString(), index: index, color: int.parse(categoryList[dataList2[index]['tag'].toString()]), time: dataList2[index]['time'].toString())
                  ),
                  onDismissed: (direction) {
                    _dataListBloc.add(DataRemoved(dataList2[index]));
                    dataList2.removeAt(index);
                    // setState(() {});
                  }
                // secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete), alignment: Alignment.centerLeft),
              ))
      );
    }

    return widgets;
  }

  Widget build(BuildContext context) {
    return ListBody(
      children: _listItem(context),
    );
    // final count = dataList.length;
    //
    // return ListView.builder(
    //     padding: const EdgeInsets.symmetric(
    //       vertical: kToolbarHeight,
    //     ),
    //     itemCount: count,
    //     // itemExtent: 100,
    //     itemBuilder: (context, index) {
    //       return Align(
    //           heightFactor: 0.58,
    //           child: Dismissible(
    //               key: ObjectKey(dataList[index]),
    //               // color: (index % 2 == 0) ? Colors.red : Colors.green,
    //               // child: Dumbung(tag: dataList[index]['tag'].toString(), memo: dataList[index]['memo'].toString() ),
    //               child: Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 height: (index % 2==0) ? 200 : 266,
    //                 child:Dumbung(tag: dataList[index]['tag'].toString(), memo: dataList[index]['memo'].toString(), index: index, color: int.parse(dataList[index]['color']))
    //               ),
    //               onDismissed: (direction) {
    //                 dataList.removeAt(index);
    //                 setState(() {});
    //               }
    //               // secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete), alignment: Alignment.centerLeft),
    //               ));
    //     });
  }
}

class _FilterChips extends StatefulWidget {
  @override
  _FilterChipsState createState() =>
      new _FilterChipsState();
}

class _FilterChipsState extends State<_FilterChips> with TickerProviderStateMixin {

  List<String> _options = ['전체'] + categoryList.keys.toList();
  List<bool> _selected = [true] + List.filled(categoryList.length-1, false);

  Widget _buildChips() {
    List<Widget> chips = [];
    _options.remove('null');

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
          selected: _selected[i],
          labelPadding: EdgeInsets.fromLTRB(10,4,10,4),
          label: Text(_options[i], style: TextStyle(fontSize:16, color: _selected[i]? Colors.white : Color(0xFF999EA8))),
          backgroundColor: Color(0xFFF3F4F5),
          // shape: StadiumBorder(side: BorderSide(),),
          side: BorderSide(color:_selected[i] ? Colors.black:Color(0xFFC8CED8)),
          // outlinedBorder: ,
          selectedColor: Colors.black,
          onSelected: (bool selected) {
            setState(() {
              _selected[i] = selected;
            });
          });

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 6), // 칩간 간격
          child: choiceChip
      ));
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
  Widget build(BuildContext context){
    return _buildChips();
  }

}

class newAlertButton extends StatelessWidget {
  // const newAlertButton({super.key});
  final VoidCallback voidCallback;
  // final Function(String val) function;
  newAlertButton({required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60, height: 48,
        child: ElevatedButton(
      onPressed: voidCallback,
      child: Icon(Icons.arrow_forward_ios),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: textColor(500),
        shape: RoundedRectangleBorder(
          // 사각형 모양으로 변경
          borderRadius:
          BorderRadius.circular(30.0), // 모서리를 둥글게 조정할 수 있음
        ),
      ),
        )
    );
  }
}
