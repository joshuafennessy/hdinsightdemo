##only run on the first headnode 
lhost=$(hostname)
if [[ $lhost != *"hn0"* ]]
then
	exit 0
fi
	
##setup directories
rm -rf ~/weather_temp

mkdir ~/weather_temp
cd ~/weather_temp

##download sample files from NOAA
ftp -inpv ftp.ncdc.noaa.gov << EOF

user anonymous jfennessy@blue-granite.com

cd /pub/data/ghcn/daily
mget ghcnd-stations.txt ghcnd-states.txt

cd by_year
mget 2015.csv.gz 2014.csv.gz 2016.csv.gz

close
bye
EOF

##unzip files
gunzip ~/weather_temp/*.csv.gz

##upload to HDFS
hadoop fs -rm -r /data/weather/
hadoop fs -mkdir -p /data/weather/daily
hadoop fs -put ~/weather_temp/2015.csv /data/weather/daily
hadoop fs -put ~/weather_temp/2014.csv /data/weather/daily
hadoop fs -put ~/weather_temp/2016.csv /data/weather/daily

hadoop fs -mkdir -p /data/weather/stations
hadoop fs -put ~/weather_temp/ghcnd-stations.txt /data/weather/stations

hadoop fs -mkdir -p /data/weather/states
hadoop fs -put ~/weather_temp/ghcnd-states.txt /data/weather/states

##clean up file system
rm -rf ~/weather_temp

##add a section here to copy to ADL -- use a parameter to drive branch
##TODO
