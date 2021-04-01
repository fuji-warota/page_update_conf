#!/bin/zsh
#更新を確認したいサイトのurlをconf_listに追加しておくこと
rm ~/Desktop/todays_update_site.txt
for url in $(cat conf_list); do
  w3m -dump "$url" > tmp.txt
  name=$(echo $url|md5)
#初確認時の処理
  if ! find ./before_page/$name.txt; then
    #echo $url
    cat tmp.txt > ./before_page/$name.txt
    continue;
  fi
  if ! diff -q ./before_page/$name.txt tmp.txt; then
    echo $url >> ~/Desktop/todays_update_site.txt
    cat tmp.txt > ./before_page/$name.txt
  fi
done 
