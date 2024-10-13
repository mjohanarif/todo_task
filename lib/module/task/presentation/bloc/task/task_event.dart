part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.getTasks() = _GetTasks;
  const factory TaskEvent.addTask(TaskModel task) = _AddTask;
  const factory TaskEvent.editTask(TaskModel task) = _EditTask;
  const factory TaskEvent.deleteTask(String id) = _DeleteTask;
  const factory TaskEvent.filterTask(TaskStatus status) = _FilterTask;
}
