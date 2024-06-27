byDesc<T>(DateTime Function(T) fun) {
  return (T a, T b) {
    return -fun(a).compareTo(fun(b));
  };
}
