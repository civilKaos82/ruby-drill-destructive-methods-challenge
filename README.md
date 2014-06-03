# Ruby Drill Destructive Methods

##Learning Competencies

- Preserving/consuming method arguments
- Modifying values in place

##Summary

The fundamental way that programmers organize their code is by writing methods. Methods (the code you write between `def` and `end`) usually have _input_ and _output_.

A method's input is made up of the argument(s) you pass in. Let's look at a method:

```ruby
def double(x)
  return x * 2
end

double(2) #=> 4
```

In the code above, `double` is the method and `2` is the method's input. The method's _output_ is whatever the method returns. In this case, the output is `4`.

Methods that take an input and provide an output are also known as "pure functions" because they don't affect anything outside of themselves. The only things that change happen between `def` and `end`, the world before and after the method runs is exactly the same.

Some methods have what we call _side-effects_. Methods with side-effects are also known as "impure functions" because they mess with things outside themselves. Side-effects are things that change outside your method when the method runs. Let's look at an example of an impure function:

```ruby
def add_gusto(message)
  message += "!"
end

hello_msg = "Hello"
add_gusto(hello_msg)
hello_msg #=> "Hello!"
```

See what happened? Our `add_gusto` method took its input and "modified it in place". If we look at our `hello_msg` before and after calling `add_gusto` we see that it is not the same. `add_gusto` actually changed it instead of returning a new string. In other words, `add_gusto` had a side-effect: it modified the original string that we declared _outside_ the method. `add_gusto` is an example of a **destructive method**.

One of the conventions that you'll learn in Ruby is that methods with side-effects are appended with a `!` (what programmers call a "bang"). This helps future programmers calling these methods understand that when they call it, something serious is happening behind the scenes and a side-effect will occur.

For this exercise, you will write a function (a method with no side-effects), and then a method with the side-effect of "destroying" its input argument.

*Note: the bang `!` symbol is used because permanently modifying data is dangerous. Use destructive methods with caution.*

###Rules for your method

You will be writing two versions of a method called `destroy_message` which takes in a string identified by the variable `message` and modifies that string based upon the following rules:

* A message is a string that may or may not contain a `":"`
* If the original message contains a `":"` then all content after (but not including) the `":"` is removed when the message self-destructs. So if the original message is `"This message will self destruct: Ruby is fun"` then the destructed message is `"This message will self destruct:"`.
* If the original message does not contain a `":"` then it will not change in when it is destructed.

There are already some tests you can use to verify your solution, but you can add more as you discover bugs and edge cases.

##Releases

###Release 0 : Writing methods with no side effects

Start by writing the `destroy_message` method following the rules outlined above. It **must not** permanently alter the original string passed in.

What does that mean? Here is an example of a *non-destructive* method:

```ruby
name = "Mr. Billy Jones"

# The String#sub method replaces one part of the string
# with another and returns the new, modified string.
name.sub('Jones', 'Jimmy Jones')
# => "Mr. Billy Jimmy Jones"

# But it does NOT permanently change the string, as we
# can see here:
name
# => "Mr. Billy Jones"
```

###Release 1 : Destroying everything!

Now, write the method `destroy_message!` which does the same thing as `destroy_message` (without the `!`) **except** that this new method will permanently modify the original string.

What does it mean to permanently modify a piece of data? Here is an example of a *destructive* method:

```ruby
name = "Mr. Billy Jones"

# The String#sub! method replaces one part of the ORIGINAL
# string with another and returns the modified string.
name.sub!('Jones', 'Jimmy Jones')
# => "Mr. Billy Jimmy Jones"

# When you call #sub! on a string, it permanently modifies
# the original value.
name
# => "Mr. Billy Jimmy Jones"
```
