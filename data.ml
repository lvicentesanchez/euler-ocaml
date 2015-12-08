module type Semigroup = sig
  type t
  val append: t -> t -> t
end

module type Monoid = sig
  include Semigroup
  val zero: t
end
