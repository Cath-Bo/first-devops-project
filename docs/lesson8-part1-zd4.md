#1. sudo find / -xdev -type f -user root -perm -4000 -print 2>/dev/null
**Pliki z bitem SUID należące do root — liczba trafień: 22.** 
Większość znalezionych plików to standardowe narzędzia systemowe lub komponenty zainstalowanych usług; ich obecność nie oznacza automatycznie podatności.
Pliki wymagają weryfikacji właściciela, uprawnień i pochodzenia z pakietów systemowych, szczególnie jeśli odpowiadają nieużywanym usługom.
#2. sudo find / -xdev \( -path /tmp -o -path /var/tmp \) -prune -o -type d -perm -0002 -print 2>/dev/null
#    stat -c '%A (%a) %U:%G %n' /home/kitten/.local/share/blesh/cache.d/ /home/kitten/.local/share/blesh/run
**Katalogi zapisywalne dla wszystkich — liczba trafień: 2.**
Oba katalogi mają uprawnienia 1777 i ustawiony bit sticky; ponieważ znajdują się w katalogu użytkownika i dotyczą blesh, należy sprawdzić, czy takie uprawnienia są wymagane przez aplikację.
#3. sudo find /var -xdev -type f -size +50M -print 2>/dev/null
**Pliki większe niż 50 MB w /var — liczba trafień: 2**
- `/var/lib/apt/lists/deb.debian.org_debian_dists_trixie_main_source_Sources` 
— Wynik normalny: plik zawiera indeks metadanych pakietów źródłowych Debiana.
- `/var/lib/apt/lists/deb.debian.org_debian_dists_trixie_main_binary-amd64_Packages` 
— Wynik normalny: plik zawiera indeks pakietów binarnych Debiana dla architektury amd64.
#4. find "$HOME" -xdev -type f -mtime +365 -print 2>/dev/null
**Pliki niezmieniane od ponad 365 dni — liczba trafień: 1**
- `/home/kitten/Downloads/vagrant_2.4.9-1_amd64.deb `
— Wynik prawdopodobnie normalny: jest to pakiet instalacyjny Vagranta pozostawiony w katalogu Pobrane, ale warto sprawdzić, czy nadal jest potrzebny.
# 4. Pliki niezmieniane od ponad 365 dni
**Liczba trafień: 1**
- `/home/kitten/Downloads/vagrant_2.4.9-1_amd64.deb` 
— Wynik prawdopodobnie normalny: jest to pakiet instalacyjny Vagranta pozostawiony w katalogu Pobrane, ale warto sprawdzić, czy nadal jest potrzebny.
