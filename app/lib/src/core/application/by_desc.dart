byDesc<T, Y>(Comparable Function(T) fun) {
  return (T a, T b) {
    return -fun(a).compareTo(fun(b));
  };
}
