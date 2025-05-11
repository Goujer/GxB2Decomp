__int64 __fastcall DllAUGetFileSize(xinyoudi::ApkUtils *a1, char a2, bool a3)
{
  return xinyoudi::ApkUtils::getFileSize(a1, (const char *)(a2 & 1), a3);
}
