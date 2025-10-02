enum SyncStatus{

  unknown(0),
  savingLocal(1),
  started(2),
  fromRemote(3),
  completing(4),
  returning(5);

  final int code;

  const SyncStatus(this.code);

  static SyncStatus getByCode(int code){
    for(SyncStatus statusCode in SyncStatus.values) {
      if(statusCode.code == code) {
        return statusCode;
      }
    }
    return SyncStatus.unknown;
  }

}