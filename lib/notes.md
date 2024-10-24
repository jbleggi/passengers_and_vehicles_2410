#ITERATION 1
##Passenger info
- instantiation = name for initialize
- attr readers "expose methods"
- do not need () in `.to eq X` 
    - eg. `.to be false`, `.to eq 18`
- '#' is used to show an instance variable in rspecs
- always test for both boolean values (really should test for all possible)
- refactoring: if/else statements with only one condition, typically will not need if/else and will only need condition you are testing
- if some method ends up affecting a state or something you want to be able to store, you want to include it in initialize
    - a method executes and then is over
    - add it to initialize to store/track

#ITERATION 2
##Vehicle class
- is ok to lump make/year/model together in a class because they are all being established at the same time AND they are all the same types of data (strings)
- reads right-hand side of code FIRST 
- could add `!` in order to make something opposite (eg. `@speeding` vs `!@speeding`)
- with arrays, order matters in return values
- use ENUMERABLES for when you have an array and you want to review or change every element of an ARRAY
- return value was array of passengers bc that as the last block/line of code
- need to reprint the array OUTSIDE of @passengers.each
    - @passengers.each will always give out the @array stored as the last line of code run

#ITERATION 3
- if expected output is long, you can assign it to a new variable in the rspec block
    - `expected = [taylor, jude, charlie, bob, ruby]
        expect (park.passengers).to eq expected`
- "nested iteration"
- `@` is an instance variable, without is a local variable
- could use `.map`
- no "hard coding"! aka if you have a variable assigned to a value (like admission), code using the variable (admission) and NOT the actual value (20)

#ITERATION 4
- during ICs, iteration 4 is "bonus work"
- method chaining: can add something like `.sort` to the `end` of a method block
    - best practice: only one or two things at the end in order to ensure readability
- REFACTOR: each method should only be responsible for one item
