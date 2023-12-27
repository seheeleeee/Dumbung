
import 'dart:convert';

String vals="Null";
List<String> dlist = <String>['One', 'Two', 'Three', 'Four'];
int dataID = 3;
var json_data = '''
  [
  {"dataID" : "0", "tag" : "일상", "memo" : "회사가야지", "time": "11:20"},
  {"dataID" : "1", "tag" : "건강", "memo" : "약먹어", "time": "09:20"},
  {"dataID" : "3", "tag" : "날씨", "memo" : "우산챙겨", "time": "12:50"},
  {"dataID" : "4", "tag" : "천재", "memo" : "공부해", "time": "23:20"}
  ]
''';

List<dynamic> parsedData = jsonDecode(json_data);
List<Map<String, String>> dataList = [];

// Map 형태로 데이터 변환
void dataInitialize() {
  for (var item in parsedData) {
    if (item is Map<String, dynamic>) {
      dataList.add(item.cast<String, String>());
    }
  }
}
void dataSort(List<Map<String, String>> dataList) {
  dataList.sort((a, b) => a['time']!.compareTo(b['time']!));
}
// 시간을 기준으로 정렬

// 'time'이 점심 이전인 첫 번째 데이터의 인덱스 찾기
int lunchIndex(List dataList){
  int indexBeforeNoon = -1;
    for (int i = 0; i < dataList.length; i++) {
      String currentTime = dataList[i]['time'];
      if (isBeforeNoon(currentTime)) {
        indexBeforeNoon = i;
      }
      else break;
    }
    return indexBeforeNoon;
}

// 시간을 비교하여 점심 이전인지 확인하는 함수
bool isBeforeNoon(String time) {
  if (time != null) {
    int hour = int.parse(time.split(':')[0]);
    // print(hour);
    return hour < 12;
    }
  return false;
}


var json_data_category = '''
{"일상":"1", "건강":"2", "천재":"3", "날씨":"4", "null":"0"}
''';

var categoryList =jsonDecode(json_data_category);