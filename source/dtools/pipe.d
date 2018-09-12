module dtools.pipe;

template FP(T) {
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
        map
    +/
    TFunc map(Func f) {
        import dtools.fp : map;
        return (T[] xs) => map(f, xs);
    }

    /++
        take
    +/
    TFunc take(int n) {
        import dtools.fp : take;
        return (T[] xs) => take(n, xs);
    }
}