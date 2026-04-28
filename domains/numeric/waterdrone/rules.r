2026-04-28 20:02:19,460 INFO     Policy solves 50 out of 50 problems, unsolved:
2026-04-28 20:02:19,460 INFO     Final policy: 4 rules, 0 transition constraints, 0 state constraints with 2 features: n_sum_frame(f_primitive_unary(burning,0)), n_sum_frame(f_restrict_unary(f_primitive_unary(burning,0),c_not(c_primitive(at,0))))
Rules:
{ n_sum_frame(f_primitive_unary(burning,0)) > 0 }  ⇒  { ↑n_sum_frame(f_restrict_unary(f_primitive_unary(burning,0),c_not(c_primitive(at,0)))) }
{ n_sum_frame(f_primitive_unary(burning,0)) > 0 }  ⇒  { ↓n_sum_frame(f_primitive_unary(burning,0)) }
{ n_sum_frame(f_primitive_unary(burning,0)) > 0 ∧ n_sum_frame(f_restrict_unary(f_primitive_unary(burning,0),c_not(c_primitive(at,0)))) > 0 }  ⇒  {  }
{ n_sum_frame(f_primitive_unary(burning,0)) > 0 ∧ n_sum_frame(f_restrict_unary(f_primitive_unary(burning,0),c_not(c_primitive(at,0)))) > 0 }  ⇒  { ↓n_sum_frame(f_restrict_unary(f_primitive_unary(burning,0),c_not(c_primitive(at,0)))) }
2026-04-28 20:02:19,460 INFO     Total wall time: 2673.76s
2026-04-28 20:02:19,460 INFO     Best policy solver CPU time: 0.38s
2026-04-28 20:02:19,460 INFO     Best policy solver wall time: 0.31s
2026-04-28 20:02:19,460 INFO     Total solver CPU time: 0.48s
2026-04-28 20:02:19,460 INFO     Total CPU time: 2673.10s
2026-04-28 20:02:19,460 INFO     Total memory usage: 85.31MB
