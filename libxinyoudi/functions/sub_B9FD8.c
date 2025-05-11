__int64 __fastcall sub_B9FD8(unsigned __int8 a1)
{
  __int64 result; // x0

  if ( a1 == 255 )
    return 0LL;
  switch ( a1 & 7 )
  {
    case 0:
    case 4:
      result = 8LL;
      break;
    case 2:
      result = 2LL;
      break;
    case 3:
      result = 4LL;
      break;
    default:
      abort();
  }
  return result;
}
