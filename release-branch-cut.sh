#!/bin/sh

BACKUP_RELEASE_NAME=$1
GIT=/usr/bin/git

# Tag release in master
$GIT fetch --all
$GIT checkout master
$GIT tag $BACKUP_RELEASE_NAME

# Rename Release branch to $BACKUP_RELEASE_NAME
$GIT checkout Release
$GIT branch -m $BACKUP_RELEASE_NAME
$GIT push origin :Release $BACKUP_RELEASE_NAME
$GIT push -u origin $BACKUP_RELEASE_NAME

# Generate new Release branch
$GIT checkout -b Release origin/master
$GIT push -u origin Release

