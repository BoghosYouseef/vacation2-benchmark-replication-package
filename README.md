# vacation2-benchmark-replication-package
This is a replication package that runs the vacation2[1][2] benchmark. 

## Assumptions/Pre-requisites
Desktop computer with at least 16 Gb Memory.
processor      Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz
disk           512GB ADATA SSD SX900
system         OptiPlex 9020 (05A4)

## Accuracy tip
Make sure to reduce the amount of processes active in the background as much as possible when running the experiment to increase the accuracy and reliability of the results.

### Software
20.04.2-Ubuntu
x86_64 GNU/Linux

#### Lein
You can run the program using [Leiningen](https://leiningen.org/). Follow the instructions at that website to install and setup leiningen.

To test if Leiningen is working, clone the repo and navigate to the /vacation2 directory inside the terminal using the command:<br />
`$ cd vacation2-benchmark-replication-package/vacation2`

Then run the command

`$ lein run -- -v original -w 1 -s 0 -t 1000 -r 50 -n 10 -p 5`

some output should pop up, when the execution is done, the last output should be the parameters used inside the experiment. Defined at the end of this README.md

**Note:** Those parameters were the ones chosen and run by the original authors.[2]<br />
**Important:** Make sure lein command is working, otherwise the script will not work.


## Recommended Setup

1. Clone this repo using the command in the terminal:<br /> `git clone https://github.com/BoghosYouseef/vacation2-benchmark-replication-package`
2. Go inside the src folder inside the repo using the command:<br /> `cd vacation2-benchmark-replication-package/src/`
3. Make the bash script executable using the command:<br /> `sudo chmod +x automate-experiments-vacation2-v2.bash`
4. Run the script using the command:<br /> `bash automate-experiments-vacation2-v2.bash`

When the script is done, there should be 3 new directories in the folder src/. One of those directories is called graphs
there you can find the two graphs generated after running the experiment.

**Note:** The automate-experiments-vacation2-v2.bash script only reproduces the experiment twice for each setting and takes the median of that to save time.



## Paramteres defintion:

#### -v either orginal or txact.
#### -w the number of primary worker actors.
#### -s the number of secondary worker actors. (this is only available for txact version)
#### -t the numver of reservations.
#### -n number of queries per relation per reservation.
#### -r number of flights/rooms/cars.
#### -p work factor for password generation.
#### -d prnt debug information

# References
[1] github repo of the original [vacation2](https://github.com/jswalens/vacation2) benchmark <br />
[2] Swalens, J., Koster, J. D., & Meuter, W. D. (2021). Chocola: Composable Concurrency Language. ACM Transactions on Programming Languages and Systems (TOPLAS), 42(4), 1-56.
