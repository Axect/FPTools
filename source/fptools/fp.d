module fptools.fp;

template FP(T) {
    import fptools.native : take, takeWhile, map, drop, dropWhile, filter, zipWith;

    alias Condition = bool delegate(T);
    alias Func = T delegate(T);
    alias DFunc = T delegate(T, T);
    alias TFunc = T[] delegate(T[]);
    alias TCond = bool delegate(T[]);

    /++
        Functional Programming Pipe
    +/
    struct Pipe {
        import fptools.native : reduce, all, any;

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

        /++
            reduce
        +/
        T reduce(DFunc op) {
            return reduce(op, this.list);
        }

        /++
            all
        +/
        bool all(Condition p) {
            return all(p, this.list);
        }

        /++
            any
        +/
        bool any(Condition p) {
            return any(p, this.list);
        }
    }

    /++
        seq (Like R)
    +/
    T[] seq (T start, T end, T step = 1) {
        T diff = (end - start) / step;
        ulong l = cast(ulong)diff + 1;
        T[] result;
        result.length = l;
        foreach(i; 0 .. l) {
            result[i] = start + step * cast(T)i;
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