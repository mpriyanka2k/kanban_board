import 'package:cloud_firestore/cloud_firestore.dart';

enum TaskStatus { todo, inProgress, completed }

class TaskModel {
  final String id;
  final String title;
  final String description;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'status': status.name,
    };
  }

  factory TaskModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TaskModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      status: TaskStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => TaskStatus.todo,
      ),
    );
  }
}
