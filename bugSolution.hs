The issue stems from the polymorphic nature of `apply` and the lack of type information for the list elements.  The solution requires explicit type annotations to guide the type inference or a different approach to applying the functions.  Here's a corrected version:

```haskell
apply :: (a -> b) -> a -> b
apply f x = f x

-- Explicit type annotation
applyList :: [(a -> b)] -> [a] -> [b]
applyList fs xs = zipWith apply fs xs

-- Example usage with explicit types
main :: IO ()
main = do
  let fs = [(+1), (*2)]
  let xs = [1, 2]
  let ys = applyList fs xs -- Correctly type-checked
  print ys -- Output: [2,4]

-- Alternative solution using function specialization
applyList' :: [Int -> Int] -> [Int] -> [Int]
applyList' fs xs = zipWith ($) fs xs

main' :: IO ()
main' = do
  let fs = [(+1), (*2)]
  let xs = [1,2]
  let ys = applyList' fs xs
  print ys -- Output: [2,4] 
```
This corrected version uses `zipWith` to apply each function in the list to the corresponding argument in the other list.  The `applyList` function introduces explicit type annotations to resolve ambiguity, while `applyList'` shows an alternative by specializing the function to operate on lists of `Int -> Int` and `Int`. Choosing the correct approach depends on the context and desired level of polymorphism.