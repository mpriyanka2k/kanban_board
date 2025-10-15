import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class TaskUsecase {
  final TaskRepository _repository;

  TaskUsecase(this._repository);

  /// 🔹 Get all tasks (Stream)
  Stream<List<TaskModel>> getTasks() {
    return _repository.getTasks();
  }

  /// 🔹 Add a new task
  Future<void> addTask(TaskModel task) async {
    await _repository.addTask(task);
  }

  /// 🔹 Update only the task status (for drag & drop)
  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    await _repository.updateTaskStatus(id, status);
  }

  /// 🔹 Update full task (from edit screen)
  Future<void> updateTask(String id, TaskModel task) async {
    await _repository.updateTask(id, task);
  }

  /// 🔹 Delete task
  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
  }
}
