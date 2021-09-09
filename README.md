# ycashcli
To use this script, you must have Julia, a Ycash Full Node, and ycash-cli installed on your machine. Place the script in your home folder and start Julia.
Once Julia is running:

julia>include("ycash.jl") for ycash

julia>include("zcash.jl") for zcash (Zcash is a separate branch from main)

Once the script is running, commands are executed in the following format:

ycashcli("z_listunspent")


At the moment ycashcli() only takes one arg at a time. The z_send() function was created in order to deal with this when sending and most likely other functions will needed to be added to achieve full useability and functionality. You may pass multiple args by running ycash-cli just like you would from bash:

run(`./ycash-cli [insert stuff here]`) MAKE SURE YOU DON'T FORGET BACKTICKS
