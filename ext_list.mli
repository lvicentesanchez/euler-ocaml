open Core.Std

include (module type of List)

val scan_left : 'a t -> init:'b -> f:('b -> 'a -> 'b) -> 'b t
