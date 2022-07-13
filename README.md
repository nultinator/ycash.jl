# ycash.jl
A wrapper for "ycash-cli" from the Julia REPL.

You must have Julia, a Ycash/Zcash Full Node, and ycash-cli installed on your machine.
Julia can be downloaded from here: https://julialang.org/downloads/.


In bash run the following commands:

  cd ycashcli/src
  
  julia
  
  include("ycash.jl")
  
To run commands use the following syntax:

ycashcli("getblock", 0)
