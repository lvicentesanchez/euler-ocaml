type 'a t

val dequeue: 'a t -> ('a * 'a t) option

val empty: 'a t

val fold : 'a t -> init:'b -> f:('b -> 'a -> 'b) -> 'b

val is_empty: 'a t -> bool

val length: 'a t -> int

val map: 'a t -> f:('a -> 'b) -> 'b t

val peek: 'a t -> 'a option

val queue: 'a t -> 'a -> 'a t
