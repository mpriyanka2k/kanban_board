import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/add_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/delete_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/get_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/update_task_status_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/update_task_usecase.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/task_events.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/tsak_states.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final GetTaskUsecase _getTaskUsecase;
  final UpdateTaskStatusUsecase _updateTaskStatusUsecase;
  final UpdateTaskUsecase _updateTaskUsecase;

  TaskBloc(this._addTaskUsecase,this._deleteTaskUsecase,this._getTaskUsecase,this._updateTaskStatusUsecase,this._updateTaskUsecase) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTaskStatus>(_onUpdateStatus);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    await emit.forEach<List<TaskModel>>(
      _getTaskUsecase.getTasks(),
      onData: (tasks) => TaskLoaded(tasks),
      onError: (error, stackTrace) => TaskError(error.toString()),
    );
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      await _addTaskUsecase.addTask(TaskModel(
          id: '',
          title: event.title,
          description: event.description,
          status: event.status));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void _onUpdateStatus(UpdateTaskStatus event, Emitter<TaskState> emit) async {
    try {
      await _updateTaskStatusUsecase.updateTaskStatus(event.id, event.status);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      await _updateTaskUsecase.updateTask(event.id, event.task);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      await _deleteTaskUsecase.deleteTask(event.id);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
