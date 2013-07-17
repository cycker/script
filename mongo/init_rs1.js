hostname="cycker-T61"
rsconf = {
_id: "rs1", members: [ { _id: 0, host: hostname+":27020" } ] 
}
rs.initiate( rsconf )
rs.add(hostname+":27021")
rs.add(hostname+":27022")

