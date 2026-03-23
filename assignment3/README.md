Assignment 3
Due Mar 21 by 11:59pm Points 100 Submitting a file upload Available Mar 8 at 12am - Mar 23 at 11:59pm
 

CS157C: NoSQL Database Systems
Assignment 3 (Replication and Sharding)
Instructor: Dr. Kim
This assignment is to have hands-on exercises for MongoDB Replica Set and Sharding. You will first deploy and manipulate a replica set in a single server, and then in a cluster of three servers. You will also deploy a sharded cluster of three shards in a single server.
With the use of Docker and the given automation scripts, the need for troubleshooting is expected to be minimal. If any troubleshooting is required to complete the given tasks, it should be considered part of this assignment.
In a required screenshot, make sure to include the title of the window frame that shows the hostname of your system. This is required to ensure the identity of your screenshot. Required screenshots are interleaved in the assignment description.
Have all answers in hw3.pdf and submit it. 
Task 1
To deploy a replica set of three members in a single server, following ReplicationSingleNodeSetup.html document.
Screen1: Get the screenshots of rs.status() and rs.config() after finishing all the steps described in this document.

Populate data in the primary member using the following script.
use test
var bulk = db.test_collection.initializeUnorderedBulkOp();
people = ["Marc", "Bill", "George", "Eliot", "Matt", "Trey", "Tracy", "Greg", "Steve", "Kristina", "Katie", "Jeff"];
for(var i=0; i<1000000; i++){
   user_id = i;
   name = people[Math.floor(Math.random()*people.length)];
   number = Math.floor(Math.random()*10001);
   bulk.insert( { "user_id":user_id, "name":name, "number":number });
}
bulk.execute();
Screen2: Read test_collection from PRIMARY. Limit the output to 10.
Screen3: Read test_collection from one of the secondaries. Limit the output to 10.
Task 2
To deploy a replica set of three members in a cluster of three servers using the ReplicationClusterSetup.html automation script. The scripts automate the replica deployment steps described in this document (https://www.mongodb.com/docs/manual/tutorial/deploy-replica-set/). Note:
You should run bootstrap-ubuntu.sh in a terminal of your local laptop, not inside a docker container.
Window users: When bootstrap-ubuntu.sh gets to the following part of the script:
docker exec -t mongodb0.example.net /tmp/setup-replication.sh
docker exec -t mongodb0.example.net /tmp/populate-testdata.sh  
You may get an error "OCI runtime exec failed: exec failed: container_linux.go:345: starting container process caused "no such file or directory": unknown". That is because ^M is attached to every line of the scripts in your window in a way that #/bin/bash is not recognized because of #/bin/bash^M. In mongodb0.example.net, do the following to remove ^M.
root@mongodb0:/tmp# tr '\015' '\012' < setup-replication.sh > new
root@mongodb0:/tmp# mv new setup-replication.sh
root@mongodb0:/tmp# chmod 755 setup-replication.sh
Do the same for populate-testdata.sh
Manually run setup-replication.sh and populate-testdata.sh in mongodb0.example.net.
Screen4: Get the screenshots of rs.status() and rs.config() after finishing the steps described in this document.
Screen5: Read test_collection from PRIMARY. Limit the output to 10.
Screen6: Read test_collection from one of the secondaries. Limit the output to 10.

Make the primary step-down and see which node is elected as a new primary.
Specify the command to make this happen.
Screen7: Get the screenshot of rs.status() before stepping down the primary. Specify the hostname of the primary.
Screen8: Get the screenshot of rs.status() after stepping-down the primary. Specify the hostname of the new primary.
Stop the Docker container of Primary. You do not need any screenshot. Describe what you observed in the replica set.
Stop another Docker container. You do not need any screenshot. Describe what you observed in the replica set.
Task 3
To deploy a sharded cluster in a single server, following ShardingSingleNodeSetup.html document. You don't have to include screenshots of this process except for the items as required below.
Include the results of VI-3, VI-4, and VI-5.
VI-3: Check the number of documents in shard0000, shard0001, and shard0002. What do you observe?
VI-4: Insert an additional 100000 documents into the sharded cluster and check the total number of documents in testcollection and the number of documents in each shard.
VI-5: Include the final shard status after finishing all the steps of the given document.