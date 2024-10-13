part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.getTasks() = _GetTasks;
  const factory TaskEvent.addTask(TaskModel task) = _AddTask;
  const factory TaskEvent.editTask(int index, TaskModel task) = _EditTask;
  const factory TaskEvent.deleteTask(int index) = _DeleteTask;
  const factory TaskEvent.filterTask(TaskStatus status) = _FilterTask;
}
