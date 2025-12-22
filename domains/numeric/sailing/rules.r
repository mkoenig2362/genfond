

Rules with p01, p02 & p03:
2025-10-27 10:46:59,160 INFO     Total wall time: 29.05s
2025-10-27 10:46:59,160 INFO     Best policy solver CPU time: 0.48s
2025-10-27 10:46:59,160 INFO     Best policy solver wall time: 0.29s
2025-10-27 10:46:59,160 INFO     Total solver CPU time: 36.26s
2025-10-27 10:46:59,160 INFO     Total CPU time: 56.08s
2025-10-27 10:46:59,160 INFO     Total memory usage: 680.09MB
#if boat at a person AND there are people who need saving  ⇒  THEN inc saved people AND dec people who need saving
{ min(dist(x())) = 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 }  
  ⇒  { ↑sum(restr(x(),saved)) ∧ ↓sum(restr(x(),and(saved_G,not(saved)))) }
#if boat at a person AND there are people who need saving AND some are saved  ⇒  THEN inc people who need saving AND inc dist of nearest objects
{ min(dist(x())) = 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  { ↑sum(restr(x(),and(saved_G,not(saved)))) ∧ ↑min(dist(x())) }
#if boat at a person AND there are people who need saving AND some are saved  ⇒  THEN inc saved AND inc dist
{ min(dist(x())) = 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  { ↑sum(restr(x(),saved)) ∧ ↑min(dist(x())) }     
#if boat at a person AND there are people who need saving AND none are saved  ⇒  THEN dec dist of the closest obj
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) = 0 }  
  ⇒  { ↓min(dist(x())) }
#if boat at a person AND there are people who need saving AND some are saved  ⇒  THEN 
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) = 0 }  
  ⇒  { ↓sum(restr(x(),and(saved_G,not(saved)))) ∧ ↓min(dist(x())) }
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  {  ; ↓min(dist(x())) }
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  {  ; ↓min(dist(x())) ∧ ↓sum(restr(x(),saved)) }
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  {  ; ↓sum(restr(x(),and(saved_G,not(saved)))) ∧ ↓min(dist(x())) }
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  {  ; ↓sum(restr(x(),and(saved_G,not(saved)))) ∧ ↓min(dist(x())) ∧ ↓sum(restr(x(),saved)) }
{ min(dist(x())) > 0 ∧ sum(restr(x(),and(saved_G,not(saved)))) > 0 ∧ sum(restr(x(),saved)) > 0 }  
  ⇒  {  }



First  Rules:
{ n_sum_frame(f_restrict_unary(f_primitive_unary(x,0),c_primitive(saved,0))) = 0 }  
⇒  {  }
{ n_sum_frame(f_restrict_unary(f_primitive_unary(x,0),c_primitive(saved,0))) = 0 }  
⇒  { ↑n_sum_frame(f_restrict_unary(f_primitive_unary(x,0),c_primitive(saved,0))) }