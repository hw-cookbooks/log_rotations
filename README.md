Log Rotations
=============

This is a simple helper cookbook to easily manage log rotations.
Files to be rotated are defined within attributes which allows
for flexible definitions of logs to rotate.

How it works
------------

Simply add a Hash with the path of the file, a name for the rotation,
and any extras you may want:

```ruby
override_attributes(
  :log_rotations => [
    {:name => 'mail-log', :path => '/var/log/mail.log'}
  ]
)
```
