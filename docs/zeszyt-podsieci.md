# adres		192.168.50.77/26

W ostatnim oktecie 192: 256-192=64 adresa w bloku.
Granice podsieci to: 0, 64, 128, 192.
Adres 77 należy do zakresu 64–127.
** siec ** 	192.168.50.64
** maska ** 	255.255.255.192
** broadcast ** 192.168.50.127
** hosts **	192.168.50.65--192.168.50.126
** ilosc **	64 - 2 = 62

# adres 10.10.10.200/25

W ostatnim oktecie: 256-128=128
Granice podsieci to: 0, 128.
Adres 200 należy do zakresu 128–255.
** siec ** 	10.10.10.128
** maska ** 	255.255.255.128
** broadcast ** 10.10.10.255
** hosts **	10.10.10.129--10.10.10.254
** ilosc **	128 - 2 = 126
 
# adres 172.16.5.130/23

W ostatnim oktecie (trzeci): 256-254=2
Zmiana zachodzi w trzecim oktecie: 256-254=2
Podsieci zaczynają się w trzecim oktecie od liczb parzystych: 0, 2, 4, 6 itd.
Adres 172.16.5.130 należy do podsieci obejmującej trzeci oktet 4–5.
** siec ** 	172.16.4.0
** maska ** 	255.255.254.0
** broadcast ** 172.16.5.255
** hosts **	172.16.4.1--172.16.5.254
** ilosc **	512 - 2 = 510


# adres 192.0.2.9/30

W ostatnim oktecie: 256-252=4
Granice podsieci to: 0, 4, 8, 12, 16 ...
** siec ** 	192.0.2.8
** maska ** 	255.255.255.252
** broadcast ** 192.0.2.11
** hosts **	192.0.2.9--192.0.2.10
** ilosc **	4 - 2 = 2
______________________________

# Dzielimy sieć 192.168.200.0/24 na 8 równych podsieci.
** 8 sieci 8 = 2 ^ 3 **

** nowa maska /24 + 3 = /27 **

- Maska dla nowych sieci: 255.255.255.224
- Wielkość kazdej sieci: 256 − 224 = 32 adresa
- Każda podsieć ma 32 - 2 = 30 adresów hostów.
Zwiększamy ostatni oktet co 32: 0, 32, 64, 96, 128, 160, 192, 224.
2. Tabela podsieci
Nr	Adres sieci		Zakres hostów			Broadcast
1	192.168.200.0/27	192.168.200.1–192.168.200.30	192.168.200.31
2	192.168.200.32/27	192.168.200.33–192.168.200.62	192.168.200.63
3	192.168.200.64/27	192.168.200.65–192.168.200.94	192.168.200.95
4	192.168.200.96/27	192.168.200.97–192.168.200.126	192.168.200.127
5	192.168.200.128/27	192.168.200.129–192.168.200.158	192.168.200.159
6	192.168.200.160/27	192.168.200.161–192.168.200.190	192.168.200.191
7	192.168.200.192/27	192.168.200.193–192.168.200.222	192.168.200.223
8	192.168.200.224/27	192.168.200.225–192.168.200.254	192.168.200.255

_______________________________

# Dzielimy 10.50.0.0/16 na 4 równe podsieci.
** 4 sieci 4 = 2 ^ 2 **
** nowa maska /16 + 2 = /18**

- Maska: 255.255.192.0.
- Rozmiar bloku: 256 − 192 = 64 w trzecim oktecie.
- Każda podsieć ma 2^{32-18}=2^{14}=16384 adresy, w tym 16382 adresy hostów.
2. Tabela podsieci
Nr	Adres sieci	Zakres hostów			Broadcast
1	10.50.0.0/18	10.50.0.1–10.50.63.254		10.50.63.255
2	10.50.64.0/18	10.50.64.1–10.50.127.254	10.50.127.255
3	10.50.128.0/18	10.50.128.1–10.50.191.254	10.50.191.255
4	10.50.192.0/18	10.50.192.1–10.50.255.254	10.50.255.255
