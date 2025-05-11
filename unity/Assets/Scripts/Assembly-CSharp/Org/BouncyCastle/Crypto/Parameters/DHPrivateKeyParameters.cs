using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DHPrivateKeyParameters : DHKeyParameters
	{
		private readonly BigInteger x;

		public BigInteger X
		{
			get
			{
				return null;
			}
		}

		public DHPrivateKeyParameters(BigInteger x, DHParameters parameters)
			: base(false, null)
		{
		}

		public DHPrivateKeyParameters(BigInteger x, DHParameters parameters, DerObjectIdentifier algorithmOid)
			: base(false, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DHPrivateKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
