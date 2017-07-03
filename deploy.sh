#!/bin/bash
set -e
set -x

commit_id=`git log -n1 --format="%h"`
environment_name=`eb list | grep "*" | sed "s/\\* //"`


# master
git checkout $1
eb deploy --timeout 100 --label $commit_id-$environment_name


# cronjobs
#if [[ `git branch --list cronjobs` ]]
#then
#   git branch -D cronjobs
#fi

#git co -b cronjobs
#environment_name=`eb list | grep "*" | sed "s/\\* //"`
#rm -f .ebextensions/10_threshold.config
#git add -A
#git commit -m "Preparing to commit to cronjobs branch"
#eb deploy --timeout 100 --label $commit_id-$environment_name
#git co master
#git branch -D cronjobs


# activejobs
#if [[ `git branch --list activejobs` ]]
#then
#   git branch -D activejobs
#fi

#git co -b activejobs
#environment_name=`eb list | grep "*" | sed "s/\\* //"`
#mv .ebextensions_extra/30_queue_url_for_activejobs_enviroment.config .ebextensions/
#rm -rf cron.yaml
#git add -A
#git commit -m "Preparing to commit to activejobs branch"
#eb deploy --timeout 100 --label $commit_id-$environment_name
#git co master
#git branch -D activejobs

