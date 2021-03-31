#!/bin/zsh
#更新を確認したいサイトのurlをconf_listに追加しておくこと
rm ~/Desktop/todays_update_site.tex
for url in $(cat conf_list); do
  w3m -dump "$url" > tmp.txt
#初確認時の処理
  if ! find $url.txt; then
    #echo $url
    tmp.tex > $url.tex
    continue;
  fi
  if diff $url.tex tmp.tex; then
    echo $url >> ~/Desktop/todays_update_site.tex
  fi
done 
