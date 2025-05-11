void __fastcall sub_B664C(std::type_info *a1)
{
  std::type_info::~type_info(a1);
  operator delete(a1);
}
