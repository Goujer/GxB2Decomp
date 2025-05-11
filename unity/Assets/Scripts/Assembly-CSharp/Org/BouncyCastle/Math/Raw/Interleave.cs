namespace Org.BouncyCastle.Math.Raw
{
	internal abstract class Interleave
	{
		private const ulong M32 = 1431655765uL;

		private const ulong M64 = 6148914691236517205uL;

		internal static uint Expand8to16(uint x)
		{
			return 0u;
		}

		internal static uint Expand16to32(uint x)
		{
			return 0u;
		}

		internal static ulong Expand32to64(uint x)
		{
			return 0uL;
		}

		internal static void Expand64To128(ulong x, ulong[] z, int zOff)
		{
		}

		internal static ulong Unshuffle(ulong x)
		{
			return 0uL;
		}
	}
}
