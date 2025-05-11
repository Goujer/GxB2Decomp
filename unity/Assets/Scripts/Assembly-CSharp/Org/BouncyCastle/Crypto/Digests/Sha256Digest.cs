using Org.BouncyCastle.Utilities;

namespace Org.BouncyCastle.Crypto.Digests
{
	public class Sha256Digest : GeneralDigest
	{
		private const int DigestLength = 32;

		private uint H1;

		private uint H2;

		private uint H3;

		private uint H4;

		private uint H5;

		private uint H6;

		private uint H7;

		private uint H8;

		private uint[] X;

		private int xOff;

		private static readonly uint[] K;

		public override string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public Sha256Digest()
		{
		}

		public Sha256Digest(Sha256Digest t)
		{
		}

		private void CopyIn(Sha256Digest t)
		{
		}

		public override int GetDigestSize()
		{
			return 0;
		}

		internal override void ProcessWord(byte[] input, int inOff)
		{
		}

		internal override void ProcessLength(long bitLength)
		{
		}

		public override int DoFinal(byte[] output, int outOff)
		{
			return 0;
		}

		public override void Reset()
		{
		}

		private void initHs()
		{
		}

		internal override void ProcessBlock()
		{
		}

		private static uint Sum1Ch(uint x, uint y, uint z)
		{
			return 0u;
		}

		private static uint Sum0Maj(uint x, uint y, uint z)
		{
			return 0u;
		}

		private static uint Theta0(uint x)
		{
			return 0u;
		}

		private static uint Theta1(uint x)
		{
			return 0u;
		}

		public override IMemoable Copy()
		{
			return null;
		}

		public override void Reset(IMemoable other)
		{
		}
	}
}
