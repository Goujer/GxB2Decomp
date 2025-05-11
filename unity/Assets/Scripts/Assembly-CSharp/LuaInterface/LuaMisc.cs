using System;

namespace LuaInterface
{
	[NoToLua]
	public static class LuaMisc
	{
		public static string GetArrayRank(Type t)
		{
			return null;
		}

		public static string GetTypeName(Type t)
		{
			return null;
		}

		public static string[] GetGenericName(Type[] types, int offset, int count)
		{
			return null;
		}

		private static string CombineTypeStr(string space, string name)
		{
			return null;
		}

		private static string GetGenericName(Type t)
		{
			return null;
		}

		public static Delegate GetEventHandler(object obj, Type t, string eventName)
		{
			return null;
		}

		public static string GetPrimitiveStr(Type t)
		{
			return null;
		}

		public static double ToDouble(object obj)
		{
			return 0.0;
		}

		public static Type GetExportBaseType(Type t)
		{
			return null;
		}
	}
}
