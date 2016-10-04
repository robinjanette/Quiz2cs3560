#makefile for Quiz 2

all : build doczip

build : myexe

myexe : college.o collegemain.o course.o
	g++ *.o -o myexe

college.o : college.cc college.h
	g++ -c college.cc 

collegemain.o : collegemain.cc college.h node.h course.h
	g++ -c collegemain.cc

course.o : course.cc course.h
	g++ -c course.cc

doczip : doc
	tar -cvzf Quiz2.tar.gz html latex

doc : html/index.html

html/index.html : college.cc college.h collegemain.cc course.cc course.h node.h tarray.h
	doxygen *.cc *.h

clean : 
	-rm -f *.o *.class myexe
	-rm -r html
	-rm -r latex


