using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ElGamalPublicKeyParameters : ElGamalKeyParameters
	{
		private readonly BigInteger y;

		public BigInteger Y
		{
			get
			{
				return null;
			}
		}

		public ElGamalPublicKeyParameters(BigInteger y, ElGamalParameters parameters)
			: base(false, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(ElGamalPublicKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
