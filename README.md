# Cerbero

Uniqueness validation does not guarantee uniqueness. Only the database
constraints do this. But there is a flaw - when database constraints
fail, an exception is thrown, and even when we catch it, the validation
error is not set.

This gem solves the issue.

It catches the database constraints exception, revalidates and returns
`false` from save. To use it, you should set _both_ validation and
database constraint. Then even if uniqueness validation mistakenly let
you in, it will break the database constraint, then revalidate and the
validation will tell you the truth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cerbero'
```

## Usage

Say you need the uniqueness of `email` inside the `company_id`. In your
model you should say:

```ruby
validates :email, uniqueness: {scope: :company_id}
```

and in your migration:

```ruby
add_index :users, [:email, :company_id], unique: true
```

__Important:__ you should add both validation and db constraint. If you
don't supply validation, you'll have `save` returning `false`, yet no
validation errors will be displayed, which is a strange and obscure
behavior.

Then if the gem is required, it makes the stuff work so that when the
uniqueness validtion lets you in, but the database constraint then
fails, `save` returns `false`, then uniqueness validation is re-run and
the execution flow goes like the uniqueness validation worked perfectly.


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
- Add travis-ci - it's broken for some reason.
- Extract the save monkey-patch to module and apply the
`alias_method_chain` pattern to avoid possible collisions.
- Add an option to apply the gem per-model basis.
