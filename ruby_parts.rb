# Question: 1
"A database of tables that are linked with a system of primary
and foreign keys"

# Question: 2
"1:N, (1:1), N:N"

# Question: 5
"Structured QUERY Language"

# Question: 8
"Active Record is what we call an Object-Relational Mapping.
It’s purpose is to map the instance variables of our models
in our Ruby program to the columns of the corresponding
tables in our SQL database"

# Question: 9
"A migration is a change in our database structure(its schema):
tables, columns or relations between tables"

# Question: 10
"rake db:migrate"

#Question:  11
class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end
end

#Question:  12
class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publishing_year
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end


#Question:  13
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
  end
end

#Question:  14
class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :reading_date

      t.timestamps
    end
  end
end

#Question:  15
class AddCategoryToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category, :string
  end
end

#Question:  16
class Author
  has_many :books
end

class Book
  belongs_to :author
  has_many :readings

  has_many :users, through: :readings

  validates :publishing_year, presence: true
end

class User
  has_many :readings

  has_many :books, through: :readings
end

class Reading
  belongs_to :user
  belongs_to :book
end

#Question:  17
  #1. Add your favorite author to the DB
  author = Author.create(name: "Kae Tempest")

  #2. Get all authors
  Author.all

  #3. Get author with id=8
  Author.find(8)

  #4. Get author with name="Jules Verne", store it in a variable: jules
  jules = Author.find_by(name: "Jules Verne")
  # All authors called "Jules Verne"  Author.where(name: "Jules Verne")
  
  #5. Get Jules Verne's books
  jules.books
  
  #6. Instantiate a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
  twenty_thousand = Book.new(title: "20000 Leagues under the Sea", publishing_year: 1870)

  #7. Add Jules Verne as this book's author
  twenty_thousand.author = jules

  #8. Now save this book in the DB!
  twenty_thousand.save!

#Question:  18
class Author
  validates :name, uniqueness: true, presence: true
end

#Question:  19
'NO 🙅‍♂️'

