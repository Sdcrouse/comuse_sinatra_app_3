# Sinatra Order of Operations Guide

## Checklist

### PART 1 — Project Setup: Corneal, MVC, ActiveRecord

**BEFORE YOU CODE**
- [x] 1. Check project requirements in `spec.md`
- [x] 2. Ideate!  What do you want to build?
      - choose a domain you're familiar with!
      - choose a domain you care about
- [x] 3. Wireframing & User Stories
      - Write down your models, their attributes, and their associations
      - "As a user, I can ....."
      - "A user should be able to ....."
      - What does your app _do_?
- [x] 4. Design your MVP = 'Minimum Viable Product' vs. what are my 'stretch goals'
      - Stretch goals - bonus features you want but don't need

**NOW WE CODE (BUT JUST OUR MODELS — NO CONTROLLERS OR VIEWS)**

- [ ] 5. Generate new project using corneal gem
- [ ] 6. Create github repo
- [ ] 7. Build your models
      - Migrations
      - Model classes
      - Associations
- [ ] 8. Test your models and associations in the console
      - Create some seed data
      - Adjust migrations as needed

**KEYWORDS FOR ASSESSMENT**
- ActiveRecord
- MVC
- Associations (has_many, belongs_to macro)
- `has_secure_password`

### PART 2 — User Authentication

**NOW, CONSIDER USER CONTROLLER, APPLICATION CONTROLLER, AND VIEWS**

*IMPORTANT:* Build views and controller actions based on the flow of your app, one step at a time, testing as you go!
  - Use `shotgun` and `pry` (or `raise`/`inspect`) all the time!

**START WITH LOGIN**

- [ ] 10. Enable `sessions` in `ApplicationController`
  - Enable sessions
  - Create session secret

- [ ] 9. Create your `UsersController`
  - Build your `get` login route + view
  - Build your `post` login route
  - Build your `get users/:id` route + "show" view

- [ ] 12. Create your `ApplicationController` helper methods
  - `#logged_in?`
  - `#current_user`

**MOVE ON TO SIGN UP + LOG OUT**

### PART 3 — CRUD

- [ ] 14. Create your `PostsController`
  - Mount new controller in `ApplicationController` with `use PostsController`

- [ ] 15. Implement READ functionality
  - Create `get '/posts'` route
  - Create `index.erb` view

- [ ] 16. Implement CREATE functionality
  - Create `get '/posts/new'` to render form
  - Create `new.erb`
  - Create `post "/posts" do` to create new post

- [ ] 17. Implement UPDATE functionality
  - Confirm `use Rack::MethodOverride` in `config.ru`
  - Create `get '/posts/:id/edit'` to render form
  - Create `edit.erb`
  - Create `patch '/posts/:id'` to create new post

- [ ] 18. Implement DELETE functionality
  - Confirm `use Rack::MethodOverride` in `config.ru`
  - Create `delete` form in `show.erb` view
  - Create `delete '/posts/:id'` route


### Using the corneal gem

You are welcome to use the [corneal gem].  However, you should understand what it's doing.  Remove any folders and files you're not using.  For example, if you're not going to write any tests, delete the `spec` folder.

[corneal gem]:https://github.com/thebrianemory/corneal
