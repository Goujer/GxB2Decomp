unsigned __int64 std::get_new_handler(void)
{
  unsigned __int64 result; // x0

  do
    result = __ldaxr(&_cxa_new_handler);
  while ( __stlxr(result, &_cxa_new_handler) );
  return result;
}
