# vacation2-benchmark-replication-package
This is a replication package that runs the vacation2 benchmark. 

## Assumptions/Pre-requisites
Desktop with 16 at least 16 Gb Memory.
processor      Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz
disk           512GB ADATA SSD SX900
system         OptiPlex 9020 (05A4)

## Accuracy tip
Make sure to reduce the amount of processes active in the background as much as possible when running the experiment to increase the accuracy and reliability of the results.

### Software
20.04.2-Ubuntu
x86_64 GNU/Linux

#### Lein




## Recommended Setup

1. Clone this repo using the command in the terminal: `git clone https://github.com/BoghosYouseef/vacation2-benchmark-replication-package`
2. Go inside the src folder inside the repo using the command: `cd vacation2-benchmark-replication-package/src/`
3. Make the bash script executable using the command: `sudo chmod +x automate-experiments-vacation2-v2.bash`
4. Run the script using the command: `bash automate-experiments-vacation2-v2.bash`

When the script is done, there should be 3 new directories in the folder src/. One of those directories is called graphs
there you can find the two graphs generated after running the experiment.

**Note:** The automate-experiments-vacation2-v2.bash script only reproduces the experiment twice for each setting and takes the median of that to save time.

#lein run -- -v original -w 4 -s 8 -t 30 -n 300

term
: definition 


#### Paramteres defintion:

#### -v either orginal or txact.
#### -w the number of primary worker actors.
#### -s the number of secondary worker actors. (this is only available for txact version)
#### -t the numver of reservations.
#### -n number of queries per relation per reservation.
#### -r number of flights/rooms/cars.
#### -p work factor for password generation.
#### -d prnt debug information

