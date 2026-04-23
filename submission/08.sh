# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
bitcoin-cli -signet getrawtransaction 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb true | jq -r '.blockhash' | xargs bitcoin-cli -signet getblock | jq -r '.height'
