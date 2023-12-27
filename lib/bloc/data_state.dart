import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class DataListBlocState extends Equatable {
  final int count;
  final int selectCount;
  const DataListBlocState({
    this.count = 0,
    this.selectCount = 1,
  });

  DataListBlocState copyWith({
    int? count,
    int? selectCount,
  }) {
    return DataListBlocState(
      count: count ?? this.count,
      selectCount: selectCount ?? this.selectCount,
    );
  }

  @override
  List<Object> get props => [count, selectCount];
}
