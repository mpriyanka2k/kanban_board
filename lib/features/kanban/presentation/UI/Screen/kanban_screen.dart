import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/task_bloc.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/task_events.dart';
import 'package:kanbanboard/features/kanban/presentation/bloc/tsak_states.dart';
import 'package:kanbanboard/features/kanban/domain/entities/task.dart';
import 'package:kanbanboard/generated/l10n.dart';

import '../../../../auth/presentation/bloc/auth_event.dart';

class KanbanBoardScreen extends StatelessWidget {
  const KanbanBoardScreen({super.key});

  void _addTaskDialog(BuildContext context, {TaskModel? task}) {
    final isEditing = task != null;
    final titleController = TextEditingController(text: task?.title);
    final descController = TextEditingController(text: task?.description);
    TaskStatus? selectedStatus = task?.status ?? null;
    const Color themeBlue = Color(0xFF1E88E5);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
              title: Text(
                isEditing ? S.of(context).updateTask : S.of(context).newTask,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: themeBlue,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: S.of(context).title,
                        hintText: S.of(context).title.toLowerCase(),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: themeBlue, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextField(
                      controller: descController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: S.of(context).description,
                        hintText: '${S.of(context).description.toLowerCase()}...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: themeBlue, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    DropdownButtonFormField<TaskStatus>(
                      decoration: InputDecoration(
                        labelText: S.of(context).status,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: themeBlue, width: 2),
                        ),
                      ),
                      value: selectedStatus,
                      items: TaskStatus.values.map((status) {
                        return DropdownMenuItem<TaskStatus>(
                          value: status,
                          child: Text(
                            _statusTitle(context, status),
                            style: TextStyle(color: _statusColor(status), fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        if (newValue != null) {
                         selectedStatus = newValue;
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(S.of(context).cancel, style: TextStyle(color: Colors.grey.shade600)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    elevation: 5,
                  ),
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      if (isEditing) {
                        TaskModel updatedTask = TaskModel(
                          id: task!.id,
                          title: titleController.text,
                          description: descController.text,
                          status: selectedStatus!,
                        );
                        context.read<TaskBloc>().add(UpdateTask(task.id, updatedTask));
                      } else {
                        context.read<TaskBloc>().add(
                          AddTask(
                            titleController.text,
                            descController.text,
                            selectedStatus ?? TaskStatus.todo,
                          ),
                        );
                      }
                    }
                    context.pop();
                  },
                  child: Text(
                    isEditing ? S.of(context).saveChanges : S.of(context).createTask,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Color _statusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.inProgress:
        return const Color(0xFF6A5AE0);
      case TaskStatus.todo:
        return const Color(0xFFFFB74D);
      case TaskStatus.completed:
        return const Color(0xFF66BB6A);
      default:
        return Colors.grey;
    }
  }

  Color _statusCardColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.inProgress:
        return const Color.fromARGB(255, 161, 151, 230);
      case TaskStatus.todo:
        return const Color.fromARGB(255, 224, 211, 191);
      case TaskStatus.completed:
        return const Color.fromARGB(255, 195, 228, 196);
      default:
        return Colors.grey;
    }
  }

  String _statusTitle(BuildContext context, TaskStatus status) {
    switch (status) {
      case TaskStatus.inProgress:
        return S.of(context).inProgress;
      case TaskStatus.todo:
        return S.of(context).toDo;
      case TaskStatus.completed:
        return S.of(context).completed;
      default:
        return S.of(context).unknown;
    }
  }

  Widget _buildTaskCard(BuildContext context, TaskModel task) {
    return Card(
      color: _statusCardColor(task.status),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                decoration: task.status == TaskStatus.completed ? TextDecoration.lineThrough : null,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: task.status == TaskStatus.completed ? Colors.grey : Colors.black,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              task.description,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                color: _statusColor(task.status),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.sp),
                child: Text(task.status.name, style: TextStyle(fontSize: 10.sp)),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                InkWell(
                  onTap: () => _addTaskDialog(context, task: task),
                  child: Icon(Icons.edit, size: 14.sp, color: Colors.green),
                ),
                SizedBox(width: 4.w),
                InkWell(
                  onTap: () => context.read<TaskBloc>().add(DeleteTask(task.id)),
                  child: Icon(Icons.delete, size: 14.sp, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(BuildContext context, TaskStatus status, List<TaskModel> tasks) {
    final statusTasks = tasks.where((t) => t.status == status).toList();
    final color = _statusColor(status);
    final title = _statusTitle(context, status);

    return Expanded(
      child: DragTarget<TaskModel>(
        onAccept: (t) {
          if (t.status != status) {
            context.read<TaskBloc>().add(UpdateTaskStatus(t.id, status));
          }
        },
        builder: (context, candidateData, rejectedData) {
          final isDropping = candidateData.isNotEmpty;

          return Container(
            margin: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: isDropping ? color.withOpacity(0.1) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(10.r),
              border: isDropping ? Border.all(color: color, width: 2.w) : null,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 15.w,
                            height: 18.w,
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                statusTasks.length.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp, color: color),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(title, style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(5.w),
                    itemCount: statusTasks.length,
                    itemBuilder: (_, index) {
                      final task = statusTasks[index];
                      return LongPressDraggable<TaskModel>(
                        data: task,
                        feedback: Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                          elevation: 4,
                          child: Container(
                            width: 100.w,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              children: [
                                Text(task.title, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                SizedBox(height: 10.sp),
                                Text(task.description, style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                              ],
                            ),
                          ),
                        ),
                        child: _buildTaskCard(context, task),
                        childWhenDragging: Opacity(opacity: 0.5, child: _buildTaskCard(context, task)),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Load tasks
    context.read<TaskBloc>().add(LoadTasks());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 235, 248),
      floatingActionButton: InkWell(
        onTap: () => _addTaskDialog(context),
        child: CircleAvatar(
          radius: 25.sp,
          backgroundColor: const Color(0xFF1E88E5),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 221, 235, 248),
        elevation: 1,
        title: Text(S.of(context).appTitle, style: const TextStyle(color: Colors.black)),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                    title: Text(
                      S.of(context).logoutConfirmationMsg,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: const Color(0xFF1E88E5)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text(S.of(context).no, style: const TextStyle(color: Colors.red)),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LogoutRequested());
                          context.pop();
                          context.go('/login');
                        },
                        child: Text(S.of(context).yes, style: const TextStyle(color: Colors.green)),
                      )
                    ],
                  );
                },
              );
            },
            child: Icon(Icons.logout, size: 20.sp, color: Colors.red),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            final tasks = state.tasks;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: TaskStatus.values.map((status) => _buildColumn(context, status, tasks)).toList(),
            );
          } else if (state is TaskError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text(S.of(context).dataNotAvailable));
        },
      ),
    );
  }
}
