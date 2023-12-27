import 'package:dumbung/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'color.dart';

// TextEditingController _textEditingController = TextEditingController();


class AlertSettingWidgets extends StatefulWidget {
  // const AlertSettingWidgets({super.key});

  final String label;
  final Widget widget2;
  final Widget button;

  final TextEditingController controller;
  final TextEditingController timeController1;
  final TextEditingController timeController2;


  DateTime time1 = DateTime(2016, 5, 10, 09, 00);
  DateTime time2 = DateTime(2016, 5, 10, 09, 00);


  AlertSettingWidgets({required this.label, required this.widget2, required this.button, required this.controller,required this.timeController1,required this.timeController2});

  @override
  State<AlertSettingWidgets> createState() => _AlertSettingWidgetsState(label, widget2,button, controller,timeController1,timeController2);
}

class _AlertSettingWidgetsState extends State<AlertSettingWidgets> {
  final String label;
  final Widget widget2;
  final Widget button;
  final TextEditingController controller;
  final TextEditingController timeController1;
  final TextEditingController timeController2;

  DateTime time1 = DateTime(2023, 5, 10, 09, 00);
  DateTime time2 = DateTime(2023, 5, 10, 12, 00);


  _AlertSettingWidgetsState(this.label, this.widget2, this.button, this.controller,this.timeController1,this.timeController2);


  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container
        (
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height:32, child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
              Container(
                  height:80, width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Colors.white, // 모달 배경색
                    borderRadius:
                    BorderRadius.all(Radius.circular(16)),
                  ),
                  padding:EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: (widget2 is TextField)
                      ? TextField(
                          controller: controller,
                          decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '원하는 알림메시지를 입력해보세요.',
                          hintStyle:TextStyle(color:textColor(300))),
                        )
                      : Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children:[
                        (widget2 is CupertinoButton)? Row(children:[CupertinoButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: time1,
                              onDateTimeChanged: (DateTime newDateTime){
                                setState(() {
                                  time1 = newDateTime;
                                  timeController1.text ='${newDateTime.hour.toString().padLeft(2, '0')}:${newDateTime.minute.toString().padLeft(2, '0')}';
                                });
                              },
                            )),
                            child: Text(
                              '${time1.hour.toString().padLeft(2, '0')}:${time1.minute.toString().padLeft(2, '0')}',
                              // timeController1.text,
                              style: const TextStyle(
                                  fontSize: 28.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                              ),
                            )),
                         Text(time1.hour >= 12 ? 'PM' : 'AM', style: TextStyle(fontSize: 28))
                      ])
                        :widget2,

                        Container(),

                        (button is CupertinoButton)? Row(children:[CupertinoButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: time2,
                              onDateTimeChanged: (DateTime newDateTime){
                                setState(() {
                                  time2 = newDateTime;
                                  timeController2.text ='${newDateTime.hour.toString().padLeft(2, '0')}:${newDateTime.minute.toString().padLeft(2, '0')}';
                                });
                              },
                            )),
                            child: Text(
                                '${time2.hour.toString().padLeft(2, '0')}:${time2.minute.toString().padLeft(2, '0')}',
                              // '${_timeEditingController_1.text}',
                              style: const TextStyle(
                                  fontSize: 28.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                              ),
                            )),
                          Text(time2.hour >= 12 ? 'PM' : 'AM',style: TextStyle(fontSize: 28))
                        ])
                        :button,

                      ]
                  )
              ),
            ],
          ));




  }
}

