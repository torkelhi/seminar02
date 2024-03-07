# Eksperiment med minneallokering (både stack og heap)

**stackoverflow.c** er generert av GPT UiO 2024-03-06 med prompt "lag et program som overfyller stack". Kan kompileres med 

```
$ gcc -o stackoverflow stackoverflow.c 

```

Kan analyseres med "strace" og "valgrind"

```
$ strace -c ./stackoverflow
$ valgrind --leak-check=yes ./stackoverflow
```