# Web Library

Welcome to the Web Library project! This application provides a platform to read and upload books. 

## Features

1. **User Registration:**
   - Implemented using Devise, allowing users to register and authenticate.
    
     ![Знімок екрана (523)](https://github.com/Natali-Kotelnitska/web_library/assets/83007830/36ce0e52-b4b9-4a81-8cc1-fdeefd80fb48)

2. **Book Management:**
   - Users can add books to the library by uploading PDF files, along with images and text.
     
     ![Знімок екрана (519)](https://github.com/Natali-Kotelnitska/web_library/assets/83007830/cca1420f-68ba-4217-bfe7-f04dc5af08a7)

3. **Active Storage:**
   - Books utilize Active Storage for file attachments, including covers and content in PDF format.
   
     ![Знімок екрана (522)](https://github.com/Natali-Kotelnitska/web_library/assets/83007830/71d1825b-44eb-4675-ad1b-ac108e2a60a4)

4. **Search Functionality:**
   - Elasticsearch and Chewy are employed for efficient book search capabilities.
     
    ![Знімок екрана (273)](https://github.com/Natali-Kotelnitska/web_library/assets/83007830/5b6a5b71-9566-48db-87db-6a083dc50d86)

5. **PDF Viewer:**
   - Adobe PDF Embed API is integrated to provide a seamless and user-friendly book reading experience.

## Getting Started

1. **Clone this repository.**

2. **Install Ruby on Rails version 7.0.8 and PostgreSQL.**

3. **Install the required gems using the provided Gemfile.**
   ```bash
   bundle install
   ```
4. **Configure the Database:**
   - Ensure your database is properly configured.

5. **Set up Elasticsearch and Chewy for Search:**
   - Implement Elasticsearch and Chewy to enhance search functionality.

6. **Run the Server:**
     ```bash
     rails server
     ```

4. **Explore the Web Library:**
   - Open your browser and navigate to [http://localhost:3000](http://localhost:3000) to explore the Web Library.

## Contribution
Feel free to contribute and enhance the Web Library project. Your contributions are valued! Happy reading! 📚






