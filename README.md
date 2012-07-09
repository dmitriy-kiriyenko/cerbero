# Cerbero

Uniqueness validation do not guarantee uniqueness. Only the database
constraints do this. But there is a flaw - when database constraints
fail, an exception is thrown, and even when we catch it, the validation
error is not set.

This gem solves the issue.

It catches the database constraints exception, revalidates and returns
`false` from save. To use it, you should set _both_ validation and
database constraint. Then even if uniqueness validation mistakenly let
you in, it will break the database constraint, then revalidate and the
validation will tell you the truth.

Say you need the uniqueness of `email` inside the `company_id`. In your
model you should say:

```ruby
validates :email, uniqueness: {scope: :company_id}
```

and in your migration:

```ruby
add_index :users, [:email, :company_id], unique: true
```

and add the gem to the Gemfile.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cerbero'
```

## Contributing

Use it! Provide me the issues if found. If you are really willing to
provide some code:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO:

- Apply a cleaner pattern to test via multiple databases.
