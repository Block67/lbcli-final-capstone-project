# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
TX=b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
TX_DATA=$(bitcoin-cli -signet getrawtransaction $TX true)
OUT_SUM=$(echo "$TX_DATA" | jq '[.vout[].value] | add * 100000000 | round')
IN_SATS=0
while IFS=' ' read -r txid vout; do
  VAL=$(bitcoin-cli -signet getrawtransaction "$txid" true | jq -r ".vout[$vout].value * 100000000 | round")
  IN_SATS=$((IN_SATS + VAL))
done <<< "$(echo "$TX_DATA" | jq -r '.vin[] | "\(.txid) \(.vout)"')"
echo $((IN_SATS - OUT_SUM))
