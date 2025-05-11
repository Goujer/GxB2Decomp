unsigned __int8 *__fastcall sub_B28F0(unsigned __int8 *a1, unsigned __int8 *a2, __int64 *a3)
{
  unsigned __int8 *v4; // x19
  int v6; // w8
  unsigned __int8 *v7; // x22
  unsigned __int8 *v8; // x0
  unsigned __int8 *v9; // x0
  int v10; // t1
  _BYTE *v11; // x22
  __int64 v12; // x0
  bool v13; // zf
  unsigned __int8 *v14; // x22

  v4 = a1;
  if ( a1 != a2 )
  {
    v6 = *a1;
    if ( v6 == 74 )
    {
      v11 = a1 + 1;
      if ( a1 + 1 != a2 )
      {
        while ( *v11 != 69 )
        {
          v12 = sub_B28F0(v11, a2, a3);
          v13 = v12 == (_QWORD)v11;
          v11 = (_BYTE *)v12;
          if ( v13 )
            return v4;
        }
        return v11 + 1;
      }
      return v4;
    }
    if ( v6 != 76 )
    {
      if ( v6 != 88 )
        return (unsigned __int8 *)sub_925FC(a1, a2, a3);
      v7 = a1 + 1;
      v8 = (unsigned __int8 *)sub_A20BC(a1 + 1, a2, (__int64)a3);
      if ( v8 == v7 )
        return v4;
      goto LABEL_6;
    }
    if ( a1 + 1 == a2 || a1[1] != 90 )
      return sub_A743C(a1, a2, a3);
    v14 = a1 + 2;
    v8 = sub_91038(a1 + 2, a2, a3);
    if ( v8 != v14 )
    {
LABEL_6:
      if ( v8 != a2 )
      {
        v10 = *v8;
        v9 = v8 + 1;
        if ( v10 == 69 )
          return v9;
      }
    }
  }
  return v4;
}
