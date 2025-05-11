using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ElGamalPrivateKeyParameters : ElGamalKeyParameters
	{
		private readonly BigInteger x;

		public BigInteger X
		{
			get
			{
				return null;
			}
		}

		public ElGamalPrivateKeyParameters(BigInteger x, ElGamalParameters parameters)
			: base(false, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(ElGamalPrivateKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
