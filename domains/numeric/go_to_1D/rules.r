2026-04-28 20:17:15,274 INFO     Policy solves 50 out of 50 problems, unsolved:
2026-04-28 20:17:15,274 INFO     Final policy: 4 rules, 0 transition constraints, 0 state constraints with 2 features: n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))), n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0)))
Rules:
{ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) > 0 ∧ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) = 0 }  ⇒  { ↓n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) }
{ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) > 0 ∧ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) > 0 }  ⇒  { ↑n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) ∧ ↓n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) }
{ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) > 0 ∧ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) > 0 }  ⇒  { ↓n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) ∧ ↓n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) }
{ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x,0))) > 0 ∧ n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) > 0 }  ⇒  { ↓n_sum_frame(f_distance(f_primitive_unary(x,0),f_primitive_unary(x_G,0))) }
2026-04-28 20:17:15,274 INFO     Total wall time: 275.01s
2026-04-28 20:17:15,274 INFO     Best policy solver CPU time: 396.87s
2026-04-28 20:17:15,274 INFO     Best policy solver wall time: 29.73s
2026-04-28 20:17:15,274 INFO     Total solver CPU time: 397.67s
2026-04-28 20:17:15,274 INFO     Total CPU time: 642.40s
2026-04-28 20:17:15,274 INFO     Total memory usage: 4412.40MB
