import 'package:kanbanboard/features/kanban/domain/entities/task.dart';

abstract class TaskRepository {
  Stream<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> updateTaskStatus(String id, TaskStatus status);
  Future<void> deleteTask(String id);
  Future<void> updateTask(String id,TaskModel task);
}