@assert 1 == 1

println("Hello from our test file")

@assert Int64(ycashcli("getblock", 0)["time"]) == 1477641360
println("Block 0: passed")

@assert (typeof(Int64(ycashcli("getblockcount"))) == Int64)
println("Blocks are integers: passed")

@assert (typeof(Float64(ycashcli("getdifficulty")))) == Float64
println("Difficulty is Float64: passed")

@assert (typeof(ycashcli("getmempoolinfo"))) == Dict{String, Any}
println("Mempool: passed")

@assert (typeof(ycashcli("getinfo"))) == Dict{String, Any}
println("Getinfo: passed")

@assert bytes2hex(codeunits("hello")) == "68656c6c6f"
println("String to hex: passed")

@assert String(hex2bytes("68656c6c6f")) == "hello"
println("Hex to string: passed")

@assert (typeof(ycashcli("getchaintips"))) == Vector{Any}
println("Chain tips: passed")

#test to make sure we can create transparent addresses
@assert getnewaddress()[1:2] == "s1"
println("S_address: passed")


println("End of Tests")


