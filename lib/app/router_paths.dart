import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
  static final splash = SplashPath();
  static final auth = AuthPath();
  static final home = HomePath();
  static final profile = ProfilePath();
  static final cards = CardsPath();
  static final shop = ShopPath();
  static final pay = PayPath();
}

class SplashPath extends Path<SplashPath> {
  SplashPath() : super('/');

  Path get home => Path('home', parent: this);
  Path get purchaseSuccess => Path('purchase-success', parent: this);
  Path get ticketDetails => Path('ticket-details', parent: this);
}

class AuthPath extends Path<AuthPath> {
  AuthPath() : super('/auth');

  
}

class HomePath extends Path<HomePath> {
  HomePath() : super('/home');
  
}

class ProfilePath extends Path<ProfilePath> {
  ProfilePath() : super('/profile');
 

}

class CardsPath extends Path<CardsPath> {
  CardsPath() : super('/cards');
 
}

class ShopPath extends Path<ShopPath> {
  ShopPath() : super('/shop');
 
}

class PayPath extends Path<PayPath> {
  PayPath() : super('/pay');
  
}
