FLAGS+=$(shell pkg-config --cflags --libs libqpdf)
CXXFLAGS+=-Wall

all: urftopdf

urftopdf:urftopdf.cpp unirast.h
	$(CXX) urftopdf.cpp -o urftopdf $(CXXFLAGS) $(FLAGS)

install:urftopdf
	DESTDIR=$(DESTDIR) ./install_pdf.sh

clean:
	-rm urftopdf
