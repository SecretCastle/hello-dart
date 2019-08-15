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
    // 取绝对值
    var mHour = compare['minusHour'].abs();
    var mMin = compare['minusMin'].abs();
    var mSecond = compare['minusSecond'].abs();
    if (mMin > 1 && mHour > 0) {
      // 如果分钟和小时都大于0, 则duration为小时和分钟的和的毫秒数
      duration = new Duration(hours: mHour, minutes: mMin, seconds: mSecond);
    } else if (mMin == 0 && mHour > 0) {
      // 如果小时大于0，分钟等于0, 则duration为小时的毫秒数
      duration = new Duration(hours: mHour);
    } else if (mMin > 1 && mHour == 0) {
      // 如果小时等于0，分钟大于0，则duration为分钟毫秒数
      duration = new Duration(minutes: mMin);
    } else if (mMin == 1 && mHour == 0) {
      // 如果分钟等于1，则以秒数来倒计时
      duration = new Duration(seconds: mSecond);
    }
    print(duration);
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
