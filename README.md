---
---
# TRuby

TRuby is a typed ruby dialect. It works by transpiling files
written in a syntax pretty similar to ruby into ruby itself.

## Internals
This section describes how the simpler sexps are built

### Singletons

Core singletons like the instances from `TrueClass`, `FalseClass`, and `NilClass`.

```ruby
true
# (true)

false
# (false)

nil
# (nil)
```

### Integer

Integer numbers

```ruby
123
# (int 123)

-123
# (int -123)

__LINE__
# (int 1)
```

### Symbol

#### Plain

```ruby
:foo
# (sym :foo)

:'foo'
# (sym :foo)
```
