__int64 __fastcall sub_B7CF4(__int64 result, __int64 a2, __int64 a3, __int64 a4, int a5, char a6)
{
  __int64 v7; // x8
  __int64 v11; // x9
  __int64 v12; // x9
  int v13; // w8
  int v14; // w8

  v7 = *(_QWORD *)(a2 + 16);
  if ( (a6 & 1) != 0 )
  {
    result = strcmp(*(const char **)(result + 8), *(const char **)(v7 + 8));
    if ( (_DWORD)result )
      return result;
  }
  else if ( result != v7 )
  {
    return result;
  }
  v11 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a2 + 77) = 1;
  if ( v11 == a4 )
  {
    v12 = *(_QWORD *)(a2 + 32);
    *(_BYTE *)(a2 + 76) = 1;
    if ( v12 )
    {
      if ( v12 != a3 )
      {
        v13 = *(_DWORD *)(a2 + 60);
        *(_BYTE *)(a2 + 78) = 1;
        *(_DWORD *)(a2 + 60) = v13 + 1;
        return result;
      }
      v14 = *(_DWORD *)(a2 + 48);
      if ( v14 == 2 )
      {
        v14 = a5;
        *(_DWORD *)(a2 + 48) = a5;
      }
      if ( v14 != 1 )
        return result;
    }
    else
    {
      *(_QWORD *)(a2 + 32) = a3;
      *(_DWORD *)(a2 + 48) = a5;
      *(_DWORD *)(a2 + 60) = 1;
      if ( a5 != 1 )
        return result;
    }
    if ( *(_DWORD *)(a2 + 72) == 1 )
      *(_BYTE *)(a2 + 78) = 1;
  }
  return result;
}
