use bts;
select count(dest) from flights where arr_delay < ARR_THR and dep_delay < DEP_THR;
select count(dest) from flights where arr_delay >= ARR_THR and dep_delay < DEP_THR;
select count(dest) from flights where arr_delay < ARR_THR and dep_delay >= DEP_THR;
select count(dest) from flights where arr_delay >= ARR_THR and dep_delay >= DEP_THR;
