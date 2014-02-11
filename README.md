#Credit Card Checker
[![Code Climate](https://codeclimate.com/github/albandiguer/ccc.png)](https://codeclimate.com/github/albandiguer/ccc)

## Tests

```
bundle
bundle exec guard
```

### Output

````
Running:
.........
Finished in 0.003867s, 2327.3856 runs/s, 8792.3455 assertions/s.
9 runs, 34 assertions, 0 failures, 0 errors, 0 skips
````

## Few notes
The `CreditCardValidator` is a wrapper of an external gem [Luhnacy](https://github.com/rorymckinley/luhnacy). Few reasons why I made this choice and why it is safe.

- We do not reinvent the wheel.
- If we can contribute we do and make this project stronger.
- Integration tests insure that this version of the gem fullfills our requirements.
- The `Gemfile` has a locked version of the dependency to avoid mistaken updates.


The `CreditCardIdentifier` could be extracted into a gem of the same name and has no dependencies.

## PR notes

Any PR should be made in a separate branch. Thanks.


