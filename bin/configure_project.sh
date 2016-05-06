#!/usr/bin/env bash

year=`date +%Y`
CUSTOM_FILES="MIT-LICENSE README.md composer.json"

read -p "Author name: " author_name
read -p "Author email: " author_email
read -p "Package name (I.E. zend/validator): " package_name
read -p "Library name (I.E. Zend Validator): " library_name
read -p "Vendor namespage (PHP, I.E. Zend): " vendor_namespace
read -p "Package description: " package_description
read -p "Github username: " github_username
read -p "Github repository (zend-framework/zend-validator): " github_repo
read -p "Style CI id: " style_ci_id

function replace_in_file() {
  local file=$1
  local search=$2
  local replace=$3

  replace=`echo $replace | sed 's/\//\\\\\//g'`
  sed -i "s/$search/$replace/g" $file
}

replace_in_file composer.json 'Marcelo Jacobus' '{author_name}'
replace_in_file composer.json 'marcelo.jacobus@gmail.com' '{author_email}'
replace_in_file composer.json "Skeleton for libraries" '{package_description}'
replace_in_file composer.json "mjacobus/library-skeleton" '{package_name}'

for file in `echo $CUSTOM_FILES`; do
  replace_in_file $file '{year}' $year

  if [ "$author_name" != "" ]; then
    replace_in_file $file '{author_name}' "$author_name"
  fi

  if [ "$author_email" != "" ]; then
    replace_in_file $file '{author_email}' "$author_email"
  fi

  if [ "$library_name" != "" ]; then
    replace_in_file $file '{library_name}' "$library_name"
  fi

  if [ "$package_name" != "" ]; then
    replace_in_file $file '{package_name}' "$package_name"
  fi

  if [ "$package_description" != "" ]; then
    replace_in_file $file '{package_description}' "$package_description"
  fi

  if [ "$github_username" != "" ]; then
    replace_in_file $file '{github_username}' "$github_username"
  fi

  if [ "$github_repo" != "" ]; then
    replace_in_file $file '{github_repo}' "$github_repo"
  fi

  if [ "$style_ci_id" != "" ]; then
    replace_in_file $file '{style_ci_id}' "$style_ci_id"
  fi

  if [ "$vendor_namespace" != "" ]; then
    replace_in_file $file '{vendor_namespace}' "$vendor_namespace"
  fi
done
