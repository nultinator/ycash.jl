struct utxo
    address::String
    txid::String
    amountYec::Float64
    scriptPubKey::String
    vout::Int64
end

function create_utxo(address, txid, amountYec, scriptPubKey, vout)
    return (utxo("$address", "$txid", amountYec, "$scriptPubKey", vout))
end