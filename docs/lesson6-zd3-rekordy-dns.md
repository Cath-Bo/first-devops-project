# Ściągawka: typy rekordów DNS

| Typ | Przykład zapisu | Zastosowanie | Pułapka |
|---|---|---|---|
| **A** | `example.com. IN A 192.0.2.10` | Wskazuje adres IPv4 hosta. | Poprawny rekord może wskazywać nieaktualny adres IP. |
| **AAAA** | `example.com. IN AAAA 2001:db8::10` | Wskazuje adres IPv6 hosta. | Brak rekordu AAAA nie oznacza, że nazwa nie istnieje. |
| **CNAME** | `www.example.com. IN CNAME example.com.` | Tworzy alias wskazujący inną nazwę DNS. | CNAME wyklucza inne rekordy pod tą nazwą, dlatego nie należy używać go na wierzchołku strefy. |
| **MX** | `example.com. IN MX 10 mail.example.com.` | Wskazuje serwer pocztowy obsługujący domenę. | Niższa wartość priorytetu oznacza pierwszeństwo, a cel MX powinien mieć rekord A lub AAAA. |
| **TXT** | `example.com. IN TXT "v=spf1 -all"` | Przechowuje tekst używany m.in. przez SPF i weryfikację domen. | Dwie oddzielne polityki SPF dla jednej domeny mogą powodować błąd `permerror`. |
| **NS** | `example.com. IN NS ns1.example.com.` | Wskazuje serwer nazw obsługujący strefę. | Niezgodne rekordy NS mogą powodować problemy z delegacją domeny. |
| **SOA** | `example.com. IN SOA ns1.example.com. hostmaster.example.com. 2026102201 7200 3600 1209600 3600` | Zawiera podstawowe informacje o strefie, w tym numer seryjny i parametry odświeżania. | Po zmianie strefy należy odpowiednio zaktualizować numer seryjny. |
| **PTR** | `10.2.0.192.in-addr.arpa. IN PTR example.com.` | Mapuje adres IPv4 na nazwę w odwrotnym DNS. | Rekord PTR nie tworzy się automatycznie po dodaniu rekordu A; trzeba skonfigurować go w strefie odwrotnej. |
| **SRV** | `_https._tcp.example.com. IN SRV 10 5 443 server.example.com.` | Wskazuje host, port, priorytet i wagę usługi. | Sam rekord SRV nie gwarantuje, że usługa działa na wskazanym porcie. |
| **CAA** | `example.com. IN CAA 0 issue "ca.example"` | Określa, które urzędy certyfikacji mogą wydawać certyfikaty dla domeny. | Błędna polityka CAA może uniemożliwić wydanie certyfikatu. |

**Uwaga:** `192.0.2.0/24` i `2001:db8::/32` to zakresy adresów zarezerwowane do dokumentacji; przykłady nie wskazują rzeczywistych usług.
