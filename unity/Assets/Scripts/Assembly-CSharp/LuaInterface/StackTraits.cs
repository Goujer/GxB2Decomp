using System;

namespace LuaInterface
{
	public static class StackTraits<T>
	{
		public static Action<IntPtr, T> Push;

		public static Func<IntPtr, int, T> Check;

		public static Func<IntPtr, int, T> To;

		public static void Init(Action<IntPtr, T> push, Func<IntPtr, int, T> check, Func<IntPtr, int, T> to)
		{
		}

		private static Action<IntPtr, T> SelectPush()
		{
			return null;
		}

		private static void PushValue(IntPtr L, T o)
		{
		}

		private static void PushObject(IntPtr L, T o)
		{
		}

		private static void PushArray(IntPtr L, T array)
		{
		}

		private static T DefaultTo(IntPtr L, int pos)
		{
			return default(T);
		}

		private static T DefaultCheck(IntPtr L, int stackPos)
		{
			return default(T);
		}
	}
}
