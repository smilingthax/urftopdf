FLAGS+=$(shell cups-config --cflags --libs)
FLAGS+=$(shell pkg-config --cflags --libs libqpdf)
CXXFLAGS+=-Wall -g
#CXXFLAGS+=-std=c++0x

all: urftopdf

urftopdf:urftopdf.cpp unirast.h
	$(CXX) urftopdf.cpp -o urftopdf -lm $(CXXFLAGS) $(FLAGS)

install:urftopdf
	DESTDIR=$(DESTDIR) ./install_pdf.sh

clean:
	-rm urftopdf
