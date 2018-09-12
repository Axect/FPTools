import std.stdio : writeln;

// import dtools.fp;
import dtools.seq;
import dtools.pipe;

void main() {
	mixin FP!int;

	Pipe p;
	p.input(seq(1,10));
	p.proc(
		map(x => x + 1),
		take(3),
		map(x => x - 1)
	);
	p.output.writeln;
}