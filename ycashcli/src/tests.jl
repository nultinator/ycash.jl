@assert 1 == 1

println("Hello from our test file")
println(ycashcli("getblockchaininfo"))
println(ycashcli("getblock", 0))
@assert ycashcli("getblock", 0)["time"] == 1477641360