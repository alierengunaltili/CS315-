parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: cs315f21_group35.yacc.y lex.yy.c
	yacc cs315f21_group35.yacc.y
lex.yy.c: cs315f21_group35.lex.l
	lex cs315f21_group35.lex.l
clean:
	rm -f lex.yy.c y.tab.c parser
