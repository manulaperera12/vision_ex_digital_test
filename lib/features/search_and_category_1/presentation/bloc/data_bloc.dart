import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/data/model/data_model.dart';
import 'package:vision_ex_digital_assignment_manula/core/bloc/event_transformer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/network/network_services.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final NetworkService networkService;

  DataBloc({required this.networkService}) : super(DataState()) {
    on<InitialDataEvent>(_onInitialDataEvent, transformer: Transformer.throttleRestartable());
  }

  Future<void> _onInitialDataEvent(InitialDataEvent event, Emitter<DataState> emit) async {
    emit(state.copyWith(status: DataStateStatus.loading));

    try {
      // Check network connectivity first
      bool isConnected = await networkService.isConnected();

      if (!isConnected) {
        emit(state.copyWith(
            status: DataStateStatus.failure,
            errorMessage: 'No internet connection. Please check your network settings.'
        ));
        return;
      }

      // Get reference to Firestore
      final firestore = FirebaseFirestore.instance;

      // Get all documents from 'places' collection
      final QuerySnapshot querySnapshot = await firestore.collection('places').get();

      // Map each document, including its ID
      final List<DataModel> dataList = querySnapshot.docs.map((doc) {
        return DataModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      debugPrint("#88547 dataList: $dataList");
      emit(state.copyWith(dataList: dataList, status: DataStateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStateStatus.failure, errorMessage: e.toString()));
    }
  }
}