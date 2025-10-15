import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

class AddTaskUsecase {
  final TaskRepository _repository;

  AddTaskUsecase(this._repository);
 
  Future<void> addTask(TaskModel task) async {
    await _repository.addTask(task);
  }

}