# FPTools

Functional Programming & Efficient Tools for D.

## Why FPTools?

In Rust, we can use functional programming anywhere because same speed is guaranteed by zero cost abstraction.
But in D, we can find functional programming is much slower than OOP or procedural programming.
In FPTools, it is also guaranteed like Rust by hand written functions.

## Usage

### Add Dependency

* Add `dependencies` in `dub.json`
  
```json
// In dub.json
{
    "dependencies": {
	    "fptools": "~>0.0.2"
    },
}
```

### Example

```d
import dtools.fp;

void main() {
	mixin FP!long;                // You can choose any type to use FP (double, string, int, long and etc.)

	Pipe p;                       // Declare pipeline
	p.input(seq(1,100));          // Input sequence
	p.proc(                       // Write Procedures
		map(x => 2 * x),          // map (Haskell like)
		takeWhile(x => x < 100),  // takeWhile (Haskell like)
		map(x => x / 2),          // map (Haskell like)
		take(40),                 // take (Haskell like)
		drop(10),                 // drop (Haskell like)
		dropWhile(x => x < 30),   // dropWhile (Haskell like)
		reduce((x,y) => x * y)    // reduce (Haskell like)
	);
	p.output[0].writeln;          // output function exports result as sequence
}
```