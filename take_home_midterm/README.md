
Skip To Content
Kushagra Bainsla
Account
Dashboard
Courses
Groups
Calendar
Inbox
History
Studio
10 unread release notes.10
Help
Library
SP26: CS-157C Sec 81 - NoSQLAssignmentsTake Home Midterm

Spring 2026
Home
Announcements
Syllabus
Modules
Assignments
Quizzes
Grades
IgniteAI Search
SJSU Official Syllabus
Zoom
Pages
People
Take Home Midterm
Due Wednesday by 11:59pm Points 100 Submitting a file upload Available Mar 23 at 12am - Apr 10 at 11:59pm
CS157C: NoSQL Database Systems
Take-Home Midterm Exam
Instructor: Dr. Kim
Maximum obtainable score: 100 points

The tasks given in this exam should be done in the AWS Learners' Lab, where you have $50credit. When an AWS instance is not being used, you should pause it so that you are not being charged unnecessarily.
What to submit: Include all your answers in midterm.pdf and submit it.
Each screenshot must include the name of the host from which it was taken.
Troubleshooting is your responsibility.
Problem Description
Required: In AWS, set up a MongoDB cluster with at least 3 nodes, including a sharding system consisting of three shards, one mongos, and a replica set of three config servers. The config servers should be deployed in a replica set.
You may launch the replica set of config servers on nodes of your choice.
Each shard should be replicated in a replica set with three members. You may launch the members of a replica set on nodes of your choice.
Carefully read the following task description. I suggest you plan the entire process for completing the tasks before actual deployment and implementation.
Tasks
For each task, describe the steps and procedures, and include screenshot(s) to demonstrate the task was completed. It is your responsibility to select suitable screenshots to show your work. You do not need to follow the exact order provided below. Ensure that your identity is visible in each screenshot, either in the form of the IP address of the Ubuntu container (e.g., a prompt like ubuntu@35.174.136.58 for terminal screenshots) or your AWS account information for screenshots taken in the AWS console.

(5 Points) Set up nodes in AWS. Determine the number of nodes based on your deployment plan. (There should be at least 3 nodes.)
(5 points) Access these instances (nodes) through SSH
(5 Points) Install MongoDB in each node (i.e. instance)
(3 points) Create a directory to store database in each node
(5 points) Specify Public and Private IP Addresses of AWS instances used in your solution.
(6 points) Set up and launch three config servers in a replica set.
(5 points) Connect mongos to each config server.
(10 points) Set up and launch each of the three shards. Make sure to include the result of sh.status() before adding the shards, which will be done in the next task.
(5 points) Add the shards and ensure you include the result of sh.status() after adding them.
(5points) Enable the shards and explain the nature of the shard key (ascending, random, or location-based) as well as the sharding strategy (range-based or hash-based) used in your deployment.
(10 points) Populate the cluster with data using a public dataset. Explain your collection and include the code to populate the data, along with the result of sh.status() after the data is populated. Specify the URL for the dataset. (Refer to Task 12 to choose an appropriate dataset for executing the given queries. You are allowed to clean and reduce the public dataset of your choice to populate a reasonable amount of data to be distributed across the shards. You may determine what constitutes a reasonable amount.) You are not permitted to use zips.json provided in the prior assignment. If the public dataset you choose is not large enough, you are allowed to synthesize additional data to scale it.
(12 points) Generate the following queries for the populated data. For each query, show its execution time and also show which shard served the query.
A range query to find documents in a given range.
A query involving $elemMatch involving at least two conditions.
A query involving $in, $nin, or $all
A query involving aggregate()
A update
A delete
(5 points) Show shards are replicated using rs.status().
(5 points) List of hosts and describe what are deployed in each host. For example,
node0:port#  config server PRIMARY
node1:port#  config server SECONDARY
...
Grading
Criteria	Maximum Obtainable Scores
14 Tasks	86 points
The use of public data set	4 points
Clarity and Organization of report	10 points
Total	100 points
Suggested Reference
The following is provided for your reference. However, you are primarily responsible to find information to complete the given tasks.

AWS Learners Lab InstructionLinks to an external site.

Deploy a Sharded Cluster [MongoDB]Links to an external site.
How to setup MongoDB Sharded Cluster with Replicasets on AWS - Part 3Links to an external site.

