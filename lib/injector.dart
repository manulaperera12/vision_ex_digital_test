import 'package:get_it/get_it.dart';
import 'core/network/network_services.dart';
import 'features/search_and_category_1/presentation/bloc/data_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Add this package for network connectivity

final sl = GetIt.instance;

Future<void> setupLocators() async {
  // External
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => Connectivity());

  // Network service
  sl.registerLazySingleton(() => NetworkService(connectivity: sl()));

  // Bloc
  sl.registerFactory(() => DataBloc(networkService: sl()));
}