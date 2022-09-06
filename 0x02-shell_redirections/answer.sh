#!/bin/bash

push_flag=0

while getopts 'ps:a:' OPTS; do
  case "$OPTS" in 
    p)
      push_flag=1
      ;;
    s)
      filename="${OPTARG}"
      ;;
    a)
      answer="${OPTARG}"
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done

# echo the shebang to the script
echo '#!/bin/bash' > "${filename}" 2>&1 

# echo the answer into the script

printf "${answer}\n" >> "${filename}" 2>&1 

# make the script executable
chmod +x "${filename}"

cat "${filename}"

if [ $push_flag -gt 0 ]; then
  # git add
  git add .

  # git comment
  git commit -m "Task ${filename:0:2}"

  #git push
  git push
fi
