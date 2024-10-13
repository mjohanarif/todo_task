import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task/module/task/presentation/ui/widgets/filter_section.dart';
import 'package:todo_task/module/task/presentation/ui/widgets/task_card.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const CircularProgressIndicator();
              },
              loaded: (results) {
                if (results == null || results.isEmpty) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FilterSection(),
                      AppSpacing(
                        v: 200,
                      ),
                      Center(child: Text('No task to be shown')),
                    ],
                  );
                }
                return Column(
                  children: [
                    const FilterSection(),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 72.h,
                        ),
                        itemBuilder: (context, index) {
                          return TaskCard(task: results[index]);
                        },
                        separatorBuilder: (context, index) {
                          return AppSpacing.v16();
                        },
                        itemCount: results.length,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.sp),
        child: PrimaryButton(
          height: 52,
          title: 'Add Task',
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.addTaskPage,
            );
          },
        ),
      ),
    );
  }
}
