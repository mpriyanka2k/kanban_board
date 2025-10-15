import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  final TaskRepository _repository;

  DeleteTaskUsecase(this._repository);

  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
  }
}