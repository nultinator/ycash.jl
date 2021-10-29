
import Pkg
function build_deps()
	Pkg.add("JSON")
	Pkg.add("OrderedCollections")
	Pkg.add("DataFrames")
end

function build_ycashd()
	run(`git clone https://github.com/ycashfoundation/ycash.git`)
	cd("ycash")
	run(`./zcutil/build.sh -j4`)
end
println("Would you like to build ycashd?")
	reply = readline()
	if reply == "yes"
		build_ycashd()
	end

println("Would you like to build dependancies?")
println("reply: yes or no")
	Answer = readline()
	if Answer == "yes"
		build_deps()
	end
using JSON
using OrderedCollections
using DataFrames

pwd()
cd()
println("Enter the path to ycash/zcash-cli")
location = readline()
cd(location)
function ycashcli(command)
    cd()
    cd(location)
	JSON.parse(read(`./ycash-cli $command`, String))
end
addresses = JSON.parse(read(`./ycash-cli z_listaddresses`, String))
notes = JSON.parse(read(`./ycash-cli z_listunspent`, String))
memos = String(hex2bytes(notes[1]["memo"])) #FIX THE KEY VARIABLE IN THIS LINE!!!!!

function checky()
	yaddr_regex = r"^ys1\w{75}"

	from = readline()
           
	while match(yaddr_regex, from) == nothing
  		println("That yaddr looks invalid. Please enter a valid address")
  		from = readline()
	end
end
	
function getbalance()
        DataFrame(ycashcli("z_gettotalbalance"))
end
	
function decodememo(memo)
		String(hex2bytes(memo))
	end

function new_s_addr()
        run(`./ycash-cli getnewaddress`)
end

function show_transparent()
        ycashcli("listreceivedbyaddress")
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

