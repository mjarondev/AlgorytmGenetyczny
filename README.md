

# Regulator PID nastawiany algorytmem genetycznym
Program służący do wyznaczenia parametrów regulatora PID za pomocą algorytmu genetycznego.

## Spis treści
- [Informacje ogólne](#informacje-ogólne)
- [Technologie](#technologie)
- [Uruchamianie programu](#uruchamianie-programu)
- [Korzystanie z aplikacji](#korzystanie-z-aplikacji)
- [Status projektu](#status-projektu)

## Informacje ogólne
Program wyznacza parametry regulatora PID dla obiektu drugiego rzędu wykorzystując algorytm genetyczny. Umożliwia wybór dwóch metod selekcji, metody koła ruletki oraz metody rangowej.

## Technologie
Projekt został napisany przy użyciu
- MATLAB 2020b
- AppDesigner
- SIMULINK

## Uruchamianie programu
Do skompilowania aplikacji potrzebne jest oprogramowanie MATLAB z toolboxami Simulink oraz AppDesigner. Aby skompilować program wszystkie pliki powinny znajdować się w folderze dostępnym dla MATLAB. Głównym plikiem uruchamiającym aplikację jest plik z rozszerzeniem .mlapp.

## Korzystanie z aplikacji
Przed uruchomieniem algorytmu należy wpisać dane wybranego obiektu, ustawić czas symulacji w zależności od szybkości wybranego obiektu, kryterium zatrzymania, metodę selekcji oraz czułość tej metody po czym nacisnąć start. Program zatrzyma się po osiągnięciu kryterium zatrzymania czyli po minimalnym czasie trwania algorytmu lub po określonej liczbie iteracji. Można go także zatrzymać ręcznie.

## Status projektu
Zakończony.


