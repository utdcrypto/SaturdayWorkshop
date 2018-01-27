const Abi = require('./compiled/Workshop.json')
const AbiTwo = require('./compiled/Demo.json')
var fs = require('fs')

global.config = {
    rpc: {
        host: "localhost",
        port: "8545"
    }
}

class Contract {
    constructor(_abi, _bytecode) {
        this.abi = _abi;
        this.bytecode = _bytecode;
        this.contract = web3.eth.contract(_abi)
    }

    workshopDeploy() {
        return this.contract.new({
            from: acct0,
            data: this.bytecode,
            gas: 4000000
        }, (error, result) => {
            if (!error) {
                global.deployed = this.contract.at(result.address)
                global.deployedAddress = result.address
                console.log(result.address)
            } else {
                console.log(error)
            }
        })
    }

}


global.Web3 = require('web3')
//global.util = require('ethereumjs-util')
global.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))

global.abi = Abi
global.abiTwo = AbiTwo
global.bin = fs.readFileSync('./compiled/Workshop.bin', 'utf8')
global.binTwo = fs.readFileSync('./compiled/Demo.bin', 'utf8')
//global.contractOne = web3.eth.contract(abiOne)
//global.contractTwo = web3.eth.contract(abiTwo)

global.contract = new Contract(abi, bin)
global.contractTwo = new Contract(abiTwo, binTwo)

global.deployed = null
global.deployedAddress = null

global.acct0 = web3.eth.accounts[0]
global.acct1 = web3.eth.accounts[1]
global.acct2 = web3.eth.accounts[2]
global.acct3 = web3.eth.accounts[3]
global.acct4 = web3.eth.accounts[4]
global.acct5 = web3.eth.accounts[5]
global.acct6 = web3.eth.accounts[6]
global.acct7 = web3.eth.accounts[7]
global.acct8 = web3.eth.accounts[8]
global.acct9 = web3.eth.accounts[9]

balanceToString = (account) => {
    return web3.eth.getBalance(account).toString()
}
getBalances = () => {
    var allAccts = web3.eth.accounts
    return allAccts.map(balanceToString)
}