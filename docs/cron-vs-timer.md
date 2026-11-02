## Kiedy Cron jest lepszym rozwiązaniem?

Cron jest lepszym rozwiązaniem w prostych scenariuszach, gdy trzeba skonfigurować okresowe uruchamianie jednej komendy, na przykład w minimalnym systemie Linux lub Unix bez systemd. Jego zaletą jest prostota konfiguracji — wystarczy jeden wpis w pliku `crontab`.

## Wnioski

W przypadku naszego projektu praktyczniejszym rozwiązaniem jest timer systemd, ponieważ obsługuje wykonywanie pominiętych zadań (`Persistent=true`), losowe opóźnienie (`RandomizedDelaySec`), wygodne przeglądanie logów za pomocą `journalctl` oraz zarządzanie zależnościami między usługami.

Cron pozostaje dobrym rozwiązaniem dla prostych zadań cyklicznych, ale w przypadku bardziej złożonej automatyzacji systemd timer oferuje znacznie więcej możliwości.
