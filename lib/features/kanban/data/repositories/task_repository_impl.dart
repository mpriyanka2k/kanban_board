import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';

import '../../../../services/firebase_service.dart';

class TaskRepositoryImpl implements TaskRepository{
    final FirebaseService _firebaseService;
      TaskRepositoryImpl(this._firebaseService);
  
  @override
  Future<void> addTask(TaskModel task) async {
     await _firebaseService.taskCollection().add(task.toMap());
  }

  @override
  Stream<List<TaskModel>> getTasks() {
    return _firebaseService.taskCollection().snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => TaskModel.fromDoc(doc)).toList(),
    );
  }

  @override
  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    await _firebaseService.taskCollection().doc(id).update({'status': status.name});
  }
  
  @override
  Future<void> deleteTask(String id) async{
    await _firebaseService.taskCollection().doc(id).delete();
  }
  
  @override
  Future<void> updateTask(String id, TaskModel task) async {
   await _firebaseService.taskCollection().doc(task.id).update({'title':task.title,'description':task.description,'status': task.status.name});
  }
}