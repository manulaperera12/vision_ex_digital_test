part of 'data_bloc.dart';

enum DataStateStatus { initial, loading, success, failure }

class DataState extends Equatable {
  final DataStateStatus status;
  final List<DataModel> dataList;
  final String? errorMessage;

  const DataState({
    this.status = DataStateStatus.initial,
    this.dataList = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, dataList, errorMessage];

  DataState copyWith({
    DataStateStatus? status,
    List<DataModel>? dataList,
    String? errorMessage,
  }) {
    return DataState(
      status: status ?? this.status,
      dataList: dataList ?? this.dataList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}