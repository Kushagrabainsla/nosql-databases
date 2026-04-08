# Take-Home Midterm Task Plan

This document lists every required task and exactly what you must do and capture for full credit.

## Global requirements (apply to every task)
- Perform work in AWS Learners' Lab.
- Pause instances when not in use to avoid charges.
- Include your identity in every screenshot (terminal prompt like ubuntu@<public-ip> or AWS console showing your account).
- Put all answers and screenshots into midterm.pdf for submission.

## Task 1 (5 pts): Set up nodes in AWS
What to do:
- Launch the required EC2 instances based on your deployment plan (minimum 3 nodes, more if using dedicated roles).
- Use the same VPC/subnet so private IP routing works.
- Tag instances clearly (node1, node2, ...).
What to capture:
- AWS console screenshot showing instance list with public/private IPs and your AWS identity.

## Task 2 (5 pts): Access instances through SSH
What to do:
- SSH into each instance using your key pair.
- Verify you can reach all nodes.
What to capture:
- Terminal screenshot(s) showing ubuntu@<public-ip> prompt for each node (or enough to prove access).

## Task 3 (5 pts): Install MongoDB on each node
What to do:
- Install MongoDB on every instance (config servers, shard members, mongos host).
- Verify version using mongod --version or mongosh --version.
What to capture:
- Terminal output showing installation success and version.

## Task 4 (3 pts): Create database directories
What to do:
- Create db paths for each role (e.g., /data/configdb, /data/shardA, /data/shardB, /data/shardC).
- Set correct permissions (mongodb user or current user depending on service setup).
What to capture:
- Terminal output of ls -l showing directories exist.

## Task 5 (5 pts): Specify public and private IPs
What to do:
- Record public and private IP for each instance.
What to capture:
- AWS console screenshot showing both IPs.
- Also include a table in the report listing node name, public IP, private IP.

## Task 6 (6 pts): Set up 3 config servers in a replica set
What to do:
- Start mongod on three nodes using --configsvr and a shared replica set name.
- Initialize the config replica set with rs.initiate().
- Confirm PRIMARY/SECONDARY status.
What to capture:
- Terminal output of rs.status() showing 3 members.

## Task 7 (5 pts): Connect mongos to config servers
What to do:
- Start mongos with --configdb <csrsName/host1:27019,host2:27019,host3:27019>.
- Verify you can connect using mongosh to mongos.
What to capture:
- Terminal showing mongos started and mongosh connected.

## Task 8 (10 pts): Set up and launch each of the 3 shards
What to do:
- For each shard, start 3 mongod instances with --shardsvr and unique replica set names.
- Initiate each shard replica set with rs.initiate().
- From mongos, run sh.status() BEFORE adding shards.
What to capture:
- rs.status() for each shard.
- sh.status() output before shards are added.

## Task 9 (5 pts): Add the shards
What to do:
- Add each shard replica set using sh.addShard().
- Run sh.status() AFTER adding shards.
What to capture:
- sh.status() output after shards are added (showing 3 shards).

## Task 10 (5 pts): Enable sharding + shard key explanation
What to do:
- sh.enableSharding("dbName").
- sh.shardCollection("dbName.collection", { key: 1 } or { key: "hashed" }).
- Explain shard key nature (ascending/random/location-based) and sharding strategy (range or hash).
What to capture:
- Output from sh.shardCollection() or sh.status().

## Task 11 (10 pts): Populate data using public dataset
What to do:
- Choose a public dataset (not zips.json).
- Use mongoimport or a script to load data into the sharded collection.
- Provide dataset URL.
- Run sh.status() after data is loaded.
What to capture:
- Import command output and dataset URL.
- sh.status() output after loading data.

## Task 12 (12 pts): Required queries + timing + shard
What to do:
- Run each query and show execution time and which shard served it.
Required queries:
- Range query
- $elemMatch with at least two conditions
- $in or $nin or $all
- aggregate()
- update
- delete
What to capture:
- Query text
- explain("executionStats") showing shard info and timing

## Task 13 (5 pts): Show shard replication status
What to do:
- Run rs.status() on each shard replica set.
What to capture:
- rs.status() output showing PRIMARY/SECONDARY members.

## Task 14 (5 pts): List of hosts and deployments
What to do:
- Create a host-role list, e.g.
  node1:27019 config PRIMARY
  node2:27019 config SECONDARY
  node3:27019 config SECONDARY
  node4:27018 shardA PRIMARY
  ...
What to capture:
- A clear table or list in the report.

## Report quality (10 pts): Clarity and organization
What to do:
- Organize the PDF in the same order as tasks.
- Label each task clearly.
- Place screenshots directly under the task.
- Include short explanations of what each screenshot proves.

---

Next step: confirm whether you want a strict 13-instance plan or a cost-optimized plan, and I will map the exact node layout and proceed to Task 1 setup steps.
