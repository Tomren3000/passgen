passgen:
	ghc -hidir build -odir build -o bin/passgen passgen.hs

clean:
	@rm -f bin/* 
	@rm -f build/*
