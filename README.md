# Ruby Drill Destructive Methods

## Summary
```ruby
class_name = "SomeClassName"
# => "SomeClassName"
to_snake_case(class_name)
# => "some_class_name"
class_name
# => "SomeClassName"
to_snake_case!(class_name)
# => "some_class_name"
class_name
# => "some_class_name"
```
*Figure 1*. A non-destructive `to_snake_case` method and a destructive `to_snake_case!` method.

What is the difference between the `to_snake_case` and `to_snake_case!` methods in Figure 1?  Both take the same object as input and return the same output value.  The difference is in what happens to the argument to each method.  In addition to providing a return value, the `to_snake_case!`method changes the object passed to it.

In Ruby, it's not uncommon to encounter such pairs of methods—for example, `String#upcase` and `String#upcase!` or `Array#map` and `Array#map!`.  We'll be writing a pair of such methods in this challenge.

We generally think of methods in terms of their *inputs* and *outputs*.  Arguments are passed into the methods.  Some value comes out of the method.  In Figure 1, we input the string `'SomeClassName'` to the `to_snake_case` method, and the string `'some_class_name` comes out of the method.  And that's all that happens.

Methods that take input and provide an output are sometimes known as *[pure functions]* because they don't affect anything outside of themselves. The only things that change happen between `def` and `end`; the world before and after the method runs is exactly the same.

Other methods have what we call *side-effects*.  Side-effects are changes that occur outside of a method when the method runs.  Maybe a file is written or text is printed to the command line.  Methods with side-effects are also known as *impure functions*.

A common side-effect, as seen in Figure 1, is mutating, or changing, an object.  What happens to the value of our variable `class_name` when we pass it to the `to_snake_case!` method?  The object changes.  The variable `class_name` still points to the same string object, but the object has changed.  It's value was changed from `SomeClassName` to `some_class_name`—it was *modified in place*.  Methods that have the side effect of changing objects' values are often referred to as *destructive methods*.


### Convention for Using ! in Method Names
> The bang (!) does not mean "destructive" nor lack of it mean non
destructive either.  The bang sign means "the bang version is more
dangerous than its non bang counterpart; handle with care".

> Yukihiro Matsumoto (see [post][Matz comment])

In the example methods that we've mentioned, we've seen pairs of similarly named methods wherein one method's name ends in a *bang*, an exclamation point.  For example, `String#upcase` and `String#upcase!`.  What does the bang mean, and when do we use it?

The bang signifies danger.  What type of danger?  That depends.  Sometimes the danger is that the method is destructive, while sometimes it's another danger.  We understand the danger when we compare a dangerous method to a similar non-dangerous method.  In our example of converting a string to snake case in Figure 1, we can compare `to_snake_case` to `to_snake_case!` and see the danger is that `to_snake_case!` mutates its argument.

We should only add a bang to a method name if there is a non-dangerous equivalent.

*Note:*  For more detail, see David A. Black's blog post *[Bang methods; or, Danger, Will Rubyist!][bang post]*




##Releases
###Rules for your method

You will be writing two versions of a method called `destroy_message` which takes in a string identified by the variable `message` and modifies that string based upon the following rules:

* A message is a string that may or may not contain a `":"`
* If the original message contains a `":"` then all content after (but not including) the `":"` is removed when the message self-destructs. So if the original message is `"This message will self destruct: Ruby is fun"` then the destructed message is `"This message will self destruct:"`.
* If the original message does not contain a `":"` then it will not change in when it is destructed.

There are already some tests you can use to verify your solution, but you can add more as you discover bugs and edge cases.


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

[bang post]: http://dablog.rubypal.com/2007/8/15/bang-methods-or-danger-will-rubyist
[Matz comment]: https://www.ruby-forum.com/topic/176830#773946
[pure functions]: https://en.wikipedia.org/wiki/Pure_function
