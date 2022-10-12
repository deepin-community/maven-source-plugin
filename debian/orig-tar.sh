#!/bin/sh -e

VERSION=$2
TAR=../maven-source-plugin_$VERSION.orig.tar.xz
DIR=maven-source-plugin-$VERSION
TAG=$(echo "maven-source-plugin-$VERSION" | sed -re's/~(alpha|beta)/-\1-/')

svn export http://svn.apache.org/repos/asf/maven/plugins/tags/${TAG}/ $DIR
XZ_OPT=--best tar -c -J -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR ../$TAG
