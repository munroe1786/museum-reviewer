Specifications for the Sinatra Assessment
Specs:

   X Use Sinatra to build the app
        
        I have Sinatra installed on the app.
   
   X Use ActiveRecord for storing information in a database
        
        I have the ActiveRecord gem installed on the app.
   
   X Include more than one model class (e.g. User, Post, Category)
        
        I have 3 models: User, Review and Comment
   
   X Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        
        A User has many reviews and has many comments. 
   
   X Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        
        Reviews belong to a User. Comments belong to both Users and Reviews.
   
   X Include user accounts with unique login attribute (username or email)

        I have a username validation setup and the has_secure_password method creates unique passwords.

   X  Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

        The User can create reviews, read them all, update their own and delete their own.  The User can 
        
        write comments on reviews, read all comments, update their comments and delete their comments.

   X  Ensure that users can't modify content created by other users

         The authorize_user_for(record) helper method ensures that User can only alter reviews or 
         
         comments they created.

   X  Include user input validations

          The User is not able to save empty fields on reviews or comments.

   X  BONUS - not required - Display validation failures to user with error message (example form URL           e.g. /posts/new)

          There are flash messages telling the user about errors and redirecting them if there is an 
          
          error.

   X  Your README.md includes a short description, install instructions, a contributors guide and a link        to the license for your code

          The README.md has a short description, install instructions, a contributor's guide and license information and link.
    
    Confirm

    You have a large number of small Git commits
    Your commit messages are meaningful
    You made the changes in a commit that relate to the commit message
    You don't include changes in a commit that aren't related to the commit message