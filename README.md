# Word Definer
## Created by Lara Bjork on December 20, 2019
### Project Description

This project was completed as an independent assignment for the Ruby class at Epicodus, during a week focused on Routing with Ruby. The task description was as follows:
_You are making a website for an educational non-profit that needs help building a learning website for kids. The concept for the website is to make learning fun: children will write up a list of words they don't know (but would like to learn) and then come up with their own definitions. Once you complete the basic objectives, you have an additional challenge: make this the best website for kids you can!_

_The Word Definer:_
_* Make an application that contains a Word class._
_* The homepage of the app should list all words._
_* When a word is clicked, it should lead to a page with the word's definitions._
_* Children should be able to add a word, and when viewing a word, be able to add, update or delete one or more definitions._
_* This week you should deploy your application to Heroku so the kids can try it out!_

### Specifications
These specs were developed based on the assignment description.
**1. Behavior:** A user should be able to enter a word and have it be saved into a list of words.
**Input:** "stupendous"
**Output:** "Word list: stupendous"

**2. Behavior:** A user should be able to add a definition to a word that has already been entered.
**Input:** "super amazing"
**Output:** "'Stupendous' means 'super amazing'"

**3. Behavior:** A user should be able to update a definition to a word that has already been entered.
**Input:** "super dooper amazing"
**Output:** "'Stupendous' means 'super dooper amazing'"

**4. Behavior:** A user should be able to delete a definition to a word that has already been entered.
**Input:** [accesses existing definition]
**Output:** [deletes definition]

### Technologies Used
Ruby 2.5.1, rspec, pry, Bundler, Sinatra, Capybara, Heroku

Project was written using Google Chrome; no other browsers were tested for compatibility.

### Project Setup instructions
1. Ensure that you have the correct version of Ruby installed.
2. Clone the project locally from github.
3. Install Bundler if you do not already have it by running **gem install bundler** in the terminal.
4. Run **bundle install** to manage gems; if you make additional changes to the Gemfile, you will need to run this command again.
5. If something doesn't display correctly or goes wrong somehow, please contact me at <lara.m.bjork@gmail.com> and I will do my best to troubleshoot for you.

### Known Issues and Limitations
* No known bugs

### License
This software is licensed under the MIT license.

Copyright (c) 2019 Lara Bjork
