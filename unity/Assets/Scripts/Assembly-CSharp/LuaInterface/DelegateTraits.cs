using System;

namespace LuaInterface
{
	public static class DelegateTraits<T>
	{
		private static DelegateFactory.DelegateCreate _Create;

		public static void Init(DelegateFactory.DelegateCreate func)
		{
		}

		public static Delegate Create(LuaFunction func)
		{
			return null;
		}

		public static Delegate Create(LuaFunction func, LuaTable self)
		{
			return null;
		}
	}
}
