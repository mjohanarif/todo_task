import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  locator

    // repository
    ..registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(
        localDataSource: locator(),
      ),
    )

    // usecase
    ..registerLazySingleton(
      () => GetTasksUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => AddTaskUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => EditTaskUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteTaskUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => FilterTaskUsecase(
        repository: locator(),
      ),
    )

    // data source
    ..registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl(),
    )

    // BLOC
    ..registerFactory(
      () => TaskBloc(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
      ),
    )

    // external
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        locator(),
      ),
    )
    ..registerLazySingleton(
      () => CacheHandler(
        cache: locator(),
      ),
    );

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(TaskStatusAdapter());
    await Hive.openBox<TaskModel>(Constant.taskKey);
  }
}
