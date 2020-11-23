# stanza-train

Entraînement d'un nouveau modèle de reconnaissance des entités nommées avec Stanza.

Voir [Model Training and Evaluation](https://stanfordnlp.github.io/stanza/training.html) de la documentation officielle.

Répertoire construit selon [celui-ci](https://github.com/stanfordnlp/stanza-train) et adapté pour l'OBVIL.

## Environnement

Stanza nécessite la version 3 de Python.

`pip install stanza`

Ensuite, il faut construire l'architecture requise

```
git clone https://github.com/OBVIL/stanza-train
cd stanza-train

# Attention ce script télécharge des vecteurs, il faut du temps et de l'espace.
# Besoin de le faire qu'une seule fois.
cd data/wordvec/word2vec
bash download_vectors.sh 

cd ../../..
git clone https://github.com/stanfordnlp/stanza.git
cp config/config.sh stanza/scripts/config.sh
cd stanza
```

Le script `config.sh` est utilisé pour indiquer les variables d'environnement nécessaires à l'entraînement.

## Entrainement

### Entités nommées

Le format de corpus attendu pour l'entrainement est `BIOS` ou `BIOES`.
Les données doivent être enregistrées dans le dossier `../data/ner_training_corpus`.
Le dossier doit être nommé de la sorte `Lang-nom-corpus`. Par exemple : `French-zolavdp`.
Les fichiers doivent être de la forme `dev.bio`, `test.bio` et `train.bio`.

```
French-zolavdp/
├── dev.bio
├── test.bio
└── train.bio
```

S'assurer que l'on soit dans le dossier de Stanza.
Puis lancer la commande suivante :

```
bash scripts/run_ner.sh French-zolavdp --max_steps 500 --word_emb_dim 5
```

Le modèle est enregistré dans le dossier `stanza/saved_models/ner`.
Pour l'utiliser :

```
>>> import stanza
>>> nlp = stanza.Pipeline(lang='fr', processors='tokenize,ner', ner_model_path='saved_models/ner/french_zolavdp_ner.pt')
```
