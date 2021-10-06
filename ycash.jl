

import Pkg
Pkg.add("JSON")
Pkg.add("OrderedCollections")
import JSON
using JSON
using OrderedCollections

pwd()
println("Enter the path to ycash/zcash-cli")
location = readline()
cd(location)
function ycashcli(command)
	JSON.parse(read(`./ycash-cli $command`, String))
end

function decodememo(note)
	notes = ycashcli("z_listunspent")
	memo = String(hex2bytes(notes[note]["memo"]))
	println(memo)
end

function checky()
	yaddr_regex = r"^ys1\w{75}"

	from = readline()
           
	while match(yaddr_regex, from) == nothing
  	println("That yaddr looks invalid. Please enter a valid address")
  	from = readline()
		end
	end
	

#Sending works now!!!!!, Still need function to convert memo to hexadecimal format though
function z_send()
           println("Send from?")
           from = readline()
           println("Send to?")
           to = readline()
           println("How much?")
           amount = readline()
           println("Memo?")
           memo = readline()
           params = OrderedDict{String, Any}([("address", to), ("amount", amount)])
           sendparams = JSON.json(params)
           run(`./ycash-cli z_sendmany "$from" '['$sendparams']'`)
       end


