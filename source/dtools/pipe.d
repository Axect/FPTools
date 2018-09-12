module dtools.pipe;

template FP(T) {
    import dtools.fp : take, takeWhile, map, drop, dropWhile;

    alias Condition = bool delegate(T);
    alias Func = T delegate(T);
    alias TFunc = T[] delegate(T[]);

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
}