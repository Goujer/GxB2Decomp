using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ElGamalParameters : ICipherParameters
	{
		private readonly BigInteger p;

		private readonly BigInteger g;

		private readonly int l;

		public BigInteger P
		{
			get
			{
				return null;
			}
		}

		public BigInteger G
		{
			get
			{
				return null;
			}
		}

		public int L
		{
			get
			{
				return 0;
			}
		}

		public ElGamalParameters(BigInteger p, BigInteger g)
		{
		}

		public ElGamalParameters(BigInteger p, BigInteger g, int l)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(ElGamalParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
