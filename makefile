go: lex.yy.c p.tab.c
	gcc p.tab.c lex.yy.c -lfl -ly -o go.exe

lex.yy.c: p.l
	flex  p.l

p.tab.c: p.y
	bison -dv p.y

clean:
	rm -f lex.yy.c
	rm -f p.output
	rm -f p.tab.h
	rm -f p.tab.c
	rm -f go

