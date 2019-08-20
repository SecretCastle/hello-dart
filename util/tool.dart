import 'dart:async';

/**
 * 时间比较
 * @param target 目标时间
 * @param compare 比较时间
 * 
 * 返回 
 * @result minusHour 小时差值
 * @result minusMin 分钟差值
 */
compareTime(String target, DateTime compare) {
  // 获取compare小时
  var hour = compare.hour;
  // 获取compare分钟
  var min = compare.minute;
  var seconds = 59 - compare.second;
  var targetArr = target.split(':');
  // 目标时
  var targetHour = targetArr[0];
  // 目标分
  var targetMin = targetArr[1];
  // 获得小时差
  var minusHour = int.parse(targetHour) - hour;
  // 获得分钟差
  var minusMin = int.parse(targetMin) - min;
  // 秒数差值
  var minusSecond = seconds;
  // 返回时、分差值
  return {
    'minusHour': minusHour,
    'minusMin': minusMin,
    'minusSecond': minusSecond
  };
}

/**
 * 定时器定义
 * @param 执行函数
 * @param 间隔时间
 * @param 总时间
 */
timer(Function fn, num dur, num destoryTime) {
  var timerDur;
  var hour;
  var min;
  var seconds;
  // 判断duration是否
  if (destoryTime > dur) {
    // 获取时间间隔的duration对象
    var duration = new Duration(seconds: dur);
    // 定义定时器，相当于js中 setInterval
    timerDur = new Timer.periodic(duration, (timerDur) {
      destoryTime -= 1;
      hour = (destoryTime / 60 / 60 % 24).floor();
      min = (destoryTime / 60 % 60).floor();
      seconds = (destoryTime % 60).floor();
      if (destoryTime <= 1 * 60) {
        print(
            '${hour < 10 ? '0' + hour.toString() : hour}:${min < 10 ? '0' + min.toString() : min}:${seconds < 10 ? '0' + seconds.toString() : seconds}');
      }
      if (destoryTime == 0) {
        // 取消定时器
        timerDur.cancel();
        // 执行函数
        fn();
      }
    });
    timerDur = null;
  }
}
