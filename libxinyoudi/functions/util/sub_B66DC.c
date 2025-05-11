void __fastcall sub_B66DC(std::type_info *a1)
{
  std::type_info::~type_info(a1);
  operator delete(a1);
}
