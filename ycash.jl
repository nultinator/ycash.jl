

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
addresses = JSON.parse(read(`./ycash-cli z_listaddresses`, String))
notes = JSON.parse(read(`./ycash-cli z_listunspent`, String))
memos = String(hex2bytes(notes[1]["memo"])) #FIX THE KEY VARIABLE IN THIS LINE!!!!!
#This send function doesn't work correctly yet, but it's close
function z_sendtofrom()
           println("Send from?")
           from = readline()
           println("Send to?")
           to = readline()
           println("How much?")
           amount = readline()
           println("Memo?")
           memo = readline()
           dict = OrderedDict("address" => "$to", "amount" => amount, "memo" => "$memo")
           params = JSON.json(dict)
           run(`./ycash-cli z_sendmany "$from" 'params'`)
end


