import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class UpdateTaskStatusUsecase {
  final TaskRepository _repository;

  UpdateTaskStatusUsecase(this._repository);

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    await _repository.updateTaskStatus(id, status);
  }

}