# Covid19_SQL_projekt

Tento projekt má za cíl získat data o šíření Covidu19 a spojit je s informacemi o jednotlivých státech. Mezi tyto údaje patří například HDP, hustota zalidnění, podíl náboženství, počasí a mnoho dalších.
Z důvodu chybějících hodnot v databázi, máme u některých zemí neúplné informace, a to:
1. Chybí meteorologické údaje u zemí, které leží mimo Evropu.
2. Chybí ekonomické a náboženské údaje u Ruska, US a některých menších zemí. U Ruska a US jsem nejzákladnější hodnoty doplnil
z externích zdrojů.
3. Dále také chybí gini koeficient u více než poloviny zemí.

Výstupem je skript, který generuje tabulku obsahující denní nárůsty nakažených a informace o jednotlivých zemích.
