import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_task/module/task/presentation/ui/widgets/selected_status_section.dart';
import 'package:todo_task/module/task/presentation/ui/widgets/unselected_status_section.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

class TaskDetailPage extends StatefulWidget {
  final (int, TaskModel) task;
  const TaskDetailPage({super.key, required this.task});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  void initState() {
    super.initState();
    titleController.text = widget.task.$2.title;
    descriptionController.text = widget.task.$2.description;
    status = widget.task.$2.status;
    date = widget.task.$2.createdAt;
    if (status == TaskStatus.belumSelesai) {
      selectedIndex = 0;
    } else {
      selectedIndex = 1;
    }
  }

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late TaskStatus status;
  late DateTime date;
  late int selectedIndex;

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
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Description Task',
                ),
                maxLines: 10,
              ),
              AppSpacing.v16(),
              SizedBox(
                height: 35.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const AppSpacing(h: 4),
                  itemBuilder: (context, index) {
                    if (selectedIndex == index) {
                      return SelectedStatusSection(
                        status: Constant.listStatus[index].instring,
                        onTap: () {
                          context.read<TaskBloc>().add(
                              TaskEvent.filterTask(Constant.listStatus[index]));
                          selectedIndex = index;
                          setState(() {});
                        },
                      );
                    }
                    return UnselectedStatusSection(
                      status: Constant.listStatus[index].instring,
                      onTap: () {
                        context.read<TaskBloc>().add(
                            TaskEvent.filterTask(Constant.listStatus[index]));
                        selectedIndex = index;
                        setState(() {});
                      },
                    );
                  },
                  itemCount: Constant.listStatus.length,
                ),
              ),
              AppSpacing.v16(),
              Text(
                'Created At : ${DateFormat('h:mm a, EEEE dd-MMM-yyyy').format(date)}',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.sp),
        child: PrimaryButton(
          title: 'Edit Task',
          height: 52.h,
          onTap: () {
            context.read<TaskBloc>().add(
                  TaskEvent.editTask(
                    widget.task.$1,
                    TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      status: Constant.listStatus[selectedIndex],
                      createdAt: DateTime.now(),
                    ),
                  ),
                );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
