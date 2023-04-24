class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = "",
    this.password = "",
  });

  // takes value from input field copies and paste
  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email??this.email,
      password: password??this.password
    );
  }
}
