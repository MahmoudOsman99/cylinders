import 'package:cylinders/features/bearing_types/data/datasources/remote/bearing_remote_datasource_impl.dart';
import 'package:cylinders/features/bearing_types/domain/repositories/bearing_repository.dart';
import 'package:cylinders/features/bearing_types/domain/usecases/add_bearing_usecase.dart';
import 'package:cylinders/features/bearing_types/presentation/cubit/bearing_types_cubit.dart';
import 'package:cylinders/features/screw_m/presentation/cubit/key_m_cubit.dart';
import 'package:cylinders/features/troubleshoots/data/datasources/remote/troubleshoots_remote_data.dart';
import 'package:cylinders/features/troubleshoots/domain/repositories/troubleshoot_repository.dart';
import 'package:cylinders/features/troubleshoots/domain/usecases/add_troubleshoots_usecase.dart';
import 'package:cylinders/features/troubleshoots/domain/usecases/all_troubleshoots_usecase.dart';
import 'package:cylinders/features/troubleshoots/presentation/cubit/troubleshoots_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/internet_info.dart';
import 'features/bearing_types/data/datasources/remote/bearing_remote_datasource.dart';
import 'features/bearing_types/data/repositories/bearing_repository_impl.dart';
import 'features/troubleshoots/data/repositories/troubleshoots_repository_impl.dart';
import 'features/troubleshoots/domain/usecases/update_troubleshoots_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Troubleshoots
  // Cubit
  sl.registerFactory<TroubleshootsCubit>(() => TroubleshootsCubit(
        getAllTroubleshootsUsecase: sl(),
        addTroubleshootUsecase: sl(),
        updateTroubleshootUsecase: sl(),
      ));

  //UseCases
  sl.registerLazySingleton(() => GetAllTroubleshootsUsecase(repo: sl()));
  sl.registerLazySingleton(() => AddTroubleshootUseCase(repo: sl()));
  sl.registerLazySingleton(() => UpdateTroubleshootUseCase(repo: sl()));

  // Repositories
  sl.registerLazySingleton<TroubleshootRepository>(
      () => TroubleshootRepositoryImpl(
            netInfo: sl(),
            troubleshootRemote: sl(),
          ));

  // DataSources
  sl.registerLazySingleton<TroubleshootsRemoteDataSource>(
      () => TroubleshootsRemoteDataSource());

//   sl.registerLazySingleton<ProductLocalDataSource>(
//       () => DeviceLocalDataSourceImplSharedPref(sharedPref: sl()));

  //! Features - KeyAndMCubit
  // Bloc
  sl.registerFactory(() => KeyAndMCubit());

//   //! Features - Installments
//   // Bloc
//   sl.registerFactory(() => InstallmentsBloc(
//         addInstallmentUsecase: sl(),
//         deleteInstallmentUsecase: sl(),
//         getAllInstallmentsUsecase: sl(),
//         updateInstallmentUsecase: sl(),
//         getOneEmployeeByIdUsecase: sl(),
//         getOneProductByIdUsecase: sl(),
//         getOneClientUseCase: sl(),
//         getAllEmployees: sl(),
//         getAllClient: sl(),
//         getAllProduct: sl(),
//       ));

//   //UseCases

//   sl.registerLazySingleton(
//       () => GetAllInstallmentsUsecase(installmentsRepository: sl()));
//   sl.registerLazySingleton(
//       () => AddInstallmentUsecase(installmentsRepository: sl()));
//   sl.registerLazySingleton(
//       () => UpdateInstallmentUsecase(installmentsRepository: sl()));
//   sl.registerLazySingleton(
//       () => DeleteInstallmentUsecase(installmentsRepository: sl()));

//   // Repositories
//   sl.registerLazySingleton<InstallmentsRepository>(
//       () => InstallmentsRepositoryImpl(
//             installmentsRemoteDataSource: sl(),
//             networkInfo: sl(),
//           ));

//   // DataSources
//   sl.registerLazySingleton<InstallmentsRemoteDataSource>(
//       () => InstallmentsRemoteDataSourceImplByFirebase(networkInfo: sl()));

//   // sl.registerLazySingleton<InstallmentsRemoteDataSource>(
//   //     () => InstallmentsLocalDataSource(sharedPref: sl()));

  //! Features - Bearing
  // Bloc
  sl.registerFactory(() => BearingTypesCubit(
        addBearingUseCase: sl(),
      ));

  //UseCases

  sl.registerLazySingleton(() => AddBearingUseCase(repo: sl()));

  // Repositories
  sl.registerLazySingleton<BearingRepository>(() => BearingRepositoryImpl(
        bearingRemote: sl(),
        networkInfo: sl(),
      ));

  // DataSources
  sl.registerLazySingleton<BearingRemoteDataSource>(
      () => BearingRemoteDataSourceImplWithFirebase());

//   //! Features - Client
//   // Bloc
//   sl.registerFactory(() => ClientsBloc(
//         addClientUseCase: sl(),
//         getOneClientUseCase: sl(),
//       ));

//   //UseCases

//   sl.registerLazySingleton(() => GetOneClientUseCase(repo: sl()));
//   sl.registerLazySingleton(() => GetAllClientUseCase(repo: sl()));
//   sl.registerLazySingleton(() => AddClientUseCase(repo: sl()));

//   // Repositories
//   sl.registerLazySingleton<ClientRepository>(() => ClientRepositoryImpl(
//         clientRemoteDatasource: sl(),
//         networkInfo: sl(),
//       ));

//   // DataSources
//   sl.registerLazySingleton<ClientRemoteDatasource>(
//       () => ClientsRemoteDataSourceImplByFirebase(
//             networkInfo: sl(),
//           ));

//   // sl.registerLazySingleton<EmployeeLocalDataSource>(
//   //     () => EmployeeLocalDataSourceImpl(sharedPref: sl()));

//   //! Features - Debt
//   // Cubit
//   sl.registerFactory(() => DebtCubit(
//         getAllEmployeesUsecase: sl(),
//       ));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(checker: sl()));

//   //! External
//   final sharedPref = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPref);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
