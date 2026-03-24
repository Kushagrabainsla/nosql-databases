Individual Tasks
Due Wednesday by 11:59pm Points 70 Submitting a file upload Available Feb 23 at 12am - Mar 25 at 11:59pm
I. Individual Tasks
Task 1: Neo4j Graph Academy Courses
You may need to allocate additional time beyond the hour(s) specified by Graph Academy.

Complete Neo4j FundamentalsLinks to an external site.
Complete Cypher FundamentalsLinks to an external site.
Complete Intermediate Cypher QueriesLinks to an external site.
In your Neo4j account, click on your account name (e.g., your email) at the top right corner, then go to Rewards and Achievements and select My Achievements. Take a screenshot of all certificates (expecting 3) for submission.

Task 2: Graph Data Model Design
You will model a social network where users can:

Friend each other.
Post status updates.
Like other users' posts.
Nodes
User: Represents a person in the network.
Attributes: name, age, city
Post: Represents a status update made by a user.
Attributes: content, timestamp
Relationships
FRIENDS: Connects two User nodes, representing a friendship between them.
POSTED: Connects a User to a Post, indicating that the user authored the post.
LIKES: Connects a User to a Post, representing that the user liked the post.
Design a property graph schema for the social network and draw it out (hand-drawn or digital).

 

A graph schema is a structured blueprint that defines how data is organized and represented in a graph database. It outlines the types of nodes, the relationships between those nodes, and the properties associated with them.

User nodes will be represented as circles with labels like "User".
Post nodes will also be represented as circles with labels like "Post".
FRIENDS relationships are bi-directional arrows between two User nodes.
POSTED relationships are single-directional arrows from a User node to a Post node.
LIKES relationships are also single-directional arrows from a User node to a Post node.
An example is provided to illustrate how to express properties in the User Node.
Node: User 
  Properties:
    - name: String
    - age: Integer
    - city: String
Draw your graph schema for the minimal structure needed. For this, you may need total 2 nodes and 3 edges for relationships in the graph schema.

Task 3: Creating the Graph in Neo4j
Create a graph in Neo4j using the following data.

User Nodes

CREATE (alice:User {name: 'Alice', age: 30, city: 'San Francisco'}),
       (bob:User {name: 'Bob', age: 28, city: 'San Francisco'}),
       (carol:User {name: 'Carol', age: 25, city: 'Los Angeles'}),
       (dave:User {name: 'Dave', age: 35, city: 'San Francisco'}),
       (eve:User {name: 'Eve', age: 27, city: 'Los Angeles'}),
       (frank:User {name: 'Frank', age: 32, city: 'New York'}),
       (grace:User {name: 'Grace', age: 29, city: 'San Francisco'})
Post Nodes

CREATE (post1:Post {content: 'Just had a great coffee!', timestamp: '2024-10-20T10:00:00'}),
       (post2:Post {content: 'Loving the new park in town!', timestamp: '2024-10-21T11:30:00'}),
       (post3:Post {content: 'Excited for the weekend!', timestamp: '2024-10-22T12:00:00'}),
       (post4:Post {content: 'Check out my new recipe!', timestamp: '2024-10-23T09:00:00'}),
       (post5:Post {content: 'Had a fantastic workout!', timestamp: '2024-10-24T08:00:00'})

Relationships

// Friendships
CREATE (alice)-[:FRIENDS]->(bob),
       (alice)-[:FRIENDS]->(dave),
       (bob)-[:FRIENDS]->(carol),
       (carol)-[:FRIENDS]->(eve),
       (dave)-[:FRIENDS]->(grace),
       (frank)-[:FRIENDS]->(bob),
       (frank)-[:FRIENDS]->(carol)

// Posts
CREATE (alice)-[:POSTED]->(post1),
       (bob)-[:POSTED]->(post2),
       (carol)-[:POSTED]->(post3),
       (dave)-[:POSTED]->(post4),
       (eve)-[:POSTED]->(post5)

// Likes
CREATE (bob)-[:LIKES]->(post1),
       (grace)-[:LIKES]->(post1),
       (carol)-[:LIKES]->(post2),
       (alice)-[:LIKES]->(post3),
       (eve)-[:LIKES]->(post4),
       (dave)-[:LIKES]->(post4),
       (frank)-[:LIKES]->(post5)

Summary of the Dataset

Users: There are 7 users: Alice, Bob, Carol, Dave, Eve, Frank, and Grace.
Posts: There are 5 posts made by users.
Friendships: Users have established friendships, with some mutual friendships.
Likes: Users have liked various posts, demonstrating interactions.
Get a screenshot of your graph in Neo4j showing the nodes and relationships. (No need to show properties)

Task 4: Cypher
Write Cypher statements to extract/update/delete the required information from your social network:

Basic Level
Q1. List all users and their posts:
Q2. Find all friends of 'Alice'.
Q3. Find all posts liked by 'Bob'
Q4. Find users who like each other's posts (mutual likers):
Q5. Find the most liked post
Intermediate Level
Q6. Find mutual friends (individuals who are friends with both users) between 'Alice' and 'Bob'.
Q7. Get Users who liked Alice's Posts
Q8. Count the number of likes for each post made by 'Alice'.
Q9. Find the top three users who have posted the most updates.
Q10. Retreive all posts that friends of 'Alice" liked.
Q11. Find users in 'San Francisco' who have the most friends. (Count direct friendships only, meaning A is directly friends with B, not transitive friendships (A being friends with C through B))
Update/Delete
Q12: Update Alice's City with a new city 'Los Angeles'.
Q13: Delete a post with content 'Hello World!'.
Obtain the Cypher statements and their results.

Task 5
Explain how graph databases differ from relational databases (250 words)
Explain "Index Free Adjacency" in a few sentences.
Individual Tasks Deliverables (Total: 70 points)
For Each Student: Include the results of the tasks in individual_project.pdf and submit it. 

Task 1: Screenshot of certificates
Neo4j Fundamentals (10 points)
Cypher Fundamentals (10 points)
Intermediate Cypher Queries (24 points)
Task 2: Graph Schema (2 points)
Task 3: Screenshot of the graph (2 points)
Task 4: Cypher statements and their corresponding results
Basic Level: Q1 ~ Q5 (5 points: 1 point each)
Intermediate Level: Q6 ~ Q11 (12 points: 2 points each)
Update/Delete: Q12 ~ Q13 (2 points: 1 point each)
Task 5: Your explanations (3 points: 1.5 each)