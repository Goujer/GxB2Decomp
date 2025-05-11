__int64 __fastcall sub_B9E48(__int64 a1, __int64 a2, __int64 a3)
{
  unsigned __int64 v3; // x3
  unsigned __int64 v4; // x1
  __int64 result; // x0

  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a3 + 8);
  if ( v3 >= v4 )
    LODWORD(result) = 0;
  else
    LODWORD(result) = -1;
  if ( v3 > v4 )
    return 1LL;
  else
    return (unsigned int)result;
}
