__int64 __fastcall sub_B959C(__int64 *a1, __int64 a2)
{
  __int64 v4; // x1
  __int64 result; // x0

  sub_B92B4(a1, a2);
  v4 = *(_QWORD *)(a2 + 1640);
  result = *(unsigned int *)(a2 + 16 * v4 + 8);
  if ( (_DWORD)result == 6 )
  {
    a1[99] = 0LL;
  }
  else
  {
    result = Unwind_GetGR((__int64)a1, v4);
    a1[99] = result;
  }
  return result;
}
