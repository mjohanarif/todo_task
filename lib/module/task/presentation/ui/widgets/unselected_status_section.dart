import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task/shared/shared.dart';

class UnselectedStatusSection extends StatelessWidget {
  final VoidCallback? onTap;
  final String status;

  const UnselectedStatusSection({
    super.key,
    this.onTap,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 12.w,
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.pink,
              maxRadius: 5,
            ),
            AppSpacing.h8(),
            Text(
              status,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
