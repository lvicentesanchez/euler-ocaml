type 'a t
include (module type of Istack) with type 'a t := 'a t
include Foldable.Extension with type 'a t := 'a t
