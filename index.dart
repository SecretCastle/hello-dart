import 'Clock.dart';

/**
 * 定义测试时间戳
 */
final clock_time = '16:28';

alarmClockDo() {
  print('do do do ~~~ do do do ~~~');
}

main() {
  final alarmClock = new AlarmClock(1);
  alarmClock.initAlarmClock(clock_time, alarmClockDo);
}
