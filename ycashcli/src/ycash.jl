
import Pkg
Pkg.add("DataFrames")
Pkg.add("JSON")
Pkg.add("OrderedCollections")

using JSON
using OrderedCollections
using DataFrames

include("utxo.jl")

dir = readdir()
println(isfile("path.txt"))
if isfile("path.txt") == false
    include("setup.jl")
end
f = open("path.txt", "r")
path = readline(f)
cd()
cd(path)
println(path)

function getnewaddress()
    chomp(read(`./ycash-cli getnewaddress`, String))
end

function ycashcli(command::String)
	JSON.parse(read(`./ycash-cli $command`, String))
end

function ycashcli(command::String, arg1)
	JSON.parse(read(`./ycash-cli $command $arg1`, String))
end

function ycashcli(command::String, arg1, arg2)
	JSON.parse(read(`./ycash-cli $command $arg1 $arg2`, String))
end


function shielded_send(from::String, to::String, amount::Float64, memo::String)
    text = bytes2hex(codeunits(memo))
    params = JSON.json(OrderedDict("address" => "$to", "amount" => amount, "memo" => "$text"))
    run(`./ycash-cli z_sendmany $from '['$params']'`)
end

function safe_send(to_address::String, amount::Float64, fee::Float64)
    sum = 0 #total value of utxos in our dict, start at 0, go until we hit the target amount
    change_address = getnewaddress() #for receiving our change
    utxos = ycashcli("listunspent") #we need our utxos to create raw transactions
    unspents = []#List of spendable UTXOs    
    for utxo in utxos
        utxo = create_utxo(utxo["address"], utxo["txid"], utxo["amount"], utxo["scriptPubKey"], utxo["vout"])
        dict_object = OrderedDict("txid" => utxo.txid, "vout" => utxo.vout)#turn utxo into a Dict object
        push!(unspents, dict_object) #add utxo to our list, "unspents"
        sum += utxo.amountYec #add value of the utxo to the sum we declared earlier
        if sum > amount + fee #stop when we have enough outputs for our transaction
            break
        end
    end
    ###Transaction output data goes here###
    change = round((sum - amount - fee), digits=8)
    outputs = JSON.json(OrderedDict(to_address => amount, change_address => change))
    #Build the transaction
    vins = JSON.json(unspents)
    tx_hex = chomp(read(`./ycash-cli createrawtransaction $vins $outputs`, String))
    signed = JSON.parse(read(`./ycash-cli signrawtransaction $tx_hex`, String))["hex"]
    sent_data = read(`./ycash-cli sendrawtransaction $signed`, String)
    return sent_data
end




        


function checky()
	yaddr_regex = r"^ys1\w{75}"

	from = readline()
           
	while match(yaddr_regex, from) == nothing
  		println("That yaddr looks invalid. Please enter a valid address")
  		from = readline()
	end
end


include("tests.jl")

