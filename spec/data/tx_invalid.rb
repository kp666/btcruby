InvalidTxs = [
["The following are deserialized transactions which are invalid."],
["They are in the form"],
["[[[prevout hash, prevout index, prevout scriptPubKey], [input 2], ...],"],
["serializedTransaction, verifyFlags]"],
["Objects that are only a single string (like this one) are ignored"],

["0e1b5688cf179cd9f7cbda1fac0090f6e684bbf8cd946660120197c3f3681809 but with extra junk appended to the end of the scriptPubKey"],
[[["6ca7ec7b1847f6bdbd737176050e6a08d66ccd55bb94ad24f4018024107a5827", 0, "0x41 0x043b640e983c9690a14c039a2037ecc3467b27a0dcd58f19d76c7bc118d09fec45adc5370a1c5bf8067ca9f5557a4cf885fdb0fe0dcc9c3a7137226106fbc779a5 CHECKSIG VERIFY 1"]],
"010000000127587a10248001f424ad94bb55cd6cd6086a0e05767173bdbdf647187beca76c000000004948304502201b822ad10d6adc1a341ae8835be3f70a25201bbff31f59cbb9c5353a5f0eca18022100ea7b2f7074e9aa9cf70aa8d0ffee13e6b45dddabf1ab961bda378bcdb778fa4701ffffffff0100f2052a010000001976a914fc50c5907d86fed474ba5ce8b12a66e0a4c139d888ac00000000", "P2SH"],

["This is the nearly-standard transaction with CHECKSIGVERIFY 1 instead of CHECKSIG from tx_valid.json"],
["but with the signature duplicated in the scriptPubKey with a non-standard pushdata prefix"],
["See FindAndDelete, which will only remove if it uses the same pushdata prefix as is standard"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "DUP HASH160 0x14 0x5b6462475454710f3c22f5fdf0b40704c92f25c3 EQUALVERIFY CHECKSIGVERIFY 1 0x4c 0x47 0x3044022067288ea50aa799543a536ff9306f8e1cba05b9c6b10951175b924f96732555ed022026d7b5265f38d21541519e4a1e55044d5b9e17e15cdbaf29ae3792e99e883e7a01"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006a473044022067288ea50aa799543a536ff9306f8e1cba05b9c6b10951175b924f96732555ed022026d7b5265f38d21541519e4a1e55044d5b9e17e15cdbaf29ae3792e99e883e7a012103ba8c8b86dea131c22ab967e6dd99bdae8eff7a1f75a2c35f1f944109e3fe5e22ffffffff010000000000000000015100000000", "P2SH"],

["Same as above, but with the sig in the scriptSig also pushed with the same non-standard OP_PUSHDATA"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "DUP HASH160 0x14 0x5b6462475454710f3c22f5fdf0b40704c92f25c3 EQUALVERIFY CHECKSIGVERIFY 1 0x4c 0x47 0x3044022067288ea50aa799543a536ff9306f8e1cba05b9c6b10951175b924f96732555ed022026d7b5265f38d21541519e4a1e55044d5b9e17e15cdbaf29ae3792e99e883e7a01"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006b4c473044022067288ea50aa799543a536ff9306f8e1cba05b9c6b10951175b924f96732555ed022026d7b5265f38d21541519e4a1e55044d5b9e17e15cdbaf29ae3792e99e883e7a012103ba8c8b86dea131c22ab967e6dd99bdae8eff7a1f75a2c35f1f944109e3fe5e22ffffffff010000000000000000015100000000", "P2SH"],

["This is the nearly-standard transaction with CHECKSIGVERIFY 1 instead of CHECKSIG from tx_valid.json"],
["but with the signature duplicated in the scriptPubKey with a different hashtype suffix"],
["See FindAndDelete, which will only remove if the signature, including the hash type, matches"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "DUP HASH160 0x14 0x5b6462475454710f3c22f5fdf0b40704c92f25c3 EQUALVERIFY CHECKSIGVERIFY 1 0x47 0x3044022067288ea50aa799543a536ff9306f8e1cba05b9c6b10951175b924f96732555ed022026d7b5265f38d21541519e4a1e55044d5b9e17e15cdbaf29ae3792e99e883e7a81"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006a473044022067288ea50aa799543a536ff9306f8e1cba05b9c6b10951175b924f96732555ed022026d7b5265f38d21541519e4a1e55044d5b9e17e15cdbaf29ae3792e99e883e7a012103ba8c8b86dea131c22ab967e6dd99bdae8eff7a1f75a2c35f1f944109e3fe5e22ffffffff010000000000000000015100000000", "P2SH"],

["An invalid P2SH Transaction"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0x7a052c840ba73af26755de42cf01cc9e0a49fef0 EQUAL"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000009085768617420697320ffffffff010000000000000000015100000000", "P2SH"],

["Tests for CheckTransaction()"],
["No inputs"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0x7a052c840ba73af26755de42cf01cc9e0a49fef0 EQUAL"]],
"0100000000010000000000000000015100000000", "P2SH"],

["No outputs"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0x05ab9e14d983742513f0f451e105ffb4198d1dd4 EQUAL"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006d483045022100f16703104aab4e4088317c862daec83440242411b039d14280e03dd33b487ab802201318a7be236672c5c56083eb7a5a195bc57a40af7923ff8545016cd3b571e2a601232103c40e5d339df3f30bf753e7e04450ae4ef76c9e45587d1d993bdc4cd06f0651c7acffffffff0000000000", "P2SH"],

["Negative output"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0xae609aca8061d77c5e111f6bb62501a6bbe2bfdb EQUAL"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006d4830450220063222cbb128731fc09de0d7323746539166544d6c1df84d867ccea84bcc8903022100bf568e8552844de664cd41648a031554327aa8844af34b4f27397c65b92c04de0123210243ec37dee0e2e053a9c976f43147e79bc7d9dc606ea51010af1ac80db6b069e1acffffffff01ffffffffffffffff015100000000", "P2SH"],

["MAX_MONEY + 1 output"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0x32afac281462b822adbec5094b8d4d337dd5bd6a EQUAL"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006e493046022100e1eadba00d9296c743cb6ecc703fd9ddc9b3cd12906176a226ae4c18d6b00796022100a71aef7d2874deff681ba6080f1b278bac7bb99c61b08a85f4311970ffe7f63f012321030c0588dc44d92bdcbf8e72093466766fdc265ead8db64517b0c542275b70fffbacffffffff010140075af0750700015100000000", "P2SH"],

["MAX_MONEY output + 1 output"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0xb558cbf4930954aa6a344363a15668d7477ae716 EQUAL"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000006d483045022027deccc14aa6668e78a8c9da3484fbcd4f9dcc9bb7d1b85146314b21b9ae4d86022100d0b43dece8cfb07348de0ca8bc5b86276fa88f7f2138381128b7c36ab2e42264012321029bb13463ddd5d2cc05da6e84e37536cb9525703cfd8f43afdb414988987a92f6acffffffff020040075af075070001510001000000000000015100000000", "P2SH"],

["Duplicate inputs"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0x236d0639db62b0773fd8ac34dc85ae19e9aba80a EQUAL"]],
"01000000020001000000000000000000000000000000000000000000000000000000000000000000006c47304402204bb1197053d0d7799bf1b30cd503c44b58d6240cccbdc85b6fe76d087980208f02204beeed78200178ffc6c74237bb74b3f276bbb4098b5605d814304fe128bf1431012321039e8815e15952a7c3fada1905f8cf55419837133bd7756c0ef14fc8dfe50c0deaacffffffff0001000000000000000000000000000000000000000000000000000000000000000000006c47304402202306489afef52a6f62e90bf750bbcdf40c06f5c6b138286e6b6b86176bb9341802200dba98486ea68380f47ebb19a7df173b99e6bc9c681d6ccf3bde31465d1f16b3012321039e8815e15952a7c3fada1905f8cf55419837133bd7756c0ef14fc8dfe50c0deaacffffffff010000000000000000015100000000", "P2SH"],

["Coinbase of size 1"],
["Note the input is just required to make the tester happy"],
[[["0000000000000000000000000000000000000000000000000000000000000000", -1, "1"]],
"01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff0151ffffffff010000000000000000015100000000", "P2SH"],

["Coinbase of size 101"],
["Note the input is just required to make the tester happy"],
[[["0000000000000000000000000000000000000000000000000000000000000000", -1, "1"]],
"01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff655151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151ffffffff010000000000000000015100000000", "P2SH"],

["Null txin"],
[[["0000000000000000000000000000000000000000000000000000000000000000", -1, "HASH160 0x14 0x02dae7dbbda56097959cba59b1989dd3e47937bf EQUAL"]],
"01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff6e49304602210086f39e028e46dafa8e1e3be63906465f4cf038fbe5ed6403dc3e74ae876e6431022100c4625c675cfc5c7e3a0e0d7eaec92ac24da20c73a88eb40d09253e51ac6def5201232103a183ddc41e84753aca47723c965d1b5c8b0e2b537963518355e6dd6cf8415e50acffffffff010000000000000000015100000000", "P2SH"],

["Same as the transactions in valid with one input SIGHASH_ALL and one SIGHASH_ANYONECANPAY, but we set the _ANYONECANPAY sequence number, invalidating the SIGHASH_ALL signature"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0x21 0x035e7f0d4d0841bcd56c39337ed086b1a633ee770c1ffdd94ac552a95ac2ce0efc CHECKSIG"],
  ["0000000000000000000000000000000000000000000000000000000000000200", 0, "0x21 0x035e7f0d4d0841bcd56c39337ed086b1a633ee770c1ffdd94ac552a95ac2ce0efc CHECKSIG"]],
 "01000000020001000000000000000000000000000000000000000000000000000000000000000000004948304502203a0f5f0e1f2bdbcd04db3061d18f3af70e07f4f467cbc1b8116f267025f5360b022100c792b6e215afc5afc721a351ec413e714305cb749aae3d7fee76621313418df10101000000000200000000000000000000000000000000000000000000000000000000000000000000484730440220201dc2d030e380e8f9cfb41b442d930fa5a685bb2c8db5906671f865507d0670022018d9e7a8d4c8d86a73c2a724ee38ef983ec249827e0e464841735955c707ece98101000000010100000000000000015100000000", "P2SH"],

["CHECKMULTISIG with incorrect signature order"],
["Note the input is just required to make the tester happy"],
[[["b3da01dd4aae683c7aee4d5d8b52a540a508e1115f77cd7fa9a291243f501223", 0, "HASH160 0x14 0xb1ce99298d5f07364b57b1e5c9cc00be0b04a954 EQUAL"]],
"01000000012312503f2491a2a97fcd775f11e108a540a5528b5d4dee7a3c68ae4add01dab300000000fdfe000048304502207aacee820e08b0b174e248abd8d7a34ed63b5da3abedb99934df9fddd65c05c4022100dfe87896ab5ee3df476c2655f9fbe5bd089dccbef3e4ea05b5d121169fe7f5f401483045022100f6649b0eddfdfd4ad55426663385090d51ee86c3481bdc6b0c18ea6c0ece2c0b0220561c315b07cffa6f7dd9df96dbae9200c2dee09bf93cc35ca05e6cdf613340aa014c695221031d11db38972b712a9fe1fc023577c7ae3ddb4a3004187d41c45121eecfdbb5b7210207ec36911b6ad2382860d32989c7b8728e9489d7bbc94a6b5509ef0029be128821024ea9fac06f666a4adc3fc1357b7bec1fd0bdece2b9d08579226a8ebde53058e453aeffffffff0180380100000000001976a914c9b99cddf847d10685a4fabaa0baf505f7c3dfab88ac00000000", "P2SH"],


["The following is a tweaked form of 23b397edccd3740a74adb603c9756370fafcde9bcc4483eb271ecad09a94dd63"],
["It is an OP_CHECKMULTISIG with the dummy value missing"],
[[["60a20bd93aa49ab4b28d514ec10b06e1829ce6818ec06cd3aabd013ebcdc4bb1", 0, "1 0x41 0x04cc71eb30d653c0c3163990c47b976f3fb3f37cccdcbedb169a1dfef58bbfbfaff7d8a473e7e2e6d317b87bafe8bde97e3cf8f065dec022b51d11fcdd0d348ac4 0x41 0x0461cbdcc5409fb4b4d42b51d33381354d80e550078cb532a34bfa2fcfdeb7d76519aecc62770f5b0e4ef8551946d8a540911abe3e7854a26f39f58b25c15342af 2 OP_CHECKMULTISIG"]],
"0100000001b14bdcbc3e01bdaad36cc08e81e69c82e1060bc14e518db2b49aa43ad90ba260000000004847304402203f16c6f40162ab686621ef3000b04e75418a0c0cb2d8aebeac894ae360ac1e780220ddc15ecdfc3507ac48e1681a33eb60996631bf6bf5bc0a0682c4db743ce7ca2b01ffffffff0140420f00000000001976a914660d4ef3a743e3e696ad990364e555c271ad504b88ac00000000", "P2SH"],


["CHECKMULTISIG SCRIPT_VERIFY_NULLDUMMY tests:"],

["The following is a tweaked form of 23b397edccd3740a74adb603c9756370fafcde9bcc4483eb271ecad09a94dd63"],
["It is an OP_CHECKMULTISIG with the dummy value set to something other than an empty string"],
[[["60a20bd93aa49ab4b28d514ec10b06e1829ce6818ec06cd3aabd013ebcdc4bb1", 0, "1 0x41 0x04cc71eb30d653c0c3163990c47b976f3fb3f37cccdcbedb169a1dfef58bbfbfaff7d8a473e7e2e6d317b87bafe8bde97e3cf8f065dec022b51d11fcdd0d348ac4 0x41 0x0461cbdcc5409fb4b4d42b51d33381354d80e550078cb532a34bfa2fcfdeb7d76519aecc62770f5b0e4ef8551946d8a540911abe3e7854a26f39f58b25c15342af 2 OP_CHECKMULTISIG"]],
"0100000001b14bdcbc3e01bdaad36cc08e81e69c82e1060bc14e518db2b49aa43ad90ba260000000004a010047304402203f16c6f40162ab686621ef3000b04e75418a0c0cb2d8aebeac894ae360ac1e780220ddc15ecdfc3507ac48e1681a33eb60996631bf6bf5bc0a0682c4db743ce7ca2b01ffffffff0140420f00000000001976a914660d4ef3a743e3e696ad990364e555c271ad504b88ac00000000", "P2SH,NULLDUMMY"],

["As above, but using a OP_1"],
[[["60a20bd93aa49ab4b28d514ec10b06e1829ce6818ec06cd3aabd013ebcdc4bb1", 0, "1 0x41 0x04cc71eb30d653c0c3163990c47b976f3fb3f37cccdcbedb169a1dfef58bbfbfaff7d8a473e7e2e6d317b87bafe8bde97e3cf8f065dec022b51d11fcdd0d348ac4 0x41 0x0461cbdcc5409fb4b4d42b51d33381354d80e550078cb532a34bfa2fcfdeb7d76519aecc62770f5b0e4ef8551946d8a540911abe3e7854a26f39f58b25c15342af 2 OP_CHECKMULTISIG"]],
"0100000001b14bdcbc3e01bdaad36cc08e81e69c82e1060bc14e518db2b49aa43ad90ba26000000000495147304402203f16c6f40162ab686621ef3000b04e75418a0c0cb2d8aebeac894ae360ac1e780220ddc15ecdfc3507ac48e1681a33eb60996631bf6bf5bc0a0682c4db743ce7ca2b01ffffffff0140420f00000000001976a914660d4ef3a743e3e696ad990364e555c271ad504b88ac00000000", "P2SH,NULLDUMMY"],

["As above, but using a OP_1NEGATE"],
[[["60a20bd93aa49ab4b28d514ec10b06e1829ce6818ec06cd3aabd013ebcdc4bb1", 0, "1 0x41 0x04cc71eb30d653c0c3163990c47b976f3fb3f37cccdcbedb169a1dfef58bbfbfaff7d8a473e7e2e6d317b87bafe8bde97e3cf8f065dec022b51d11fcdd0d348ac4 0x41 0x0461cbdcc5409fb4b4d42b51d33381354d80e550078cb532a34bfa2fcfdeb7d76519aecc62770f5b0e4ef8551946d8a540911abe3e7854a26f39f58b25c15342af 2 OP_CHECKMULTISIG"]],
"0100000001b14bdcbc3e01bdaad36cc08e81e69c82e1060bc14e518db2b49aa43ad90ba26000000000494f47304402203f16c6f40162ab686621ef3000b04e75418a0c0cb2d8aebeac894ae360ac1e780220ddc15ecdfc3507ac48e1681a33eb60996631bf6bf5bc0a0682c4db743ce7ca2b01ffffffff0140420f00000000001976a914660d4ef3a743e3e696ad990364e555c271ad504b88ac00000000", "P2SH,NULLDUMMY"],

["As above, but with the dummy byte missing"],
[[["60a20bd93aa49ab4b28d514ec10b06e1829ce6818ec06cd3aabd013ebcdc4bb1", 0, "1 0x41 0x04cc71eb30d653c0c3163990c47b976f3fb3f37cccdcbedb169a1dfef58bbfbfaff7d8a473e7e2e6d317b87bafe8bde97e3cf8f065dec022b51d11fcdd0d348ac4 0x41 0x0461cbdcc5409fb4b4d42b51d33381354d80e550078cb532a34bfa2fcfdeb7d76519aecc62770f5b0e4ef8551946d8a540911abe3e7854a26f39f58b25c15342af 2 OP_CHECKMULTISIG"]],
"0100000001b14bdcbc3e01bdaad36cc08e81e69c82e1060bc14e518db2b49aa43ad90ba260000000004847304402203f16c6f40162ab686621ef3000b04e75418a0c0cb2d8aebeac894ae360ac1e780220ddc15ecdfc3507ac48e1681a33eb60996631bf6bf5bc0a0682c4db743ce7ca2b01ffffffff0140420f00000000001976a914660d4ef3a743e3e696ad990364e555c271ad504b88ac00000000", "P2SH,NULLDUMMY"],


["Empty stack when we try to run CHECKSIG"],
[[["ad503f72c18df5801ee64d76090afe4c607fb2b822e9b7b63c5826c50e22fc3b", 0, "0x21 0x027c3a97665bf283a102a587a62a30a0c102d4d3b141015e2cae6f64e2543113e5 CHECKSIG NOT"]],
"01000000013bfc220ec526583cb6b7e922b8b27f604cfe0a09764de61e80f58dc1723f50ad0000000000ffffffff0101000000000000002321027c3a97665bf283a102a587a62a30a0c102d4d3b141015e2cae6f64e2543113e5ac00000000", "P2SH"],


["Inverted versions of tx_valid CODESEPARATOR IF block tests"],

["CODESEPARATOR in an unexecuted IF block does not change what is hashed"],
[[["a955032f4d6b0c9bfe8cad8f00a8933790b9c1dc28c82e0f48e75b35da0e4944", 0, "IF CODESEPARATOR ENDIF 0x21 0x0378d430274f8c5ec1321338151e9f27f4c676a008bdf8638d07c0b6be9ab35c71 CHECKSIGVERIFY CODESEPARATOR 1"]],
"010000000144490eda355be7480f2ec828dcc1b9903793a8008fad8cfe9b0c6b4d2f0355a9000000004a48304502207a6974a77c591fa13dff60cabbb85a0de9e025c09c65a4b2285e47ce8e22f761022100f0efaac9ff8ac36b10721e0aae1fb975c90500b50c56e8a0cc52b0403f0425dd0151ffffffff010000000000000000016a00000000", "P2SH"],

["As above, with the IF block executed"],
[[["a955032f4d6b0c9bfe8cad8f00a8933790b9c1dc28c82e0f48e75b35da0e4944", 0, "IF CODESEPARATOR ENDIF 0x21 0x0378d430274f8c5ec1321338151e9f27f4c676a008bdf8638d07c0b6be9ab35c71 CHECKSIGVERIFY CODESEPARATOR 1"]],
"010000000144490eda355be7480f2ec828dcc1b9903793a8008fad8cfe9b0c6b4d2f0355a9000000004a483045022100fa4a74ba9fd59c59f46c3960cf90cbe0d2b743c471d24a3d5d6db6002af5eebb02204d70ec490fd0f7055a7c45f86514336e3a7f03503dacecabb247fc23f15c83510100ffffffff010000000000000000016a00000000", "P2SH"],

["CHECKLOCKTIMEVERIFY tests"],

["By-height locks, with argument just beyond tx nLockTime"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "1 NOP2 1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "499999999 NOP2 1"]],
"0100000001000100000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000fe64cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],

["By-time locks, with argument just beyond tx nLockTime (but within numerical boundries)"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "500000001 NOP2 1"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000065cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "4294967295 NOP2 1"]],
"0100000001000100000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000feffffff", "P2SH,CHECKLOCKTIMEVERIFY"],

["Argument missing"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "NOP2 1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000001b1010000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Argument negative with by-blockheight nLockTime=0"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "-1 NOP2 1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Argument negative with by-blocktime nLockTime=500,000,000"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "-1 NOP2 1"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000065cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000004005194b1010000000100000000000000000002000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Input locked"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0 NOP2 1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000000ffffffff0100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000251b1ffffffff0100000000000000000002000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Another input being unlocked isn't sufficient; the CHECKLOCKTIMEVERIFY-using input must be unlocked"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0 NOP2 1"] ,
  ["0000000000000000000000000000000000000000000000000000000000000200", 1, "1"]],
"010000000200010000000000000000000000000000000000000000000000000000000000000000000000ffffffff00020000000000000000000000000000000000000000000000000000000000000100000000000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Argument/tx height/time mismatch, both versions"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0 NOP2 1"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000065cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000251b100000000010000000000000000000065cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "499999999 NOP2 1"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000065cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "500000000 NOP2 1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "500000000 NOP2 1"]],
"0100000001000100000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000ff64cd1d", "P2SH,CHECKLOCKTIMEVERIFY"],

["Argument 2^32 with nLockTime=2^32-1"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "4294967296 NOP2 1"]],
"0100000001000100000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000ffffffff", "P2SH,CHECKLOCKTIMEVERIFY"],

["Same, but with nLockTime=2^31-1"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "2147483648 NOP2 1"]],
"0100000001000100000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000ffffff7f", "P2SH,CHECKLOCKTIMEVERIFY"],

["6 byte non-minimally-encoded arguments are invalid even in their contents are valid"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "0x06 0x000000000000 NOP2 1"]],
"010000000100010000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Failure due to failing CHECKLOCKTIMEVERIFY in scriptSig"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "1"]],
"01000000010001000000000000000000000000000000000000000000000000000000000000000000000251b1000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Failure due to failing CHECKLOCKTIMEVERIFY in redeemScript"],
[[["0000000000000000000000000000000000000000000000000000000000000100", 0, "HASH160 0x14 0xc5b93064159b3b2d6ab506a41b1f50463771b988 EQUAL"]],
"0100000001000100000000000000000000000000000000000000000000000000000000000000000000030251b1000000000100000000000000000000000000", "P2SH,CHECKLOCKTIMEVERIFY"],

["Make diffs cleaner by leaving a comment here without comma at the end"]
]
