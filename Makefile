# Nazwa projektu
NAME = Butane-Kernel

# Wersja kernela
VERSION = 23
PATCHLEVEL = 5
SUBLEVEL = 0
EXTRAVERSION = 8

# Kompilator
CC = gcc

# Opcje kompilacji
CFLAGS = -Wall -O2

# Katalog źródłowy
SRCDIR = src

# Katalog wyjściowy
OUTDIR = build

# Lista źródeł
SOURCES = $(wildcard $(SRCDIR)/*.c)

# Lista plików obiektowych
OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OUTDIR)/%.o, $(SOURCES))

# Nazwa pliku wykonywalnego
KERNEL = $(OUTDIR)/$(NAME)-$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)

# Reguła domyślna
all: $(KERNEL)

# Reguła kompilacji
$(KERNEL): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

# Reguła kompilacji źródeł do plików obiektowych
$(OUTDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Czyszczenie plików tymczasowych
clean:
	rm -f $(OBJECTS) $(KERNEL)

# Reguła instalacji (przykładowa)
install:
	cp $(KERNEL) /boot

.PHONY: all clean install
