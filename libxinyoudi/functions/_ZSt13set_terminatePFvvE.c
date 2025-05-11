unsigned __int64 __fastcall std::set_terminate(__int64 (__fastcall *a1)())
{
  __int64 (__fastcall *v1)(); // x8
  unsigned __int64 result; // x0

  v1 = sub_904A8;
  if ( a1 )
    v1 = a1;
  do
    result = __ldaxr((unsigned __int64 *)&_cxa_terminate_handler);
  while ( __stlxr((unsigned __int64)v1, (unsigned __int64 *)&_cxa_terminate_handler) );
  return result;
}
