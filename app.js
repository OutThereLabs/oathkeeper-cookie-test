const providerURL = new URL("/v1/web3/mainnet", window.location.href);
const provider = new Web3.providers.HttpProvider(providerURL.href);
const web3 = new Web3(provider);

document.getElementById("cookie").innerHTML = document.cookie;

web3.eth.getAccounts((error, accounts) => {
    document.getElementById("accounts").innerHTML = JSON.stringify(error || accounts);
})