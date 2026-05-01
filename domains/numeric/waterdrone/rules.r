2026-05-01 12:08:15,872 INFO     Policy solves 3 out of 3 problems, unsolved:
2026-05-01 12:08:15,872 INFO     Final policy: 5 rules, 0 transition constraints, 0 state constraints with 3 features: b_nullary(atRiver), n_minimum(f_primitive_unary(carrying,0)), n_sum_frame(f_primitive_unary(burning,0))
Rules:
{ b_nullary(atRiver) ∧ n_minimum(f_primitive_unary(carrying,0)) = 0 ∧ n_sum_frame(f_primitive_unary(burning,0)) > 0 }  ⇒  { ↑n_minimum(f_primitive_unary(carrying,0)) }
{ b_nullary(atRiver) ∧ n_minimum(f_primitive_unary(carrying,0)) > 0 ∧ n_sum_frame(f_primitive_unary(burning,0)) > 0 }  ⇒  { ¬b_nullary(atRiver) }
{ n_minimum(f_primitive_unary(carrying,0)) = 0 ∧ n_sum_frame(f_primitive_unary(burning,0)) > 0 ∧ ¬b_nullary(atRiver) }  ⇒  { b_nullary(atRiver) }
{ n_minimum(f_primitive_unary(carrying,0)) > 0 ∧ n_sum_frame(f_primitive_unary(burning,0)) > 0 ∧ ¬b_nullary(atRiver) }  ⇒  {  }
{ n_minimum(f_primitive_unary(carrying,0)) > 0 ∧ n_sum_frame(f_primitive_unary(burning,0)) > 0 ∧ ¬b_nullary(atRiver) }  ⇒  { ↓n_minimum(f_primitive_unary(carrying,0)) ∧ ↓n_sum_frame(f_primitive_unary(burning,0)) }
2026-05-01 12:08:15,872 INFO     Total wall time: 13.35s
2026-05-01 12:08:15,872 INFO     Best policy solver CPU time: 0.20s
2026-05-01 12:08:15,872 INFO     Best policy solver wall time: 0.12s
2026-05-01 12:08:15,872 INFO     Total solver CPU time: 0.29s
2026-05-01 12:08:15,872 INFO     Total CPU time: 13.39s
2026-05-01 12:08:15,872 INFO     Total memory usage: 85.62MB