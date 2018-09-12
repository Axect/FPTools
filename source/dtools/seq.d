module dtools.seq;

T[] seq(T) (T start, T end, T step = 1) {
    T diff = (end - start) / step;
    auto l = diff + 1;
    T[] result;
    result.length = l;
    foreach(i; 0 .. l) {
        result[i] = start + step * i;
    }
    return result;
}