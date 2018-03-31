PROJECT=max31855evkit

all: $(PROJECT)
	./$(PROJECT) -vvv -n1

$(PROJECT): main.o
	gcc -g -o $(PROJECT) main.o -lm

main.o: main.c
	gcc -g -O2 -c main.c

check: max31855
	cppcheck --enable=all -q .

clean:
	rm -f main.o

distclean: clean
	rm -f $(PROJECT)
