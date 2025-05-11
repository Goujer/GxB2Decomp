void *__fastcall sub_8F9C4(size_t a1)
{
  unsigned __int64 StatusReg; // x20
  size_t v2; // x19
  void *v4[2]; // [xsp+0h] [xbp-20h] BYREF

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  if ( a1 )
    v2 = a1;
  else
    v2 = 1LL;
  v4[1] = *(void **)(StatusReg + 40);
  if ( posix_memalign(v4, 0x10uLL, v2) )
    return (void *)sub_8FA30(v2);
  else
    return v4[0];
}
