class SignupEvent {}

class InitSignupEvent extends SignupEvent {
  final String firstName, lastName, email, password;

  InitSignupEvent(this.firstName, this.lastName, this.email, this.password);
}
