export ANVIL_PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export ANVIL_ADDRESS=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
export ANVIL_RPC_URL=127.0.0.1:8545
export VOTING =0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9

# deploy the contract
forge script DeployVoting --rpc-url $ANVIL_RPC_URL --private-key $ANVIL_PRIVATE_KEY --broadcast

# add candidates in the list
cast send --unlocked --from $ANVIL_ADDRESS 0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9 "addCandidate(string)" "hud"
cast send --unlocked --from $ANVIL_ADDRESS 0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9 "addCandidate(string)" "nuh"
cast send --unlocked --from $ANVIL_ADDRESS 0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9 "addCandidate(string)" "pius"
cast send --unlocked --from $ANVIL_ADDRESS 0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9 "addCandidate(string)" "ali"
cast send --unlocked --from $ANVIL_ADDRESS 0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9 "addCandidate(string)" "yol"

# vote for different candidates