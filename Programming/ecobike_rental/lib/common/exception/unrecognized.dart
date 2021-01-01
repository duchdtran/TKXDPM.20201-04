class UnrecognizedException implements Exception {
  UnrecognizedException();

  @override
  String toString(){
    return 'Error: Something went wrong!';
  }
}