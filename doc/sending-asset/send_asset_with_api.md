# How to Send WienAsset with QT Wallet or Explorer API Guide
First, declare a variable that contain all your transaction's details.
```javascript
  //create the parameter of the transaction you want to send
  {
    "from": [ "Sender Address", ], //array
    "to": [
      {
        "address": "Receiver Address", //string
        "assetId": "Asset ID", //string
        "amount": 100000000, //Amount to send is without divisibility //int
      },
    ], //array object
    "coloredChangeAddress": "Address to receive balance of the asset", //string
    "financeChangeAddress": "Address to receive balance of WIEN", //string
    "metadata": {
      "description": "Any description", //string
      "userData": {
        "meta": [{
          "key": "key", //string
          "value": { example: "abc", }, //object
          "type": "object" //string
        }]
      } //object (Optional)
    },
    "privateKey": "Sender Private Key" //string (Optional)
  }
  ```
This is a complete example of sending an Asset with wienasset-sdk. in ```send``` variable,  note that the ```metadata``` and the object in ```metadata``` are optional.
Besides, ```coloredChangeAddress ``` and ```financeChangeAddress ``` is required or else you might perform coin burn.

Next, create a POST request to call the API below with the parameter that you have created:
```
https://asset.wienchain.com/createSendTX
```

This API will return an object with the key below:

| Parameter  | Description  | Example  |
| ------------ | ---------- | ------------ |
| c  | This is the status of the result. 0 = success, 1 = fail  | 0  |
| d  | This carry the data that return from the API.  | "unsignedTX": "0100ABC"  |
| m  | Error message  | -  |

If you include the sender privateKey in the parameter, the api will return a signedTx hex. Else, it will return an unsignedTx hex. 
You can broadcast the signedTx hex straightaway while for an unsignedTx hex, you will need to sign the hex before you broadcast it.

You can use the debug console in your QT-Wallet to sign your unsignedTx hex with `signrawtransaction` command.
```
signrawtransaction 010000000289fd068ef2fbda7d91565a8e6c375f3604c335cef58e15ac531bb319ef2bdc69000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388acffffffff31b0b4dcdc25a22a55e698f546f5b8021091a740de7a7e9d44e0afa01b61a65d000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388acffffffff036d160000000000001976a914549e5aad597ff660cfb1de6326387c70c1b0689188ac0000000000000000086a0657410315000118730100000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388ac00000001
```
It will return a signedTx hex. Then, you can broadcast this signedTx hex with `sendrawtransaction` command.
```
sendrawtransaction 011100000289fd068ef2fbda7d91565a8e6c375f3604c335cef58e15ac531bb319ef2bdc69000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388acffffffff31b0b4dcdc25a22a55e698f546f5b8021091a740de7a7e9d44e0afa01b61a65d000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388acffffffff036d160000000000001976a914549e5aad597ff660cfb1de6326387c70c1b0689188ac0000000000000000086a0657410315000118730100000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388ac11111111
```
This command will return the txid of broadcasted transaction. 
This is an example of signing and broadcasting a transaction in QT-Wallet debug console. 

![Screenshot](https://github.com/wienchain/wienchain-core/blob/master/doc/sending-asset/qt_wallet_screenshot.jpeg?raw=true)

It is advisible to decode the unsignedTx hex with `decoderawtransaction` command to ensure that the hex is normal.
```
decoderawtransaction 010000000289fd068ef2fbda7d91565a8e6c375f3604c335cef58e15ac531bb319ef2bdc69000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388acffffffff31b0b4dcdc25a22a55e698f546f5b8021091a740de7a7e9d44e0afa01b61a65d000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388acffffffff036d160000000000001976a914549e5aad597ff660cfb1de6326387c70c1b0689188ac0000000000000000086a0657410315000118730100000000001976a914b5840fda3da51eee0312d36ee739ddaa7f690a7388ac00000001
```

## Alternative: Broadcast transaction with Explorer API
Once you got the signedTx hex, you can broadcast your transaction with Explorer API below:
```
https://explorer.wienchain.com/api/transmit
```
Create a POST request with the signedTx as below:
```
{ "txHex": "your signedTx hex"}
```
This API will also return the txid of broadcasted transaction.
