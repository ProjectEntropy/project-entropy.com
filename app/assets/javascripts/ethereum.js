var entropy_address = "0x75a178d53f30f5877302682b65563df930c6aaef"
var entropy_node_address = "https://eth1.project-entropy.com:8545"


function print(s){
  console.log(s)
}


function initalizeWeb3()
{
  // Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 !== 'undefined') {
    // Use Mist/MetaMask's provider
    print('Using existing injected web3 object - likely MetaMask or Mist')
    web3 = new Web3(web3.currentProvider);
    print(web3.isConnected())
  } else {
    print('No injected web3 object detected - establishing link to Ethereum Node - localhost')
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

    if(!web3.isConnected())
    {
      print('Unable to connect to localhost node - establishing link to remote public Entropy Ethereum Node')
      web3 = new Web3(new Web3.providers.HttpProvider(entropy_node_address));
    }
  }

}

// Fetch the balance of an address
function fetchBalance(adr, callback)
{
  web3.eth.getBalance(adr, 'latest', callback)
}

// Refresh the screen with the result of fetching Entropies balance
function updateBalance()
{
  fetchBalance(entropy_address, function(e, balance){
    document.getElementById('coinbase').innerText = entropy_address

    var target = 100.0
    var ether = web3.fromWei(balance)
    document.getElementById("ether_count").innerText = ether

    var percentage = Math.floor( ether / target * 100 )
    var progress = document.getElementById("crowdfund_progress")

    progress.innerText = percentage + "%"
    progress.style = "width: " + percentage + "%; min-width: 27px;"
    //
  })
}

// Every block, update the balance of Entropy
function watchBalance() {
  updateBalance()
  web3.eth.filter('latest').watch(function() { updateBalance() })
}
