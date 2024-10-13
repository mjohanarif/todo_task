import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.taskDetailPage,
          arguments: task,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppColors.primaryShadow,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              padding: EdgeInsets.all(8.sp),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<TaskBloc>().add(
                            TaskEvent.deleteTask(task.id),
                          );
                    },
                    child: const Icon(
                      Icons.delete_forever_outlined,
                      color: AppColors.pink2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                8.w,
                8.h,
                8.w,
                0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: const Divider(color: AppColors.grey),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 8.w).copyWith(bottom: 8.h),
              child: Row(
                children: [
                  const Text('Created At : '),
                  Expanded(
                    child: Text(
                      DateFormat('h:mm a, EEEE dd-MMM-yyyy').format(
                        task.createdAt,
                      ),
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
