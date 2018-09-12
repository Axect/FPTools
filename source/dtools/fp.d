module dtools.fp;

/++
    take - Usage : take(3, [1,2,3,4,5]) == [1,2,3]
+/
T[] take(T) (int n, T[] list) {
    return list[0 .. n];
}

/++
    takeWhile - Usage : takeWhile!int(x => x < 3, seq(1,10)) == [1,2]
+/
T[] takeWhile(T) (bool delegate(T) p, T[] list) {
    auto n = 0;
    T[] result;
    while(p(list[n])) {
        result ~= list[n];
        n++;
    }
    return result;
}

