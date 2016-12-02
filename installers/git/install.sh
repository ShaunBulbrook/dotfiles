#!/usr/bin/env bash

cp gitconfig .gitconfig

sed -i "s/{{ GIT_EMAIL }}/$GIT_EMAIL/g" .gitconfig
sed -i "s/{{ GIT_NAME }}/$GIT_NAME/g" .gitconfig

if [ -z "$GIT_KEY" ]; then
	GIT_HAS_KEY=';'
fi

sed -i "s/{{ GIT_KEY }}/$GIT_KEY/g" .gitconfig
sed -i "s/{{ GIT_HAS_KEY }}/$GIT_HAS_KEY/g" .gitconfig
sed -i "s/{{ GIT_EDITOR }}/$GIT_EDITOR/g" .gitconfig

mv .gitconfig ~/.gitconfig
