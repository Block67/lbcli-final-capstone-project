# Which tx in block 216,351 spends the coinbase output of block 216,128?
CB_TXID=$(bitcoin-cli -signet getblockhash 216128 | xargs bitcoin-cli -signet getblock | jq -r '.tx[0]')
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216351) 2 | jq -r --arg cb "$CB_TXID" '.tx[] | select(.vin[].txid == $cb) | .txid'
