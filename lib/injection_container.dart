import 'package:cylinders/features/questions/data/datasources/remote/questions_remote_data.dart';
import 'package:cylinders/features/questions/data/repositories/questions_repository_impl.dart';
import 'package:cylinders/features/questions/domain/repositories/question_repository.dart';
import 'package:cylinders/features/questions/domain/usecases/add_question_usecase.dart';
import 'package:cylinders/features/questions/domain/usecases/all_questions_usecase.dart';
import 'package:cylinders/features/questions/presentation/cubit/questions_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/internet_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Questions
  // Cubit
  sl.registerFactory<QuestionsCubit>(() => QuestionsCubit(
        getAllQuestionsUsecase: sl(),
        addQuestionUsecase: sl(),
      ));

  //UseCases
  sl.registerLazySingleton(() => GetAllQuestionsUsecase(repo: sl()));
  sl.registerLazySingleton(() => AddQuestionUseCase(repo: sl()));

  // Repositories
  sl.registerLazySingleton<QuestionRepository>(() => QuestionRepositoryImpl(
        netInfo: sl(),
        questionRemote: sl(),
      ));

  // DataSources
  sl.registerLazySingleton<QuestionsRemoteDataSource>(
      () => QuestionsRemoteDataSource());

//   sl.registerLazySingleton<ProductLocalDataSource>(
//       () => DeviceLocalDataSourceImplSharedPref(sharedPref: sl()));

//   //! Features - Employees
//   // Bloc
//   sl.registerFactory(() => EmployeessBloc(
//         getAllEmployeesUseCase: sl(),
//         addEmployeeUsecase: sl(),
//         getOneEmployeeByIdUseCase: sl(),
//       ));

//   //UseCases

//   sl.registerLazySingleton(() => GetAllEmployeesUsecase(sl()));
//   sl.registerLazySingleton(() => GetOneEmployeeByIdUseCase(sl()));
//   sl.registerLazySingleton(() => AddEmployeeUsecase(sl()));

//   // Repositories
//   sl.registerLazySingleton<EmployeeRepository>(() => EmployeesRepositoryImpl(
//         employeeRemoteDatasource: sl(),
//         employeeLocalDatasource: sl(),
//         networkInfo: sl(),
//       ));

//   // DataSources
//   sl.registerLazySingleton<EmployeesRemoteDatasource>(
//       () => EmployeesRemoteDatasourceImplFirebase(networkInfo: sl()));

//   sl.registerLazySingleton<EmployeeLocalDataSource>(
//       () => EmployeeLocalDataSourceImpl(sharedPref: sl()));

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

//   //! Features - Client
//   // Bloc
//   sl.registerFactory(() => InstallmentHistoryCubit(
//         getOneClientUseCase: sl(),
//         getAllInstallHistoryUseCase: sl(),
//         getAllInstallmentsUsecase: sl(),
//       ));

//   //UseCases

//   sl.registerLazySingleton(() => GetAllInstallHistoryUseCase(repo: sl()));

//   // Repositories
//   sl.registerLazySingleton<InstallmentHistoryRepository>(
//       () => InstallmentHistoryRepositoryImpl(
//             installmentHistoryRemoteDatasource: sl(),
//             networkInfo: sl(),
//           ));

//   // DataSources
//   sl.registerLazySingleton<InstallmentHistoryRemoteDatasource>(
//       () => InstallmentHistoryRemoteDatasourceImplFirebase());

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
