#!/bin/bash

#next_directory ()
#{
#	largest=0
#
#	for fname in diffs/*-*-*
#	do
#		test2=${fname%-*}
#		current=${test2#*-}
#		if [ $current -ge $largest ]; then
#			largest=$current
#		fi
#	done
#
#	next=$[$largest+1]-`date +%Y%m%d%H%M%S`
#}
#
#next_directory

next=1-`date +%Y%m%d%H%M%S`

wwwrapid=diffs/www.rapid-$next
wwwredgage=diffs/www.redgage-$next
betarapid=diffs/beta.rapid-$next
betaredgage=diffs/beta.redgage-$next
apolloredgage=diffs/redgage-$next

echo $wwwrapid
echo $wwwredgage
echo $betarapid
echo $betaredgage
echo $apolloredgage

#mkdir $wwwrapid
#mkdir $wwwredgage
#mkdir $betarapid
mkdir $betaredgage
#mkdir $apolloredgage

#rsync -avz --delete --exclude=*.svn --backup --backup-dir=$wwwrapid titan.redgage.com:/httpd/www.rapid .
#rsync -avz --delete --exclude=*.svn --backup --backup-dir=$wwwredgage titan.redgage.com:/httpd/www.redgage .
#rsync -avz --delete --exclude=*.svn --backup --backup-dir=$betarapid titan.redgage.com:/httpd/beta.rapid .
sudo rsync -avz -e "ssh -i ~/.ssh/hercules_backup" --delete --exclude=*.svn --backup --backup-dir=$betaredgage rampage@titan.redgage.com:/httpd/beta.redgage .
#rsync -avz --delete --exclude=*.svn --backup --backup-dir=$apolloredgage apollo.redgage.com:/httpd/redgage .
