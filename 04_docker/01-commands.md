### Compiliamo l'immagine

```
docker build -t manydesigns/demo:1.0 .
```



### Facciamo il push sul registro

```
docker push manydesigns/demo:1.0
```



### Creiamo il container

```
docker run manydesigns/demo:1.0
```



### Creiamo il container
#### esponendo le porte

```
docker run -p 8081:8080 manydesigns/demo:1.0
```



### Creiamo il container
#### con persistenza dei dati

```
docker volume create blobs

docker run -p 8081:8080 -v blobs:/opt/blobs manydesigns/demo:1.0
```