#!/usr/bin/bash

# Adaptation https://github.com/stanfordnlp/stanza/blob/master/scripts/download_vectors.sh

# Télécharge les word2vec de fasttext et les compresse au bon format
# Nécessaire à l'entraînement de Stanza

# !! Prend du temps, principalement la compression
# Si les modèles existent, ne pas le relancer
# Idéalement, lancer depuis tmux

# Ne lancer ce script qu'une seule fois pour récupérer les word2vec

FASTTEXT_BASE_URL="https://dl.fbaipublicfiles.com/fasttext/vectors-wiki"

declare -a FASTTEXT_LANG=("Arabic" "French" "English")
declare -a FASTTEXT_CODE=("ar" "fr" "en")
declare -a LOCAL_CODE=("ar" "fr" "en")

function prepare_fasttext_vec() {
    lang=$1
    ftcode=$2
    code=$3

    cwd=$(pwd)
    mkdir -p $lang
    cd $lang
    echo "=== Downloading fasttext vector file for ${lang}..."
    url="${FASTTEXT_BASE_URL}/wiki.${ftcode}.vec"
    fname="${code}.vectors"
    #echo "$url -O $fname"
    wget $url -O $fname

    echo "=== Compressing file ${fname}..."
    xz --verbose $fname
    #echo "xz --verbose $fname"
    cd $cwd
}

for (( i=0; i<${#FASTTEXT_LANG[*]}; ++i)); do
    prepare_fasttext_vec ${FASTTEXT_LANG[$i]} ${FASTTEXT_CODE[$i]} ${LOCAL_CODE[$i]}
done
