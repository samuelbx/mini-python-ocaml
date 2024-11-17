Compilateur mini-Python
par Samuel Boïté et Smaïl El Hafdi

Étapes :

1. Type checking  [typing.ml]
  [+] quelques erreurs de typage simples sont levées, e.g. concernant les constantes

2. Simplification de l'AST  [simplify.ml]
  [+] les calculs sont distribués quand ça permet de réduire le nombre d'opérations
  [+] les opérateurs unaires et binaires se simplifient dès que possible
  [+] les opérations entre constantes sont évaluées
  [+] les blocs sont regroupés et/ou ignorés lorsqu'ils ne sont jamais atteints (ex: if false)
  [+] l'AST est printable
  Un script sur lequel tester les simplifications possibles est fourni : test_simplify.py

3. RTL [rtl.ml]

Structure de mémoire choisie : celle de l'énoncé
Les wrappers __print__ et __len__ sont définis à ce moment-là :
ils se chargent d'adapter leur comportement en fonction du type de la variable au runtime.

Fonctionnalités manquantes :
  [-] opérations sur les booléens (dommage !)
  [-] erreur pour indices négatifs dans les listes
  [-] table de vérité complète pour les non-booléens
  [-] wrapper my_malloc (mais on n'a pas eu de souci)

Pour ce qui suit :

Faute de temps, nous nous sommes (très fortement) basés sur le code github.com/AmaurX/INF564 de
mini-c pour la structure globale des fichiers et les algorithmes mis en œuvre (analyse du temps
de vie et coloration du graphe).

4. ERTL [ertl.ml]

5. LTL [ltl.ml]
  - Ligne 112 : fix pour retourner 0 en exit value si on est la fonction main 

6. Linéarisation [lin.ml]
