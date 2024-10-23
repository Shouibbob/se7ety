import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/feature/auth/data/models/doctor_model.dart';

class AuthEvent {}

// Login
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

// Register
class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final UserType userType;
  RegisterEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.userType});
}

class UpdateDoctorRegistrationEvent extends AuthEvent {
  final DoctorModel model;

  UpdateDoctorRegistrationEvent({required this.model});
}
