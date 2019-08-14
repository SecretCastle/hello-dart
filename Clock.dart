class BasicClock {
  num type;
  /**
   * 定义基础定时器的类型
   * type: 
   *   闹钟: 1
   *   秒表: 2
   */
  BasicClock(num type) {
    // 绑定类型
    this.type = type;
  }
}

/**
 * dart start with AlarmClock
 */

class AlarmClock extends BasicClock {
  final type = 1;
  AlarmClock(type) : super(type) {
    print('init alarm clock $this.type');
  }

  /**
   * @param clock_time 定时时间
   */
  void initAlarmClock(String clock_time) {
    final now = new DateTime.now();
    final date = DateTime.parse(clock_time);
    // 如果当前时间在设定日期之前
    if (now.isBefore(date)) {
      print('Before');
    } else {
      print('After');
    }
  }

  /**
   * 定时器设定
   */
  void startTimeClock() {}
}

/**
 * dart start with BasicClock
 */
class StopWatch extends BasicClock {
  final type = 2;
  StopWatch(type) : super(type) {
    print(type);
  }
}
