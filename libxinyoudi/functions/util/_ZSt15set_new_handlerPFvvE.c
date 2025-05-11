unsigned __int64 __fastcall std::set_new_handler(void (*a1)(void))
{
  unsigned __int64 v1; // x8

  do
    v1 = __ldaxr(&_cxa_new_handler);
  while ( __stlxr((unsigned __int64)a1, &_cxa_new_handler) );
  return v1;
}
