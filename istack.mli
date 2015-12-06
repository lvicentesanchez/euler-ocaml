type 'a t

val empty: 'a t

val fold : 'a t -> init:'b -> f:('b -> 'a -> 'b) -> 'b

val is_empty: 'a t -> bool

val length: 'a t -> int

val map: 'a t -> f:('a -> 'b) -> 'b t

val peek: 'a t -> 'a option

val pop: 'a t -> ('a * 'a t) option

val push: 'a t -> 'a -> 'a t
