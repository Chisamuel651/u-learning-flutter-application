class AppStates {
  int counter;
  // constructor of the class
  AppStates({required this.counter});
}

class InitStates extends AppStates {
  // InitStates(): a constructor is called, AppStates(): super constructor is also called counter: value is initialized
  InitStates() : super(counter: 0);
}
