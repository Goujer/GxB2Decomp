__int64 __fastcall xinyoudi::ApkUtils::setAssetManager(__int64 this, AAssetManager *a2)
{
  if ( !this )
    return __android_log_print(6, "ApkUtils-Unity", "AssetManager is nullptr in setAssetManager!");
  xinyoudi::ApkUtils::_assetManager = this;
  return this;
}
