import 'package:docdoc/core/networking/firebase_factory.dart';
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
  GetIt.I.registerLazySingleton<FirebaseFactory>(() => firebaseFactory);

  //Login
  GetIt.I.registerLazySingleton<LoginFirebaseService>(
      () => LoginFirebaseService(getIt()));
  GetIt.I.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  GetIt.I.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //SignUp
  GetIt.I.registerLazySingleton<SignUpFirebaseService>(
      () => SignUpFirebaseService(getIt()));
  GetIt.I.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  GetIt.I.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
