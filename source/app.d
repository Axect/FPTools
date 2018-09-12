import std.stdio : writeln;

import dtools.fp;
import dtools.seq;

void main() {
	sum(1,2).writeln;
	seq(1,10,2).writeln;
	take(3, seq(1,10,2)).writeln;
	takeWhile!int(x => x < 3, seq(1,10)).writeln;
	f(2).writeln;
}

T sum(T) (T lhs, T rhs) {
	return lhs + rhs;
}

bool f(T) (T x) {
	return x < 3;
}