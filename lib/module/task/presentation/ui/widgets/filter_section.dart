import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task/module/task/presentation/ui/widgets/selected_status_section.dart';
import 'package:todo_task/module/task/presentation/ui/widgets/unselected_status_section.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (results) {
            if (results?.isEmpty ?? false) {
              selectedIndex = null;
              setState(() {});
            }
          },
        );
      },
      child: SizedBox(
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
                  context
                      .read<TaskBloc>()
                      .add(TaskEvent.filterTask(Constant.listStatus[index]));
                  selectedIndex = index;
                  setState(() {});
                },
              );
            }
            return UnselectedStatusSection(
              status: Constant.listStatus[index].instring,
              onTap: () {
                context
                    .read<TaskBloc>()
                    .add(TaskEvent.filterTask(Constant.listStatus[index]));
                selectedIndex = index;
                setState(() {});
              },
            );
          },
          itemCount: Constant.listStatus.length,
        ),
      ),
    );
  }
}
