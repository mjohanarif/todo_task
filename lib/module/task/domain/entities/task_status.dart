import 'package:hive/hive.dart';

part 'task_status.g.dart';

@HiveType(typeId: 1)
enum TaskStatus {
  @HiveField(0)
  selesai('Selesai'),
  @HiveField(1)
  belumSelesai('Belum Selesai');

  final String instring;

  const TaskStatus(this.instring);
}
