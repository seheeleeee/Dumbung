import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dataset.dart';
import 'data_bloc_event.dart';
import 'data_state.dart';

// 이벤트 정의
// enum DataListEvent { dataUpdated }

// Bloc 정의
class DataListBloc extends Bloc<DataListEvent, List<Map<String, String>>> {
  // DataListBloc() : super(_parseDataListFromJson());
  DataListBloc() : super(dataList){
    on<DataAdded>(_DataAdded);
    on<DataRemoved>(_DataRemoved);
  }
  void _DataAdded(
      DataAdded event, Emitter<List<Map<String, String>>> emit){
      final List<Map<String, String>> currentState = state;
      final List<Map<String, String>> updatedList = List.from(currentState)..add(event.newData);

      // print('dataAdded!');
      // print(updatedList);
      dataSort(updatedList);
      // print(dataSort);
      emit(updatedList);
  }

  void _DataRemoved(
      DataRemoved event, Emitter<List<Map<String, String>>> emit){
      final List<Map<String, String>> currentState = state;
      final List<Map<String, String>> updatedList = currentState.where((data) => data != event.dataToRemove).toList();
      emit(updatedList);
  }

  static List<Map<String, String>> _parseDataListFromJson() {
    String jsonData = json_data; // 다른 파일에서 가져온 데이터 (e.g., dataset.dart)
    List<dynamic> parsedList = jsonDecode(jsonData);
    return parsedList.map((item) => Map<String, String>.from(item)).toList();
  }
}

//
//   List<Map<String, String>> _updateDataList() {
//     // 기존 리스트에서 아이템을 추가, 삭제, 변경 등의 로직 수행
//     List<Map<String, String>> updatedList = state; // 현재 상태의 데이터 리스트 가져오기
//
//     // 데이터를 업데이트하는 로직을 수행하여 변경된 리스트 반환
//     updatedList.add({"dataID": "5", "tag": "운동", "memo": "운동하기", "time": "07:00"});
//     // ... 다른 업데이트 로직
//
//     return updatedList;
//   }
//
//
//   List<Map<String, String>> fetchData() {
//     // 실제 데이터를 가져오는 로직
//     // var json_data = '''
//     //   [
//     //     {"dataID" : "0", "tag" : "일상", "memo" : "회사가야지", "time": "11:20"},
//     //     {"dataID" : "1", "tag" : "건강", "memo" : "약먹어", "time": "09:20"},
//     //     {"dataID" : "3", "tag" : "날씨", "memo" : "우산챙겨", "time": "12:50"},
//     //     {"dataID" : "4", "tag" : "천재", "memo" : "공부해", "time": "23:20"}
//     //   ]
//     // ''';
//
//     // List<dynamic> parsedList = jsonDecode(json_data);
//     // List<Map<String, String>> dataList = parsedList
//     //     .map((item) => Map<String, String>.from(item))
//     //     .toList();
//     // dataSort();
//
//     return dataList;
//   }
// }
