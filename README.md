# iLink - Server

_This readme file is only for the **server side** of iLink. To read the combined version, please visit the [iLinkDocs](https://github.com/teamilink/iLinkDocs) repository._

iLink optimises your social media presence by linking all the landing pages under one main URL as an online business card.

<hr />

- **Deployed Server**: [https://ilink-server.herokuapp.com/links](https://ilink-server.herokuapp.com/links)
- **Deployed App**: [https://ilinkapp.netlify.app/](https://ilinkapp.netlify.app/)

  - Test User
    - Email: `coder@test.com`, Password: `test123`
    - Profile: [https://ilinkapp.netlify.app/ilink/coder_academy](https://ilinkapp.netlify.app/ilink/coder_academy)

- **Client Repo**: [https://github.com/teamilink/client](https://github.com/teamilink/client)
- **Part A Docs Repo**: [https://github.com/teamilink/iLinkDocs](https://github.com/teamilink/iLinkDocs)

<hr />

## Installation & Instructions

- Clone the server repository
  `$ git clone git@github.com:teamilink/server.git`
- Move into the directory
  `$ cd server`
- Install the dependencies and libraries that used in this project
  `$ bundle install` and `$ bundle update`
- Set the local database
  `$ rails db:create db:migrate`
  - If you have any error to create your database, please run `$ rails db:drop` first then run the command line again
  - This project runs without any initial data, but if you wish you can run `$ rails db:seed` to start the project with test data
- Run the server
  `$ rails s` or `$ rails start`
  - The server will run on port 4000

## Overview

iLink is an application that offers digital marketing professionals the tool to optimise their social media presence by linking all their social media platforms and promotion links (landing page) together under one main URI link endpoint.

Below are the benefits that offered by iLink:

- The application allows users to add multiple landing page links or call to action buttons.
- Users can direct their web traffic to specific landing pages (promotion) or other target pages on their website and add as many links as they want.
- Businesses can enhance their brand identity with a custom image and links.

By having this capability of iLink, users such as small business owners or digital marketers are able to better manage their social media presence by giving their followers a convenient way to and one-click process to all their online contents on the internet.

### Functionality / Features

Account Creation

- User Login/Logout and New Account Registration
- Image uploaded for user profile picture
- Random image from a batch of images via unsplash API if no profile image is uploaded by the user.
- Fill up basic information of the user

Account Dashboard

- Create and generate new card (main URI endpoint link)
- Add new URI links with title and description into the card
- View, update or delete existing links to the card

### Target audience

This app aims at social media influencers, marketing and branding professionals and other social media content creators that are looking to grow and gather all their followers across multiple different platforms into one single platform for their web visitors.

## Tech stack

The following is the technology stack used for this project.

- **Programming Language:** Ruby and Javascript
- **Client Side:** React.js library, Material UI & PostCSS.
- **Server Side:** Ruby on Rails framework
- **Testing:** RSpec, Jest, React-testing-libraries, Cypress
- **Database:** PostgreSQL
- **Cloud Storage:** Amazon S3
- **Cloud Hosting:** Netlify for Client side and Heroku for server side
- **Utilities:** Balsamiq Wireframes, Draw.io
- **DevOps:** Github, Git Version Control, Visual Studio Code
- **Project Management Tools:** Trello and Discord

### Libraries & Dependencies

- **rails** for building server side api
- **postgresql** for database
- **puma** for the app server
- **bcrypt** for secure password
- **knock** for authentication
- **rspec** for testing code
- **factory_bot** for creating test fixtures
- **database_cleaner** for cleaning the database for testing
- **image_processing** for Active Storage variant
- **aws-sdk-s3** for storing uploaded images and generating accessable urls
- **jsonapi-serializer** for serializing Rails models

## Screenshots of the App

**Home**
![](/screenshots/Home.png)

**Sign up**
![](/screenshots/Signup.png)

**Dashboard - Links**
![](/screenshots/Dashboard-Links.png)

**Dashboard - Appearance**
![](/screenshots/Dashboard-Appearance.png)

**iLink Profile - Valid Username**
![](/screenshots/iLink-profile.png)

**iLink Profile - Invalid Username**
![](/screenshots/iLink-profile-invalid.png)

**Not Found**
![](/screenshots/not_found.png)

## Reference Links

- [iLink Part A - Trello Board](https://trello.com/b/vwtGNhLx/t3a2-part-a)
- [iLink Part B - Trello Board](https://trello.com/b/PY27jXUy/t3a2-part-b)
- [iLink - Slide Deck for Part A](https://www.canva.com/design/DAFFim6i7co/uUwexPtZMTMt71YQwHYxwA/view?utm_content=DAFFim6i7co&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)
- [iLink - Slide Deck for Part B](https://www.canva.com/design/DAFIPGhVCBQ/23sgypgNdu5MORrvwsGv5w/view?utm_content=DAFIPGhVCBQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)
