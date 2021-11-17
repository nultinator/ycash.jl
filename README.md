# ycash.jl
To use this script, you must have Julia, a Ycash/Zcash Full Node, and ycash-cli installed on your machine.
Julia can be downloaded from here: https://julialang.org/downloads/


In bash run the following commands:

  cd ycashcli/src
  
  julia
  
  include("ycash.jl") or 
  
  include("zcash.jl")
  
Future iterations of this will use a project.toml file, but at the moment, all dependencies install and/or update at the beginning of the script
    -Pkg.add("blahblahblah")

Once the script is running, commands are executed in the following format:

ycashcli("z_listunspent")
Precompilation/JIT compilation takes a bit, but after you've run a command once, it executes extremely fast for the life of the REPL running it.


At the moment ycashcli() only takes one arg at a time. The z_send() function was created in order to deal with this when sending and most likely other functions will needed to be added to achieve full useability and functionality. You may pass multiple args by running ycash-cli just like you would from bash:

run(`./ycash-cli [insert stuff here]`) MAKE SURE YOU DON'T FORGET BACKTICKS
