class CoreResponse<T1, T2> {
  T1? failure;
  T2? response;

  bool get isError => failure != null;

  CoreResponse(dynamic response) {
    if (response is T1) {
      this.failure = response;
    } else if (response is T2) {
      this.response = response;
    } else {
      throw Exception("Non match types");
    }
  }
  void fold(Function(T1 l) left, Function(T2 r) right) {
    if (isError) {
      left(failure as T1);
    } else {
      right(response as T2);
    }
  }
}
