__int64 Unwind_FindEnclosingFunction()
{
  bool v0; // zf
  __int64 result; // x0
  __int64 v2; // [xsp+28h] [xbp+28h]

  v0 = _Unwind_Find_FDE() == 0;
  result = v2;
  if ( v0 )
    return 0LL;
  return result;
}
