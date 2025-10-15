import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class UpdateTaskUsecase {
  final TaskRepository _repository;

  UpdateTaskUsecase(this._repository);

  Future<void> updateTask(String id, TaskModel task) async {
    await _repository.updateTask(id, task);
  }

}