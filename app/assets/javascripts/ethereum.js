var entropy_address = "0xea91b8a1ca93c1150cad64499cb4fbb785d7efd2"
var entropy_node_address = "https://eth1.project-entropy.com:8545"
var target = 20000
var entropy


function p(s){
  console.log(s)
}


function initalizeWeb3()
{
  // Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 !== 'undefined') {
    // Use Mist/MetaMask's provider
    p('Using existing injected web3 object - likely MetaMask or Mist')
    window.web3 = new Web3(web3.currentProvider);
    p(web3.isConnected())
  } else {
    p('No injected web3 object detected - establishing link to Ethereum Node - localhost')
    window.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

    if(!web3.isConnected())
    {
      p('Unable to connect to localhost node - establishing link to remote public Entropy Ethereum Node')
      window.web3 = new Web3(new Web3.providers.HttpProvider(entropy_node_address));
    }
  }

  wrapEntropy()

}

// Wrap the entropy dApp in a truffle interface to make things easier
function wrapEntropy()
{
  Entropy.setProvider(web3);
  window.entropy = Entropy.at(entropy_address)

  watchBalance()
}

// Fetch the balance of an address
function fetchBalance(adr, callback)
{
  web3.eth.getBalance(adr, 'latest')
  callback()
}

//
// Refresh the screen with the result of fetching Entropies balance
function updateBalance()
{
  fetchBalance(entropy_address, function(e, balance){
    var ether = web3.fromWei(balance)
    $("#ether_count").html(ether)

    var percentage = ( ether / target * 100 ).toFixed(2)
    var progress = $("#crowdfund_progress")

    progress.html(percentage + "%")
    progress.style = `width: %{percentage}%; min-width: 50px;`

  })
}
// Every block, update the balance of Entropy
function watchBalance() {
  updateBalance()
  web3.eth.filter('latest').watch(function() { updateBalance() })
}

// Get all NewCitizen events to see a count of citizens
// function watchNewCitizens(){
//   var newCitizensEvent = entropy.NewCitizen({fromBlock: 0, toBlock: 'latest'});
//   newCitizensEvent.watch(function(err, result) {
//     if (err) {
//       console.log(err)
//       return;
//     }
//     console.log("watchNewCitizen:")
//     console.log(result)
//   })
// }
