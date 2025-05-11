std::__ndk1 *__fastcall std::__hash_table<std::__hash_value_type<char const*,xinyoudi::FileRef *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,hash_func,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,cmp,true>,std::allocator<std::__hash_value_type<char const*,xinyoudi::FileRef *>>>::rehash(
        std::__ndk1 *result,
        std::__ndk1 *this)
{
  std::__ndk1 *v2; // x20
  std::__ndk1 *v3; // x19
  unsigned __int64 v4; // x21
  _BOOL4 v5; // w8
  std::__ndk1 *v6; // x1

  v2 = this;
  v3 = result;
  if ( this == (std::__ndk1 *)((char *)&dword_0 + 1) )
  {
    v2 = (std::__ndk1 *)(&dword_0 + 2);
  }
  else if ( (((unsigned __int64)this - 1) & (unsigned __int64)this) != 0 )
  {
    result = (std::__ndk1 *)std::__next_prime(this, (unsigned __int64)this);
    v2 = result;
  }
  v4 = *((_QWORD *)v3 + 1);
  if ( (unsigned __int64)v2 > v4 )
    return (std::__ndk1 *)std::__hash_table<std::__hash_value_type<char const*,xinyoudi::FileRef *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,hash_func,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,cmp,true>,std::allocator<std::__hash_value_type<char const*,xinyoudi::FileRef *>>>::__rehash();
  if ( (unsigned __int64)v2 < v4 )
  {
    v5 = v4 >= 3 && ((v4 - 1) & v4) == 0;
    result = (std::__ndk1 *)vcvtps_u32_f32((float)*((unsigned __int64 *)v3 + 3) / *((float *)v3 + 8));
    if ( v5 )
    {
      if ( (unsigned __int64)result >= 2 )
        result = (std::__ndk1 *)(1LL << (64 - (unsigned __int8)__clz((unsigned __int64)result - 1)));
    }
    else
    {
      result = (std::__ndk1 *)std::__next_prime(result, (unsigned __int64)this);
    }
    v6 = v2 >= result ? v2 : result;
    if ( (unsigned __int64)v6 < v4 )
      return (std::__ndk1 *)std::__hash_table<std::__hash_value_type<char const*,xinyoudi::FileRef *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,hash_func,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,cmp,true>,std::allocator<std::__hash_value_type<char const*,xinyoudi::FileRef *>>>::__rehash();
  }
  return result;
}
