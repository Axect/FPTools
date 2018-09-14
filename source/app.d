import std.stdio : writeln;

// import dtools.fp;
import fptools.fp;
import fptools.native;

void main() {
	mixin FP!double;

	Pipe p;
	p.input(seq(1,100));
	p.proc(
		map(x => 2 * x),
		takeWhile(x => x < 100),
		map(x => x / 2),
		take(40),
		drop(10),
		dropWhile(x => x <= 30),
		zipWith((x,y) => x + y, seq(1,10))
	);
	p.output.writeln;
	p.reduce((x, y) => x + y).writeln;

	Pipe q;
	q.input([2, 4, 6, 7]);
	q.proc(
		map(x => x - 2)
	);
	q.output.writeln;
	q.all(x => x % 2 == 0).writeln;
}