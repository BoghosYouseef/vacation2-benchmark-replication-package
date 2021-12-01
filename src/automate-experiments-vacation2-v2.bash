#!/bin/bash

# last modified: 10/11/2021

# path to experiments folder:
# ~/Desktop/student-workSpace

# path to working git repository:
#  /home/messy/Workspace-boghos-youseef/

echo "Starting Automation Script..."


# this is the benchmark version with transacional actors
#lein run -- -vtxact -w 4 -s 8 -t 30 -n 300

# this is the original version of the benchmark
#
#lein run -- -v original -w 4 -s 8 -t 30 -n 300

# Paramteres defintion:
# -v either orginal or txact.
# -w the number of primary worker actors.
# -s the number of secondary worker actors. (this is only available for txact version)
# -t the numver of reservations.
# -n number of queries per relation per reservation.
# -r number of flights/rooms/cars.
# -p work factor for password generation.
# -d prnt debug information

#Version=txact
#primary_worker_actors=1
#secondary_worker_actors=20
#num_reservations=50
#num_queries=10
addition_factor=4

primary_worker_actors=1
secondary_worker_actors=1
num_reservations=1000
num_flights_cars=50
num_queries=10
p=5



echo "currently running Bash ${BASH_VERSION}"
#echo "Do you want to run the original version?(y/n)"
#read answer
#
#if [[ "$answer" == 'y' ]];
#	then Version=original 
#else version=txact
#	echo "how many secondary workers?"
#	read secondary_worker_actors
#
#fi

#echo "How many points do you need?"
#read num_of_points

#echo "write the name of the output file"
#read output_name

#if [[ "$output_name" == 0 ]];
#	then
#		echo "no output file will be produced for this run"
#fi

threads="1 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64"
secondary_threads="1 2 8 64"

echo creating the folders neccessary for the replication of the experiment...

mkdir execution-times
mkdir experiment-outputs

cd execution-times

mkdir original
for i in $secondary_threads
do
	mkdir "txact-$i"
done
cd ../experiment-outputs
mkdir original

for i in $secondary_threads
do
	mkdir "txact-$i"
done

cd ..

runExperiment(){

	# first argument ($1): experiment version
	# second argument($2): number of secondary threads	
	# third argument ($3): number of repetitions of the experiment

	if [[ "$1" == "original" ]];
		then 	
			local outputDir='original'
	else
		
		local outputDir="txact-$2"
		echo --------------------output dir: $outputDir
	fi

	for j in $( seq 0 $3 )
	do
		for i in $threads
		do

			cd ../vacation2
			echo "now in loop number ${i}"

			echo "Running the script with the following options:  -v $1 -w ${i} -s $2 -t ${num_reservations} -r ${num_flights_cars} -n ${num_queries} -p ${p}"
		
			output=$(lein run -- -v $1 -w ${i} -s $2 -t ${num_reservations} -r ${num_flights_cars} -n ${num_queries} -p ${p})
			output_name="output${j}-$1-$2-vacation2-linux.txt"
			echo ${output_name}

			cd ../src/experiment-outputs/$outputDir
			
			echo "Now writing the results to ${output_name}."
			echo ${output} >> ./${output_name}
			cd ../../
		done
	done
}

gtimefile(){
  

	cd experiment-outputs/$1
	
	echo path befor for loop
	pwd
	for f in *;
	do

		echo "file name : ${f}"
		mawk '/time/ {print $(NF - 1)}' ${f} >> ../../execution-times/$1/"execution-time-${f}"
	done 
	echo "Output file created!"
	cd ../../

	echo path after for loop and cd
	pwd
}




runExperiment "original" "0" "2"
gtimefile "original" 



runExperiment "txact" "1" "2"
gtimefile "txact-1" 


runExperiment "txact" "2" "2"
gtimefile "txact-2"


runExperiment "txact" "8" "2"
gtimefile "txact-8"


runExperiment "txact" "64" "2"
gtimefile "txact-64"
# echo ${output2} | sed -n "s/\([0-9]\{4\}\.[0-9]\{3\}\)/"
echo starting plotter....

python3 plotting-program.py


echo "shell program done!"
echo graphs can be found in src/graphs/
echo "-----------------------"
