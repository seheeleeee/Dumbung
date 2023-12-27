import 'package:equatable/equatable.dart';

// import'immu'

// @immutable
abstract class DataListEvent{
  // const DataListEvent();
  // @override
  // List<Object> get props => [];
}

class DataListUpdated extends DataListEvent {}

class DataAdded extends DataListEvent {
  final Map<String, String> newData;
  DataAdded(this.newData);
}

class DataRemoved extends DataListEvent {
  final Map<String, String> dataToRemove;
  DataRemoved(this.dataToRemove);
}


