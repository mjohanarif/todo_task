import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_task/module/task/task.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase addTaskUsecase;
  final GetTasksUsecase getTasksUsecase;
  final EditTaskUsecase editTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final FilterTaskUsecase filterTaskUsecase;

  TaskBloc(
    this.addTaskUsecase,
    this.getTasksUsecase,
    this.editTaskUsecase,
    this.deleteTaskUsecase,
    this.filterTaskUsecase,
  ) : super(const _Initial()) {
    on<_AddTask>((event, emit) async {
      final result = await addTaskUsecase(event.task);
      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_EditTask>((event, emit) async {
      final result = await editTaskUsecase((event.index, event.task));
      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_DeleteTask>((event, emit) async {
      final result = await deleteTaskUsecase(event.index);
      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_GetTasks>((event, emit) async {
      final result = await getTasksUsecase(null);
      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_FilterTask>((event, emit) async {
      final result = await filterTaskUsecase(event.status);
      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
