module BencodeTests (tests) where

import FuncTorrent.Bencode (encode, decode, BVal(..))

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.QuickCheck (testProperty)

propEncodeDecode :: BVal -> Bool
propEncodeDecode bval = let encoded = encode bval
                            decoded = decode encoded
                        in Right bval == decoded

qcTests :: TestTree
qcTests = testGroup "QuickCheck tests" [ testProperty "encode/decode" propEncodeDecode ]

tests :: TestTree
tests = testGroup "Tests" [qcTests]
