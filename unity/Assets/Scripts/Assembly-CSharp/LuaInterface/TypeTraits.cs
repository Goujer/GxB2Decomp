using System;

namespace LuaInterface
{
	public static class TypeTraits<T>
	{
		public static Func<IntPtr, int, bool> Check;

		public static Type type;

		public static bool IsValueType;

		public static bool IsArray;

		private static string typeName;

		private static int nilType;

		private static int metaref;

		public static void Init(Func<IntPtr, int, bool> check)
		{
		}

		public static string GetTypeName()
		{
			return null;
		}

		public static int GetLuaReference(IntPtr L)
		{
			return 0;
		}

		private static bool DefaultCheck(IntPtr L, int pos)
		{
			return false;
		}

		private static bool IsNilType()
		{
			return false;
		}

		private static bool IsUserData(IntPtr L, int pos)
		{
			return false;
		}

		private static bool IsUserTable(IntPtr L, int pos)
		{
			return false;
		}
	}
}
