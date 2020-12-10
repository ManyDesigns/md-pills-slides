# ManyDesigns Pills Slides

Progetto con template per le presentazioni di ManyDesigns Pills basato su [Reveal.js](https://revealjs.com/)

Reveal.js supporta l'utilizzo di semplici file [Markdown](https://revealjs.com/markdown/) per generare le slide. 

Qui un esempio dell'immediatezza dello strumento:
```markdown
# SLIDE1

Contenuto slide 
- punto1
- punto2



# SLIDE 2
Contenuto slide 2
<img src="example.png">
```

## Creare una nuova presentazione

Ogni presentazione ha la sua specifica cartella e il suo `index.html` indipendente dagli altri.
Può essere quindi customizzata cambiando il [tema](https://revealjs.com/themes/) desiderato
o inserendo plugin, aggiungendo stili personali etc... (se proprio si vuole ;-) )

- creare nuova cartella a partire da una precedente presentazione 
- aggiungere il link all `/index.html`  
- lanciare serve.sh (installa [live-server](https://github.com/tapio/live-server#readme) )
- enjoy!


## Note

Possiamo aggiornare la versione di reveal.js sfruttando il fatto che e' linkata tramite
submodules di git (ved https://medium.com/@martinomensio/how-to-host-reveal-js-slides-on-github-pages-and-have-a-tidy-repository-1a363944c38d)
```shell script
cd reveal.js #to go in the submodule
git checkout tags/4.9.10 #to select the version
cd .. #go back to your repository and test if everything is working (maybe there are breaking changes on its API)
git add reveal.js && git commit -m "changed reveal.js version" && git push #to deploy the new version
```

Per creare altri repository che linkano reveal.js si può copiare lo script `create_revealjs.sh` inserito qui solo come riferimento.
