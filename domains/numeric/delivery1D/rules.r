F == gripper free
MD == max(dist(x(),x()))
MD_{PtoT} == max(dist(restr(x(),is_p),restr(x(),is_t)))
D_{GtoT} == min(dist(restr(x(),is_g),restr(x(),is_t)))



{ F ∧ MD > 0 ∧ MD_{PtoT} > 0 }  ⇒  { ↑D_{GtoT} }
{ F ∧ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} > 0 }  ⇒  { ¬F }
{ MD = 0 ∧ MD_{PtoT} = 0 ∧ D_{GtoT} = 0 ∧ ¬F }  ⇒  { F }
{ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} = 0 ∧ ¬F }  ⇒  { F }
{ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} = 0 ∧ ¬F }  ⇒  { ↓MD_{PtoT} ∧ F ∧ ↓MD }
{ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} > 0 }  ⇒  { ↓D_{GtoT} ∧ ↓MD }
{ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} > 0 ∧ ¬F }  ⇒  {  ; ↓D_{GtoT} }
{ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} > 0 ∧ ¬F }  ⇒  {  }
{ MD > 0 ∧ MD_{PtoT} > 0 ∧ D_{GtoT} > 0 ∧ ¬F }  ⇒  { ↓D_{GtoT} }
{ MD > 0 ∧ D_{GtoT} > 0 ∧ ¬F }  ⇒  { ↓D_{GtoT} ∧ ↓MD }





{
(0, 5, 'down(g)'), 
(0, 4, 'up(g)'), 
(0, 9, 'up(g)'), 
(0, 7, 'put(p1,g,t)'), 
(0, 11, 'put(p1,g,t)'), 
(0, 2, 'down(g)'), 
(0, 3, 'up(g)'), 
(0, 1, 'collect(p1,g)'), 
(0, 0, 'down(g)'), 
(0, 4, 'down(g)'), 
(0, 15, 'down(g)'), 
(0, 14, 'up(g)'), 
(0, 6, 'up(g)'), 
(0, 8, 'up(g)'), 
}
