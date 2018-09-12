module dtools.fp;

T[] take(T) (int n, T[] list) {
    return list[0 .. n];
}