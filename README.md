# Train ticket booking system

*  Ruby version -> 3.1.2 
*  sqlite3 -> 1.4
*  rails version -> 7.0.4

---

> Only Database administrator can make the admin.

...So for adding admin DBA need to fire below query

``
    update users set role = 0 where id in (__id_of_user_to_whom_dba_want_to_make_admin__);
    # example : update users set role = 0 where id in (1,2,3);
``

> For adding SMS services Need a twillio account no., auth token , twillio_mobile_no
