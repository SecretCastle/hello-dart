import './util/tool.dart' as Tools;
import 'dart:async';

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
    print('init alarm clock ${this.type == 1 ? '闹铃' : ''}');
  }

  /**
   * @param clock_time 定时时间
   */
  void initAlarmClock(String clock_time, Function alarmClockDo) {
    // 启动内部私有方法，实现闹钟
    this._inerCharge(clock_time, alarmClockDo);
  }

  /**
   * 内部闹钟实现
   */
  _inerCharge(String clock_time, Function alarmClockDo) {
    var duration;
    final now = new DateTime.now();
    // 获取定时点和当前时间点的差值
    var compare = Tools.compareTime(clock_time, now);
    // 获取时间差值
    var mHour = compare['minusHour'];
    var mMin = compare['minusMin'];
    var mSecond = compare['minusSecond'];
    print(compare);
    if (mHour >= 0 && mMin > 0) {
      // 当天
      duration =
          new Duration(hours: mHour, minutes: mMin - 1, seconds: mSecond);
    } else if (mHour >= 0 && mMin <= 0) {
      // 当天
      duration =
          new Duration(hours: mHour, minutes: 59 + mMin, seconds: mSecond);
    } else if (mHour < 0 && mMin > 0) {
      // 第二天
      mHour = 23 + mHour;
      mMin = mMin - 1;
      duration = new Duration(hours: mHour, minutes: mMin, seconds: mSecond);
    } else if (mHour < 0 && mMin <= 0) {
      // 第二天
      mHour = 23 + mHour;
      mMin = 59 + mMin;
      duration = new Duration(hours: mHour, minutes: mMin, seconds: mSecond);
    }
    // 执行Timer
    new Timer(duration, alarmClockDo);
  }
}

/**
 * dart start with BasicClock
 */
class StopWatch extends BasicClock {
  final type = 2;
  StopWatch(type) : super(type) {
    print('init count down clock ${this.type == 2 ? '秒表' : ''}');
  }
}
