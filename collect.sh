#! bin/bash
# author:huangshengcong
function mergefile {
	file_list=()
	for i  in `seq 1 10`; do
		echo "$i"
		find $work_Path$i -name $target_file | xargs -I {} cp {} $DIR$i"_"$target_file
		file_list+=$i"_"$target_file" "
	done
	#echo $file_list
}
work_Path=/home/aaa/Desktop/Room2/exp1-2/12cm/
# iso
DIR=$work_Path"result_data/log_bin/iso/"
target_file=0_receptor.root
mergefile

cd $DIR
rm -f iso.root
hadd iso.root $file_list
cp iso.root $work_Path"result_data/log_bin/data_ana/12cm_iso.root"
pwd
cd $work_Path
pwd

#loop
deg=("0deg" "45deg" "90deg")
distance=("25cm" "50cm" "100cm" "150cm" "200cm")
n=0

for j in `seq 0 2`;do
	for k in `seq 0 4`;do
		DIR=$work_Path"result_data/log_bin/"${deg[$j]}"/"${distance[$k]}"/"
		let n++
		target_file=$n"_receptor.root"
		mergefile
		cd $DIR
		rm -f ${deg[$j]}"_"${distance[$k]}".root"
		hadd ${deg[$j]}"_"${distance[$k]}".root" $file_list
		cp ${deg[$j]}"_"${distance[$k]}".root" $work_Path"result_data/log_bin/data_ana/12cm_"${deg[$j]}"_"${distance[$k]}".root"
		pwd
		cd $work_Path
		pwd
	done		
done
