all: compile

compile:
	ghc -hidir ./build -odir ./build -o ./bin/passgen passgen.hs

clean:
	@rm -rf bin/*
	@rm -rf build/*

