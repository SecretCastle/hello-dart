import 'Clock.dart';

/**
 * 定义测试时间戳
 */
final clock_time = '2019-08-15 00:20';

main() {
  final alarmClock = new AlarmClock(1);
  alarmClock.initAlarmClock(clock_time);
}
