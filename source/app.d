import std.stdio : writeln;

// import dtools.fp;
import dtools.seq;
import dtools.pipe;
import dtools.fp;

void main() {
	mixin FP!int;

	Pipe p;
	p.input(seq(1,100));
	p.proc(
		map(x => x + 1),
		takeWhile(x => x < 50),
		map(x => x - 1),
		take(40),
		drop(10),
		dropWhile(x => x < 30)
	);
	p.output.writeln;
}