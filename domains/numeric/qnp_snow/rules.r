Rules:
{ n_sum_frame(f_primitive_unary(snow,0)) > 0 }  ⇒  {  }
{ n_sum_frame(f_primitive_unary(snow,0)) > 0 }  ⇒  { ↓n_sum_frame(f_primitive_unary(snow,0)) }





{ n_maximum(f_primitive_unary(snowWalkway,0)) = 0 ∧ n_minimum(f_primitive_unary(snowDriveway,0)) > 0 }  ⇒  { ↓n_minimum(f_primitive_unary(snowDriveway,0)) ∧ ↑n_maximum(f_primitive_unary(snowWalkway,0)) }
{ n_maximum(f_primitive_unary(snowWalkway,0)) > 0 }  ⇒  {  ; ↓n_maximum(f_primitive_unary(snowWalkway,0)) }
{ n_maximum(f_primitive_unary(snowWalkway,0)) > 0 }  ⇒  {  }
{ n_minimum(f_primitive_unary(snowDriveway,0)) > 0 }  ⇒  {  }
2025-10-27 19:16:13,738 INFO     Total wall time: 2.48s
2025-10-27 19:16:13,738 INFO     Best policy solver CPU time: 0.05s
2025-10-27 19:16:13,738 INFO     Best policy solver wall time: 0.04s
2025-10-27 19:16:13,738 INFO     Total solver CPU time: 0.08s
2025-10-27 19:16:13,738 INFO     Total CPU time: 2.47s
2025-10-27 19:16:13,738 INFO     Total memory usage: 55.61MB