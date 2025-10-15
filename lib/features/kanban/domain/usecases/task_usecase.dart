import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class TaskUsecase {
  final TaskRepository _repository;

  TaskUsecase(this._repository);
  Stream<List<TaskModel>> getTasks() {
    return _repository.getTasks();
  }

  Future<void> addTask(TaskModel task) async {
    await _repository.addTask(task);
  }

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    await _repository.updateTaskStatus(id, status);
  }

  Future<void> updateTask(String id, TaskModel task) async {
    await _repository.updateTask(id, task);
  }

  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
  }
}
