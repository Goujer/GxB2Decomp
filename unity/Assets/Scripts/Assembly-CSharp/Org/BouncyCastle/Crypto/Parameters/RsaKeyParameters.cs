using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class RsaKeyParameters : AsymmetricKeyParameter
	{
		private readonly BigInteger modulus;

		private readonly BigInteger exponent;

		public BigInteger Modulus
		{
			get
			{
				return null;
			}
		}

		public BigInteger Exponent
		{
			get
			{
				return null;
			}
		}

		public RsaKeyParameters(bool isPrivate, BigInteger modulus, BigInteger exponent)
			: base(false)
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
	}
}
