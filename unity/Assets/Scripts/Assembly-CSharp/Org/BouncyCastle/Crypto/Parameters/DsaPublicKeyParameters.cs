using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DsaPublicKeyParameters : DsaKeyParameters
	{
		private readonly BigInteger y;

		public BigInteger Y
		{
			get
			{
				return null;
			}
		}

		public DsaPublicKeyParameters(BigInteger y, DsaParameters parameters)
			: base(false, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DsaPublicKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
