enum OnlineStatus {
  online,
  offline;

  String get description {
    switch (this) {
      case OnlineStatus.online:
        return 'You are online';
      case OnlineStatus.offline:
        return 'Offline Mode: showing cached tickets.';
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
