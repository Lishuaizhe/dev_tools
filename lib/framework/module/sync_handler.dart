abstract class SyncHandler{
  ///同步信息
  String syncMessage();

  /// 处理数据同步
  Future<int> handle(int userId, int startTime, int endTime);
}