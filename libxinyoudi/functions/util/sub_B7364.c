void __fastcall sub_B7364(__int64 a1, __int64 a2, __int64 a3, int a4)
{
  if ( *(_QWORD *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1 )
    *(_DWORD *)(a2 + 52) = a4;
}
