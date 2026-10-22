# Zadanie 2: NXDOMAIN pod mikroskopem

## Wyniki

| Przypadek                                                                  | Status   | ANSWER      | AUTHORITY      | TTL                   |
|----------------------------------------------------------------------------|----------|-------------|----------------|-----------------------|
| Istniejąca nazwa z rekordem A (`example.com A`)                            | NOERROR  | 2 rekordy A | Pusta          | TTL rekordów A: 173 s |
| Istniejąca nazwa bez rekordu AAAA (`ipv4only.arpa AAAA`)                   | NOERROR  | Pusta       | SOA: TTL 471 s,|                       |
|									     |		|	      | MINIMUM 3600 s | 471 s                 |
| Nieistniejąca nazwa w istniejącej domenie (`nonexistent-84729.iana.org A`) | NXDOMAIN | Pusta       | SOA: TTL 3600 s|                       |
|									     |		|	      |	MINIMUM 3600 s | 3600 s                |

## Wnioski

Status NOERROR oznacza, że zapytanie zostało obsłużone poprawnie. Jeśli nazwa istnieje, ale nie ma rekordu żądanego typu, odpowiedź może mieć pustą sekcję ANSWER i status NOERROR. Jest to odpowiedź NODATA.

Status NXDOMAIN oznacza, że zapytana nazwa nie istnieje. W obu odpowiedziach negatywnych sekcja AUTHORITY zawiera rekord SOA strefy.

Zgodnie z zasadą ujemnego buforowania DNS, negatywny TTL jest wyznaczany jako minimum z TTL rekordu SOA i pola MINIMUM w tym rekordzie. W badanych odpowiedziach wynosi 471 sekund dla ipv4only.arpa oraz 3600 sekund dla nonexistent-84729.iana.org.

W pierwszym przypadku odpowiedź jest pozytywna, więc negatywny TTL nie ma zastosowania.
