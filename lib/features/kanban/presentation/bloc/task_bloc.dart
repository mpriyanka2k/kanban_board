import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/task_events.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/tsak_states.dart';

import '../../domain/usecases/task_usecase.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
     final TaskUsecase _taskUsecase;

  TaskBloc(this._taskUsecase) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTaskStatus>(_onUpdateStatus);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
     await emit.forEach<List<TaskModel>>(
    _taskUsecase.getTasks(),
    onData: (tasks) => TaskLoaded(tasks),
    onError: (error, stackTrace) => TaskError(error.toString()),
  );
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      await _taskUsecase.addTask(TaskModel(
        id: '',
        title: event.title,
        description: event.description,
        status: event.status
      ));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void _onUpdateStatus(UpdateTaskStatus event, Emitter<TaskState> emit) async {
    try {
      await _taskUsecase.updateTaskStatus(event.id, event.status);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
     try {
      await _taskUsecase.updateTask(event.id, event.task);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event,Emitter<TaskState> emit) async {
    try {
      await _taskUsecase.deleteTask(event.id);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }


}
