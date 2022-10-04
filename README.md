# ycash.jl
A wrapper for "ycash-cli" from the Julia REPL.

You must have Julia, a Ycash/Zcash Full Node, and ycash-cli installed on your machine.
Julia can be downloaded from here: https://julialang.org/downloads/.


<h2>Getting Started</h2>

```shell
  cd ycashcli/src
  ./julia
```
Once inside a live REPL
  
```julia
  include("ycash.jl")
```
  
<h2>Commands and Usage</h2>
<h4>ycashcli()</h4>
<p>Takes a command(string) and up to two args(any) as input, then returns the information sent back from the node. The following snippets are not an exhaustive list but just a few examples</p>

```julia
ycashcli("getblockchaininfo")
```
```julia
ycashcli("getpeerinfo")
```


```julia
ycashcli("getblock", 0")
```

<h4>shielded_send()</h4>
<p>Takes your y_address(string), to_address(string), amount(float64) and fee(float64) as input. A shielded transaction is then created and sent using the input data.</p>

```julia
shielded_send("ys1youryaddressgoeshereblahblahblah", "ys1youaresendingtothisaddressblahblah", 21.0, 0.01)
```

<h4>getnewaddress()</h4>
<p>Returns a new transaparent address</p>

```julia
getnewaddress()
```

<h4>safe_send()</h4>
<p>Takes a receiving address(string), amount(float64), and fee(float64) as input, then generates a new change address to help protect some of the privacy of the sender. A new the new transaction is then created and the change is sent to newly generated address. This is <b><i>NOT</i></b> a replacement for shielded transactions.</p>

```julia
safe_send("s1youaresendingtothisaddress", 21.0, 0.01)
```


PRs Welcome
