
import Pkg
function build_deps()
	Pkg.add("JSON")
	Pkg.add("OrderedCollections")
	Pkg.add("DataFrames")
end

function build_zcashd()
	run(`git clone https://github.com/zcash/zcash.git`)
	cd("zcash")
	run(`./zcutil/build.sh -j4`)
end
println("Would you like to build zcashd?")
	reply = readline()
	if reply == "yes"
		build_zcashd()
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
function zcashcli(command)
    cd()
    cd(location)
	JSON.parse(read(`./zcash-cli $command`, String))
end
y_addresses = JSON.parse(read(`./zcash-cli z_listaddresses`, String))
notes = JSON.parse(read(`./zcash-cli z_listunspent`, String))
memos = String(hex2bytes(notes[1]["memo"])) #FIX THE KEY VARIABLE IN THIS LINE!!!!!

function checky()
	zaddr_regex = r"^zs1\w{75}"

	from = readline()
           
	while match(zaddr_regex, from) == nothing
  		println("That yaddr looks invalid. Please enter a valid address")
  		from = readline()
	end
end
	
function shieldedbalances()
       for address in z_addresses
           if occursin(r"(zs1)", address) == true
           balance = read(`./zcash-cli z_getbalance "$address"`, String)
           println("$address = $balance")
           end
       end
end
	
function decodememo(memo)
		String(hex2bytes(memo))
	end

function new_t_addr()
        run(`./zcash-cli getnewaddress`)
end

function show_transparent()
        zcashcli("listreceivedbyaddress")
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
           run(`./zcash-cli z_sendmany "$from" '['$sendparams']'`)
       end

