# what is the coinbase tx in this block 243,834
bitcoin-cli -signet getblockhash 243834 | xargs bitcoin-cli -signet getblock | jq -r '.tx[0]'
