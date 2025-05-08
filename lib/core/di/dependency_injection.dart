import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/core/networking/firebase_factory.dart';
import 'package:docdoc/features/home/data/apis/home_api_service.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/login/data/firebase/login_firebase_service.dart';
import 'package:docdoc/features/login/data/repo/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/sign_up/data/firebase/sign_up_firebase_service.dart';
import 'package:docdoc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  FirebaseFactory firebaseFactory = FirebaseFactory();
  getIt.registerLazySingleton<FirebaseFactory>(() => firebaseFactory);
  Dio dio = DioFactory.getDio();

  //Login
  getIt.registerLazySingleton<LoginFirebaseService>(
      () => LoginFirebaseService(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //SignUp
  getIt.registerLazySingleton<SignUpFirebaseService>(
      () => SignUpFirebaseService(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //Home
  // getIt.registerSingleton<DioFactory>(dio);
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
