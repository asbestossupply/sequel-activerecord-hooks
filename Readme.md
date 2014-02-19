# UPDATE:
[Rodrigo Rosenfeld Rosas](https://github.com/rosenfeld) merged these changes into his [sequel-devise gem](https://github.com/rosenfeld/sequel-devise) so just use that. This repo will remain for some time for historical purposes.

## What's this?
This gem fixes an issue I had with *Sequel* and *Devise* (specifically the *Confirmable* module).

##### The issue I had

A class as simple as:

```ruby
  class User < Sequel::Model
    plugin :devise
    devise :database_authenticatable, :confirmable
  end
```

would cause an exception:

> wrong number of arguments (2 for 0..1) 

I tracked the issue down to [some code in devise](https://github.com/plataformatec/devise/blob/master/lib/devise/models/confirmable.rb#L36):

`before_create :generate_confirmation_token, :if => :confirmation_required?`

that code uses a hook syntax with 2 arguments (`:generate_confirmation_token` and a hash of `{:if => :confirmation_required?}`) that's not supported by Sequel!

The initial purpose of this gem is to get Sequel and Devise to play nicely together.

## Usage
Add something like the following to your `application.rb`:

```ruby
    config.sequel.after_connect = proc do
      Sequel::Model.plugin :activerecord_hooks
    end 
```