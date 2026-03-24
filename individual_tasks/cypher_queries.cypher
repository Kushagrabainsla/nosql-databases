// ============================================
// TASK 3: Create the Complete Graph
// ============================================
// Run this entire block to create all nodes and relationships

CREATE (alice:User {name: 'Alice', age: 30, city: 'San Francisco'}),
       (bob:User {name: 'Bob', age: 28, city: 'San Francisco'}),
       (carol:User {name: 'Carol', age: 25, city: 'Los Angeles'}),
       (dave:User {name: 'Dave', age: 35, city: 'San Francisco'}),
       (eve:User {name: 'Eve', age: 27, city: 'Los Angeles'}),
       (frank:User {name: 'Frank', age: 32, city: 'New York'}),
       (grace:User {name: 'Grace', age: 29, city: 'San Francisco'}),

       (post1:Post {content: 'Just had a great coffee!', timestamp: '2024-10-20T10:00:00'}),
       (post2:Post {content: 'Loving the new park in town!', timestamp: '2024-10-21T11:30:00'}),
       (post3:Post {content: 'Excited for the weekend!', timestamp: '2024-10-22T12:00:00'}),
       (post4:Post {content: 'Check out my new recipe!', timestamp: '2024-10-23T09:00:00'}),
       (post5:Post {content: 'Had a fantastic workout!', timestamp: '2024-10-24T08:00:00'}),

       (alice)-[:FRIENDS]->(bob),
       (alice)-[:FRIENDS]->(dave),
       (bob)-[:FRIENDS]->(carol),
       (carol)-[:FRIENDS]->(eve),
       (dave)-[:FRIENDS]->(grace),
       (frank)-[:FRIENDS]->(bob),
       (frank)-[:FRIENDS]->(carol),

       (alice)-[:POSTED]->(post1),
       (bob)-[:POSTED]->(post2),
       (carol)-[:POSTED]->(post3),
       (dave)-[:POSTED]->(post4),
       (eve)-[:POSTED]->(post5),

       (bob)-[:LIKES]->(post1),
       (grace)-[:LIKES]->(post1),
       (carol)-[:LIKES]->(post2),
       (alice)-[:LIKES]->(post3),
       (eve)-[:LIKES]->(post4),
       (dave)-[:LIKES]->(post4),
       (frank)-[:LIKES]->(post5);

// View the complete graph (for screenshot)
// MATCH (n) RETURN n

// ============================================
// TASK 4: BASIC LEVEL QUERIES
// ============================================

// Q1. List all users and their posts
MATCH (u:User)-[:POSTED]->(p:Post)
RETURN u.name AS User, p.content AS Post;

// Q2. Find all friends of 'Alice'
MATCH (alice:User {name: 'Alice'})-[:FRIENDS]-(friend:User)
RETURN friend.name AS Friend;

// Q3. Find all posts liked by 'Bob'
MATCH (bob:User {name: 'Bob'})-[:LIKES]->(post:Post)
RETURN post.content AS LikedPost;

// Q4. Find users who like each other's posts (mutual likers)
MATCH (u1:User)-[:POSTED]->(p1:Post)<-[:LIKES]-(u2:User),
      (u2)-[:POSTED]->(p2:Post)<-[:LIKES]-(u1)
WHERE u1 <> u2
RETURN DISTINCT u1.name AS User1, u2.name AS User2;

// Q5. Find the most liked post
MATCH (p:Post)<-[:LIKES]-(u:User)
RETURN p.content AS Post, COUNT(u) AS LikeCount
ORDER BY LikeCount DESC
LIMIT 1;

// ============================================
// TASK 4: INTERMEDIATE LEVEL QUERIES
// ============================================

// Q6. Find mutual friends between 'Alice' and 'Bob'
MATCH (alice:User {name: 'Alice'})-[:FRIENDS]-(mutualFriend:User)-[:FRIENDS]-(bob:User {name: 'Bob'})
WHERE alice <> bob
RETURN DISTINCT mutualFriend.name AS MutualFriend;

// Q7. Get Users who liked Alice's Posts
MATCH (alice:User {name: 'Alice'})-[:POSTED]->(post:Post)<-[:LIKES]-(liker:User)
RETURN DISTINCT liker.name AS UserWhoLikedAlicePost;

// Q8. Count the number of likes for each post made by 'Alice'
MATCH (alice:User {name: 'Alice'})-[:POSTED]->(post:Post)
OPTIONAL MATCH (post)<-[:LIKES]-(liker:User)
RETURN post.content AS Post, COUNT(liker) AS LikeCount;

// Q9. Find the top three users who have posted the most updates
MATCH (u:User)-[:POSTED]->(p:Post)
RETURN u.name AS User, COUNT(p) AS PostCount
ORDER BY PostCount DESC
LIMIT 3;

// Q10. Retrieve all posts that friends of 'Alice' liked
MATCH (alice:User {name: 'Alice'})-[:FRIENDS]-(friend:User)-[:LIKES]->(post:Post)
RETURN DISTINCT friend.name AS Friend, post.content AS LikedPost;

// Q11. Find users in 'San Francisco' who have the most friends
MATCH (u:User {city: 'San Francisco'})-[:FRIENDS]-(friend:User)
RETURN u.name AS User, COUNT(DISTINCT friend) AS FriendCount
ORDER BY FriendCount DESC;

// ============================================
// TASK 4: UPDATE/DELETE QUERIES
// ============================================

// Q12. Update Alice's City to 'Los Angeles'
MATCH (alice:User {name: 'Alice'})
SET alice.city = 'Los Angeles'
RETURN alice.name AS User, alice.city AS NewCity;

// Q13. Delete a post with content 'Hello World!'
MATCH (p:Post {content: 'Hello World!'})
DETACH DELETE p;
