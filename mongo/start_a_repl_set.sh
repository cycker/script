export LC_ALL=C
DATA=/home/hduser/mongo/data
BIN=/usr/local/mongodb/bin
for d in rs0-0 rs0-1 rs0-2 rs1-0 rs1-1 rs1-2 config-0  mongos-0 
do
	mkdir -p $DATA/$d
done

cd /usr/local/mongodb/bin/
$BIN/mongod --port 27017 --keyFile $DATA/keyfile --dbpath  $DATA/rs0-0 --replSet rs0 --smallfiles --oplogSize 1 --fork --logpath $DATA/rs0-0/m.log --rest
$BIN/mongod --port 27018 --keyFile $DATA/keyfile --dbpath  $DATA/rs0-1 --replSet rs0 --smallfiles --oplogSize 1 --fork --logpath $DATA/rs0-1/m.log --rest
$BIN/mongod --port 27019 --keyFile $DATA/keyfile --dbpath  $DATA/rs0-2 --replSet rs0 --smallfiles --oplogSize 1 --fork --logpath $DATA/rs0-2/m.log --rest
$BIN/mongod --port 27020 --keyFile $DATA/keyfile --dbpath  $DATA/rs1-0 --replSet rs1 --smallfiles --oplogSize 1 --fork --logpath $DATA/rs1-0/m.log --rest
$BIN/mongod --port 27021 --keyFile $DATA/keyfile --dbpath  $DATA/rs1-1 --replSet rs1 --smallfiles --oplogSize 1 --fork --logpath $DATA/rs1-1/m.log --rest
$BIN/mongod --port 27022 --keyFile $DATA/keyfile --dbpath  $DATA/rs1-2 --replSet rs1 --smallfiles --oplogSize 1 --fork --logpath $DATA/rs1-2/m.log --rest
$BIN/mongod --port 29017 --keyFile $DATA/keyfile --configsvr --dbpath  $DATA/config-0 --smallfiles  --fork --logpath $DATA/config-0/m.log --rest
$BIN/mongos --port 31017 --keyFile $DATA/keyfile --configdb cycker-T61:29017 --fork --logpath $DATA/mongos-0/m.log 

