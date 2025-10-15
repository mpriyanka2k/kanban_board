import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class GetTaskUsecase {
  final TaskRepository _repository;

  GetTaskUsecase(this._repository);

  Stream<List<TaskModel>> getTasks() {
    return _repository.getTasks();
  }

}