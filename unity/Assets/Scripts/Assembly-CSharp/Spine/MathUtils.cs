using System;

namespace Spine
{
	public static class MathUtils
	{
		public const float PI = (float)Math.PI;

		public const float PI2 = (float)Math.PI * 2f;

		public const float RadDeg = 180f / (float)Math.PI;

		public const float DegRad = (float)Math.PI / 180f;

		private const int SIN_BITS = 14;

		private const int SIN_MASK = 16383;

		private const int SIN_COUNT = 16384;

		private const float RadFull = (float)Math.PI * 2f;

		private const float DegFull = 360f;

		private const float RadToIndex = 8192f / (float)Math.PI;

		private const float DegToIndex = 45.511112f;

		private static float[] sin;

		static MathUtils()
		{
		}

		public static float Sin(float radians)
		{
			return 0f;
		}

		public static float Cos(float radians)
		{
			return 0f;
		}

		public static float SinDeg(float degrees)
		{
			return 0f;
		}

		public static float CosDeg(float degrees)
		{
			return 0f;
		}

		public static float Atan2(float y, float x)
		{
			return 0f;
		}

		public static float Clamp(float value, float min, float max)
		{
			return 0f;
		}
	}
}
