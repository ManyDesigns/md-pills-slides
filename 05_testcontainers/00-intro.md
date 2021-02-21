## About
Libreria Java per sfurrare un Docker container attraverso dei test JUnit(4/5)



## Come possiamo usarla
* Integration test per Data access layer <!-- .element: class="fragment" -->
* Integration test a livello applicativo <!-- .element: class="fragment" -->
* Test UI <!-- .element: class="fragment" -->
* E molto altro <!-- .element: class="fragment" -->
  * L'unico limite è la fantasia! <!-- .element: class="fragment" -->



## Creazione di un container generico
```java
@Container
public static GenericContainer<?> alpine =
    new GenericContainer<>(DockerImageName.parse("alpine:3.13.2");)
            .withExposedPorts(80)
            .withEnv("MAGIC_NUMBER", "42")
            .withCommand("/bin/sh", "-c",
                "while true; do echo \"$MAGIC_NUMBER\" | nc -l -p 80; done");
```
Notes: Dichiarando il nostro GenericContanier static Testcontainer farà in modo di creare un solo container per tutta la sessione di test

Altrimenti TestContanier farà in modo di creare il container prima dell'esecuzione di un test e distruggerlo quando il test è finito