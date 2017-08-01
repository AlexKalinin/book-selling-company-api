# Task

Company A has several book stores, each store have different amount of books in stoke. Book is sold if the amount in stoke equals to 0. Each book has a publisher.

You need to design JSON API to be able to:
1. Fetch list of stores which have available books from a particular publisher.
2. Mark list of books as sold for a particular shop.

Code should be tested. No UI, only JSON.

Implement with Ruby on Rails.

# Setup in development

Prepare sources:

    git clone ...
    cp .ruby-version.sample .ruby-version
    cp .ruby-gemset.sample .ruby-gemset
    bundle install
    rake db:create db:migrate db:seed
    rails s
 
Fetch list of stores which have available books from a particular publisher:

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/stores/available_books_by_publisher/Publisher%20A 
    
Mark list of books as sold for a particular shop:

    curl -X PUT -H 'Content-Type: application/json' -d '{"books_ids":[1,2]}' http://localhost:3000/store/1/books/mark_as_sold
    
Run tests:

    rspec