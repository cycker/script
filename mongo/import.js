D=db.getSisterDB("dbname")
str="123456789"
obj={tim:1,int1:1,int2:2,char3:str}
for(i=1;i<10;i++) {
	obj._id = i;
	D.tb_1g.insert(obj);
}
