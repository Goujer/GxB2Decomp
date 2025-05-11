__int64 *__fastcall xinyoudi::ApkUtils::getFileRef(xinyoudi::ApkUtils *this, const char *s2)
{
  unsigned __int8 v3; // w9
  int v4; // w8
  const char *v5; // x10
  int v6; // t1
  unsigned __int64 v7; // x20
  unsigned __int64 v8; // x21
  unsigned __int64 v9; // x22
  __int64 v10; // x23
  unsigned __int64 v11; // x24
  __int64 ***v12; // x8
  __int64 **v13; // x25
  unsigned __int64 v14; // x8

  v3 = *s2;
  if ( *s2 )
  {
    v4 = 0;
    v5 = s2 + 1;
    do
    {
      v4 = 131 * v4 + v3;
      v6 = *(unsigned __int8 *)v5++;
      v3 = v6;
    }
    while ( v6 );
    v7 = v4 & 0x7FFFFFFF;
    v8 = *((_QWORD *)this + 2);
    if ( !v8 )
      return 0LL;
    goto LABEL_7;
  }
  v7 = 0LL;
  v8 = *((_QWORD *)this + 2);
  if ( v8 )
  {
LABEL_7:
    v9 = v8 - 1;
    v10 = (v8 - 1) & v8;
    if ( v10 )
    {
      v11 = v7;
      if ( v7 >= v8 )
        v11 = v7 % v8;
    }
    else
    {
      v11 = v9 & v7;
    }
    v12 = *(__int64 ****)(*((_QWORD *)this + 1) + 8 * v11);
    if ( !v12 )
      return 0LL;
    v13 = *v12;
    if ( !*v12 )
      return 0LL;
    do
    {
      v14 = (unsigned __int64)v13[1];
      if ( v7 == v14 )
      {
        if ( !strcmp((const char *)v13[2], s2) )
          return v13[3];
      }
      else
      {
        if ( v10 )
        {
          if ( v14 >= v8 )
          {
            if ( v14 % v8 != v11 )
              return 0LL;
            goto LABEL_19;
          }
        }
        else
        {
          v14 &= v9;
        }
        if ( v14 != v11 )
          return 0LL;
      }
LABEL_19:
      v13 = (__int64 **)*v13;
    }
    while ( v13 );
  }
  return 0LL;
}
