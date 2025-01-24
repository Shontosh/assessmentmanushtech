import 'package:equatable/equatable.dart';

class SignInParams extends Equatable {
  final String identifier;
  final String password;

  const SignInParams({
    required this.identifier,
    required this.password,
  });

  @override
  List<Object?> get props => [identifier, password];

  Map<String, dynamic> toJson() {
    return {
      "identifier" :identifier,
      "password" : password
    };
  }
}
