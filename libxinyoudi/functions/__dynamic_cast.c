void *_dynamic_cast(
        const void *lpsrc,
        const struct __class_type_info *lpstype,
        const struct __class_type_info *lpdtype,
        ptrdiff_t s2d)
{
  const struct __class_type_info *v5; // x0
  __int64 v6; // x10
  char *v7; // x19
  void *result; // x0
  _QWORD v11[4]; // [xsp+8h] [xbp-68h] BYREF
  __int128 v12; // [xsp+28h] [xbp-48h]
  __int128 v13; // [xsp+38h] [xbp-38h]
  _QWORD v14[3]; // [xsp+48h] [xbp-28h]

  v14[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)lpsrc - 16LL);
  v5 = *(const struct __class_type_info **)(*(_QWORD *)lpsrc - 8LL);
  v11[0] = lpdtype;
  v11[1] = lpsrc;
  v11[2] = lpstype;
  v11[3] = s2d;
  *(_QWORD *)((char *)v14 + 7) = 0LL;
  v7 = (char *)lpsrc + v6;
  v14[0] = 0LL;
  v13 = 0u;
  v12 = 0u;
  if ( v5 == lpdtype )
  {
    LODWORD(v14[1]) = 1;
    (*(void (__fastcall **)(const struct __class_type_info *, _QWORD *, char *, char *, __int64, _QWORD))(*(_QWORD *)lpdtype + 40LL))(
      lpdtype,
      v11,
      v7,
      v7,
      1LL,
      0LL);
    if ( (_DWORD)v13 == 1 )
      return v7;
    else
      return 0LL;
  }
  else
  {
    (*(void (__fastcall **)(const struct __class_type_info *, _QWORD *, char *, __int64, _QWORD))(*(_QWORD *)v5 + 48LL))(
      v5,
      v11,
      (char *)lpsrc + v6,
      1LL,
      0LL);
    if ( HIDWORD(v13) == 1 )
    {
      if ( (_DWORD)v13 == 1 )
        return (void *)v12;
      result = 0LL;
      if ( !LODWORD(v14[0]) && *(_QWORD *)((char *)&v13 + 4) == 0x100000001LL )
        return (void *)v12;
    }
    else if ( HIDWORD(v13) )
    {
      return 0LL;
    }
    else if ( DWORD2(v13) == 1 && DWORD1(v13) == 1 && LODWORD(v14[0]) == 1 )
    {
      return (void *)*((_QWORD *)&v12 + 1);
    }
    else
    {
      return 0LL;
    }
  }
  return result;
}
