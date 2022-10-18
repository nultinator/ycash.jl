function build_ycashd()
	run(`git clone https://github.com/ycashfoundation/ycash.git`)
	cd("ycash")
	run(`./zcutil/build.sh -j4`)
end

function set_path()
	println("Please enter the path to ycash-cli: ")
	path = readline()
	touch("path.txt")
	open("path.txt", "w") do io
	write("path.txt", path)
	end
end

println("Would you like to build ycashd? Y/n")
	if ascii(readline()) == "y"
		build_ycashd()
	end
println("Would you like to set the path to ycash-cli? Y/n")
	if ascii(readline()) == "y"
		set_path()
	end