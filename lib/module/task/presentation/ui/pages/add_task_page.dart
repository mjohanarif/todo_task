import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.v16(),
              const Text('Title'),
              const AppSpacing(v: 4),
              TextField(
                controller: titleController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Title Task',
                ),
                maxLines: 1,
              ),
              AppSpacing.v16(),
              const Text('Description'),
              const AppSpacing(v: 4),
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Description Task',
                ),
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.sp),
        child: PrimaryButton(
          title: 'Add Task',
          height: 52.h,
          onTap: titleController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty
              ? () {
                  context.read<TaskBloc>().add(
                        TaskEvent.addTask(
                          TaskModel(
                            title: titleController.text,
                            description: descriptionController.text,
                            status: TaskStatus.belumSelesai,
                            createdAt: DateTime.now(),
                            id: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString() +
                                titleController.text,
                          ),
                        ),
                      );
                  Navigator.pop(context);
                }
              : null,
        ),
      ),
    );
  }
}
