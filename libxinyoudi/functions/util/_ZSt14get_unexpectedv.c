unsigned __int64 std::get_unexpected(void)
{
  unsigned __int64 result; // x0

  do
    result = __ldaxr((unsigned __int64 *)&_cxa_unexpected_handler);
  while ( __stlxr(result, (unsigned __int64 *)&_cxa_unexpected_handler) );
  return result;
}
