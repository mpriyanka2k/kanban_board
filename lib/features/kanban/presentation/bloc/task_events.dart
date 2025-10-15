import '../../domain/entities/task.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {

  final String title;
  final String description;
  final TaskStatus status;
  AddTask(this.title, this.description,this.status);
}

class UpdateTaskStatus extends TaskEvent {
  final String id;
  final TaskStatus status;
  UpdateTaskStatus(this.id, this.status);
}

class DeleteTask extends TaskEvent{
  final String id;
  DeleteTask(this.id);
}

class UpdateTask extends TaskEvent {
  final String id;
  final TaskModel task;
  UpdateTask(this.id, this.task);
}
