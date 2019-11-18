# How to Send WienAsset with SDK Guide
First, import the package and declare the config as below.
```javascript
const WienAsset = require('wienassets-sdk')
const config = {
  network: 'mainnet',
  wienAssetHost: 'https://explorer.wienchain.com',
  blockExplorerHost: 'https://explorer.wienchain.com',
  metadataServerHost: 'https://asset.wienchain.com/metadata',
  mnemonic: 'limb update banner quantum random midnight grit cage crime addict window differ'
};
```
The ```config``` object configure the package to integrate mainnet or testnet. The example of the parameters are as below:

| Parameter  | Testnet  | Mainnet  |
| ------------ | ------------ | ------------ |
| network  | testnet  | mainnet  |
| wienAssetHost  | https://<span/>explorer-testnet.wienchain.com  | https://<span/>explorer.wienchain.com  |
| blockExplorerHost  | https://<span/>explorer-testnet.wienchain.com  | https://<span/>explorer.trivechain.com  |
| metadataServerHost  | https://<span/>asset-testnet.wienchain.com/metadata  | https://<span/>asset.wienchain.com/metadata  |
| mnemonic  | -  | -  |

You can generate new mnemonic by removing ```mnemonic``` from the ```config```.
Now, initiate the package.
```javascript
const wa = new WienAsset(config);

wa.init(function (err) {
  if (err) console.log(JSON.parse(err));
  
  //create a variable of the transaction you want to send
  let send = {
    from: [ "Sender Address", ], //array
    to: [
      {
        address: "Receiver Address", //string
        assetId: "Asset ID", //string
        amount: 100000000, //Amount to send is without divisibility //int
      },
    ], //array object
    coloredChangeAddress: "Address to receive balance of the asset", //string
    financeChangeAddress: 'Address to receive balance of WIEN', //string
    metadata: {
      description: "Any description", //string
      userData: {
        meta: [{
          key: "key", //string
          value: { example: "abc", }, //object
          type: 'object' //string
        }]
      } //object (Optional)
    },
    transmit: false, // default: true. When it is false, it will return an signedTx Hex, else it will broadcast your transction straightaway.
  }
  
  //This will create, sign and/or broadcast your transaction
  wa.sendAsset(send, function (err, body) {
      console.log(JSON.parse(err))
      console.log(body)
  })
})
  ```
This is a complete example of sending an Asset with wienasset-sdk. in ```send``` variable,  note that the ```metadata``` and the object in ```metadata``` are optional.
Besides, ```coloredChangeAddress ``` and ```financeChangeAddress ``` is required or else you might perform coin burn.
Lastly, if the transaction broadcast successful, it will return the ```txid``` of the broadcasted transaction.
