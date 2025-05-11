using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class RsaPrivateCrtKeyParameters : RsaKeyParameters
	{
		private readonly BigInteger e;

		private readonly BigInteger p;

		private readonly BigInteger q;

		private readonly BigInteger dP;

		private readonly BigInteger dQ;

		private readonly BigInteger qInv;

		public BigInteger PublicExponent
		{
			get
			{
				return null;
			}
		}

		public BigInteger P
		{
			get
			{
				return null;
			}
		}

		public BigInteger Q
		{
			get
			{
				return null;
			}
		}

		public BigInteger DP
		{
			get
			{
				return null;
			}
		}

		public BigInteger DQ
		{
			get
			{
				return null;
			}
		}

		public BigInteger QInv
		{
			get
			{
				return null;
			}
		}

		public RsaPrivateCrtKeyParameters(BigInteger modulus, BigInteger publicExponent, BigInteger privateExponent, BigInteger p, BigInteger q, BigInteger dP, BigInteger dQ, BigInteger qInv)
			: base(false, null, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}

		private static void ValidateValue(BigInteger x, string name, string desc)
		{
		}
	}
}
