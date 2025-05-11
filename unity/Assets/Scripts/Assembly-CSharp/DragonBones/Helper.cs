using System.Collections.Generic;

namespace DragonBones
{
	internal static class Helper
	{
		public static readonly int INT16_SIZE;

		public static readonly int UINT16_SIZE;

		public static readonly int FLOAT_SIZE;

		internal static void Assert(bool condition, string message)
		{
		}

		internal static void ResizeList<T>(this List<T> list, int count, T value = default(T))
		{
		}

		internal static List<float> Convert(this List<object> list)
		{
			return null;
		}

		internal static bool FloatEqual(float f0, float f1)
		{
			return false;
		}
	}
}
