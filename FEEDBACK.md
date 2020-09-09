# Overall

While the TODO comments lay out a path for how to make this functional, it's really 
not enough to make an informed decision about how to move forward. We use these 
assignments as a way to evaluate technical fit, so without having major components
of the assignment available to review, we can't use it for its purpose.

However, here is some feedback because we did take a look at the coding assignment.

- In absence of implementation would have been good to have a product architecture 
  definition - probably just placeholders / arch description / code comments of what the
  vision would be
- Doesn't really meet the requirements of the assignment
- Problem / use case to solve defined but not implemented (loans) - would have been cool to see
  as nobody took that approach to this assignment so far.

# Back end

- looks like follows rails guidelines
- Code looks clean (not too much of it though, so hard to judge)
- No stripe integration at all
- Doesn't have any entity in seeds
- You can't log in without creating an user using the db / rails c

# Front end

- :+1: webpacker
- It doesn't have any UI for payments
- It's not integrated with stripe

