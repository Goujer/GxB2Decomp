char *__fastcall sub_B7EFC(char a1, char *a2, char *a3, unsigned __int64 *a4)
{
  char *v5; // x19
  _QWORD *v8; // x0
  char *result; // x0
  unsigned __int64 v10; // x1
  _QWORD *v11; // t1
  _QWORD *v12; // [xsp+38h] [xbp+38h] BYREF

  v5 = a3;
  if ( a1 == 80 )
  {
    v8 = (_QWORD *)((unsigned __int64)(a3 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    v11 = (_QWORD *)*v8;
    result = (char *)(v8 + 1);
    v10 = (unsigned __int64)v11;
  }
  else
  {
    switch ( a1 & 0xF )
    {
      case 0:
      case 4:
      case 0xC:
        result = a3 + 8;
        v10 = *(_QWORD *)a3;
        break;
      case 1:
        ((void (__fastcall __noreturn *)(char *, _QWORD **))loc_B7E94)(a3, &v12);
      case 2:
        result = a3 + 2;
        v10 = *(unsigned __int16 *)a3;
        break;
      case 3:
        result = a3 + 4;
        v10 = *(unsigned int *)a3;
        break;
      case 9:
        result = sub_B7EBC(a3, &v12);
        v10 = (unsigned __int64)v12;
        break;
      case 0xA:
        result = a3 + 2;
        v10 = *(__int16 *)a3;
        break;
      case 0xB:
        result = a3 + 4;
        v10 = *(int *)a3;
        break;
      default:
        abort();
    }
    if ( v10 )
    {
      if ( (a1 & 0x70) != 0x10 )
        v5 = a2;
      v10 += (unsigned __int64)v5;
      if ( a1 < 0 )
        v10 = *(_QWORD *)v10;
    }
  }
  *a4 = v10;
  return result;
}
