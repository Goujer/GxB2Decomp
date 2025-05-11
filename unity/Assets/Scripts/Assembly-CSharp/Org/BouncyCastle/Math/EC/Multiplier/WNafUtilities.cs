namespace Org.BouncyCastle.Math.EC.Multiplier
{
	public abstract class WNafUtilities
	{
		public static readonly string PRECOMP_NAME;

		private static readonly int[] DEFAULT_WINDOW_SIZE_CUTOFFS;

		private static readonly byte[] EMPTY_BYTES;

		private static readonly int[] EMPTY_INTS;

		private static readonly ECPoint[] EMPTY_POINTS;

		public static int[] GenerateCompactNaf(BigInteger k)
		{
			return null;
		}

		public static int[] GenerateCompactWindowNaf(int width, BigInteger k)
		{
			return null;
		}

		public static byte[] GenerateJsf(BigInteger g, BigInteger h)
		{
			return null;
		}

		public static byte[] GenerateNaf(BigInteger k)
		{
			return null;
		}

		public static byte[] GenerateWindowNaf(int width, BigInteger k)
		{
			return null;
		}

		public static int GetNafWeight(BigInteger k)
		{
			return 0;
		}

		public static WNafPreCompInfo GetWNafPreCompInfo(ECPoint p)
		{
			return null;
		}

		public static WNafPreCompInfo GetWNafPreCompInfo(PreCompInfo preCompInfo)
		{
			return null;
		}

		public static int GetWindowSize(int bits)
		{
			return 0;
		}

		public static int GetWindowSize(int bits, int[] windowSizeCutoffs)
		{
			return 0;
		}

		public static ECPoint MapPointWithPrecomp(ECPoint p, int width, bool includeNegated, ECPointMap pointMap)
		{
			return null;
		}

		public static WNafPreCompInfo Precompute(ECPoint p, int width, bool includeNegated)
		{
			return null;
		}

		private static byte[] Trim(byte[] a, int length)
		{
			return null;
		}

		private static int[] Trim(int[] a, int length)
		{
			return null;
		}

		private static ECPoint[] ResizeTable(ECPoint[] a, int length)
		{
			return null;
		}
	}
}
