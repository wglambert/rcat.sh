#!/bin/bash
echo -e ""
echo "directory to recursively search, default is ./"
 read -e dir
 echo -e""
  if [ -z "$dir" ]; then \
   dir="./"
  fi
echo "filename to search, defaults to every file"
 read -e file
 echo -e ""
  if [ -z "$file" ]; then \
   file=""
  fi
echo "text to search for, default is output everything"
 read -e text
 echo -e ""
  if [ -z $"text" ]; then \
   text=""
  fi

echo -e "------------SEARCHING------------\n"
if [ -z "$file" -a -z "$text" ]; then \
 tail -n +1 $(find "$dir" -not -type d)
        echo -e "------------INPUT------------\ntail -n +1 $(find "$dir" -not -type d)\n-----------------------------\n"

elif [ -z "$fil"e -a -n "$text" ]; then \
 tail -n +1 $(find "$dir" -not -type d) | grep -C 1 "$text"
        echo -e "------------INPUT------------\ntail -n +1 $(find "$dir" -not -type d) | grep -C 1 "$text"\n-----------------------------\n"

elif [ -n "$file" -a -n "$text" ]; then \
 tail -n +1 $(find "$dir" -name "$file" -not -type d) | grep -C 1 "$text"
        echo -e "------------INPUT------------\ntail -n +1 $(find "$dir" -name "$file" -not -type d) | grep -C 1 "$text"\n-----------------------------\n"

elif [ -n "$file" -a -z "$text" ]; then \
 tail -n +1 $(find "$dir" -name "$file" -not -type d)
        echo -e "------------INPUT------------\ntail -n +1 $(find "$dir" -name "$file" -not -type d)\n-----------------------------\n"
fi
