# Plan kopii zapasowych

## 1. Obecna konfiguracja

Projekt znajduje się na komputerze LinuxBook w katalogu `/home/kitten/devops-course/`.

Kopie zapasowe są wykonywane automatycznie:

- Codziennie: `rsync` kopiuje pliki na serwer `web-lab`.
- Raz w tygodniu: `tar` tworzy pełne archiwum z datą w nazwie.
- Wyniki zadań są zapisywane w pliku logu.

Archiwum jest przechowywane lokalnie w katalogu `/home/kitten/logs/`.

## 2. Zasada 3-2-1

Zasada 3-2-1 oznacza:

- 3 kopie danych.
- 2 różne rodzaje nośników.
- 1 kopia przechowywana poza główną lokalizacją.

## 3. Porównanie z naszą konfiguracją

- **3 kopie:** mamy oryginalne pliki, kopię na serwerze oraz archiwum TAR.
- **2 nośniki:** mamy wszystkie dane i kopie zapasowe  na jednym nośniku fizycznym
- **1 kopia poza lokalizacją:** nie mamy kopii przechowywanej poza naszą główną lokalizacją.

## 4. Brakujące elementyNie możemy uznać tej kopii za niezależną kopię na innym nośniku fizycznym. Awaria komputera może spowodować utratę obu kopii.

Aby spełnić zasadę 3-2-1, należy dodać niezależny nośnik oraz kopię przechowywaną w innej lokalizacji, na przykład w zewnętrznym magazynie danych.

## 5. Test przywracania

Archiwum zostało rozpakowane do katalogu tymczasowego. Następnie wykonano porównanie za pomocą `diff -r`.

Brak komunikatów oznacza, że nie znaleziono różnic między oryginalnymi i przywróconymi plikami.
