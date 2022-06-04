all:
	dune build @all

watch:
	dune build --watch

clean:
	dune clean

doc:
	dune build @doc

test:
	dune build @runtest --force --no-buffer



.PHONY: build clean test all doc
