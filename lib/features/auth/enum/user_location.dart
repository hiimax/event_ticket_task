enum UserLocation {
  Lagos,
  Abuja;

  String get description {
    switch (this) {
      case UserLocation.Lagos:
        return 'You are in Lagos';
      case UserLocation.Abuja:
        return 'You are in Abuja';
    }
  }

  String get id {
    switch (this) {
      case UserLocation.Lagos:
        return 'Lagos';
      case UserLocation.Abuja:
        return 'Abuja';
    }
  }
}
