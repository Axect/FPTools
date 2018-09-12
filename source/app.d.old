import std.stdio : writeln;

// import dtools.fp;
import dtools.fp;
import dtools.native;

void main() {
	mixin FP!long;

	Pipe p;
	p.input(seq(1,100));
	p.proc(
		map(x => 2 * x),
		takeWhile(x => x < 100),
		map(x => x / 2),
		take(40),
		drop(10),
		dropWhile(x => x < 30),
		prod
	);
	p.output[0].writeln;
}