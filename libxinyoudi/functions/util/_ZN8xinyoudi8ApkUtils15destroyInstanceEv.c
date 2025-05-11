__int64 __fastcall xinyoudi::ApkUtils::destroyInstance(xinyoudi::ApkUtils *this)
{
  if ( xinyoudi::ApkUtils::_apkUtils )
  {
    (*(void (__fastcall **)(__int64))(*(_QWORD *)xinyoudi::ApkUtils::_apkUtils + 8LL))(xinyoudi::ApkUtils::_apkUtils);
    xinyoudi::ApkUtils::_apkUtils = 0LL;
  }
  return __android_log_print(4, "ApkUtils-Unity", "DestroyInstance!");
}
