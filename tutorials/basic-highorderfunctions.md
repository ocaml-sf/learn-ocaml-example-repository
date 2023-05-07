                                                   Higher-order functions
-----------------------------------------------------------------------------------------------------------------------------------------

Higher-order functions are functions that take other functions as arguments or return functions as their results. Here is an example of a higher-order function that takes a function `f` and applies it to each element of a list `l`:


let rec map f l =
  match l with
  | [] -> []
  | x :: xs -> f x :: map f xs


The `map` function takes a function `f` as its first argument and a list `l` as its second argument. It applies `f` to each element of `l` and returns a new list containing the results. For example, if we define a function `square` that squares its argument:


let square x = x * x


We can use `map` to apply `square` to each element of a list:


let l = [1; 2; 3]
let l_squared = map square l  (* returns [1; 4; 9] *)

-----------------------------------------------------------------------------------------------------------------------------------------

Another example of a higher-order function in OCaml is the `fold_left` function, which takes a function `f`, an initial accumulator value `acc`, and a list `l`, and applies `f` to each element of `l` and the current accumulator value to produce a new accumulator value. Here's an example implementation of `fold_left`:


let rec fold_left f acc l =
  match l with
  | [] -> acc
  | x :: xs -> fold_left f (f acc x) xs


We can use `fold_left` to compute the sum of a list of integers:


let sum l = fold_left (+) 0 l


The `sum` function takes a list `l` as its argument and uses `fold_left` with the `+` operator and an initial accumulator value of `0` to compute the sum of `l`. For example:


let l = [1; 2; 3]
let sum_l = sum l  (* returns 6 *)

------------------------------------------------------------------------------------------------------------------------------------------

`fold_right` is a higher-order function in OCaml that is similar to `fold_left`, but it processes the elements of a list from right to left instead of from left to right.

Here's the signature of `fold_right`:


val fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b


The first argument is a function `f` that takes an element of the list and an accumulator value and returns a new accumulator value. The second argument is the list to be processed, and the third argument is the initial accumulator value.

Here's an example implementation of `fold_right`:


let rec fold_right f l acc =
  match l with
  | [] -> acc
  | x :: xs -> f x (fold_right f xs acc)


The implementation is similar to `fold_left`, except that it calls itself recursively on the tail of the list (`xs`) and passes the current accumulator value (`acc`) as the second argument to `f`.

Here's an example of using `fold_right` to compute the product of a list of integers:


let product l = fold_right (fun x acc -> x * acc) l 1


The `product` function takes a list `l` as its argument and uses `fold_right` with a function that multiplies the current element by the accumulator and an initial accumulator value of `1` to compute the product of `l`. For example:


let l = [1; 2; 3]
let product_l = product l  (* returns 6 *)


Note: `fold_right` is often less efficient than `fold_left` because it processes the list in reverse order. This leads to an excessive stack usage for large lists.

---------------------------------------------------------------------------------------------------------------------------------------------