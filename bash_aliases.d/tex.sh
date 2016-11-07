function latexrm(){
#find ./ -regextype posix-awk -regex "(.*.mpg|.*.avi|.*.wmv|.*.mpeg)" -exec mplayer -shuffle -loop 0 {}
FILES=$(find . -name "*.rm" -o -name "*.aux" -o -name "*.lof" -o -name "*.log" -o -name "*.lot" -o -name "*.fls" -o -name "*.out" -o -name "*.toc" -o -name "*.fmt" \
 -o -name "*.fot" -o -name "*.cb" -o -name "*.cb2" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz")


if [ "$(echo -ne ${FILES} | wc -w)" -ne 0 ]; then
  echo "Do you want to delete the following files?"
  printf '%s\n' "${FILES[@]}"
  read -p "Delete them now? [y/n]" -n 1 -r

  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      echo "Deleting files..."
      rm $FILES
  else
    echo "Aborting!"
  fi
else
  echo "No files found"
fi
}

