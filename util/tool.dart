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
  var seconds = 60 - compare.second;
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
 */
timer(Function fn, num duration, num destoryTime) {}
