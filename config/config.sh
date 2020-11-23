#!/bin/bash
#
# Set environment variables for the training and testing of stanza modules.

# Set NERBASE to the location of NER data folder
# The data should be BIO format
# For details, see https://www.aclweb.org/anthology/W03-0419.pdf (CoNLL-03 NER paper)
export NERBASE=../data/ner_training_corpus

# Set directories to store processed training/evaluation files
export DATA_ROOT=../data/processed
export TOKENIZE_DATA_DIR=$DATA_ROOT/tokenize
export MWT_DATA_DIR=$DATA_ROOT/mwt
export LEMMA_DATA_DIR=$DATA_ROOT/lemma
export POS_DATA_DIR=$DATA_ROOT/pos
export DEPPARSE_DATA_DIR=$DATA_ROOT/depparse
export ETE_DATA_DIR=$DATA_ROOT/ete
export NER_DATA_DIR=$DATA_ROOT/ner
export CHARLM_DATA_DIR=$DATA_ROOT/charlm

# Set directories to store external word vector data
export WORDVEC_DIR=../data/wordvec
