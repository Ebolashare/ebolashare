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

     # the bitcoin repository is needed to obtain libdb4.8 since ubuntu official reps do not have it.
     sudo add-apt-repository ppa:bitcoin/bitcoin

     # install needed dependencies:
     sudo apt-get update && sudo apt-get install build-essential libssl-dev libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev

     # clone ebolashare sources to your computer:
     git clone https://github.com/Ebolashare/ebolashare.git

     # compile the daemon:
     cd ebolashare/src
     mkdir obj
     chmod +x leveldb/build_detect_platform
     make -f makefile.unix
     strip Ebolashared
     # Go celebrate ;)
