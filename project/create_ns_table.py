import json,sys
jsonfile_path=sys.argv[1]
#ns_table_path=sys.argv[2]

json_open = open( jsonfile_path , 'r')
source_ns_table = json.load(json_open)


node_name_table={}

for node in source_ns_table:
    tmpdict = {}
    tmpdict[node["node"]["original"]] = node["node"]["original"]
    node_name_table.update(tmpdict)

tp_name_table = {}
for node in source_ns_table:
    parentdict = {}
    parentdict[node["node"]["original"]] = {}
    for iflist in node["iflist"]:
        childdict = {}
        if ("Seg" in str(node["node"]["original"])):
          childdict[iflist["original"]] = node["node"]["clab"].lower() + "_" + iflist["clab"]
          childdict[node["node"]["clab"].lower() + "_" + iflist["clab"]] = iflist["original"]
        else:
          childdict[iflist["original"]] = iflist["clab"]
          childdict[iflist["clab"]] = iflist["original"]
        parentdict[node["node"]["original"]].update(childdict)
    tp_name_table.update(parentdict)

ns_table = {}
ns_table["node_name_table"] = node_name_table
ns_table["tp_name_table"] = tp_name_table
print (str(json.dumps(ns_table)))
