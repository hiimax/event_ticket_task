enum OnlineStatus {
  online,
  offline;

  String get description {
    switch (this) {
      case OnlineStatus.online:
        return 'You are online';
      case OnlineStatus.offline:
        return 'You are offline';
    }
  }

  String get id {
    switch (this) {
      case OnlineStatus.online:
        return 'online';
      case OnlineStatus.offline:
        return 'offline';
    }
  }
}
