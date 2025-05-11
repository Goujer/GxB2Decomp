unsigned __int64 __fastcall std::set_unexpected(void (__fastcall __noreturn *a1)())
{
  void (__fastcall __noreturn *v1)(); // x8
  unsigned __int64 result; // x0

  v1 = sub_905D0;
  if ( a1 )
    v1 = a1;
  do
    result = __ldaxr((unsigned __int64 *)&_cxa_unexpected_handler);
  while ( __stlxr((unsigned __int64)v1, (unsigned __int64 *)&_cxa_unexpected_handler) );
  return result;
}
