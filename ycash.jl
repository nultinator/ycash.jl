

import Pkg
Pkg.add("JSON")
import JSON
using JSON

pwd()
cd("ycash-441/src") #Enter the path to your ycash node here
function ycashcli(command)
	JSON.parse(read(`./ycash-cli $command`, String))
end
addresses = JSON.parse(read(`./ycash-cli z_listaddresses`, String))
notes = JSON.parse(read(`./ycash-cli z_listunspent`, String))
memos = String(hex2bytes(notes[1]["memo"])) #FIX THE KEY VARIABLE IN THIS LINE!!!!!


