type 'a t
include (module type of Iqueue) with type 'a t := 'a t
include Foldable.Extension with type 'a t := 'a t
