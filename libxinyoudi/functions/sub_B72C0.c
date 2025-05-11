void __fastcall sub_B72C0(__int64 a1, __int64 a2, __int64 a3, __int64 a4, int a5)
{
  __int64 v5; // x9
  __int64 v6; // x9
  int v7; // w8
  int v8; // w8
  int v9; // w8

  v5 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a2 + 77) = 1;
  if ( v5 == a4 )
  {
    v6 = *(_QWORD *)(a2 + 32);
    *(_BYTE *)(a2 + 76) = 1;
    if ( v6 )
    {
      if ( v6 == a3 )
      {
        v9 = *(_DWORD *)(a2 + 48);
        if ( v9 == 2 )
        {
          v9 = a5;
          *(_DWORD *)(a2 + 48) = a5;
        }
        if ( *(_DWORD *)(a2 + 72) == 1 && v9 == 1 )
          *(_BYTE *)(a2 + 78) = 1;
      }
      else
      {
        v7 = *(_DWORD *)(a2 + 60);
        *(_BYTE *)(a2 + 78) = 1;
        *(_DWORD *)(a2 + 60) = v7 + 1;
      }
    }
    else
    {
      v8 = *(_DWORD *)(a2 + 72);
      *(_QWORD *)(a2 + 32) = a3;
      *(_DWORD *)(a2 + 48) = a5;
      *(_DWORD *)(a2 + 60) = 1;
      if ( v8 == 1 && a5 == 1 )
        *(_BYTE *)(a2 + 78) = 1;
    }
  }
}
