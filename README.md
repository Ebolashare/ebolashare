EBOLA
====

ebolashare "EBOLA" a pure PoS Charity Experiment

Algorithm: X13 - Full POS

Ticker: Ebola

Current Version "3.0.0.0"

Max Coins: TBA Ebola

MinStakeAge: 21 hour, MaxStakeAge: Unlimited, 100% Annual Interest

RPC Port: 9332

30 Blocks to mature

30 seconds  block time

Block Reward Schedule:

Block 1 is 2,100,000  Premine 100% block


Boosted by devs with 15k pow blocks with 0 reward (to ensure the blockchain generation work until the PoS part gets secured). We use X13 light PoW algorithm to this task.




==========================================================

How to compile the daemon (handy info for exchanges or services):

     git clone https://github.com/Ebolashare/ebolashare.git

     cd ebolashare/src
     mkdir obj
     chmod +x leveldb/build_detect_platform
     make -f makefile.unix
     strip ebolashared
     # Go celebrate ;)
