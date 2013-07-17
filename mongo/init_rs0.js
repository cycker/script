hostname="cycker-T61"
rsconf = {
_id: "rs0", members: [ { _id: 0, host: hostname+":27017" } ] 
}
rs.initiate( rsconf )
rs.add(hostname+":27018")
rs.add(hostname+":27019")

