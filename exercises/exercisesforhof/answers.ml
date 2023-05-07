
(* 1. `filter_map` function: *)
let filter_map f l =
  List.fold_right
    (fun x acc ->
       match f x with
       | Some y -> y :: acc
       | None -> acc)
    l []

(* This function uses `fold_right` to iterate through the list `l` from right to left, and applies the function `f` to each element. If `f` returns a `Some` value, it is appended to the result list, otherwise it is skipped. *)

(* 2. `compose` function: *)


let compose f g x = f (g x)


(* This function takes two functions `f` and `g`, and returns a new function that applies `g` to its argument, and then applies `f` to the result. *)

(* 3. `exists` function: *)


let exists p l =
  List.fold_left
    (fun acc x -> acc || p x)
    false l


(* This function uses `fold_left` to iterate through the list `l` from left to right, and applies the predicate function `p` to each element. If `p` returns `true` for any element, the function returns `true`, otherwise it returns `false`. *)

(* 4. `iter2` function: *)


let iter2 f l1 l2 =
  List.iter2 f l1 l2


(* This function uses the built-in `iter2` function from the `List` module, which iterates through two lists `l1` and `l2` in parallel, applying the function `f` to the corresponding elements of each list. *)

(* 5. `flatten` function: *)


let flatten l =
  List.fold_left
    (fun acc x -> acc @ x)
    [] l


(* This function uses `fold_left` to iterate through the list `l` from left to right, and appends each sub-list to the accumulator list. The resulting list is flattened, with all the elements of the sub-lists combined into a single list. Note that this implementation is not very efficient, as it performs many list concatenations, which can be slow for large lists. *)