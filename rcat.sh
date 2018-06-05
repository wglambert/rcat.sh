#!/bin/bash

echo -e ""
echo "Directory to recursively search, default is ./"
 read -e dir
 echo -e""
  if [ -z "$dir" ]; then \
   dir="./"
  fi
echo "Filename to search, defaults to every file"
 read -e file
 echo -e ""
  if [ -z "$file" ]; then \
   file=""
  fi
echo "Text to search for, default is output everything"
 read -e text
 echo -e ""
  if [ -z "$text" ]; then \
   text=""
  fi

echo -e "------------SEARCHING------------\n"
if [ -z "$file" -a -z "$text" ]; then
        for i in $(find "$dir" -not -type d);
        do
                echo -e "==>\033[0;36m "$i" \033[0m<=="
                cat "$i"
                printf "\n"
        done
echo -e "------------INPUT------------\ncat \$(find "$dir" -not -type d)\n"

elif [ -z "$file" -a -n "$text" ]; then 
        for i in $(grep -il "$text" $(find "$dir" -not -type d));
        do
                echo -e "==>\033[0;36m "$i" \033[0m<=="
                grep --color=auto -iC 1 "$text" "$i"
                printf "\n"
        done 
echo -e "------------INPUT------------\ngrep -iC 1 "$text" \$(find "$dir" -not -type d)\n"

elif [ -n "$file" -a -n "$text" ]; then 
        for i in $(grep -il "$text" $(find "$dir" -name "$file" -not -type d));
        do
                echo -e "==>\033[0;36m "$i" \033[0m<=="
                grep --color=auto -iC 1 "$text" "$i"
                printf "\n"
        done
echo -e "------------INPUT------------\ngrep -iC 1 "$text" \$(find "$dir" -name "$file" -not -type d)\n"

elif [ -n "$file" -a -z "$text" ]; then
        for i in $(find "$dir" -name "$file" -not -type d);
        do
                echo -e "==>\033[0;36m "$i" \033[0m<=="
                cat "$i"
                printf "\n"
        done
echo -e "------------INPUT------------\ncat \$(find "$dir" -name "$file" -not -type d)\n"
fi
