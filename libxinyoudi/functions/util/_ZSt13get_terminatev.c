unsigned __int64 std::get_terminate(void)
{
  unsigned __int64 result; // x0

  do
    result = __ldaxr((unsigned __int64 *)&_cxa_terminate_handler);
  while ( __stlxr(result, (unsigned __int64 *)&_cxa_terminate_handler) );
  return result;
}
