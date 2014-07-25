for datafile in *[AB].txt
do
   echo $datafile
   bash goostats -J 100 -r $datafile stats-$datafile
done
