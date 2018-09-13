module fptools.fp;

template FP(T) {
    import fptools.native : take, takeWhile, map, drop, dropWhile, reduce, filter, zipWith;

    alias Condition = bool delegate(T);
    alias Func = T delegate(T);
    alias DFunc = T delegate(T, T);
    alias TFunc = T[] delegate(T[]);

    /++
        Functional Programming Pipe
    +/
    struct Pipe {
        T[] list;

        /++
            Input constructor
        +/
        this(T[] input) {
            this.list = input;
        }

        /++
            Same as constructor
        +/
        void input(T[] array) {
            this.list = array;
        }

        /++
            Output with copy
        +/
        T[] output() {
            return this.list[];
        }

        /++
            Process
        +/
        void proc(TFunc[] funcs...) {
            foreach(f; funcs) {
                this.list = f(this.list);
            }
        }
    }

    /++
        seq (Like R)
    +/
    T[] seq (T start, T end, T step = 1) {
        T diff = (end - start) / step;
        auto l = diff + 1;
        T[] result;
        result.length = l;
        foreach(i; 0 .. l) {
            result[i] = start + step * i;
        }
        return result;
    }

    /++
        take
    +/
    TFunc take(int n) {
        return (T[] xs) => take(n, xs);
    }

    /++
        takeWhile
    +/
    TFunc takeWhile(Condition p) {
        return (T[] xs) => takeWhile(p, xs);
    }

    /++
        map
    +/
    TFunc map(Func f) {
        return (T[] xs) => map(f, xs);
    }

    /++
        drop
    +/
    TFunc drop(int n) {
        return (T[] xs) => drop(n, xs);
    }

    /++
        dropWhile
    +/
    TFunc dropWhile(Condition p) {
        return (T[] xs) => dropWhile(p, xs);
    }

    /++
        reduce
    +/
    TFunc reduce(DFunc op) {
        return (T[] xs) => [reduce(op, xs)];
    }

    /++
        sum
    +/
    TFunc sum() {
        return reduce((x,y) => x + y);
    }

    /++
        prod
    +/
    TFunc prod() {
        return reduce((x,y) => x * y);
    }

    /++
        filter
    +/
    TFunc filter(Condition p) {
        return (T[] xs) => filter(p, xs);
    }

    /++
        zipWith
    +/
    TFunc zipWith(DFunc op, T[] other) {
        return (T[] xs) => zipWith(op, xs, other);
    }
}