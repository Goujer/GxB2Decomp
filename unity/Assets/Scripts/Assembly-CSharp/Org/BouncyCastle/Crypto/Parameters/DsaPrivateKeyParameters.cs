using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DsaPrivateKeyParameters : DsaKeyParameters
	{
		private readonly BigInteger x;

		public BigInteger X
		{
			get
			{
				return null;
			}
		}

		public DsaPrivateKeyParameters(BigInteger x, DsaParameters parameters)
			: base(false, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DsaPrivateKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
