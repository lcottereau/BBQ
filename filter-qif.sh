#!/bin/bash
COMPTES=/home/clark/Documents/comptes/
BACKUP=$COMPTES/backup/

FILENAME=`date +%Y%m%d`"-$2.qif"
BACKUP_FILE=$BACKUP/$FILENAME
echo "Sauvegarde du fichier $1 dans $BACKUP_FILE"
mv $1 $BACKUP_FILE

NEW_FILE=$COMPTES/$FILENAME
echo "Traitement du fichier $BACKUP_FILE et création du fichier $NEW_FILE"
cat $BACKUP_FILE | sed -e 's/^PRETRAIT\( DAB\)* \([0-9]*\) \(.*\) \(.*\) CB\\*\([0-9]*\)/PLIQUIDE\nMretrait du \2 à \3 avec la CB \4/' | \
         sed -e 's/^PCHQ\. N\.\([0-9]*\).*/N\1\nMchèque/' | \
         sed -e 's/^PPRLV\( SEPA\)* \(.*\)/P\2\nMprélèvement\1/' | \
         sed -e 's/^PVIR \(.*\)/Mvirement au motif : \1/' > $NEW_FILE
