using Org.BouncyCastle.Math;
using Org.BouncyCastle.Math.EC;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ECDomainParameters
	{
		internal ECCurve curve;

		internal byte[] seed;

		internal ECPoint g;

		internal BigInteger n;

		internal BigInteger h;

		public ECCurve Curve
		{
			get
			{
				return null;
			}
		}

		public ECPoint G
		{
			get
			{
				return null;
			}
		}

		public BigInteger N
		{
			get
			{
				return null;
			}
		}

		public BigInteger H
		{
			get
			{
				return null;
			}
		}

		public ECDomainParameters(ECCurve curve, ECPoint g, BigInteger n)
		{
		}

		public ECDomainParameters(ECCurve curve, ECPoint g, BigInteger n, BigInteger h)
		{
		}

		public ECDomainParameters(ECCurve curve, ECPoint g, BigInteger n, BigInteger h, byte[] seed)
		{
		}

		public byte[] GetSeed()
		{
			return null;
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected virtual bool Equals(ECDomainParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
