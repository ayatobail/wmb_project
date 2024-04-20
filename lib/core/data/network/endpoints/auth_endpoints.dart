import '../network_config.dart';

class AuthEndpoints {
  static String login = NetworkConfig.getFullApiRoute('customers/signin');
  static String signUp = NetworkConfig.getFullApiRoute('customers/signup');
}