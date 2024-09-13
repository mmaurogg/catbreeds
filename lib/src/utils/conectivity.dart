mixin Conectivity {
  Future<bool>? isConnected();
}

class ConectivityAdapter implements Conectivity {
  @override
  Future<bool> isConnected() async {
    //TODO:
    return Future.delayed(const Duration(seconds: 2), () => true);
  }
}
