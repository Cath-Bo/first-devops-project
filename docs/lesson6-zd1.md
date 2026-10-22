# Raport diagnostyczny domeny example.com

## 1. Rozwiązywanie nazwy DNS

**Polecenie:**
```bash
dig example.com
```

**Wynik:** Odpowiedź `NOERROR`. Domena została rozwiązana na dwa adresy IPv4: `104.20.23.154` oraz `172.66.147.243`. Czas zapytania wyniósł 3 ms.

**Wniosek:** Rozwiązywanie nazwy DNS działa poprawnie.

## 2. Ślad od korzenia DNS

**Polecenie:**
```bash
dig +trace example.com
```

**Wynik:** Zapytanie dotarło do autorytatywnego serwera DNS `hera.ns.cloudflare.com`, który zwrócił dwa rekordy A. Podczas prób połączenia przez IPv6 pojawił się komunikat `network unreachable`, ale śledzenie zakończyło się poprawnie przez IPv4.

**Wniosek:** Ścieżka rozwiązywania DNS działa przez IPv4; dostęp do sieci IPv6 jest niedostępny w badanym środowisku.

## 3. Rekordy MX

**Polecenie:**
```bash
dig MX example.com
```

**Wynik:** Odpowiedź `NOERROR`; zwrócony rekord MX to `0 .`.

**Wniosek:** Domena deklaruje, że nie przyjmuje poczty elektronicznej (Null MX).

## 4. Dostępność portu

**Polecenie:**
```bash
nc -z example.com 443
```

**Wynik:** Wcześniejsze sprawdzenie za pomocą `nc -vz -w 5 example.com 443` wykazało, że port `443/tcp` jest otwarty (`open`). Pojawiły się ostrzeżenia dotyczące odwrotnego wyszukiwania DNS, ale połączenie zostało ustanowione.

**Wniosek:** Połączenie TCP z portem HTTPS 443 jest dostępne.

## 5. Odpowiedź HTTP

**Polecenie:**
```bash
curl -I https://example.com
```

**Wynik:** Serwer zwrócił `HTTP/2 200`. W odpowiedzi wskazano `content-type: text/html; charset=utf-8`, `server: cloudflare` oraz `cf-cache-status: HIT`.

**Wniosek:** Serwer poprawnie odpowiedział na żądanie HTTPS typu HEAD.

## Wniosek końcowy

Dla domeny `example.com` nie stwierdzono oznak problemu z rozwiązywaniem DNS, dostępnością portu 443 ani odpowiedzią serwera HTTPS; jednak rekord MX `0 .` wskazuje, że domena nie przyjmuje poczty elektronicznej, dlatego wyniki nie potwierdzają scenariusza, w którym poczta działa, a strona internetowa nie. Do zdiagnozowania rzeczywistego zgłoszenia należy przeprowadzić te same testy dla właściwej domeny użytkownika.
