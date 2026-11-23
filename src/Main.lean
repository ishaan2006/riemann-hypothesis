module

public import Statements
public import Development.AutomorphicArithmetic.CharacterBoxes.ClaimStrip
public import Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Combinatorics.Enumerative.DyckWord
import Mathlib.Combinatorics.SimpleGraph.Triangle.Removal
import Mathlib.Data.NNRat.Floor
import Mathlib.Geometry.Euclidean.Volume.Basic
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.NumberTheory.LucasLehmer
import Mathlib.NumberTheory.SelbergSieve
import Mathlib.RingTheory.Radical.NatInt
import Mathlib.Tactic.Echelon.Zsqrtd
import Mathlib.Tactic.Inclusion.Extension.Core.Core
import Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses
import Mathlib.Tactic.NormNum.Irrational
import Mathlib.Tactic.NormNum.IsCoprime
import Mathlib.Tactic.NormNum.IsSquare
import Mathlib.Tactic.NormNum.LegendreSymbol
import Mathlib.Tactic.NormNum.ModEq
import Mathlib.Tactic.NormNum.NatFib
import Mathlib.Tactic.NormNum.NatLog
import Mathlib.Tactic.NormNum.NatSqrt
import Mathlib.Tactic.NormNum.Ordinal
import Mathlib.Tactic.NormNum.Parity
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.NormNum.RealSqrt

@[expose] public section

/-- Generalized Riemann Hypothesis (right half-plane): every Dirichlet `L`-function `L(χ, s)`
has no zeros with `1/2 < Re s`, except for the pole of the trivial character at `s = 1`.
Proved by `UpperTheory.FinalTheorems.everyCharacter`. -/
theorem LFunction_ne_zero_of_half_lt_re : DirichletLNonvanishingRightOfHalf :=
  UpperTheory.FinalTheorems.everyCharacter

/-- Mathlib's `RiemannHypothesis`, deduced from `LFunction_ne_zero_of_half_lt_re` via the
trivial character (`Claim.zeta`). -/
theorem riemannHypothesis : RiemannHypothesis :=
  Claim.zeta LFunction_ne_zero_of_half_lt_re

/-- Every nontrivial zero of `riemannZeta` in the critical strip `0 < Re s < 1` lies on `Re s = 1/2`. -/
theorem riemannZeta_eq_zero_re : RiemannZetaZerosOnLine := riemannHypothesis

/-- Every zero of a Dirichlet `L`-function in `0 < Re s < 1` lies on `Re s = 1/2`, deduced from
`LFunction_ne_zero_of_half_lt_re` and the functional equation (`Claim.strip`). -/
theorem LFunction_eq_zero_re : DirichletLZerosOnLine :=
  Claim.strip LFunction_ne_zero_of_half_lt_re

/-- Specialization of `LFunction_eq_zero_re` to primitive Dirichlet characters. -/
theorem LFunction_eq_zero_re_of_isPrimitive : PrimitiveDirichletLZerosOnLine := by
  intro N _ χ _ s h₀ h₁ hz
  exact LFunction_eq_zero_re N χ s h₀ h₁ hz
