class LoginEvent {}

class InitLoginEvent extends LoginEvent {
  final String email, password;

  InitLoginEvent(this.email, this.password);
}
