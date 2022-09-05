#!/bin/bash

# echo the shebang to the script
echo '#!/bin/bash' > $1

# echo the answer into the script

echo $2 >> $1

# make the script executable
chmod +x $1

# git add
git add .

# git comment
git commit -m "Task ${1:0}"

#git push
git push
